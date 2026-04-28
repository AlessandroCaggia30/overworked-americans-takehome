

% Parameter Assignment for year 2010 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,socsec_lim4,sscred_r,sscred_r2,sscred_r3,sscred_r4,sscred_r5,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3] = be_parameters_2010

%Social Security Contribution Parameters

ssc_r=0.1307;
socsec_lim1=0;
socsec_lim2=16649.88;
socsec_lim3=20322.00;
socsec_lim4=26444.64;
sscred_r=2100;
sscred_r2=0.2798;
sscred_r3=1716;
sscred_r4=0.1753;
sscred_r5=0;


%Employer Social Security Contribution Parameters
ssc_empr_r=0.3467;
socsec_empr_lim1=24120;
socsec_empr_lim2=48000;
sscred_empr_r=1600;
sscred_empr_r2=0.1620;
sscred_empr_r3=-0.06;

%Tax Allowance Parameters
workall_max=3590;
workall_lim1=5190;
workall_lim2=10310;
workall_lim3=17170;
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
taxbracket1=7900;
taxbracket2=11240;
taxbracket3=18730;
taxbracket4=34330;


tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;



quote_r=0.3;
quote_max=9280;

%Tax Credits
child_cr1=1370;
child_cr2=3520;
child_cr3=7880;
child_cr4=12750;
child_cr5=4870;
s_parent_cr=1370;
single_cr=6430;
married_cr=6430;
supp_cr=260;
supp_cr_thrsh=23900;

%Local Tax
local_r=0.074;


% Child Benefit
cb_1=1305.95;
cb_2=2310.57;
cb_3=3225.17;

%Basic Credit
basicr_b=0;
basicr_1=4510;
basicr_2=6020;
basicr_3=15060;
basicr_4=19580;

end