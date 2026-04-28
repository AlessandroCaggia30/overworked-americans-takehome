

% Parameter Assignment for year 2000 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,surtax_lim1,surtax_lim2,surtax_lim3,surtax_lim4,surtax_r1,surtax_r2,surtax_r3,surtax_rtph,cb_1,cb_2,cb_3, ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,socsec_empr_lim3,socsec_empr_lim4,sscred_empr_r,sscred_empr_r2,sscred_empr_r3, sscred_empr_r4] = be_parameters_2000

%Social Security Contribution Parameters
ssc_r=0.1307;
socsec_lim1=34000;
socsec_lim2=42500;
socsec_lim3=49000;
sscred_r=2600;
sscred_r2=0.4;
sscred_r3=0;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.3470;
socsec_empr_lim1=413916;
socsec_empr_lim2=524420;
socsec_empr_lim3=634668;
socsec_empr_lim4=744640;
sscred_empr_r=23478;
sscred_empr_r2=0.5509;
sscred_empr_r3=108572;
sscred_empr_r4=47836;

%Tax Allowance Parameters
workall_max=112000;
workall_lim1=168000;
workall_lim2=337000;
workall_lim3=561000;
workall_r1=0.2;
workall_r2=0.1;
workall_r3=0.05;
workall_r4=0.03;

%Special Socsec
sscspec_lim1=750000;
sscspec_lim2=850000;
sscspec_lim3=2426924;
sscspec_r1=0.09;
sscspec_r2=0.013;

%Income Tax Parameters
taxbracket1=258000;
taxbracket2=342000;
taxbracket3=488000;
taxbracket4=1123000;
taxbracket5=1684000;
taxbracket6=2470000;
tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;
tax_r6=0.525;
tax_r7=0.55;

quote_r=0.3;
quote_max=303000;

%Tax Credits
child_cr1=45000;
child_cr2=115000;
child_cr3=258000;
child_cr4=417000;
child_cr5=576000;
s_parent_cr=45000;
single_cr=210000;
married_cr=167000;

%Local Tax
local_r=0.07;

%Surtax
surtax_lim1=800000;
surtax_lim2=850000;
surtax_lim3=1200000;
surtax_lim4=1250000;
surtax_r1=0.01;
surtax_r2=0.02;
surtax_r3=0.03;
surtax_rtph=0.0000002; 

% Child Benefit
cb_1=42976;
cb_2=73280;
cb_3=103696;

end