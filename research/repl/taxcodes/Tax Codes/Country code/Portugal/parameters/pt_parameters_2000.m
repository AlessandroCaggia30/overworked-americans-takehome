

% Parameter Assignment for year 2000 Portugal.

function[ssc_r,perc,max_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,married_cred,single_cred,child_cred,echelon1,echelon2, chben_e1_1, chben_e1_2, chben_e2_1, chben_e2_2,chben_e3_1, chben_e3_2,ssc_emp_r] = pt_parameters_2000

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=0.7;
max_all=551232;
 
%  %Tax Schedule Parameters
taxbracket1=730000;
taxbracket2=1149000;
taxbracket3=2840000;
taxbracket4=6581000;

tax_r1=0.14;
tax_r2=0.15;
tax_r3=0.25;
tax_r4=0.35;
tax_r5=0.4;

%Tax Credits
married_cred=27950;
single_cred=36720;
child_cred=20200;


% %Child benefit % 3 income brackets. 

echelon1=1407000;  %upper limit on 1st bracket
echelon2=7504000;  %upper limit on 2nd bracket
chben_e1_1=4960*12;  % benefit per child for 1st income brackte up to 2 kids
chben_e1_2=7450*12;  % benefit per child for 1st income bracket for 3rd , 4th and so on kids
chben_e2_1=3370*12;
chben_e2_2=4570*12;
chben_e3_1=3000*12;
chben_e3_2=3900*12;
 
end