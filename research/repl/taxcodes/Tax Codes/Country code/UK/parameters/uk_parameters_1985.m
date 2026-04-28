

% Parameter Assignment for year 1985.

function[basic_all,married_all,singleparent_all,socseclimit1,socseclimit2,socseclimit3,socseclimit4,socsec_r1,socsec_r2,socsec_r3,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp] = uk_parameters_1985
% Standard  Allowances

basic_all=2205;
married_all=1250;
singleparent_all=0;

%Social Security Parameters % continue from here

socseclimit1=35.5;
socseclimit2=55;
socseclimit3=90;
socseclimit4=265;

socsec_r1=0.05;
socsec_r2=0.07;
socsec_r3=0.09;

 %Employer Social Security Parameters

socseclim1_emp=35*52;
socseclim2_emp=55*52;
socseclim3_emp=90*52;
socseclim4_emp=130*52;
socsec_r1_emp=0.05;
socsec_r2_emp=0.07;
socsec_r3_emp=0.09;
socsec_r4_emp=0.1045;

%Tax Schedule Parameters
taxbracket1=16200;
taxbracket2=19200;
taxbracket3=24400;
taxbracket4=32300;
taxbracket5=40200;

tax_r1=0.3;
tax_r2=0.4;
tax_r3=0.45;
tax_r4=0.5;
tax_r5=0.55;
tax_r6=0.6;

 child_ben1=6.85;   
 child_ben2=6.85;
 singlebenefit=4.25;
 
% end