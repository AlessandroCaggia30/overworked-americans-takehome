

% Parameter Assignment 

function[unemp_r,ssc_ceil,unemp_fran,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,gen_cred1,gen_cred1_thr,gen_cred2_thr,gen_cred_r,red_gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,ch_cr2,decrease_r,rate_cr,rate_ssc,ch1_trans,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,work_cred3,emp_cr_thr3,incdep_combcred1,incdep_combcred_max,incdep_combcred_per,work_red_max,extra_cash_single_par] = ne_parameters_2015

%Employee Social Security Parameters
unemp_r=0.00;    %unemployment contribution rate for gross earnings between 
ssc_ceil=51976;   %Social Security Ceiling
unemp_fran=17888;   %Unemployment contribution lower bound for wage

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.006;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.0965;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket
 
%Employers Social Security Parameters 
unemp_empr_r1=0.0207;
unemp_empr_r2=0.0216;
unemp_empr_fran1=17888;
inv_empr_r=0.0690;

%Tax Schedule Parameters
taxbracket1=19822;
taxbracket2=33589;
taxbracket3=57585;
tax_r1=0.0835;
tax_r2=0.1385;   
tax_r3=0.42;
tax_r4=0.52;
  
%Tax credit parameters
gen_cred1=2203;
gen_cred1_thr=19822;
gen_cred2_thr=56935;
gen_cred_r=0.0232;
red_gen_cred=1175;
emp_cred=163;
emp_cr_thr=9010;
emp_cr_thr3=49770;

work_cred1=0.01810;
work_cred2=0.19679;
work_cred3=0.04;
work_red_max=1730;
work_max=2220;

comb_credit_fr=4857;       
incdep_combcred1=1033;
incdep_combcred_max=2152;
incdep_combcred_per=0.04;

rate_cr= tax_r1/(oldpen_r+ widpen_r+ex_med_r+tax_r1);
rate_ssc= 1-rate_cr;

%Family cash transfers
ch1_trans=931;
ch_cr=1032;
ch_cr2=1823;
ch_cr_thr=19463;   
decrease_r=0.0675;
extra_cash_single_par=3050;

adch_thr=46470;

end