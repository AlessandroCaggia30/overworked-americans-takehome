

% Parameter Assignment for year 1988.

function[basic_all,married_all,singleparent_all,socseclimit1,socseclimit2,socseclimit3,socseclimit4,socsec_r1,socsec_r2,socsec_r3,taxbracket1,tax_r1,tax_r2,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp] = uk_parameters_1988
% Standard  Allowances

basic_all=2605;
married_all=1490;
singleparent_all=1490;

%Social Security Parameters % continue from here

socseclimit1=41;
socseclimit2=70;
socseclimit3=105;
socseclimit4=305;

socsec_r1=0.05;
socsec_r2=0.07;
socsec_r3=0.09;

%Employer Social Security Parameters

socseclim1_emp=2132;
socseclim2_emp=3640;
socseclim3_emp=5460;
socseclim4_emp=8060;
socsec_r1_emp=0.05;
socsec_r2_emp=0.07;
socsec_r3_emp=0.09;
socsec_r4_emp=0.1045;
 
%Tax Schedule Parameters
taxbracket1=19300;
tax_r1=0.25;
tax_r2=0.40;

 child_ben1=7.25;   
 child_ben2=7.25;
 singlebenefit=4.9;
 
% end