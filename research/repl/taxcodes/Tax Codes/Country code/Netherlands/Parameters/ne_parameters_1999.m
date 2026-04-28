

% Parameter Assignment for year 1999.Same parameter names  with 2000

function[work_rate,work_min,work_max,comp_rate,comp_max,unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,single_par_all,single_par_rate,basic_all,transfer_all,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,child_ben,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r] = ne_parameters_1999
         
%Employees Social Security Parameters
unemp_r=0.061;    %unemployment contribution rate for gross earnings between 15921-46205
unemp_fran=28188;    %Unemployment franchise

health_fixed= 396;   %basic insurance(med_adult)

health_ceil=54810;   %Medical insurance net wage ceiling(med_ceil)
 health_r=0.0155;      %Med insurance rate(med_rate)
 med_limit=64300;     %Health insurance wage limit

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket(old_rate)
 widpen_r=0.014;   %Widows and Orphans pension rate for 1st &2nd tax bracket(wid_rate)
 ex_med_r=0.1025;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket(ex_med_rate)

 
 ssc_ceil=80910;   %Social Security Ceiling
 
 
%Employers Social Security Parameters 
unemp_empr_r1=0.04;
unemp_empr_r2=0.0095;
unemp_empr_fran1=28188;
inv_empr_r=0.0775; 

%Tax Schedule Parameters
taxbracket1=15000;
taxbracket2=48175;
taxbracket3=105954;
tax_r1=0.062;
tax_r2=0.075;
tax_r3=0.5;
tax_r4=0.6;
   

work_rate=0.12;     % work raletd expenses calculation rate
work_min=258;
work_max=3174;
med_empr=0.0585;     %Employer health contribution rate
comp_rate=0.022;    %Compensation Allowance calculation rate(comp_per)
comp_max=83200;

single_par_all=6704; % single parent allowance (sing_par_sup)
single_par_rate=0.12;   %(sing_par_ex_rate)

basic_all=8799;      %basic allowance (basic_all + basic_all_nontrans)
transfer_all=8380;   %(basic_all)
child_ben=4240;   % child benefit for 2 children (ch2_trans)


end