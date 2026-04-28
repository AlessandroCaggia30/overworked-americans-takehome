

% Parameter Assignment for year 2002 Portugal.

function[ssc_r,perc,max_all,tax_floor,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3, chben_e1_1, chben_e1_2, chben_e2_1, chben_e2_2,chben_e3_1, chben_e3_2,chben_e4_1,chben_e4_2,ssc_emp_r] = pt_parameters_2002

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;
 %  Allowances
perc=1;
max_all=3006.81;
 
%  %Tax Schedule Parameters
tax_floor=1634.93;
taxbracket1=4100.12;
taxbracket2=6201.42;
taxbracket3=15375.45;
taxbracket4=35363.52;
taxbracket5=51251.48;

tax_r1=0.12;
tax_r2=0.14;
tax_r3=0.24;
tax_r4=0.34;
tax_r5=0.38;
tax_r6=0.4;


%Tax Credits
married_cred=174.01;
single_cred=208.81;
child_cred=139.2;
singlepar_cred=278.41;

% %Child benefit % 3 income brackets. 

echelon1=7308.21;  %upper limit on 1st bracket
echelon2=19488.56;   %upper limit on 2nd bracket
echelon3=38977.12;      
chben_e1_1=26.24*12;  % benefit per child for 1st income brackte up to 2 kids
chben_e1_2=39.6*12;  % benefit per child for 1st income bracket for 3rd , 4th and so on kids
chben_e2_1=20.45*12;
chben_e2_2=29.98*12;
chben_e3_1=17.51*12;
chben_e3_2=23.74*12;
chben_e4_1=10.84*12;
chben_e4_2=14.23*12;
end