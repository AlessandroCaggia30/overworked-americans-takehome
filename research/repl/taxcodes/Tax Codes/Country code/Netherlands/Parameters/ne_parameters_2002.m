

% Parameter Assignment 

function[unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,comb_credit,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,adch_thr2,ch_cr,adch_cr,adch_cr2,rate_cr,rate_ssc,ch_ben,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r] = ne_parameters_2002

%Employees Social Security Parameters
unemp_r=0.0495;    %unemployment contribution rate for gross earnings between 15921-46205
ssc_ceil=41499;   %Social Security Ceiling
unemp_fran=14355;   %Unemployment contribution lower bound for wage

med_limit=30700;
med_empr=0.0625;

health_ceil=28188;   %Medical insurance net wage ceiling
health_r=0.017;      %Med insurance rate 
health_fixed= 181.39;   %basic insurance

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.0125;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.1025;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket

%Employers Social Security Parameters 
unemp_empr_r1=0.036;
unemp_empr_r2=0.0089;
unemp_empr_fran1=14355;
inv_empr_r=0.0785;

 %Tax Schedule Parameters
taxbracket1=15331;
taxbracket2=27847;
taxbracket3=47746;
tax_r1=0.0295;
tax_r2=0.0845;
tax_r3=0.42;
tax_r4=0.52;
  
%Tax credit parameters

 comb_credit_fr=4061;
comb_credit=190;
singlepar_cr=1301;
addsinglepcr_r=0.043;
 gen_cred=1647;
 emp_cred=133;
 work_cred1=0.01729;
 work_cred2=0.10621;
 emp_cr_thr=7692;
 work_max=949;
 ch_cr_thr=56191;
 adch_thr=26484;
 adch_thr2=28096;
 ch_cr=40;
 adch_cr=428;
 adch_cr2=341;
rate_cr= 0.0912;
rate_ssc= 0.9088;


ch_ben=829;

 


end