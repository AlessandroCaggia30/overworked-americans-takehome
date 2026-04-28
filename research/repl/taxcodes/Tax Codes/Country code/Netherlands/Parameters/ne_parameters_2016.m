

% Parameter Assignment 

function[unemp_r,ssc_ceil,unemp_fran,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,gen_cred1,gen_cred1_thr,gen_cred2_thr,gen_cred_r,red_gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,ch_cr2,decrease_r,rate_cr,rate_ssc,ch1_trans,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,work_cred3,emp_cr_thr3,incdep_combcred1,incdep_combcred_max,incdep_combcred_per,extra_cash_single_par] = ne_parameters_2016

%Employee Social Security Parameters
unemp_r=0.00;    %unemployment contribution rate for gross earnings between 
ssc_ceil=52763;   %Social Security Ceiling
unemp_fran=0;   %Unemployment contribution lower bound for wage

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.006;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.0965;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket
 
%Employers Social Security Parameters 
unemp_empr_r1=0.0244;
unemp_empr_r2=0.0178;
unemp_empr_fran1=0;
inv_empr_r=0.0750;

%Tax Schedule Parameters
taxbracket1=19922;
taxbracket2=33715;
taxbracket3=66421;
tax_r1=0.084;
tax_r2=0.1225;   
tax_r3=0.404;
tax_r4=0.52;
  
%Tax credit parameters
gen_cred1=2242;
gen_cred1_thr=19922;
gen_cred2_thr=66417;
gen_cred_r=0.04822;
red_gen_cred=1047;
emp_cred=164;
emp_cr_thr=9147;
emp_cr_thr3=34015;

work_cred1=0.01793;
work_cred2=0.27698;
work_cred3=0.04;
work_max=3103;

comb_credit_fr=4881;       
incdep_combcred1=1039;
incdep_combcred_max=2769;
incdep_combcred_per=0.06159;

rate_cr= tax_r1/(oldpen_r+ widpen_r+ex_med_r+tax_r1);
rate_ssc= 1-rate_cr;

%Family cash transfers
ch1_trans=960;
ch_cr=1038;
ch_cr2=1866;
ch_cr_thr=19759;   
decrease_r=0.0675;
extra_cash_single_par=3066;

adch_thr=47403;

end