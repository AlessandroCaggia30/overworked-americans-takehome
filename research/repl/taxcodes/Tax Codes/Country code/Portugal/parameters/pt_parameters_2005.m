

% Parameter Assignment for year 2005 Portugal.

function[ssc_r,perc,max_all,tax_floor,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3,echelon4,echelon5,chben_e1,chben_e2,chben_e3,chben_e4,chben_e5,ssc_emp_r] = pt_parameters_2005

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=3237.41;
 
%  %Tax Schedule Parameters
tax_floor=1735;
taxbracket1=4351;
taxbracket2=6581;
taxbracket3=16317;
taxbracket4=37528;
taxbracket5=54388;

tax_r1=0.105;
tax_r2=0.13;
tax_r3=0.235;
tax_r4=0.34;
tax_r5=0.365;
tax_r6=0.4;


%Tax Credits
married_cred=187.35;
single_cred=224.82;
child_cred=149.88;
singlepar_cred=299.76;

% %Child benefit % 4 income brackets. 

echelon1=2622.9;  %upper limit on 1st bracket
echelon2=5245.8;   %upper limit on 2nd bracket
echelon3=7868.7;  
echelon4=13114.5;
echelon5=26229;
chben_e1=399.75;  % benefit per child for 1st income brackte up to 2 kids  
chben_e2=333.19;
chben_e3=306.54;
chben_e4=266.5;
chben_e5=133.25;

end