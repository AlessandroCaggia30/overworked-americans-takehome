

% Parameter Assignment for year 1994

function[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp] = uk_parameters_1994
% Standard  Allowances

basic_all=3445;
married_all=1720;

%Social Security Parameters

socseclimit1=57;
socseclimit2=430;
socsec_r1=0.02;
socsec_r2=0.1;


%Employer Social Security Parameters

socseclim1_emp=2964;
socseclim2_emp=5200;
socseclim3_emp=7540;
socseclim4_emp=10400;
socsec_r1_emp=0.036;
socsec_r2_emp=0.056;
socsec_r3_emp=0.076;
socsec_r4_emp=0.102;
 
% %Tax Schedule Parameters
taxbracket1=3000;
taxbracket2=23700;
tax_r1=0.20;
tax_r2=0.25;
tax_r3=0.40;

 child_ben1=10.2;   
 child_ben2=8.25;
 singlebenefit=6.15;
 
end