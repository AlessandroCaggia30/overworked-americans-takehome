

% Parameter Assignment for year 2002 Belgium.

function[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,surtax_lim1,surtax_lim2,surtax_r1,surtax_r2,surtax_rtph,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,socsec_empr_lim3,sscred_empr_r,sscred_empr_r2,sscred_empr_r3] = be_parameters_2002

%Social Security Contribution Parameters
ssc_r=0.1307;
socsec_lim1=10522.8;
socsec_lim2=13772.4;
socsec_lim3=16402.92;
sscred_r=981.6;
sscred_r2=0.3732;
sscred_r3=0;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.3458;
socsec_empr_lim1=10261;
socsec_empr_lim2=13329;
socsec_empr_lim3=18460;
sscred_empr_r=1120;
sscred_empr_r2=0.3821;
sscred_empr_r3=2946;

%Tax Allowance Parameters
workall_max=2950;
workall_lim1=4420;
workall_lim2=8790;
workall_lim3=14630;
workall_r1=0.23;
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
taxbracket1=6730;
taxbracket2=8930;
taxbracket3=12720;
taxbracket4=29250;
taxbracket5=43870;

tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;
tax_r6=0.525;


quote_r=0.3;
quote_max=7900;

%Tax Credits
child_cr1=1160;
child_cr2=3000;
child_cr3=6720;
child_cr4=10860;
child_cr5=4150;
s_parent_cr=1160;
single_cr=5480;
married_cr=4350;

%Local Tax
local_r=0.07;

%Surtax
surtax_lim1=29747.22;
surtax_lim2=30986.69;

surtax_r1=0;
surtax_r2=0.01;
surtax_rtph=0.000008068; 

% Child Benefit
cb_1=1021.45;
cb_2=1911.74;
cb_3=2705.3;

%Basic Credit
basicr_b=78;
basicr_1=3850;
basicr_2=5130;
basicr_3=12840;
basicr_4=16680;

end