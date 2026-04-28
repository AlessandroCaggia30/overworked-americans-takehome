

% Parameter Assignment for year 1986.

function[basic_all,supp_oneperson,supp_soleearner,single_par_all,single_par_all_two,work_supplement,extrawork_supplement,work_rate,work_min,work_max,transfer_all,sick_r,ssc_ceil,unemp_r,inv_r,inv_fran,med_limit,health_ceil,health_r,med_empr,oldpen_r,widpen_r,gen_ceil,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,child_ben,unemp_empr_r1,sick_empr_r,exepmed_r_empr,dis_r_empr,fam_r_empr, inval_r_empr] = ne_parameters_1986

% Standard  Allowances
basic_all=7168;      %basic allowance
supp_oneperson=3671; %supplement for one person households
supp_soleearner=7341; %1 earner couples
single_par_all=5873; % single parent allowance (sing_par_sup)
single_par_all_two=4437; %extra single parent supplement for parents with kids younger than 12
work_supplement=407;
extrawork_supplement=787;

work_rate=0.04;     % work raletd expenses calculation rate
work_min=200;
work_max=800;

transfer_all=7168;   %(basic_all that can be transferred)



%Social Security Parameters
sick_r=0.01;    %sickness contribution rate (zero from 1997 onwwards)
ssc_ceil=68382;   %Social Security Ceiling
unemp_r=0.0175;    %unemployment contribution rate for gross earnings between 15921-46205
inv_r=0.1505;     %invalidity contribution rate.(zero from 1998 onwards)
inv_fran=23751;  % Invalidity franchise


med_limit=48500;     %Health insurance wage limit
health_ceil=41499;   %Medical insurance net wage ceiling(med_ceil)
 health_r=0.048;      %Med insurance rate(med_rate)
 
 med_empr=0.045;     %Employer health contribution rate
 oldpen_r=0.1135;   %Old age pension rate for 1st &2nd tax bracket(old_rate)
 widpen_r=0.0135;   %Widows and Orphans pension rate for 1st &2nd tax bracket(wid_rate)
 gen_ceil=63750; %Ceiling for General Schemes
 

 
 %Employers Social Security Parameters 
unemp_empr_r1=0.0135;
sick_empr_r=0.0615;
inval_r_empr=0.0005;

exepmed_r_empr=0.0425;
fam_r_empr=0.0355;
dis_r_empr=0.057;
 
% %Tax Schedule Parameters
taxbracket1=9574;
taxbracket2=16947;
taxbracket3=31610;
taxbracket4=44506;
taxbracket5=64895;
taxbracket6=91066;
taxbracket7=120327;
taxbracket8=228355;

tax_r1=0.16;
tax_r2=0.25;
tax_r3=0.32;
tax_r4=0.42;
tax_r5=0.52;
tax_r6=0.61;
tax_r7=0.67;
tax_r8=0.70;
tax_r9=0.72;



 
 child_ben=3072;   % child benefit for 2 children (ch2_trans)


end