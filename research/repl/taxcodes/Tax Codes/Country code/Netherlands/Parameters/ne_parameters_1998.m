

% Parameter Assignment for year 1998.Same parameter names  with 2000

function[unemp_r,unemp_fran,inv_r,inv_fran,sick_r,health_fixed,med_child,health_ceil,health_r,oldpen_r,widpen_r,ex_med_r,ex_med_fixed,ex_med_child,disab_r,ssc_ceil,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,work_rate,work_min,work_max,med_empr,comp_rate,comp_max,med_limit,single_par_all,single_par_rate,basic_all,transfer_all,child_ben,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r] = ne_parameters_1998

%Employee Social Security Parameters
unemp_r=0.0645;    %unemployment contribution rate for gross earnings between 15921-46205
unemp_fran=27144;    %Unemployment franchise
inv_r=0;
inv_fran=0;
sick_r=0;
health_fixed= 216;   %basic insurance(med_adult)
med_child=0;
health_ceil=53244;   %Medical insurance net wage ceiling(med_ceil)
 health_r=0.012;      %Med insurance rate(med_rate)
 med_limit=62200;     %Health insurance wage limit

 oldpen_r=0.165;   %Old age pension rate for 1st &2nd tax bracket(old_rate)
 widpen_r=0.014;   %Widows and Orphans pension rate for 1st &2nd tax bracket(wid_rate)
 ex_med_r=0.096;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket(ex_med_rate)
 ex_med_fixed=0;    %fixed part zero from 1996 onwards
 ex_med_child=0;
 disab_r=0;       % disability rate based on taxable income for 1st &2nd tax bracket .zero from 1998 onwards
 ssc_ceil=78561;   %Social Security Ceiling
 
 %Employers Social Security Parameters 
unemp_empr_r1=0.0215;
unemp_empr_r2=0.0415;
unemp_empr_fran1=27144;
inv_empr_r=0.0785; 


%Tax Schedule Parameters
taxbracket1=0;
taxbracket2=47184;
taxbracket3=103774;
tax_r1=0;
tax_r2=0.0885;
tax_r3=0.5;
tax_r4=0.6;
   

work_rate=0.12;     % work raletd expenses calculation rate
work_min=252;
work_max=3108;
med_empr=0.056;     %Employer health contribution rate
comp_rate=0.017;    %Compensation Allowance calculation rate(comp_per)
comp_max=80600;
single_par_all=6566; % single parent allowance (sing_par_sup)
single_par_rate=0.12;   %(sing_par_ex_rate)

basic_all=8617;      %basic allowance (basic_all + basic_all_nontrans)
transfer_all=8207;   %(basic_all)
child_ben=4143;   % child benefit for 2 children (ch2_trans)


end