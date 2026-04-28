% Parameter Assignment for year 1989.

function[basic_all,supp_oneperson,supp_soleearner,single_par_all,single_par_all_two,work_supplement,extrawork_supplement,work_rate,work_min,work_max,transfer_all,sick_r,ssc_ceil,unemp_r,inv_r,inv_fran,med_limit,health_ceil,health_r,med_empr,oldpen_r,widpen_r,gen_ceil,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,child_ben,unemp_empr_r1,sick_empr_r,exepmed_r_empr,dis_r_empr] = ne_parameters_1989
% Standard  Allowances
basic_all=7415;      %basic allowance
supp_oneperson=3708; %supplement for one person households
supp_soleearner=7415; %1 earner couples
single_par_all=5932; % single parent allowance (sing_par_sup)
single_par_all_two=4482; %extra single parent supplement for parents with kids younger than 12
work_supplement=413;
extrawork_supplement=797;

work_rate=0.04;     % work raletd expenses calculation rate
work_min=200;
work_max=800;

transfer_all=7415;   %(basic_all that can be transferred)



%Social Security Parameters
sick_r=0.01;    %sickness contribution rate (zero from 1997 onwwards)
ssc_ceil=68380;   %Social Security Ceiling
unemp_r=0.0298;    %unemployment contribution rate for gross earnings between 15921-46205
inv_r=0.11;     %invalidity contribution rate.(zero from 1998 onwards)
inv_fran=23660;  % Invalidity franchise


med_limit=50150;     %Health insurance wage limit
health_ceil=42640;   %Medical insurance net wage ceiling(med_ceil)
 health_r=0.0315;      %Med insurance rate(med_rate)
 
 med_empr=0.0495;     %Employer health contribution rate
 oldpen_r=0.108;   %Old age pension rate for 1st &2nd tax bracket(old_rate)
 widpen_r=0.012;   %Widows and Orphans pension rate for 1st &2nd tax bracket(wid_rate)
 gen_ceil=65900; %Ceiling for General Schemes
 
  %Employers Social Security Parameters 
unemp_empr_r1=0.0158;
sick_empr_r=0.0495;

exepmed_r_empr=0.052;
dis_r_empr=0.062;
 

% %Tax Schedule Parameters
taxbracket1=9681;
taxbracket2=17127;
taxbracket3=31636;
taxbracket4=44658;
taxbracket5=65248;
taxbracket6=91676;
taxbracket7=121224;
taxbracket8=239314;

tax_r1=0.14;
tax_r2=0.24;
tax_r3=0.32;
tax_r4=0.41;
tax_r5=0.51;
tax_r6=0.60;
tax_r7=0.66;
tax_r8=0.69;
tax_r9=0.72;


 

%single_par_rate=0.06;   %(sing_par_ex_rate) 


 
 child_ben=3235;   % child benefit for 2 children (ch2_trans)


end