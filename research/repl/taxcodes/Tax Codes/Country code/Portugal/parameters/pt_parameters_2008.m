

% Parameter Assignment for year 2008 Portugal.

function[ssc_r,perc,max_all,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3,echelon4,echelon5,chben_e1,chben_e2,chben_e3,chben_e4,chben_e5,ssc_emp_r] = pt_parameters_2008

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=3680.64;
 
%  %Tax Schedule Parameters
tax_floor=1850;
dispy=7156.8;
taxbracket1=4639;
taxbracket2=7017;
taxbracket3=17401;
taxbracket4=40020;
taxbracket5=58000;
taxbracket6=62546;

tax_r1=0.105;
tax_r2=0.13;
tax_r3=0.235;
tax_r4=0.34;
tax_r5=0.365;
tax_r6=0.4;
tax_r7=0.42;

%Tax Credits
married_cred=234.3;
single_cred=234.3;
child_cred=170.4;
singlepar_cred=340.8;

% %Child benefit % 4 income brackets. 

echelon1=2851.87;  %upper limit on 1st bracket
echelon2=5703.74;   %upper limit on 2nd bracket
echelon3=8555.61;  
echelon4=14259.35;
echelon5=28518.7;

chben_e1=551.85;  % benefit per child for 1st income brackte up to 2 kids  
chben_e2=422.52;
chben_e3=309.48;
chben_e4=264.72;
chben_e5=132.36;

end