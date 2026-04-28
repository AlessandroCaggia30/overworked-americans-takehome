

% Parameter Assignment 

function[unemp_r,ssc_ceil,unemp_fran,med_empr,health_ceil,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,ch_cr2,decrease_r,rate_cr,rate_ssc,ch1_trans,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,work_cred3,emp_cr_thr3,emp_cr_thr4,work_max_red,incdep_combcred1,incdep_combcred_max,incdep_combcred_per,addsinglepcr_max,work_red_max] = ne_parameters_2011

%Employee Social Security Parameters
unemp_r=0.00;    %unemployment contribution rate for gross earnings between 
ssc_ceil=49297;   %Social Security Ceiling
unemp_fran=16965;   %Unemployment contribution lower bound for wage

med_empr=0.0775;
health_ceil=33427;   %Medical insurance net wage ceiling  (med_ceil)    

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.011;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.1215;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket
 
%Employers Social Security Parameters 
unemp_empr_r1=0.042;
unemp_empr_r2=0.0224;
unemp_empr_fran1=16965;
inv_empr_r=0.0572;

%Tax Schedule Parameters
taxbracket1=18628;
taxbracket2=33436;
taxbracket3=55694;
tax_r1=0.0185;
tax_r2=0.1080;   
tax_r3=0.42;
tax_r4=0.52;
  
%Tax credit parameters
gen_cred=1987;
emp_cred=158;
emp_cr_thr=9209;
emp_cr_thr3=44126;
emp_cr_thr4=50286;

work_cred1=0.01716;
work_cred2=0.12152;
work_cred3=0.0125;
work_red_max=77;
work_max=1574;
work_max_red=1497;

comb_credit_fr=4734;       
incdep_combcred1=780;
incdep_combcred_max=1871;
incdep_combcred_per=0.038;

singlepar_cr=931;
addsinglepcr_r=0.043;
addsinglepcr_max=1523;

rate_cr= tax_r1/(oldpen_r+ widpen_r+ex_med_r+tax_r1);
rate_ssc= 1-rate_cr;

%Family cash transfers
ch1_trans=947;

ch_cr=1011;
ch_cr2=1466;
ch_cr_thr=28897;   
decrease_r=0.076;

adch_thr=48186;

end