

% Parameter Assignment for year 2014 Portugal.

function[ssc_r,perc,max_all,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3,chben_e1,chben_e2,chben_e3,ssc_emp_r,surtax_r,ch_ben_lone, surtax_r2,surtax_thrs,add_surtax_r,add_surtax_cred,mw] = pt_parameters_2014

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=4104;
 
%  %Tax Schedule Parameters
tax_floor=1911;
dispy=8148;
taxbracket1=7000;
taxbracket2=20000;
taxbracket3=40000;
taxbracket4=80000;

tax_r1=0.145;
tax_r2=0.285;
tax_r3=0.37;
tax_r4=0.45;
tax_r5=0.48;

surtax_r=0.025;
surtax_r2=0.05;
surtax_thrs=250000;
add_surtax_r=0.035;
add_surtax_cred=0.025;

%Tax Credits
married_cred=213.75;
single_cred=213.75;
child_cred=213.75;
singlepar_cred=332.5;

% %Child benefit % 4 income brackets. 
echelon1=2934.54;  %upper limit on 1st bracket
echelon2=5869.08;   %upper limit on 2nd bracket
echelon3=8803.62;  

chben_e1=457.47;  % benefit per child for 1st income brackte up to 2 kids  
chben_e2=350.28;
chben_e3=318.48;

ch_ben_lone=0.2;
mw=6790;

end