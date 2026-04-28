

% Parameter Assignment for year 2007 Portugal.

function[ssc_r,perc,max_all,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3,echelon4,echelon5,chben_e1,chben_e2,chben_e3,chben_e4,chben_e5,ssc_emp_r] = pt_parameters_2007

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=3481.92;
 
%  %Tax Schedule Parameters
tax_floor=1812;
dispy=6770.4;
taxbracket1=4544;
taxbracket2=6873;
taxbracket3=17043;
taxbracket4=39197;
taxbracket5=56807;
taxbracket6=61260;

tax_r1=0.105;
tax_r2=0.13;
tax_r3=0.235;
tax_r4=0.34;
tax_r5=0.365;
tax_r6=0.4;
tax_r7=0.42;

%Tax Credits
married_cred=221.65;
single_cred=221.65;
child_cred=161.2;
singlepar_cred=322.4;

% %Child benefit % 4 income brackets. 

echelon1=2821;  %upper limit on 1st bracket
echelon2=5642;   %upper limit on 2nd bracket
echelon3=8463;  
echelon4=14105;
echelon5=28210;

chben_e1=424.45;  % benefit per child for 1st income brackte up to 2 kids  
chben_e2=353.86;
chben_e3=325.52;
chben_e4=279.76;
chben_e5=139.88;

end