

% Parameter Assignment for year 2006 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3] = be_parameters_2006

%Social Security Contribution Parameters
ssc_r=0.1307;
socsec_lim1=0;
socsec_lim2=14810.76;
socsec_lim3=24431.52;
sscred_r=1680;
sscred_r2=0.1746;
sscred_r3=0;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.3472;
socsec_empr_lim1=23482.84;
socsec_empr_lim2=48000;
sscred_empr_r=1600;
sscred_empr_r2=0.1444;
sscred_empr_r3=-0.06;

%Tax Allowance Parameters
workall_max=3230;
workall_lim1=4790;
workall_lim2=9520;
workall_lim3=15850;
workall_r1=0.261;
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
taxbracket1=7290;
taxbracket2=10380;
taxbracket3=17300;
taxbracket4=31700;


tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;



quote_r=0.3;
quote_max=8570;

%Tax Credits
child_cr1=1260;
child_cr2=3250;
child_cr3=7280;
child_cr4=11770;
child_cr5=4490;
s_parent_cr=1260;
single_cr=5940;
married_cr=5940;

%Local Tax
local_r=0.07;


% Child Benefit
cb_1=1085.64;
cb_2=2032.20;
cb_3=2875.68;

%Basic Credit
basicr_b=0;
basicr_1=4170;
basicr_2=5560;
basicr_3=13910;
basicr_4=18080;

end