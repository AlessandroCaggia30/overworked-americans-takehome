

% Parameter Assignment for year 1983.

function[basic_all,married_all,singleparent_all,socseclimit1,socseclimit2,socsec_r1,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socsec_r1_emp] = uk_parameters_1983
% Standard  Allowances

basic_all=1785;
married_all=1010;
singleparent_all=0;

%Social Security Parameters % continue from here

socseclimit1=32.5;
socseclimit2=235;

socsec_r1=0.09;

 %Employer Social Security Parameters

socseclim1_emp=235*52;
socsec_r1_emp=0.1045;
 
%Tax Schedule Parameters
taxbracket1=14600;
taxbracket2=17200;
taxbracket3=21800;
taxbracket4=28900;
taxbracket5=36000;

tax_r1=0.3;
tax_r2=0.4;
tax_r3=0.45;
tax_r4=0.5;
tax_r5=0.55;
tax_r6=0.6;

 child_ben1=5.85;   
 child_ben2=5.85;
 singlebenefit=3.65;
 
% end