

% Parameter Assignment for year 2008.

function[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st] = uk_parameters_2008

% Standard  Allowances
basic_all=6035;
married_all=0;

%Social Security Parameters

socseclimit1=105;
socseclimit2=770;
socsec_r1=0;
socsec_r2=0.11;
socsec_r3=0.01;

%Employer Social Security Parameters

ssc_r2=0.128;
st=5460;
 
% %Tax Schedule Parameters
taxbracket1=34800;
taxbracket2=10000000000000;
tax_r1=0.2;
tax_r2=0.4;
tax_r3=0;

 child_ben1=18.8;   
 child_ben2=12.55;
 singlebenefit=0;
 
end