

% Parameter Assignment for year 2007.

function[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st] = uk_parameters_2007

% Standard  Allowances
basic_all=5225;
married_all=0;

%Social Security Parameters

socseclimit1=100;
socseclimit2=670;
socsec_r1=0;
socsec_r2=0.11;
socsec_r3=0.01;

%Employer Social Security Parameters

ssc_r2=0.128;
st=5200;
 
% %Tax Schedule Parameters
taxbracket1=2230;
taxbracket2=34600;
tax_r1=0.10;
tax_r2=0.22;
tax_r3=0.40;

 child_ben1=18.1;   
 child_ben2=12.1;
 singlebenefit=0;
 
end