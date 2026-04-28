

% Parameter Assignment for year 2009 Portugal.

function[ssc_r,perc,max_all,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3,echelon4,echelon5,chben_e1,chben_e2,chben_e3,chben_e4,chben_e5,ssc_emp_r] = pt_parameters_2009

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=3888;
 
%  %Tax Schedule Parameters
tax_floor=1896;
dispy=7560;
taxbracket1=4755;
taxbracket2=7192;
taxbracket3=17836;
taxbracket4=41021;
taxbracket5=59450;
taxbracket6=64110;

tax_r1=0.105;
tax_r2=0.13;
tax_r3=0.235;
tax_r4=0.34;
tax_r5=0.365;
tax_r6=0.4;
tax_r7=0.42;

%Tax Credits
married_cred=247.5;
single_cred=247.5;
child_cred=180;
singlepar_cred=360;

% %Child benefit % 4 income brackets. 

echelon1=2934.54;  %upper limit on 1st bracket
echelon2=5869.08;   %upper limit on 2nd bracket
echelon3=8803.62;  
echelon4=14672.7;
echelon5=29345.4;

chben_e1=567.84;  % benefit per child for 1st income brackte up to 2 kids  
chben_e2=470.99;
chben_e3=345.02;
chben_e4=293.67;
chben_e5=146.77;

end