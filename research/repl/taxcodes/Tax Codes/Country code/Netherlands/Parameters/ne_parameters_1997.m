% Parameter Assignment for year 1997.
function[unemp_r,unemp_fran,inv_r,inv_fran,sick_r,health_fixed,med_child,health_ceil,health_r,oldpen_r,widpen_r,ex_med_r,ex_med_fixed,ex_med_child,disab_r,ssc_ceil,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,work_rate,work_min,work_max,med_empr,comp_rate,comp_max,med_limit,single_par_all,single_par_rate,basic_all,transfer_all,child_ben,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,sick_empr_r,min_wage,tax_red_emp] = ne_parameters_1997

%Employees social Security Parameters
unemp_r=0.0267;    %unemployment contribution rate for gross earnings between 15921-46205
unemp_fran=0;   %no unemployment franchise
inv_r=0.0845;     %disability contribution rate.(zero from 1998 onwards)
inv_fran=26622;
sick_r=0;        %sick rate, zero from 1997 onwards
health_fixed= 216;   %basic insurance(med_adult)
med_child=0;
health_ceil=51939;   %Medical insurance net wage ceiling(med_ceil)
 health_r=0.0135;      %Med insurance rate(med_rate)
 med_limit=60750;     %Health insurance wage limit

 oldpen_r=0.154;   %Old age pension rate for 1st &2nd tax bracket(old_rate)
 widpen_r=0.0165;   %Widows and Orphans pension rate for 1st &2nd tax bracket(wid_rate)
 ex_med_r=0.0885;  %Exceptional medical expenses rate for 1st &2nd tax bracket(ex_med_rate)
 ex_med_fixed=0;    %fixed part zero from 1996 onwards
 ex_med_child=0;
 disab_r=0.0635;   % disability rate based on taxable income for 1st &2nd tax bracket
 ssc_ceil=76734;   %Social Security Ceiling
 
%Employers Social Security Parameters 
unemp_empr_r1=0.054;
unemp_empr_r2=0.0032;
unemp_empr_fran1=26622;
sick_empr_r=0; 
 
min_wage=28928;
tax_red_emp=1830;


%Tax Schedule Parameters
taxbracket1=0;
taxbracket2=45960;
taxbracket3=92422;
tax_r1=0;
tax_r2=0.0505;
tax_r3=0.5;
tax_r4=0.6;
   

work_rate=0.1;     % work raletd expenses calculation rate
work_min=247;
work_max=2598;
med_empr=0.0555;     %Employer health contribution rate
comp_rate=0.099;    %Compensation Allowance calculation rate(comp_per)
comp_max=78700; 

single_par_all=5682; % single parent allowance (sing_par_sup)
single_par_rate=0.06;   %(sing_par_ex_rate)

basic_all=7102;      %basic allowance (basic_all + basic_all_nontrans=0)
transfer_all=7102;   %(basic_all)
child_ben=3972;   % child benefit for 2 children (ch2_trans)


end