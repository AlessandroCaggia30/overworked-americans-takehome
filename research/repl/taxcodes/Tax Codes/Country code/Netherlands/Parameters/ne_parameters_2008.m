

% Parameter Assignment 

function[unemp_r,ssc_ceil,unemp_fran,med_empr,health_ceil,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,comb_credit,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,decrease_r,rate_cr,rate_ssc,ch_ben,adcomb_cred,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r] = ne_parameters_2008

%Employee Social Security Parameters
unemp_r=0.035;    %unemployment contribution rate for gross earnings between 
ssc_ceil=46205;   %Social Security Ceiling
unemp_fran=15921;   %Unemployment contribution lower bound for wage

med_empr=0.072;
health_ceil=31231;   %Medical insurance net wage ceiling      
health_fixed= 1047;   %basic insurance

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.011;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.1215;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket

%Employers Social Security Parameters 
unemp_empr_r1=0.0475;
unemp_empr_r2=0.0138;
unemp_empr_fran1=15921;
inv_empr_r=0.0637;


 %Tax Schedule Parameters
taxbracket1=17579;
taxbracket2=31589;
taxbracket3=53860;
tax_r1=0.0245;
tax_r2=0.107;   
tax_r3=0.42;
tax_r4=0.52;
  
%Tax credit parameters
 gen_cred=2074;
 
 work_cred1=0.01758;
  emp_cred=151;
 work_cred2=0.1243;
  emp_cr_thr=8587;
  work_max=1443;

ch_cr=994;
ch_cr_thr=29413;   
adch_thr=46700;
decrease_r=0.0575;
   


comb_credit=112; 
 comb_credit_fr=4542; 
adcomb_cred= 746;


singlepar_cr=1459;
addsinglepcr_r=0.043;


rate_cr= tax_r1/(oldpen_r+ widpen_r+ex_med_r+tax_r1);
rate_ssc= 1-rate_cr;


ch_ben=1865/2;



end