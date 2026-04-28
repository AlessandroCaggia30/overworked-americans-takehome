

% Parameter Assignment for year 2015

function[single_all,hh_all,married_all,dep_exemption,pers_exem,pen_fixed,pens_rate_er,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,chcrd_max,chcrd_rdn,chcrd_thrsh_oth,chcrd_thrsh_m,chcrd_ref_perct,chcrd_ref_thresh,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,unemp_r,unemp_max,unemp_dedn_rate,mich_unemp_rate,mich_unemp_max,r3,inclim3,threshold_s3,threshold_m3,phaseout3,pens_rate_ee,Mich_eic_r,taxbracket_s6,taxbracket_m6,tax_r7,taxbracket_hh6,add_hosp_rate,add_hosp_thresh_m, add_hosp_thresh_oth,ded_rate,ded_unit,exemlim_s,exemlim_hh,exemlim_m] = us_parameters_2015

%Social Security Parameters
pen_fixed=0.0145; 
pens_rate_er=0.062; 
pens_rate_ee=0.062;
pen_limit=118500;
add_hosp_rate=0.009;
add_hosp_thresh_m=250000;
add_hosp_thresh_oth=200000;

unemp_r=0.006;
unemp_max=7000;
unemp_dedn_rate=0.054;
mich_unemp_rate=0.0582;
mich_unemp_max=9500;

%Tax Allowance Parameters
married_all=12600;
hh_all=9250;
single_all=6300;
pers_exem=4000;
dep_exemption=4000;

ded_rate=0.02;
ded_unit=2500;
exemlim_s=258250;
exemlim_hh=284050;
exemlim_m=309900;

 %Tax Schedule Parameters
taxbracket_s1=9225;
taxbracket_s2=37450;
taxbracket_s3=90750;
taxbracket_s4=189300;
taxbracket_s5=411500;
taxbracket_s6=413200;

taxbracket_m1=18450;
taxbracket_m2=74900;
taxbracket_m3=151200;
taxbracket_m4=230450;
taxbracket_m5=411500;
taxbracket_m6=464850;

taxbracket_hh1=13150;
taxbracket_hh2=50200;
taxbracket_hh3=129600;
taxbracket_hh4=209850;
taxbracket_hh5=411500;
taxbracket_hh6=439000;

tax_r1=0.1;
tax_r2=0.15;
tax_r3=0.25;
tax_r4=0.28;
tax_r5=0.33;
tax_r6=0.35;
tax_r7=0.396;

%Tax Credit Parameters
r0=0.0765;
r1=0.34;
r2=0.4;
r3=0.45;
inclim0=6580;
inclim1=9880;
inclim2=13870;
inclim3=13870;
threshold_s0=8240;
threshold_s1=18110;
threshold_s2=18110;
threshold_s3=18110;
threshold_m0=13750;
threshold_m1=23630;
threshold_m2=23630;
threshold_m3=23630;
phaseout0=0.0765;
phaseout1=0.1598;
phaseout2=0.2106;
phaseout3=0.2106;

chcrd_max=1000;
chcrd_rdn=50;
chcrd_thrsh_oth=75000;
chcrd_thrsh_m=110000;
chcrd_ref_perct=0.15;
chcrd_ref_thresh=3000;

%Local Tax Parameters
Detroit_ex=600;
Detroit_rate=0.024;
Mich_ex=3950;
Mich_ex_child=0;
Mich_rate=0.0425;
Mich_cr_r1=0;
Mich_cr_r2=0;
Mich_cr_r3=0;
Mich_cr_lim1=0;
Mich_cr_lim2=0;
Mich_cr_max=0; 
Mich_eic_r=0.06;

end