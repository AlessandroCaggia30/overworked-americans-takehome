

% Parameter Assignment 

function[unemp_r,ssc_ceil,unemp_fran,med_empr,health_ceil,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,ch_cr2,decrease_r,rate_cr,rate_ssc,ch1_trans,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,work_cred3,emp_cr_thr3,emp_cr_thr4,work_max_red,incdep_combcred1,incdep_combcred_max,incdep_combcred_per,addsinglepcr_max,work_red_max] = ne_parameters_2009

%Employee Social Security Parameters
unemp_r=0.00;    %unemployment contribution rate for gross earnings between 
ssc_ceil=47802;   %Social Security Ceiling
unemp_fran=16443;   %Unemployment contribution lower bound for wage

med_empr=0.069;
health_ceil=32369;   %Medical insurance net wage ceiling  (med_ceil)    
health_fixed= 1064;   %basic insurance (med_adult)

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.011;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.1215;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket

%Employers Social Security Parameters 
unemp_empr_r1=0.0415;
unemp_empr_r2=0.0141;
unemp_empr_fran1=16443;
inv_empr_r=0.0632;

%Tax Schedule Parameters
taxbracket1=17878;
taxbracket2=32127;
taxbracket3=54776;
tax_r1=0.0235;
tax_r2=0.1085;   
tax_r3=0.42;
tax_r4=0.52;
  
%Tax credit parameters
gen_cred=2007;
emp_cred=154;
emp_cr_thr=8859;
emp_cr_thr3=42509;
emp_cr_thr4=44429;

work_cred1=0.01738;
work_cred2=0.1238;
work_cred3=0.0125;
work_red_max=24;
work_max=1504;
work_max_red=1480;

comb_credit_fr=4619;       
incdep_combcred1=770;
incdep_combcred_max=1765;
incdep_combcred_per=0.038;

singlepar_cr=902;
addsinglepcr_r=0.043;
addsinglepcr_max=1484;

rate_cr= tax_r1/(oldpen_r+ widpen_r+ex_med_r+tax_r1);
rate_ssc= 1-rate_cr;

%Family cash transfers
ch1_trans=947;

ch_cr=1011;
ch_cr2=1322;
ch_cr_thr=29914;   
decrease_r=0.065;

adch_thr=50253;

end