

% Parameter Assignment for year 1996.

function[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp] = uk_parameters_1996
% Standard  Allowances

basic_all=3765;
married_all=1790;

%Social Security Parameters

socseclimit1=61;
socseclimit2=455;
socsec_r1=0.02;
socsec_r2=0.1;


%Employer Social Security Parameters

socseclim1_emp=3172;
socseclim2_emp=5720;
socseclim3_emp=8060;
socseclim4_emp=10920;
socsec_r1_emp=0.03;
socsec_r2_emp=0.05;
socsec_r3_emp=0.07;
socsec_r4_emp=0.102;
 
% %Tax Schedule Parameters
taxbracket1=3900;
taxbracket2=25500;
tax_r1=0.20;
tax_r2=0.24;
tax_r3=0.40;

 child_ben1=10.8;   
 child_ben2=8.8;
 singlebenefit=6.30;
 
end