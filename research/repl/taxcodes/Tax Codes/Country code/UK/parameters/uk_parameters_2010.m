

% Parameter Assignment for year 2010

function[basic_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,taxbracket1,taxbracket2, tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st,wtc_basic,wtc_couplelone,wtc_30hr,ctc_family,ctc_child,ntc_1st_thres,ntc_1st_taper,ntc_2nd_thres,ntc_2nd_taper,basic_thres] = uk_parameters_2010

% Standard  Allowances
basic_all=6475;
basic_thres=100000;

%Social Security Parameters

socseclimit1=5715;
socseclimit2=43875;
socsec_r1=0;
socsec_r2=0.11;
socsec_r3=0.01;

%Employer Social Security Parameters

ssc_r2=0.128;
st=5715;
 
% %Tax Schedule Parameters
taxbracket1=37400;
taxbracket2=150000;
tax_r1=0.2;
tax_r2=0.4;
tax_r3=0.5;

 child_ben1=20.3;   
 child_ben2=13.4;
 singlebenefit=0;
 
%Tax credits
wtc_basic=1920;
wtc_couplelone=1890;
wtc_30hr=790;

ctc_family=545;
ctc_child=2300;

ntc_1st_thres=6420;
ntc_1st_taper=0.39;
ntc_2nd_thres=50000;
ntc_2nd_taper=0.0667;


end