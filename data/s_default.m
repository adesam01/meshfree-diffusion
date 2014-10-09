clear domain;
global domain;
domain.nodes = [
0.000000000000000 0.000000000000000 1 0.000000000000000;
0.000000000000000 1.000000000000000 1 0.000000000000000;
1.000000000000000 0.000000000000000 1 0.000000000000000;
1.000000000000000 1.000000000000000 1 0.000000000000000;
0.347692133384303 0.000000000000000 1 0.000000000000000;
0.233703828075452 1.000000000000000 1 0.000000000000000;
0.591208342629427 0.000000000000000 1 0.000000000000000;
0.750097553300096 1.000000000000000 1 0.000000000000000;
0.000000000000000 0.404136299079968 1 0.000000000000000;
1.000000000000000 0.278843245335005 1 0.000000000000000;
0.000000000000000 0.588244381153449 1 0.000000000000000;
1.000000000000000 0.663884069226007 1 0.000000000000000;
0.365736646856680 0.414196468632449 0 1.000000000000000;
0.358498896561485 0.609692276258189 0 1.000000000000000;
0.622765308427360 0.300960537574391 0 1.000000000000000;
0.729318054903291 0.719498934357504 0 1.000000000000000;
];
clear mfreeParams; global mfreeParams; 
mfreeParams.numNodes = 16;
mfreeParams.randSeed = 17;
domain.rHole = 0.000000000000000;
domain.xHole = 0.600000000000000;
domain.yHole = 0.350000000000000;
mfreeParams.C = 0.001000000000000;
mfreeParams.irregularity = 0.300000000000000;
mfreeParams.baseFtype = 'mls';
mfreeParams.mlsDegree = 2;
mfreeParams.quadDegree = 5;
mfreeParams.timeStep = 0.125000000000000;
mfreeParams.alphaInterp = 2.600000000000000;
mfreeParams.alphaQuad = 0.800000000000000;
mfreeParams.preFindQuadSupport = 0;
mfreeParams.numRepetitions = 1;
mfreeParams.dataDistrType = 0;
default.A=spalloc(16, 16, 1);
default.A(1,1)=-7.740484115713408;
default.A(1,2)=-0.001572974775012;
default.A(1,3)=0.000609708548501;
default.A(1,5)=5.479085557662708;
default.A(1,7)=-1.786641990445891;
default.A(1,9)=5.509572310587412;
default.A(1,11)=-2.270696771888814;
default.A(1,13)=2.922199070548217;
default.A(1,14)=-1.503036736351633;
default.A(1,15)=-0.609034058172057;
default.A(2,1)=0.000004565028498;
default.A(2,2)=0.968110960014190;
default.A(2,4)=0.000020100822747;
default.A(2,6)=0.042755466058321;
default.A(2,8)=-0.013079713318067;
default.A(2,9)=-0.014770924412958;
default.A(2,11)=0.037384271258559;
default.A(2,13)=0.011580634526220;
default.A(2,14)=-0.051870698717689;
default.A(2,15)=0.003089365227781;
default.A(2,16)=0.016775973512397;
default.A(3,1)=-0.000000215675739;
default.A(3,3)=0.963347051938211;
default.A(3,4)=0.000001997232377;
default.A(3,5)=-0.015035060348630;
default.A(3,7)=0.049576658222840;
default.A(3,10)=0.056557669282469;
default.A(3,12)=-0.020185553931149;
default.A(3,13)=0.009209634796355;
default.A(3,14)=0.005410039138861;
default.A(3,15)=-0.061370223092061;
default.A(3,16)=0.012488002436467;
default.A(4,2)=0.000030813597242;
default.A(4,3)=-0.000013201192039;
default.A(4,4)=0.934293397178708;
default.A(4,6)=-0.012545834604958;
default.A(4,8)=0.091582067535556;
default.A(4,10)=-0.018058323466676;
default.A(4,12)=0.085120051841233;
default.A(4,13)=0.009811854403879;
default.A(4,14)=0.011315673165806;
default.A(4,15)=0.006552708499769;
default.A(4,16)=-0.108089206958524;
default.A(5,1)=-1.117661396458455;
default.A(5,3)=-0.282006235972823;
default.A(5,5)=-1.564748770599065;
default.A(5,7)=-1.486463231773247;
default.A(5,9)=2.019027868454343;
default.A(5,10)=-0.131811778813348;
default.A(5,11)=-0.442270759952197;
default.A(5,13)=2.145858735931954;
default.A(5,14)=-2.000688119370509;
default.A(5,15)=2.977895908227599;
default.A(5,16)=-0.117132219674257;
default.A(6,2)=0.100962607071790;
default.A(6,4)=-0.012794776063790;
default.A(6,6)=0.837518993621849;
default.A(6,8)=0.084146422453310;
default.A(6,9)=-0.011166818604624;
default.A(6,11)=-0.042639760854227;
default.A(6,12)=-0.005078371669974;
default.A(6,13)=0.008180919124468;
default.A(6,14)=0.109701468277646;
default.A(6,15)=-0.005697630314320;
default.A(6,16)=-0.063133053042128;
default.A(7,1)=0.233675857602013;
default.A(7,3)=-0.482512931939479;
default.A(7,5)=-1.242572848108904;
default.A(7,7)=-3.182074958035218;
default.A(7,9)=0.114635973895867;
default.A(7,10)=0.259645224242758;
default.A(7,12)=-0.089210430618285;
default.A(7,13)=1.267753806738352;
default.A(7,14)=-1.025558387764011;
default.A(7,15)=4.641217055211383;
default.A(7,16)=-0.494998361224467;
default.A(8,2)=-0.013350133955438;
default.A(8,4)=0.109395290070223;
default.A(8,6)=0.060779720704721;
default.A(8,8)=0.821799442073810;
default.A(8,10)=0.004375399001908;
default.A(8,11)=-0.001077004561674;
default.A(8,12)=-0.102962789053082;
default.A(8,13)=-0.010580338496518;
default.A(8,14)=-0.049088734262834;
default.A(8,15)=0.015683509397157;
default.A(8,16)=0.165025639081727;
default.A(9,1)=-1.258487968392639;
default.A(9,2)=-0.229448411068305;
default.A(9,5)=1.919500750687672;
default.A(9,6)=0.112119104657021;
default.A(9,7)=-0.311492865029973;
default.A(9,9)=-1.703655789177862;
default.A(9,11)=-1.207749452732339;
default.A(9,13)=3.061824882040709;
default.A(9,14)=1.410067254810361;
default.A(9,15)=-1.620438348478263;
default.A(9,16)=-0.172239157316390;
default.A(10,3)=0.126200199318460;
default.A(10,4)=-0.022983284287318;
default.A(10,5)=-0.008120516828302;
default.A(10,7)=-0.055714995501072;
default.A(10,8)=-0.015512012724942;
default.A(10,10)=0.740397322949040;
default.A(10,12)=0.165631678061666;
default.A(10,13)=0.007392935059369;
default.A(10,14)=-0.005088658437073;
default.A(10,15)=0.114245677502592;
default.A(10,16)=-0.046448345112420;
default.A(11,1)=-0.185594032096898;
default.A(11,2)=-1.050487342270146;
default.A(11,5)=0.280142854897838;
default.A(11,6)=1.166729691211534;
default.A(11,7)=-0.003291974745759;
default.A(11,9)=-1.364274930830569;
default.A(11,11)=-1.911035669997849;
default.A(11,13)=2.626951316805156;
default.A(11,14)=2.011380120313906;
default.A(11,15)=-0.895634135710881;
default.A(11,16)=-0.674885897576351;
default.A(12,3)=-0.036895941794987;
default.A(12,4)=0.124751267567080;
default.A(12,6)=-0.000681952586147;
default.A(12,7)=-0.009874593490044;
default.A(12,8)=-0.103070320202172;
default.A(12,10)=0.147623559244805;
default.A(12,12)=0.762732372470742;
default.A(12,13)=-0.000167343810382;
default.A(12,14)=0.006587430591438;
default.A(12,15)=-0.031027539553538;
default.A(12,16)=0.140023061563205;
default.A(13,1)=-0.000541279252546;
default.A(13,2)=-0.000278109607561;
default.A(13,3)=-0.000054176442901;
default.A(13,5)=0.008298330228295;
default.A(13,6)=-0.000769347129884;
default.A(13,7)=-0.004654938043533;
default.A(13,8)=-0.000314557889776;
default.A(13,9)=0.009773925672414;
default.A(13,10)=-0.000911156106547;
default.A(13,11)=-0.003104705991548;
default.A(13,12)=-0.000243371157690;
default.A(13,13)=0.086851006210398;
default.A(13,14)=0.026717993781118;
default.A(13,15)=0.018880086723449;
default.A(13,16)=-0.001470346048755;
default.A(14,1)=-0.000308911929753;
default.A(14,2)=-0.001286217907406;
default.A(14,4)=-0.000234302824040;
default.A(14,5)=-0.000481307154340;
default.A(14,6)=0.008525443397378;
default.A(14,7)=-0.000582885213274;
default.A(14,8)=-0.001519998252099;
default.A(14,9)=-0.003917471859423;
default.A(14,10)=-0.000123165249079;
default.A(14,11)=0.009166517754312;
default.A(14,12)=-0.001511458676591;
default.A(14,13)=0.030657231581617;
default.A(14,14)=0.097011943399957;
default.A(14,15)=-0.003206151772135;
default.A(14,16)=0.013278268566014;
default.A(15,1)=-0.000533615677834;
default.A(15,3)=-0.002743536776957;
default.A(15,4)=-0.000217309806697;
default.A(15,5)=-0.002514410981134;
default.A(15,6)=0.000000000823235;
default.A(15,7)=0.014795104941600;
default.A(15,8)=-0.000578001464558;
default.A(15,9)=-0.000692501035488;
default.A(15,10)=0.011141058547923;
default.A(15,11)=-0.000484021482550;
default.A(15,12)=-0.001563222771500;
default.A(15,13)=0.023728487474231;
default.A(15,14)=-0.005770433812695;
default.A(15,15)=0.113374945414231;
default.A(15,16)=0.008086483936007;
default.A(16,2)=-0.000412380549446;
default.A(16,3)=-0.000806583592226;
default.A(16,4)=-0.009382617175579;
default.A(16,5)=-0.000018508882290;
default.A(16,6)=-0.000251901194897;
default.A(16,7)=-0.001035780962911;
default.A(16,8)=0.026963912255439;
default.A(16,9)=-0.000051394738939;
default.A(16,10)=-0.001698848668489;
default.A(16,11)=-0.000889710442047;
default.A(16,12)=0.026116048722451;
default.A(16,13)=-0.005058781268701;
default.A(16,14)=0.016671722384844;
default.A(16,15)=0.012488895567269;
default.A(16,16)=0.127766562822260;
default.B=spalloc(16, 16, 1);
default.B(13,1)=-0.000557860350840;
default.B(13,2)=-0.000278081021086;
default.B(13,3)=-0.000056053992134;
default.B(13,5)=0.008385088933615;
default.B(13,6)=-0.000749784957703;
default.B(13,7)=-0.004628860960489;
default.B(13,8)=-0.000323705890223;
default.B(13,9)=0.009866033853503;
default.B(13,10)=-0.000931565516998;
default.B(13,11)=-0.003013058707628;
default.B(13,12)=-0.000264802501349;
default.B(13,13)=0.086397796776968;
default.B(13,14)=0.026640950687160;
default.B(13,15)=0.019001842761180;
default.B(13,16)=-0.001308584169040;
default.B(14,1)=-0.000313870448632;
default.B(14,2)=-0.001282188535143;
default.B(14,4)=-0.000244636796768;
default.B(14,5)=-0.000451929632778;
default.B(14,6)=0.008598276427604;
default.B(14,7)=-0.000593080034884;
default.B(14,8)=-0.001492012192588;
default.B(14,9)=-0.003826392064351;
default.B(14,10)=-0.000133510230399;
default.B(14,11)=0.009263680701985;
default.B(14,12)=-0.001567251437426;
default.B(14,13)=0.030536312028083;
default.B(14,14)=0.096534789443108;
default.B(14,15)=-0.003034664305523;
default.B(14,16)=0.013474010938847;
default.B(15,1)=-0.000537847825276;
default.B(15,3)=-0.002674087254771;
default.B(15,4)=-0.000224875194868;
default.B(15,5)=-0.002406356742341;
default.B(15,6)=-0.000000008973755;
default.B(15,7)=0.014846149912864;
default.B(15,8)=-0.000600943606773;
default.B(15,9)=-0.000667763991219;
default.B(15,10)=0.011184875419503;
default.B(15,11)=-0.000492527138605;
default.B(15,12)=-0.001535819432455;
default.B(15,13)=0.023748374061266;
default.B(15,14)=-0.005703036427111;
default.B(15,15)=0.112870942163746;
default.B(15,16)=0.008221952357609;
default.B(16,2)=-0.000421109524057;
default.B(16,3)=-0.000818026374655;
default.B(16,4)=-0.009190188971218;
default.B(16,5)=-0.000022497948370;
default.B(16,6)=-0.000149477417736;
default.B(16,7)=-0.001068685720221;
default.B(16,8)=0.026996214580295;
default.B(16,9)=-0.000058681375794;
default.B(16,10)=-0.001591626503965;
default.B(16,11)=-0.000921945184815;
default.B(16,12)=0.026149714390829;
default.B(16,13)=-0.004979667118486;
default.B(16,14)=0.016773585765574;
default.B(16,15)=0.012599199139014;
default.B(16,16)=0.127103826540342;
default.fstar=[];
default.fstar(1)=0.000000000000000;
default.fstar(2)=0.000000000000000;
default.fstar(3)=0.000000000000000;
default.fstar(4)=0.000000000000000;
default.fstar(5)=0.000000000000000;
default.fstar(6)=0.000000000000000;
default.fstar(7)=0.000000000000000;
default.fstar(8)=0.000000000000000;
default.fstar(9)=0.000000000000000;
default.fstar(10)=0.000000000000000;
default.fstar(11)=0.000000000000000;
default.fstar(12)=0.000000000000000;
default.fstar(13)=0.000000000000000;
default.fstar(14)=0.000000000000000;
default.fstar(15)=0.000000000000000;
default.fstar(16)=0.000000000000000;