

% Parameter Assignment for year 2008 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3] = be_parameters_2008

%Social Security Contribution Parameters

ssc_r=0.1307;
socsec_lim1=0;
socsec_lim2=15715.08;
socsec_lim3=25418.52;
sscred_r=1812;
sscred_r2=0.1768;
sscred_r3=0;


%Employer Social Security Contribution Parameters
ssc_empr_r=0.3455;
socsec_empr_lim1=23482.84;
socsec_empr_lim2=48000;
sscred_empr_r=1600;
sscred_empr_r2=0.1620;
sscred_empr_r3=-0.06;

%Tax Allowance Parameters
workall_max=3390;
workall_lim1=4970;
workall_lim2=9870;
workall_lim3=16430;
workall_r1=0.272;
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
taxbracket1=7560;
taxbracket2=10760;
taxbracket3=17930;
taxbracket4=32860;


tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;



quote_r=0.3;
quote_max=8880;

%Tax Credits
child_cr1=1310;
child_cr2=3370;
child_cr3=7540;
child_cr4=12200;
child_cr5=4660;
s_parent_cr=1310;
single_cr=6150;
married_cr=6150;
supp_cr=250;
supp_cr_thrsh=22870;

%Local Tax
local_r=0.074;


% Child Benefit
cb_1=1249.9;
cb_2=2272.06;
cb_3=3167.34;

%Basic Credit
basicr_b=0;
basicr_1=4320;
basicr_2=5760;
basicr_3=14410;
basicr_4=18730;

end