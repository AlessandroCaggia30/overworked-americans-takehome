

% Parameter Assignment for year 2005 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3] = be_parameters_2005

%Social Security Contribution Parameters
ssc_r=0.1307;
socsec_lim1=0;
socsec_lim2=14593.28;
socsec_lim3=20207.1;
sscred_r=1440;
sscred_r2=0.2567;
sscred_r3=0;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.3482;
socsec_empr_lim1=23482.84;
socsec_empr_lim2=48000;
sscred_empr_r=1600;
sscred_empr_r2=0.1444;
sscred_empr_r3=0.06;

%Tax Allowance Parameters
workall_max=3110;
workall_lim1=4660;
workall_lim2=9270;
workall_lim3=15420;
workall_r1=0.25;
workall_r2=0.1;
workall_r3=0.05;
workall_r4=0.03;

%Special Socsec
sscspec_lim1=18592.02;
sscspec_lim2=21070.96;
sscspec_lim3=60161.85;
sscspec_r1=0.09;
sscspec_r2=0.013;


%Income Tax Parameters
taxbracket1=7100;
taxbracket2=10100;
taxbracket3=16830;
taxbracket4=30840;


tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;



quote_r=0.3;
quote_max=8160;

%Tax Credits
child_cr1=1230;
child_cr2=3160;
child_cr3=7080;
child_cr4=11450;
child_cr5=4370;
s_parent_cr=1230;
single_cr=5780;
married_cr=5780;

%Local Tax
local_r=0.07;


% Child Benefit
cb_1=1043.52;
cb_2=1953.12;
cb_3=2763.96;

%Basic Credit
basicr_b=550;
basicr_1=4050;
basicr_2=5410;
basicr_3=13530;
basicr_4=17590;

end