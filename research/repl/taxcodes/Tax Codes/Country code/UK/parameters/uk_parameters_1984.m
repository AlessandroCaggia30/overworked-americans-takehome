

% Parameter Assignment for year 1984.

function[basic_all,married_all,singleparent_all,socseclimit1,socseclimit2,socsec_r1,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socsec_r1_emp] = uk_parameters_1984
% Standard  Allowances

basic_all=2005;
married_all=1150;
singleparent_all=0;

%Social Security Parameters % continue from here

socseclimit1=34;
socseclimit2=250;

socsec_r1=0.09;

 %Employer Social Security Parameters

socseclim1_emp=250*52;
socsec_r1_emp=0.1045;

 
%Tax Schedule Parameters
taxbracket1=15400;
taxbracket2=18200;
taxbracket3=23100;
taxbracket4=30600;
taxbracket5=38100;

tax_r1=0.3;
tax_r2=0.4;
tax_r3=0.45;
tax_r4=0.5;
tax_r5=0.55;
tax_r6=0.6;

 child_ben1=6.5;   
 child_ben2=6.5;
 singlebenefit=4.05;
 
% end