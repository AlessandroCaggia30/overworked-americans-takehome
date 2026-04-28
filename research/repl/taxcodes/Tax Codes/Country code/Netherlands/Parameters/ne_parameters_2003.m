

% Parameter Assignment 

function[unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,comb_credit,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,adch_thr2,ch_cr,adch_cr,adch_cr2,rate_cr,rate_ssc,ch_ben,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r] = ne_parameters_2003

%Employees Social Security Parameters
unemp_r=0.058;    %unemployment contribution rate for gross earnings between 
ssc_ceil=43065;   %Social Security Ceiling
unemp_fran=14877;   %Unemployment contribution lower bound for wage

med_limit=32050;
med_empr=0.0675;

health_ceil=29493;   %Medical insurance net wage ceiling
health_r=0.017;      %Med insurance rate 
health_fixed= 325;   %basic insurance

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.0125;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.1205;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket

%Employers Social Security Parameters 
unemp_empr_r1=0.0155;
unemp_empr_r2=0.013;
unemp_empr_fran1=14877;
inv_empr_r=0.074;
 
 %Tax Schedule Parameters
taxbracket1=15883;
taxbracket2=28850;
taxbracket3=49464;
tax_r1=0.017;
tax_r2=0.072;
tax_r3=0.42;
tax_r4=0.52;
  
%Tax credit parameters

 comb_credit_fr=4208;
comb_credit=214;
singlepar_cr=1348;
addsinglepcr_r=0.043;
 gen_cred=1766;
 emp_cred=138;
 work_cred1=0.01725;
 work_cred2=0.10662;
 emp_cr_thr=8001;
 work_max=1104;
 ch_cr_thr=58214;
 adch_thr=27438;
 adch_thr2=29108;
 ch_cr=41;
 adch_cr=534;
 adch_cr2=354;
rate_cr= 0.052;
rate_ssc= 0.9480;


ch_ben=854;

 


end