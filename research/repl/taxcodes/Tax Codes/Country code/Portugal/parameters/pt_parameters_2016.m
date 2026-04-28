

% Parameter Assignment for year 2016 Portugal.

function[ssc_r,perc,max_all,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,child_cred,echelon1,echelon2,echelon3,chben_e1,chben_e2,chben_e3,ssc_emp_r,surtax_r,ch_ben_lone, surtax_r2,surtax_thrs,add_surtax_cred,mw,add_surtax_r1,add_surtax_r2,add_surtax_r3,add_surtax_r4,add_surtax_r5,add_surtax_bracket1,add_surtax_bracket2,add_surtax_bracket3,add_surtax_bracket4] = pt_parameters_2016


%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.2375;

 %  Allowances
perc=1;
max_all=4104;
 
%  %Tax Schedule Parameters
dispy=8500;
taxbracket1=7035;
taxbracket2=20100;
taxbracket3=40200;
taxbracket4=80000;

tax_r1=0.145;
tax_r2=0.285;
tax_r3=0.37;
tax_r4=0.45;
tax_r5=0.48;

surtax_r=0.025;
surtax_r2=0.05;
surtax_thrs=250000;
add_surtax_r1=0;
add_surtax_r2=0.01;
add_surtax_r3=0.0175;
add_surtax_r4=0.03;
add_surtax_r5=0.035;

add_surtax_bracket1=7070;
add_surtax_bracket2=20000;
add_surtax_bracket3=40000;
add_surtax_bracket4=80000;

add_surtax_cred=0.025;

%Tax Credits
child_cred=600;

% %Child benefit % 4 income brackets. 
echelon1=2934.54;  %upper limit on 1st bracket
echelon2=5869.08;   %upper limit on 2nd bracket
echelon3=8803.62;  

chben_e1=473.46;  % benefit per child for 1st income brackte up to 2 kids  
chben_e2=359.04;
chben_e3=324.84;

ch_ben_lone=0.35;
mw=7420;

end