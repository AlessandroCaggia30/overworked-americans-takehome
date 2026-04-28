

% Parameter Assignment for year 2011 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,socsec_lim4,sscred_r,sscred_r2,sscred_r3,sscred_r4,sscred_r5,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3,prp_red] = be_parameters_2011

%Social Security Contribution Parameters

ssc_r=0.1307;
socsec_lim1=0;
socsec_lim2=17209.28;
socsec_lim3=21004.68;
socsec_lim4=27332.60;
sscred_r=2100;
sscred_r2=0.2743;
sscred_r3=1716;
sscred_r4=0.1718;
sscred_r5=0;


%Employer Social Security Contribution Parameters
ssc_empr_r=0.3477;
socsec_empr_lim1=24120;
socsec_empr_lim2=48000;
sscred_empr_r=1600;
sscred_empr_r2=0.1620;
sscred_empr_r3=-0.06;

%Structural reduction on the withholding tax on wages
prp_red=0.01;

%Tax Allowance Parameters
workall_max=3670;
workall_lim1=5300;
workall_lim2=10530;
workall_lim3=17530;
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
taxbracket1=8070;
taxbracket2=11480;
taxbracket3=19130;
taxbracket4=35060;


tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;



quote_r=0.3;
quote_max=9470;

%Tax Credits
child_cr1=1400;
child_cr2=3590;
child_cr3=8050;
child_cr4=13020;
child_cr5=4970;
s_parent_cr=1400;
single_cr=6570;
married_cr=6570;
supp_cr=260;
supp_cr_thrsh=24410;

%Local Tax
local_r=0.074;


% Child Benefit
cb_1=1293.51;
cb_2=2329.79;
cb_3=3273.63;

%Basic Credit
basicr_b=0;
basicr_1=4610;
basicr_2=6150;
basicr_3=15380;
basicr_4=19990;

end