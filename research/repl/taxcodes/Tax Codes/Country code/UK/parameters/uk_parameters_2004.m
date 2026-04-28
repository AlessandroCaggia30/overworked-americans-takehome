

% Parameter Assignment for year 2004.

function[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st] = uk_parameters_2004
% Standard  Allowances

basic_all=4745;
married_all=0;

%Social Security Parameters

socseclimit1=91.25;
socseclimit2=610;
socsec_r1=0;
socsec_r2=0.11;
socsec_r3=0.01;

%Employer Social Security Parameters

ssc_r2=0.128;
st=4745;

% %Tax Schedule Parameters
taxbracket1=2020;
taxbracket2=31400;
tax_r1=0.10;
tax_r2=0.22;
tax_r3=0.40;

 child_ben1=16.5;   
 child_ben2=11.05;
 singlebenefit=1.05;
 
end