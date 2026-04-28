

% Parameter Assignment for year 2011

function[basic_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,taxbracket1,taxbracket2, tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st,wtc_basic,wtc_couplelone,wtc_30hr,ctc_family,ctc_child,ntc_1st_thres,ntc_1st_taper,ntc_2nd_thres,ntc_2nd_taper,basic_thres] = uk_parameters_2011

% Standard  Allowances
basic_all=7475;
basic_thres=100000;

%Social Security Parameters

socseclimit1=7225;
socseclimit2=42475;
socsec_r1=0;
socsec_r2=0.12;
socsec_r3=0.02;

%Employer Social Security Parameters

ssc_r2=0.138;
st=7072;
 
% %Tax Schedule Parameters
taxbracket1=35000;
taxbracket2=150000;
tax_r1=0.2;
tax_r2=0.4;
tax_r3=0.5;

 child_ben1=20.3;   
 child_ben2=13.4;
 singlebenefit=0;
 
%Tax credits
wtc_basic=1920;
wtc_couplelone=1950;
wtc_30hr=790;

ctc_family=545;
ctc_child=2555;

ntc_1st_thres=6420;
ntc_1st_taper=0.41;
ntc_2nd_thres=40000;
ntc_2nd_taper=0.41;


end