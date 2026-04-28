% Parameter Assignment for year 1983.

function[supp_marriedmen,supp_marriedwoman,supp_single,work_rate,work_min,work_max,sick_r,ssc_ceil,unemp_r,inv_r,inv_fran,med_limit,health_ceil,health_r,med_empr,oldpen_r,widpen_r,gen_ceil,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,child_ben,unemp_empr_r1,sick_empr_r,exepmed_r_empr,dis_r_empr,fam_r_empr, inval_r_empr] = ne_parameters_1983
% Standard  Allowances

supp_marriedmen=12716; %Allowance for married man
supp_marriedwoman=2529; %Allowance for married woman
supp_single=9921; %Allowance for Single Persons Average of 7381 and 9921. (8651)

work_rate=0.04;     % work raletd expenses calculation rate
work_min=200;
work_max=800;


%Social Security Parameters
sick_r=0.01;    %sickness contribution rate (zero from 1997 onwwards)
ssc_ceil=68382;   %Social Security Ceiling
unemp_r=0.0455;    %unemployment contribution rate for gross earnings between 15921-46205
inv_r=0.1775;     %invalidity contribution rate.(zero from 1998 onwards)
inv_fran=24534;  % Invalidity franchise


med_limit=46550;     %Health insurance wage limit
health_ceil=39672;   %Medical insurance net wage ceiling(med_ceil)
 health_r=0.049;      %Med insurance rate(med_rate)
 
 med_empr=0.049;     %Employer health contribution rate
 oldpen_r=0.1165;   %Old age pension rate for 1st &2nd tax bracket(old_rate)
 widpen_r=0.0135;   %Widows and Orphans pension rate for 1st &2nd tax bracket(wid_rate)
 gen_ceil=61150; %Ceiling for General Schemes
 
%Employers Social Security Parameters 
unemp_empr_r1=0.0045;
sick_empr_r=0.043;
inval_r_empr=0.033;

exepmed_r_empr=0.0445;
fam_r_empr=0.047;
dis_r_empr=0.05;
 
% %Tax Schedule Parameters
taxbracket1=9272;
taxbracket2=16045;
taxbracket3=29502;
taxbracket4=41365;
taxbracket5=60097;
taxbracket6=84122;
taxbracket7=111027;
taxbracket8=144597;
taxbracket9=210234;

tax_r1=0.17;
tax_r2=0.26;
tax_r3=0.32;
tax_r4=0.4075;
tax_r5=0.5075;
tax_r6=0.5975;
tax_r7=0.655;
tax_r8=0.685;
tax_r9=0.6925;
tax_r10=0.72;
 
 child_ben=3062;   % child benefit for 2 children (ch2_trans)


end