

% Parameter Assignment for year 1988.

function[basic_all,supp_oneperson,supp_soleearner,single_par_all,single_par_all_two,work_supplement,extrawork_supplement,work_min,transfer_all,sick_r,ssc_ceil,unemp_r,inv_r,inv_fran,med_limit,health_ceil,health_r,med_empr,oldpen_r,widpen_r,gen_ceil,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,child_ben,unemp_empr_r1,sick_empr_r,exepmed_r_empr,dis_r_empr,fam_r_empr] = ne_parameters_1988
% Standard  Allowances
basic_all=7392;      %basic allowance
supp_oneperson=3696; %supplement for one person households
supp_soleearner=7392; %1 earner couples
single_par_all=5914; % single parent allowance (sing_par_sup)
single_par_all_two=4468; %extra single parent supplement for parents with kids younger than 12
work_supplement=411;
extrawork_supplement=794;

% work related expenses calculation rate
work_min=200;


transfer_all=7392;   %(basic_all that can be transferred)



%Social Security Parameters
sick_r=0.01;    %sickness contribution rate (zero from 1997 onwwards)
ssc_ceil=68643;   %Social Security Ceiling
unemp_r=0.0188;    %unemployment contribution rate for gross earnings between 15921-46205
inv_r=0.133;     %invalidity contribution rate.(zero from 1998 onwards)
inv_fran=23751;  % Invalidity franchise


med_limit=49650;     %Health insurance wage limit
health_ceil=42282;   %Medical insurance net wage ceiling(med_ceil)
 health_r=0.051;      %Med insurance rate(med_rate)
 
 med_empr=0.051;     %Employer health contribution rate
 oldpen_r=0.115;   %Old age pension rate for 1st &2nd tax bracket(old_rate)
 widpen_r=0.013;   %Widows and Orphans pension rate for 1st &2nd tax bracket(wid_rate)
 gen_ceil=65250; %Ceiling for General Schemes
 
  %Employers Social Security Parameters 
unemp_empr_r1=0.0188;
sick_empr_r=0.048;

exepmed_r_empr=0.0455;
dis_r_empr=0.062;
fam_r_empr=0.0192;
 
% %Tax Schedule Parameters
taxbracket1=9652;
taxbracket2=17075;
taxbracket3=31541;
taxbracket4=44524;
taxbracket5=65052;
taxbracket6=91401;
taxbracket7=120861;
taxbracket8=229625;

tax_r1=0.14;
tax_r2=0.24;
tax_r3=0.32;
tax_r4=0.41;
tax_r5=0.51;
tax_r6=0.60;
tax_r7=0.66;
tax_r8=0.69;
tax_r9=0.72;


 



 
 child_ben=3182;   % child benefit for 2 children (ch2_trans)


end