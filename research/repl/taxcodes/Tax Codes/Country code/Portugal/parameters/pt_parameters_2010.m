

% Parameter Assignment for year 2010 Portugal.

function[ssc_r,perc,max_all,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3,echelon4,echelon5,chben_e1,chben_e2,chben_e3,chben_e4,chben_e5,ssc_emp_r] = pt_parameters_2010

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=4104;
 
%  %Tax Schedule Parameters
tax_floor=1896;
dispy=7980;
taxbracket1=4793;
taxbracket2=7250;
taxbracket3=17979;
taxbracket4=41349;
taxbracket5=59926;
taxbracket6=64623;
taxbracket7=150000;

tax_r1=0.1108;
tax_r2=0.1358;
tax_r3=0.2408;
tax_r4=0.3488;
tax_r5=0.3738;
tax_r6=0.4088;
tax_r7=0.4288;
tax_r8=0.4588;

%Tax Credits
married_cred=261.25;
single_cred=261.25;
child_cred=190;
singlepar_cred=380;

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