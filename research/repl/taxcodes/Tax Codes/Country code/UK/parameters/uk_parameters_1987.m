

% Parameter Assignment for year 1987.

function[basic_all,married_all,singleparent_all,socseclimit1,socseclimit2,socseclimit3,socseclimit4,socsec_r1,socsec_r2,socsec_r3,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp] = uk_parameters_1987
% Standard  Allowances

basic_all=2425;
married_all=1370;
singleparent_all=1370;

%Social Security Parameters % continue from here

socseclimit1=39;
socseclimit2=65;
socseclimit3=100;
socseclimit4=295;

socsec_r1=0.05;
socsec_r2=0.07;
socsec_r3=0.09;

%Employer Social Security Parameters

socseclim1_emp=39*52;
socseclim2_emp=65*52;
socseclim3_emp=100*52;
socseclim4_emp=150*52;
socsec_r1_emp=0.05;
socsec_r2_emp=0.07;
socsec_r3_emp=0.09;
socsec_r4_emp=0.1045;
 
%Tax Schedule Parameters
taxbracket1=17900;
taxbracket2=20400;
taxbracket3=25400;
taxbracket4=33300;
taxbracket5=41200;

tax_r1=0.27;
tax_r2=0.40;
tax_r3=0.45;
tax_r4=0.50;
tax_r5=0.55;
tax_r6=0.60;

 child_ben1=7.25;   
 child_ben2=7.25;
 singlebenefit=4.7;
 
% end