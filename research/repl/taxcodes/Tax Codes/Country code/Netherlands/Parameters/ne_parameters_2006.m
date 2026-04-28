

% Parameter Assignment 

function[unemp_r,ssc_ceil,unemp_fran,med_empr,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,comb_credit,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,decrease_r,rate_cr,rate_ssc,ch_ben,adcomb_cred,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r] = ne_parameters_2006

%Employees Social Security Parameters
unemp_r=0.052;    %unemployment contribution rate for gross earnings between 
ssc_ceil=43856;   %Social Security Ceiling
unemp_fran=15138;   %Unemployment contribution lower bound for wage


med_empr=0.065;
health_r=0.065; %Med insurance rate 
health_ceil=30015;   %Medical insurance net wage ceiling      
health_fixed= 939;   %basic insurance

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.0125;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.1255;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket

%Employers Social Security Parameters 
unemp_empr_r1=0.0345;
unemp_empr_r2=0.0148;
unemp_empr_fran1=15138;
inv_empr_r=0.0638;
 
 
 %Tax Schedule Parameters
taxbracket1=17046;
taxbracket2=30631;
taxbracket3=52228;
tax_r1=0.0245;
tax_r2=0.0975;   
tax_r3=0.42;
tax_r4=0.52;
  
%Tax credit parameters
 gen_cred=1990;
 
 work_cred1=0.01795;
  emp_cred=146;
 work_cred2=0.12421;
  emp_cr_thr=8132;
  work_max=1357;

 ch_cr=924;
 ch_cr_thr=28521;   
adch_thr=44591;
decrease_r=0.0575;
  


comb_credit=146; 
 comb_credit_fr=4405; 
adcomb_cred= 608;


singlepar_cr=1414;
addsinglepcr_r=0.043;


rate_cr= 2.45/(2.45+31.7);
rate_ssc= 1-rate_cr;


ch_ben=1738/2;



end