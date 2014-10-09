#ifndef __NODES_H_INCLUDED__
#define __NODES_H_INCLUDED__

#include "base.h"
#include <math.h>
#include <common_lib.h>
#include <mpi.h>

namespace mfree
{

struct CNode: public mfree::CPoint
//MFree node
//adds some data members to CPoint
//no added functionality
{
	int index;		//unique index, usually position in the original node table
	double u;		//nodal parameter
	double dist;	//usually NaN; some operations calculate distances from certain points to nodes and store it in dist
					//only use dist when you know what you are doing
	bool boundary;	//true if this node lies on global domain boundary

	CNode()
	//default constructor creates an invalid object
	{
		index = -1;
		x = CommonLib::NaN;
		y = CommonLib::NaN;
		u = CommonLib::NaN;
		dist = CommonLib::NaN;
		boundary = false;
	}
	
	CNode(int _index, double _x, double _y, double _u = CommonLib::NaN, bool _boundary = false)
	{
		index = _index;
		x = _x;
		y = _y;
		u = _u;
		dist = CommonLib::NaN;
		boundary = _boundary;
	}

	CNode(const CNode &other) : CPoint(other)
	{
		index = other.index;
		u = other.u;
		boundary = other.boundary;
		dist = other.dist;
	}

	CNode &operator=(const CNode &other)
	{
		CPoint::operator=(other);
		index = other.index;
		u = other.u;
		boundary = other.boundary;
		dist = other.dist;
		return *this;
	}

	bool operator==(const CNode &other) const
	{
		return CPoint::operator==(other) && index == other.index && boundary == other.boundary
			&& (u == other.u || (CommonLib::isNaN(u) && CommonLib::isNaN(other.u)))
			&& (dist == other.dist || (CommonLib::isNaN(dist) && CommonLib::isNaN(other.dist)));
	}

	bool operator!=(const CNode &other) const
	{
		return !(*this == other);
	}

	void writeToFile(FILE *f) const
	//file format: x y boundary u
	{
		assert(f);
		fprintf(f, "%.15lf %.15lf %d ", x, y, (boundary ? 1 : 0));
		if (CommonLib::isNaN(u))
			fprintf(f, "NaN");
		else
			fprintf(f, "%.15lf", u);
	}

}; //end class CNode


#define CNodeTableReallocSpace 100
class CNodeTable: public C1DTable<CNode, CNodeTableReallocSpace>
//specialization of C1DTable for nodes
//also contains functions for:
//-node generation
//-receiving nodes sent by another process
//-finding nodes in a given circle
{
protected:
	int numNodesX;	//size of regular mesh whose points are used as initial node positions

public:
	CNodeTable()
		: C1DTable<CNode, CNodeTableReallocSpace>()
	//default constructor creates an invalid object
	{
		numNodesX = -1;
	}

	CNodeTable(const CNodeTable &other)
		: C1DTable<CNode, CNodeTableReallocSpace>(other)
	{
		numNodesX = other.numNodesX;
	}

	int createOrReadNodes(const MFreeOptions &options);
	//generates approximately suggestedNumNodes nodes using algorithm given in dissertation
	//returns actual number of nodes generated
	//nodes are randomly moved from inital positions (ie those on a regular mesh)
	//	by at most dx*irregularity
	//given seed is used for the random generator
	//also sets initial conditions: 0 on boundaries, 1 inside of domain

	void recvNodes(int source)
	//receives nodes from source
	//meant for initial distribution of nodes generated by root process
	{
		MPI_Status status;
		MPI_Recv(&numElems, 1, MPI_INT, source, 43, MPI_COMM_WORLD, &status);
		if (allocedSpace < numElems)
			reallocTable(numElems);
		MPI_Recv(getRawPointer(), numElems*sizeof(CNode), MPI_BYTE, source, 44, MPI_COMM_WORLD, &status);
	}

	enum SortOrder {
		sortOrderByX,
		sortOrderByY,
		sortOrderByIndex,
		sortOrderByDist
	};
	void sortNodes(SortOrder sortOrder);
	//sorts nodes by given key in ascending order using qsort

	void findNodesInCircle(const mfree::CPoint &center, double diameter, mfree::CNodeTable &res) const;
	//appends all nodes in the given circle to res
	//(any nodes previously in res will also remain there)
	//also writes distance from center to the appended nodes into their dist field

	void writeToMFile(FILE *f, char *varName) const;
	//exports nodes to matrix varName using Matlab script format

private:
	int createNodes(const MFreeOptions &options);
	int readNodes(char *filename);

}; //end class CNodeTable


class CKDTree: public mfree::CNode
//k-D tree that stores nodes, which enables efficient search for nodes in a given area

//nodes are stored not just in leaves, but also in internal tree nodes,
//which is why tree node class CKDTree is derived from CNode

//even depths divide nodes by x coordinate (i.e. to left and right halves),
//odd depths by y; root has depth 0
{
protected:
	int depth;				//depth of this node, ie how many levels below root this node is
	int numNodesInSubtree;	//n. of nodes in this subtree (= 1 + left.numNodesInSubtree + right.numNodesInSubtree)
	CRect coverRect;		//the smallest rectangle containing all the nodes in this subtree
	CKDTree *left, *right;	//pointers to left and right subtree

	CRect getSubdomainRect(int rank, int numProcs, CNodeTable &extraNodes) const;
	//function called internally by the public version of getSubdomainRect; not meant to be called directly
	//returns subdomain of process with a given rank (out of numProcs processes) using hierarchical distribution
	//recursive algorithm as given on Page 120
    //extraNodes is a list of all nodes that are higher than *this in the tree but
	//	may belong to the subdomain of proc rank
	//when initially calling, pass empty table as extraNodes

public:
	CKDTree()
	//default constructor creates an invalid object
	{
		depth = -1;
		left = right = NULL;
		numNodesInSubtree = -1;
		coverRect.xMin = CommonLib::NaN;
		coverRect.xMax = CommonLib::NaN;
		coverRect.yMin = CommonLib::NaN;
		coverRect.yMax = CommonLib::NaN;
	}

	virtual ~CKDTree()
	{
		if (left)
			delete left;
		if (right)
			delete right;
	}
		
	int buildKDTree(int numNodes, CNode *nodesSortedX, CNode *nodesSortedY, int currDepth);
	//recursively builds tree containing numNodes nodes, which must be given in two arrays:
	//one sorted by x, the other containing the same nodes but sorted by y
	//current depth should be 0 on first call
	//algorithm is as given on Page 92
	//returns maximal tree depth in final tree
	//the arrays may be reordered during tree construction
	
	void emptyTree()
	//deletes both subtrees & makes *this invalid
	{
		if (left)
			delete left;
		if (right)
			delete right;
		depth = -1;
		left = right = NULL;
		numNodesInSubtree = -1;
		coverRect.xMin = CommonLib::NaN;
		coverRect.xMax = CommonLib::NaN;
		coverRect.yMin = CommonLib::NaN;
		coverRect.yMax = CommonLib::NaN;
	}

	int findNodesInRect(const CRect &rect, CNodeTable &res) const;
	//appends all nodes from the tree that lie in given rect to the list res
	//(any nodes previously in res will also remain there)
	//returns number of nodes found
	//can also be used to convert to CNodeTable by passing it CRect(0,0,1,1)

	int findNodesInCircle(const CPoint &center, double diameter, CNodeTable &res) const;
	//appends all nodes from the tree that lie in given circle to the list res
	//(any nodes previously in res will also remain there)
	//returns number of nodes found
	//appended nodes will also have distances from center calculated

	void findKNearestNodes(const CPoint &center, int k, CNodeTable &res) const;
	//clears the list res, then finds k nearest neighbours to center and sorts them by distance

	CRect getSubdomainRect(int rank, int numProcs) const
	//returns subdomain of process with a given rank (out of numProcs processes) using hierarchical distribution
	//see comment of private version for more details
	{
		CNodeTable emptyTable;
		return getSubdomainRect(rank, numProcs, emptyTable);
	}

	int getNumNodesInSubtree() const
	{
		return numNodesInSubtree;
	}

	const CRect &getCoverRect() const
	{
		return coverRect;
	}

	void testTreeCorrectness() const
	//recursively checks various properties that must always be true in valid trees
	{
		if (left && right)
		{
			assert(!left->coverRect.overlaps(right->coverRect+*this));
			assert(left->coverRect + right->coverRect + *this == coverRect);
		}
		if (left)
			assert(left->coverRect*coverRect == left->coverRect);
		if (right)
			assert(right->coverRect*coverRect == right->coverRect);
		if (depth % 2 == 0)
		{
			if (left)
				assert(left->coverRect.xMax < x);
			if (right)
				assert(right->coverRect.xMin >= x);
		} else {
			if (left)
				assert(left->coverRect.yMax < y);
			if (right)
				assert(right->coverRect.yMin >= y);
		}
		if (left)
			left->testTreeCorrectness();
		if (right)
			right->testTreeCorrectness();
	}

}; //end class CKDTree

}; //end namespace mfree


#endif
