

% Parameter Assignment for year 1997 Portugal.

function[ssc_r,perc,max_all,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,married_cred,single_cred,child_cred,echelon1,echelon2, chben_e1_1, chben_e1_2, chben_e2_1, chben_e2_2,chben_e3_1, chben_e3_2,ssc_emp_r] = pt_parameters_1997

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=0.7;
max_all=484000;
 
%  %Tax Schedule Parameters
taxbracket1=1050000;
taxbracket2=2450000;
taxbracket3=6150000;


tax_r1=0.15;
tax_r2=0.25;
tax_r3=0.35;
tax_r4=0.4;


%Tax Credits
married_cred=26300;
single_cred=34500;
child_cred=19000;


% %Child benefitechelon1=1236900;  %upper limit on 1st bracket
echelon1=1190700;  %upper limit on 1st bracket
echelon2=6350400;  %upper limit on 2nd bracket
chben_e1_1=4000*12;  % benefit per child for 1st income brackte up to 2 kids
chben_e1_2=6000*12;  % benefit per child for 1st income bracket for 3rd , 4th and so on kids
chben_e2_1=2850*12;
chben_e2_2=2850*12;
chben_e3_1=2770*12;
chben_e3_2=2770*12;

end