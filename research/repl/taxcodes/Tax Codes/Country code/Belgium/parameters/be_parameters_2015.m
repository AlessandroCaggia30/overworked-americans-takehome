

% Parameter Assignment for year 2015 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3,prp_red,lic_r,lic_max,add_local_r,red_r,reg_r] = be_parameters_2015

%Social Security Contribution Parameters

ssc_r=0.1307;
socsec_lim1=0;
socsec_lim2=18247.09;
socsec_lim3=28762.87;
sscred_r=2237.69;
sscred_r2=0.2128;
sscred_r3=0;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.3465;
socsec_empr_lim1=22241.96;
socsec_empr_lim2=53604.28;
sscred_empr_r=1850.40;
sscred_empr_r2=0.1620;
sscred_empr_r3=-0.06;

%Structural reduction on the withholding tax on wages
prp_red=0.01;

%Tax Allowance Parameters
workall_max=4090;
workall_lim1=5760;
workall_lim2=11380;
workall_lim3=19390;
workall_r1=0.2935;
workall_r2=0.1050;
workall_r3=0.08;
workall_r4=0.03;

%Special Socsec
sscspec_lim1=18592.02;
sscspec_lim2=21070.96;
sscspec_lim3=60161.85;
sscspec_r1=0.09;
sscspec_r2=0.013;


%Income Tax Parameters
taxbracket1=8710;
taxbracket2=12400;
taxbracket3=20660;
taxbracket4=37870;


tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;



quote_r=0.3;
quote_max=10230;

%Tax Credits
child_cr1=1510;
child_cr2=3880;
child_cr3=8700;
child_cr4=14060;
child_cr5=5370;
s_parent_cr=1510;
single_cr=7090;
married_cr=7090;
supp_cr=290;
supp_cr_thrsh=26360;

%Local Tax
local_r=0.065;
add_local_r=0.01;

%Regional Tax
red_r=0.2599;
reg_r=0.35117;
%reg_r=0;

% Child Benefit
cb_1=1332.12;
cb_2=2423.92;
cb_3=3412.24;

%Basic Credit
basicr_b=0;
basicr_1=4960;
basicr_2=6620;
basicr_3=16560;
basicr_4=21520;


%Low-income credit
lic_r=0.1582;
lic_max=330.83;

end