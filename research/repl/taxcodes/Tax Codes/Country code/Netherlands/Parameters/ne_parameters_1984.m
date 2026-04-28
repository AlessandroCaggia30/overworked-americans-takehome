

% Parameter Assignment for year 1984.

function[basic_all,supp_oneperson,supp_soleearner,single_par_all,single_par_all_two,work_rate,work_min,work_max,sick_r,ssc_ceil,unemp_r,inv_r,inv_fran,med_limit,health_ceil,health_r,med_empr,oldpen_r,widpen_r,gen_ceil,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,child_ben,spouselim,spouselim2,supp_couple,unemp_empr_r1,sick_empr_r,exepmed_r_empr,dis_r_empr,fam_r_empr, inval_r_empr] = ne_parameters_1984
% Standard  Allowances
basic_all=7662;      %basic allowance
supp_oneperson=2636; %supplement for one person households
supp_soleearner=5538; %1 earner couples
spouselim=5026;
spouselim2=7662;
supp_couple=2636; %Supplement for households whose second income is between 5026 and 7662
single_par_all=5538; % single parent allowance (sing_par_sup)
single_par_all_two=4231; %extra single parent supplement for parents with kids younger than 12

work_rate=0.04;     % work raletd expenses calculation rate
work_min=200;
work_max=800;


%Social Security Parameters
sick_r=0.01;    %sickness contribution rate (zero from 1997 onwwards)
ssc_ceil=68382;   %Social Security Ceiling
unemp_r=0.029;    %unemployment contribution rate for gross earnings between 15921-46205
inv_r=0.176;     %invalidity contribution rate.(zero from 1998 onwards)
inv_fran=23751;  % Invalidity franchise


med_limit=47850;     %Health insurance wage limit
health_ceil=40716;   %Medical insurance net wage ceiling(med_ceil)
 health_r=0.0485;      %Med insurance rate(med_rate)
 
 med_empr=0.0485;     %Employer health contribution rate
 oldpen_r=0.1165;   %Old age pension rate for 1st &2nd tax bracket(old_rate)
 widpen_r=0.0145;   %Widows and Orphans pension rate for 1st &2nd tax bracket(wid_rate)
 gen_ceil=62850; %Ceiling for General Schemes
 
 %Employers Social Security Parameters 
unemp_empr_r1=0.0045;
sick_empr_r=0.05;
inval_r_empr=0.015;

exepmed_r_empr=0.0395;
fam_r_empr=0.0395;
dis_r_empr=0.065;
 
% %Tax Schedule Parameters
taxbracket1=9430;
taxbracket2=16461;
taxbracket3=30444;
taxbracket4=42743;
taxbracket5=62187;
taxbracket6=87146;
taxbracket7=115052;
taxbracket8=218075;

tax_r1=0.16;
tax_r2=0.26;
tax_r3=0.32;
tax_r4=0.42;
tax_r5=0.52;
tax_r6=0.61;
tax_r7=0.67;
tax_r8=0.70;
tax_r9=0.72;
 
 child_ben=3046;   % child benefit for 2 children (ch2_trans)


end