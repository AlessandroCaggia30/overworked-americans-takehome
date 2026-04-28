

% Parameter Assignment for year 2014 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3,prp_red,lic_r,lic_max] = be_parameters_2014

%Social Security Contribution Parameters

ssc_r=0.1307;
socsec_lim1=0;
socsec_lim2=18021.84;
socsec_lim3=28624.92;
sscred_r=2207.64;
sscred_r2=0.2082;
sscred_r3=0;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.3479;
socsec_empr_lim1=22241.96;
socsec_empr_lim2=53604.28;
sscred_empr_r=1850.50;
sscred_empr_r2=0.1620;
sscred_empr_r3=-0.06;

%Structural reduction on the withholding tax on wages
prp_red=0.01;

%Tax Allowance Parameters
workall_max=3950;
workall_lim1=5710;
workall_lim2=11340;
workall_lim3=18800;
workall_r1=0.287;
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
taxbracket1=8680;
taxbracket2=12360;
taxbracket3=20600;
taxbracket4=37750;


tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;



quote_r=0.3;
quote_max=10200;

%Tax Credits
child_cr1=1500;
child_cr2=3870;
child_cr3=8670;
child_cr4=14020;
child_cr5=5350;
s_parent_cr=1500;
single_cr=7070;
married_cr=7070;
supp_cr=280;
supp_cr_thrsh=26280;

%Local Tax
local_r=0.074;


% Child Benefit
cb_1=1342.12;
cb_2=2430.92;
cb_3=3419.24;

%Basic Credit
basicr_b=0;
basicr_1=4960;
basicr_2=6620;
basicr_3=16560;
basicr_4=21520;


%Low-income credit
lic_r=0.1304;
lic_max=200;
end