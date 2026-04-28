

% Parameter Assignment 

function[unemp_r,ssc_ceil,unemp_fran,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,singlepar_cr,addsinglepcr_r,gen_cred1,gen_cred1_thr,gen_cred2_thr,gen_cred_r,red_gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,ch_cr2,decrease_r,rate_cr,rate_ssc,ch1_trans,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,work_cred3,emp_cr_thr3,incdep_combcred1,incdep_combcred_max,incdep_combcred_per,addsinglepcr_max,work_red_max] = ne_parameters_2014

%Employee Social Security Parameters
unemp_r=0.00;    %unemployment contribution rate for gross earnings between 
ssc_ceil=51414;   %Social Security Ceiling
unemp_fran=17693;   %Unemployment contribution lower bound for wage

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.006;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.1265;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket
 
%Employers Social Security Parameters 
unemp_empr_r1=0.0215;
unemp_empr_r2=0.0318;
unemp_empr_fran1=17693;
inv_empr_r=0.0598;

%Tax Schedule Parameters
taxbracket1=19645;
taxbracket2=33363;
taxbracket3=56531;
tax_r1=0.0510;
tax_r2=0.1085;   
tax_r3=0.42;
tax_r4=0.52;
  
%Tax credit parameters
gen_cred1=2103;
gen_cred1_thr=19645;
gen_cred2_thr=56495;
gen_cred_r=0.02;
red_gen_cred=1262;
emp_cred=161;
emp_cr_thr=8913;
emp_cr_thr3=40721;

work_cred1=0.01807;
work_cred2=0.18724;
work_cred3=0.04;
work_red_max=1730;
work_max=2097;

comb_credit_fr=4814;       
incdep_combcred1=1024;
incdep_combcred_max=2133;
incdep_combcred_per=0.04;

singlepar_cr=947;
addsinglepcr_r=0.043;
addsinglepcr_max=1319;

rate_cr= tax_r1/(oldpen_r+ widpen_r+ex_med_r+tax_r1);
rate_ssc= 1-rate_cr;

%Family cash transfers
ch1_trans=931;
ch_cr=1017;
ch_cr2=1553;
ch_cr_thr=26147;   
decrease_r=0.076;

adch_thr=46581;

end