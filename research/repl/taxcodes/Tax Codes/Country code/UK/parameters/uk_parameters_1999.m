

% Parameter Assignment for year 1999.

function[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st] = uk_parameters_1999
% Standard  Allowances

basic_all=4335;
married_all=1970;

%Social Security Parameters

socseclimit1=66;
socseclimit2=500;
socsec_r1=0;
socsec_r2=0.1;

%Employer Social Security Parameters

ssc_r2=0.122;
st=4316;
 
% %Tax Schedule Parameters
taxbracket1=1500;
taxbracket2=28000;
tax_r1=0.10;
tax_r2=0.23;
tax_r3=0.40;

 child_ben1=14.4;   
 child_ben2=9.6;
 singlebenefit=2.7;
 
end