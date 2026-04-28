

% Parameter Assignment for year 2003 Portugal.

function[ssc_r,perc,max_all,tax_floor,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3, chben_e1_1, chben_e1_2, chben_e2_1, chben_e2_2,chben_e3_1, chben_e3_2,chben_e4_1,chben_e4_2,ssc_emp_r] = pt_parameters_2003

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=3081.02;
 
%  %Tax Schedule Parameters
tax_floor=1667.63;
taxbracket1=4182.12;
taxbracket2=6325.4;
taxbracket3=15682.96;
taxbracket4=36070.79;
taxbracket5=52276.51;

tax_r1=0.12;
tax_r2=0.14;
tax_r3=0.24;
tax_r4=0.34;
tax_r5=0.38;
tax_r6=0.4;


%Tax Credits
married_cred=178.3;
single_cred=213.96;
child_cred=142.6;
singlepar_cred=285.28;

% %Child benefit % 4 income brackets. 

echelon1=7488.61;  %upper limit on 1st bracket
echelon2=19969.6;   %upper limit on 2nd bracket
echelon3=39939.2;      
chben_e1_1=26.76*12;  % benefit per child for 1st income brackte up to 2 kids
chben_e1_2=40.15*12;  % benefit per child for 1st income bracket for 3rd , 4th and so on kids
chben_e2_1=20.86*12;
chben_e2_2=30.58*12;
chben_e3_1=17.86*12;
chben_e3_2=24.21*12;
chben_e4_1=15.72*12;
chben_e4_2=20.45*12;
end