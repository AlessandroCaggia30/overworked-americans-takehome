

% Parameter Assignment for year 2015 Portugal.

function[ssc_r,perc,max_all,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,married_cred,single_cred,child_cred,singlepar_cred,echelon1,echelon2,echelon3,chben_e1,chben_e2,chben_e3,ssc_emp_r,surtax_r,ch_ben_lone, surtax_r2,surtax_thrs,add_surtax_r,add_surtax_cred,mw,hc_ad,hc_ch,ben_lim1,ben_lim2,ben_lim3,ben_lim_sg1,ben_lim_sg2,ben_lim_sg3] = pt_parameters_2015


%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=4104;
 
%  %Tax Schedule Parameters
dispy=8500;
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

% Household coefficient
hc_ad=1;
hc_ch=0.3;
ben_lim1=600;
ben_lim2=1250;
ben_lim3=2000;
ben_lim_sg1=350;
ben_lim_sg2=750;
ben_lim_sg3=1200;

%Tax Credits
married_cred=0;
single_cred=0;
child_cred=325;
singlepar_cred=0;


% %Child benefit % 4 income brackets. 
echelon1=2934.54;  %upper limit on 1st bracket
echelon2=5869.08;   %upper limit on 2nd bracket
echelon3=8803.62;  

chben_e1=457.47;  % benefit per child for 1st income brackte up to 2 kids  
chben_e2=350.28;
chben_e3=318.48;

ch_ben_lone=0.2;
mw=7070;

end