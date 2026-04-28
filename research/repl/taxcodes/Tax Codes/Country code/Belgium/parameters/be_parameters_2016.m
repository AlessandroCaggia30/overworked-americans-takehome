

% Parameter Assignment for year 2016 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_r1,workall_r2,workall_r3,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3,prp_red,lic_r,lic_max,add_local_r,red_r,reg_r,ex_lim1,ex_lim2,ex_lim3,ex_lim4,ex_r1,ex_r2,ex_r3,ex_r4,ex_r5] = be_parameters_2016

%Social Security Contribution Parameters

ssc_r=0.1307;
socsec_lim1=0;
socsec_lim2=18779.58;
socsec_lim3=29293.89;
sscred_r=2306.43;
sscred_r2=0.2194;
sscred_r3=0;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.3275;
socsec_empr_lim1=26536.49;
socsec_empr_lim2=54140.328;
sscred_empr_r=1776.60;
sscred_empr_r2=0.1432;
sscred_empr_r3=-0.06;

%Structural reduction on the withholding tax on wages
prp_red=0.0025;

%Tax Allowance Parameters
workall_max=4240;
workall_lim1=8450;
workall_lim2=19960;
workall_r1=0.30;
workall_r2=0.11;
workall_r3=0.03;

%Special Socsec
sscspec_lim1=18592.02;
sscspec_lim2=21070.96;
sscspec_lim3=60161.85;
sscspec_r1=0.09;
sscspec_r2=0.013;


%Income Tax Parameters
taxbracket1=10860;
taxbracket2=12470;
taxbracket3=20780;
taxbracket4=38080;


tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;



quote_r=0.3;
quote_max=10290;

%Tax Credits
child_cr1=1520;
child_cr2=3900;
child_cr3=8740;
child_cr4=14140;
child_cr5=5400;
s_parent_cr=1520;
single_cr=7130;
married_cr=7130;
supp_cr=290;
supp_cr_thrsh=26510;

%Local Tax
local_r=0.066;
add_local_r=0.00;

%Regional Tax
red_r=0.2599;
reg_r=0.35117;
%reg_r=0;
% Child Benefit
cb_1=1349.38;
cb_2=2453.45;
cb_3=3453.32;

%Basic Credit
basicr_b=0;
basicr_1=4960;
basicr_2=6620;
basicr_3=16560;
basicr_4=21520;

%Basic exemption plus any additional exemption schedule
ex_lim1=8760;
ex_lim2=12470;
ex_lim3=20780;
ex_lim4=28080;

ex_r1=0.25;
ex_r2=0.3;
ex_r3=0.4;
ex_r4=0.45;
ex_r5=0.5;

%Low-income credit

lic_r=0.2803;
lic_max=640;

end