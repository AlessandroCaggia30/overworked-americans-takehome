

% Parameter Assignment for year 2011 Portugal.

function[ssc_r,perc,max_all,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3,chben_e1,chben_e2,chben_e3,ssc_emp_r,surtax_r,surtax_cred,mw,ch_ben_lone] = pt_parameters_2011

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=4104;
 
%  %Tax Schedule Parameters
tax_floor=1911;
dispy=8148;
taxbracket1=4898;
taxbracket2=7410;
taxbracket3=18375;
taxbracket4=42259;
taxbracket5=61244;
taxbracket6=66045;
taxbracket7=153300;

tax_r1=0.1150;
tax_r2=0.1400;
tax_r3=0.2450;
tax_r4=0.3550;
tax_r5=0.3800;
tax_r6=0.4150;
tax_r7=0.4350;
tax_r8=0.4650;

surtax_r=0.035;
surtax_cred=0.025;
mw=6790;

%Tax Credits
married_cred=261.25;
single_cred=261.25;
child_cred=190;
singlepar_cred=380;

% %Child benefit % 4 income brackets. 

echelon1=2934.54;  %upper limit on 1st bracket
echelon2=5869.08;   %upper limit on 2nd bracket
echelon3=8803.62;  

chben_e1=457.47;  % benefit per child for 1st income brackte up to 2 kids  
chben_e2=350.28;
chben_e3=318.48;

ch_ben_lone=0.2;

end