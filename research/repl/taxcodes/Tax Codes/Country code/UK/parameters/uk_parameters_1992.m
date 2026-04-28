

% Parameter Assignment for year 1992.

function[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp] = uk_parameters_1992
% Standard  Allowances

basic_all=3445;
married_all=1720;

%Social Security Parameters

socseclimit1=54;
socseclimit2=405;
socsec_r1=0.02;
socsec_r2=0.09;

%Employer Social Security Parameters

socseclim1_emp=2808;
socseclim2_emp=4680;
socseclim3_emp=6500;
socseclim4_emp=9880;
socsec_r1_emp=0.046;
socsec_r2_emp=0.066;
socsec_r3_emp=0.086;
socsec_r4_emp=0.104;
 
% %Tax Schedule Parameters
taxbracket1=2000;
taxbracket2=23700;
tax_r1=0.20;
tax_r2=0.25;
tax_r3=0.40;

 child_ben1=9.65;   
 child_ben2=7.8;
 singlebenefit=5.85;
 
end