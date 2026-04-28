

% Parameter Assignment for year 2003 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,socsec_empr_lim3,sscred_empr_r,sscred_empr_r2,sscred_empr_r3] = be_parameters_2003

%Social Security Contribution Parameters
ssc_r=0.1307;
socsec_lim1=10733.04;
socsec_lim2=14047.68;
socsec_lim3=18110.04;
sscred_r=1140;
sscred_r2=0.2806;
sscred_r3=0;


%Employer Social Security Contribution Parameters
ssc_empr_r=0.3458;
socsec_empr_lim1=10261;
socsec_empr_lim2=13329;
socsec_empr_lim3=18459;
sscred_empr_r=1255;
sscred_empr_r2=0.3295;
sscred_empr_r3=2946;

%Tax Allowance Parameters
workall_max=3000;
workall_lim1=4500;
workall_lim2=8930;
workall_lim3=14870;
workall_r1=0.25;
workall_r2=0.1;
workall_r3=0.05;
workall_r4=0.03;

%Special Socsec
sscspec_lim1=18592.01;
sscspec_lim2=21070.95;
sscspec_lim3=60161.87;
sscspec_r1=0.09;
sscspec_r2=0.013;


%Income Tax Parameters
taxbracket1=6840;
taxbracket2=9740;
taxbracket3=14530;
taxbracket4=29740;


tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;



quote_r=0.3;
quote_max=8030;

%Tax Credits
child_cr1=1180;
child_cr2=3050;
child_cr3=6830;
child_cr4=11040;
child_cr5=4220;
s_parent_cr=1180;
single_cr=5570;
married_cr=4610;

%Local Tax
local_r=0.07;


% Child Benefit
cb_1=1023.12;
cb_2=1914.84;
cb_3=2709.72;

%Basic Credit
basicr_b=260;
basicr_1=3910;
basicr_2=5220;
basicr_3=13050;
basicr_4=16960;

end