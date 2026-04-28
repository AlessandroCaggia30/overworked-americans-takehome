

% Parameter Assignment 

function[unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,comb_credit,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,adch_thr2,ch_cr,adch_cr,adch_cr2,rate_cr,rate_ssc,ch_ben,adcomb_cred,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r] = ne_parameters_2004

%Employees Social Security Parameters
unemp_r=0.058;    %unemployment contribution rate for gross earnings between 
ssc_ceil=43578;   %Social Security Ceiling
unemp_fran=15138;   %Unemployment contribution lower bound for wage

med_limit=32600;
med_empr=0.0675;

health_ceil=29493;   %Medical insurance net wage ceiling
health_r=0.0125;      %Med insurance rate 
health_fixed= 388;   %basic insurance

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.0125;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.1325;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket

%Employers Social Security Parameters 
unemp_empr_r1=0.0155;
unemp_empr_r2=0.0189;
unemp_empr_fran1=15138;
inv_empr_r=0.0745;

 %Tax Schedule Parameters
taxbracket1=16265;
taxbracket2=29543;
taxbracket3=50652;
tax_r1=0.01;
tax_r2=0.0795;
tax_r3=0.42;
tax_r4=0.52;
  
%Tax credit parameters

 comb_credit_fr=4306;
comb_credit=224;
singlepar_cr=1381;
addsinglepcr_r=0.043;
 gen_cred=1825;
 emp_cred=142;
 work_cred1=0.01753;
 work_cred2=0.11213;
 emp_cr_thr=8101;
 work_max=1213;
 ch_cr_thr=59612;
 adch_thr=28097;
 adch_thr2=29807;
 ch_cr=110;
 adch_cr=547;
 adch_cr2=363;
rate_cr= 0.03;
rate_ssc= 0.97;


ch_ben=1716/2;

adcomb_cred= 290;


end