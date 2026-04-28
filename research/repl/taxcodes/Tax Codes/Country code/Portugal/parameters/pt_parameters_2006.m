

% Parameter Assignment for year 2006 Portugal.

function[ssc_r,perc,max_all,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3,echelon4,echelon5,chben_e1,chben_e2,chben_e3,chben_e4,chben_e5,ssc_emp_r] = pt_parameters_2006

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=3334.18;
 
%  %Tax Schedule Parameters
tax_floor=1775;
dispy=6483.12;
taxbracket1=4451;
taxbracket2=6732;
taxbracket3=16692;
taxbracket4=38391;
taxbracket5=55639;
taxbracket6=60000;

tax_r1=0.105;
tax_r2=0.13;
tax_r3=0.235;
tax_r4=0.34;
tax_r5=0.365;
tax_r6=0.4;
tax_r7=0.42;

%Tax Credits
married_cred=192.95;
single_cred=231.54;
child_cred=154.36;
singlepar_cred=308.72;

% %Child benefit % 4 income brackets. 

echelon1=2701.3;  %upper limit on 1st bracket
echelon2=5402.6;   %upper limit on 2nd bracket
echelon3=8103.9;  
echelon4=13506.5;
echelon5=27013;

chben_e1=411.71;  % benefit per child for 1st income brackte up to 2 kids  
chben_e2=343.2;
chben_e3=315.77;
chben_e4=272.61;
chben_e5=136.37;

end