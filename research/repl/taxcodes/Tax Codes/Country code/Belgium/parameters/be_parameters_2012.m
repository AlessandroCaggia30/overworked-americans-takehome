

% Parameter Assignment for year 2012 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,socsec_lim4,sscred_r,sscred_r2,sscred_r3,sscred_r4,sscred_r5,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3, prp_red,lic_r, lic_max] = be_parameters_2012

%Social Security Contribution Parameters

ssc_r=0.1307;
socsec_lim1=0;
socsec_lim2=17639.94;
socsec_lim3=21530.33;
socsec_lim4=28016.82;
sscred_r=2100;
sscred_r2=0.2645;
sscred_r3=1716;
sscred_r4=0.1657;
sscred_r5=0;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.3467;
socsec_empr_lim1=23482.84;
socsec_empr_lim2=48000;
sscred_empr_r=1600;
sscred_empr_r2=0.1620;
sscred_empr_r3=-0.06;

%Structural reduction on the withholding tax on wages
prp_red=0.01;

%Tax Allowance Parameters
workall_max=3790;
workall_lim1=5490;
workall_lim2=10910;
workall_lim3=18150;
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
taxbracket1=8350;
taxbracket2=11890;
taxbracket3=19810;
taxbracket4=36300;


tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;



quote_r=0.3;
quote_max=9810;

%Tax Credits
child_cr1=1440;
child_cr2=3720;
child_cr3=8330;
child_cr4=13480;
child_cr5=5150;
s_parent_cr=1440;
single_cr=6800;
married_cr=6800;
supp_cr=270;
supp_cr_thrsh=25270;

%Local Tax
local_r=0.074;


% Child Benefit
cb_1=1329.69;
cb_2=2395.66;
cb_3=3366.30;

%Basic Credit
basicr_b=0;
basicr_1=4770;
basicr_2=6370;
basicr_3=15930;
basicr_4=20700;

%Low-income credit
lic_r=0.057;
lic_max=120;
end