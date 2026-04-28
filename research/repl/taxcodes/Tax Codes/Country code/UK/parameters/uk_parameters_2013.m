

% Parameter Assignment for year 2013

function[basic_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,taxbracket1,taxbracket2, tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st,wtc_basic,wtc_couplelone,wtc_30hr,ctc_family,ctc_child,ntc_1st_thres,ntc_1st_taper,basic_thres,cb_1st_thres,cb_2nd_thres,cb_taper1,cb_taper2, CB_first, CB_others] = uk_parameters_2013

% Standard  Allowances
basic_all=9440;
basic_thres=100000;

%Social Security Parameters

socseclimit1=7755;
socseclimit2=41450;
socsec_r1=0;
socsec_r2=0.12;
socsec_r3=0.02;

%Employer Social Security Parameters

ssc_r2=0.138;
st=7696;
 
% %Tax Schedule Parameters
taxbracket1=32010;
taxbracket2=150000;
tax_r1=0.2;
tax_r2=0.4;
tax_r3=0.45;

 child_ben1=20.3;   
 child_ben2=13.4;
 singlebenefit=0;
 
cb_1st_thres=50000;
cb_2nd_thres=60000;
cb_taper1=0.01;
cb_taper2=100;
 
CB_first=20.30;
CB_others=13.40;

%Tax credits
wtc_basic=1920;
wtc_couplelone=1970;
wtc_30hr=790;

ctc_family=545;
ctc_child=2720;

ntc_1st_thres=6420;
ntc_1st_taper=0.41;



end