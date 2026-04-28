

% Parameter Assignment for year 1996.

function[unemp_r,unemp_fran,inv_r,inv_fran,sick_r,health_fixed,med_child,health_ceil,health_r,oldpen_r,widpen_r,ex_med_r,ex_med_fixed,ex_med_child,disab_r,ssc_ceil,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,work_rate,work_min,work_max,med_empr,comp_rate,comp_max,med_limit,single_par_all,single_par_rate,basic_all,transfer_all,child_ben,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,sick_empr_r] = ne_parameters_1996

%Employee Social Security Parameters
unemp_r=0.0273;    %unemployment contribution rate for gross earnings between 15921-46205
unemp_fran=0;   %no unemployment franchise
inv_r=0.0795;     %disability contribution rate.(zero from 1998 onwards)
inv_fran=26100;
sick_r=0.0015;    %sickness contribution rate (zero from 1997 onwwards)
health_fixed= 342;   %basic insurance(med_adult)
med_child=0;         %zero from 1996 onwards     
health_ceil=50895;   %Medical insurance net wage ceiling(med_ceil)
 health_r=0.0165;      %Med insurance rate(med_rate)
 med_limit=59700;     %Health insurance wage limit

 oldpen_r=0.154;   %Old age pension rate for 1st &2nd tax bracket(old_rate)
 widpen_r=0.017;   %Widows and Orphans pension rate for 1st &2nd tax bracket(wid_rate)
 ex_med_r=0.0735;  %Exceptional medical expenses rate for 1st &2nd tax bracket(ex_med_rate)
 ex_med_fixed=0;    %fixed part zero from 1996 onwards
 ex_med_child=0;
 disab_r=0.067;   % disability rate based on taxable income for 1st &2nd tax bracket
 ssc_ceil=75429;   %Social Security Ceiling
 
%Employers Social Security Parameters 
unemp_empr_r1=0.0554;
unemp_empr_r2=0.006;
unemp_empr_fran1=26100;
sick_empr_r=0.0035;  
 


%Tax Schedule Parameters
taxbracket1=0;
taxbracket2=45325;
taxbracket3=92773;
tax_r1=0;
tax_r2=0.0635;
tax_r3=0.5;
tax_r4=0.6;
   

work_rate=0.08;     % work raletd expenses calculation rate
work_min=243;
work_max=2507;
med_empr=0.0535;     %Employer health contribution rate
comp_rate=0.1;    %Compensation Allowance calculation rate(comp_per)
comp_max=77350; 

single_par_all=5602; % single parent allowance (sing_par_sup)
single_par_rate=0.06;   %(sing_par_ex_rate)

basic_all=7003;      %basic allowance (basic_all + basic_all_nontrans=0)
transfer_all=7003;   %(basic_all)
child_ben=3884;   % child benefit for 2 children (ch2_trans)


end