

% Parameter Assignment for year 1991.

function[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,taxbracket1,tax_r1,tax_r2,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp] = uk_parameters_1991
% Standard  Allowances

basic_all=3295;
married_all=1720;

%Social Security Parameters

socseclimit1=52;
socseclimit2=390;
socsec_r1=0.02;
socsec_r2=0.09;

%Employer Social Security Parameters

socseclim1_emp=2704;
socseclim2_emp=4420;
socseclim3_emp=6760;
socseclim4_emp=9620;
socsec_r1_emp=0.046;
socsec_r2_emp=0.066;
socsec_r3_emp=0.086;
socsec_r4_emp=0.104;
 
% %Tax Schedule Parameters
taxbracket1=23700;

tax_r1=0.25;
tax_r2=0.40;

 child_ben1=9.25;   
 child_ben2=7.5;
 singlebenefit=5.6;
 
end