

% Parameter Assignment for year 1997.

function[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp] = uk_parameters_1997
% Standard  Allowances

basic_all=4045;
married_all=1830;

%Social Security Parameters

socseclimit1=62;
socseclimit2=465;
socsec_r1=0.02;
socsec_r2=0.1;

%Employer Social Security Parameters

socseclim1_emp=3224;
socseclim2_emp=5720;
socseclim3_emp=8060;
socseclim4_emp=10920;
socsec_r1_emp=0.03;
socsec_r2_emp=0.05;
socsec_r3_emp=0.07;
socsec_r4_emp=0.1;
 
% %Tax Schedule Parameters
taxbracket1=4100;
taxbracket2=26100;
tax_r1=0.20;
tax_r2=0.23;
tax_r3=0.40;

 child_ben1=11.05;   
 child_ben2=9;
 singlebenefit=6.05;
 
end