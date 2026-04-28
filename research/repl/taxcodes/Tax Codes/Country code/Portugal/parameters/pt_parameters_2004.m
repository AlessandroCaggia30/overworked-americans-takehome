

% Parameter Assignment for year 2004 Portugal.

function[ssc_r,perc,max_all,tax_floor,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3,echelon4,echelon5,chben_e1,chben_e2,chben_e3,chben_e4,chben_e5,ssc_emp_r] = pt_parameters_2004

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=3158.7;
 
%  %Tax Schedule Parameters
tax_floor=1701;
taxbracket1=4266;
taxbracket2=6452;
taxbracket3=15997;
taxbracket4=36792;
taxbracket5=53322;

tax_r1=0.12;
tax_r2=0.14;
tax_r3=0.24;
tax_r4=0.34;
tax_r5=0.38;
tax_r6=0.4;


%Tax Credits
married_cred=182.8;
single_cred=219.36;
child_cred=146.24;
singlepar_cred=292.48;

% %Child benefit % 4 income brackets. 

echelon1=2559.2;  %upper limit on 1st bracket
echelon2=5118.4;   %upper limit on 2nd bracket
echelon3=7677.6;  
echelon4=12796;
echelon5=25592;
chben_e1=390;  % benefit per child for 1st income brackte up to 2 kids  
chben_e2=325;
chben_e3=299;
chben_e4=260;
chben_e5=130;

end