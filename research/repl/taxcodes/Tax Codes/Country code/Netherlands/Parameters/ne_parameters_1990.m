

% Parameter Assignment for year 1990.

function[unemp_r,unemp_fran,inv_r,inv_fran,sick_r,health_fixed,med_child,health_ceil,health_r,oldpen_r,widpen_r,ex_med_r,ex_med_fixed,ex_med_child,disab_r,ssc_ceil,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,work_rate,work_min,work_max,med_empr,comp_rate,comp_max,med_limit,single_par_all,single_par_rate,basic_all,transfer_all,child_ben,sup_limit,sup_all,unemp_empr_r1,sick_empr_r] = ne_parameters_1990

%Social Security Parameters
unemp_r=0.012;    %unemployment contribution rate for gross earnings between 15921-46205
unemp_fran=0;   %no unemployment franchise
inv_r=0.1215;     %invalidity contribution rate.(zero from 1998 onwards)
inv_fran=23920;  % Invalidity franchise
sick_r=0.01;    %sickness contribution rate (zero from 1997 onwwards)

health_fixed= 186;   %basic insurance(med_adult)
med_child=93;     %medical care contribution for each of first 2 children
health_ceil=43160;   %Medical insurance net wage ceiling(med_ceil)
 health_r=0.0305;      %Med insurance rate(med_rate)
 med_limit=50900;     %Health insurance wage limit

 oldpen_r=0.143;   %Old age pension rate for 1st &2nd tax bracket(old_rate)
 widpen_r=0.0125;   %Widows and Orphans pension rate for 1st &2nd tax bracket(wid_rate)
 ex_med_r=0.058;  %Exceptional medical expenses rate for 1st &2nd tax bracket(ex_med_rate)
 ex_med_fixed=0;
 ex_med_child=0;
 
 disab_r=0.0115;   % disability rate based on taxable income for 1st &2nd tax bracket
 ssc_ceil=68900;   %Social Security Ceiling


  %Employers Social Security Parameters 
unemp_empr_r1=0.02;
sick_empr_r=0.059;
 
% %Tax Schedule Parameters
taxbracket1=0;
taxbracket2=42123;
taxbracket3=84245;
tax_r1=0;
tax_r2=0.13;
tax_r3=0.5;
tax_r4=0.6;


work_rate=0.04;     % work raletd expenses calculation rate
work_min=203;
work_max=1015;

 med_empr=0.0485;     %Employer health contribution rate
 comp_rate=0.104;    %Compensation Allowance calculation rate(comp_per)
 comp_max=66850; 

% Standard  Allowances
single_par_all=3654; % single parent allowance (sing_par_sup)
single_par_rate=0.06;   %(sing_par_ex_rate) 

sup_limit=35000;
sup_all=1125;
 basic_all=4568;      %basic allowance (basic_all + basic_all_nontrans=0)
 transfer_all=4568;   %(basic_all)
 child_ben=3529;   % child benefit for 2 children (ch2_trans)


end