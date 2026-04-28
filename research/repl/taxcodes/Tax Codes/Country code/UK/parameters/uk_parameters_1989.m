

% Parameter Assignment for year 1989.

function[basic_all,married_all,singleparent_all,socseclimit1,socseclimit2,socseclimit3,socseclimit4,socsec_r1,socsec_r2,socsec_r3,taxbracket1,tax_r1,tax_r2,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp] = uk_parameters_1989
% Standard  Allowances

basic_all=2785;
married_all=1590;
singleparent_all=1590;

%Social Security Parameters % continue from here

socseclimit1=43;
socseclimit2=75;
socseclimit3=115;
socseclimit4=325;

socsec_r1=0.05;
socsec_r2=0.07;
socsec_r3=0.09;

%Employer Social Security Parameters

socseclim1_emp=2236;
socseclim2_emp=3900;
socseclim3_emp=5980;
socseclim4_emp=8580;
socsec_r1_emp=0.05;
socsec_r2_emp=0.07;
socsec_r3_emp=0.09;
socsec_r4_emp=0.1045;
 
 
%Tax Schedule Parameters
taxbracket1=20700;
tax_r1=0.25;
tax_r2=0.40;

 child_ben1=7.25;   
 child_ben2=7.25;
 singlebenefit=5.2;
 
% end