

% Parameter Assignment for year 2007.

function[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,chcrd_max,chcrd_rdn,chcrd_thrsh_oth,chcrd_thrsh_m,chcrd_ref_perct,chcrd_ref_thresh,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,unemp_r,unemp_max,ded_unit] = us_parameters_2007

%Social Security Parameters
pen_fixed=0.0145;
pen_var=0.062;
pen_limit=97500;

unemp_r=0.008;
unemp_max=7000;

%Tax Allowance Parameters
married_all=10700;
hh_all=7850;
single_all=5350;
pers_exem=3400;
dep_exemption=3400;
ded_rate=0.0133;
exemlim_s=156400;
exemlim_hh=195500;
exemlim_m=234600;
ded_unit=2500;


 %Tax Schedule Parameters
taxbracket_s1=7825;
taxbracket_s2=31850;
taxbracket_s3=77100;
taxbracket_s4=160850;
taxbracket_s5=349700;

taxbracket_hh1=11200;
taxbracket_hh2=42650;
taxbracket_hh3=110100;
taxbracket_hh4=178350;
taxbracket_hh5=349700;

taxbracket_m1=15650;
taxbracket_m2=63700;
taxbracket_m3=128500;
taxbracket_m4=195850;
taxbracket_m5=349700;

tax_r1=0.1;
tax_r2=0.15;
tax_r3=0.25;
tax_r4=0.28;
tax_r5=0.33;
tax_r6=0.35;

%Tax Credit Parameters
r0=0.0765;
r1=0.34;
r2=0.4;
inclim0=5590;
inclim1=8390;
inclim2=11790;
threshold_s0=7000;
threshold_s1=15390;
threshold_s2=15390;
threshold_m0=9000;
threshold_m1=17390;
threshold_m2=17390;
phaseout0=0.0765;
phaseout1=0.1598;
phaseout2=0.2106;

chcrd_max=1000;
chcrd_rdn=50;
chcrd_thrsh_oth=75000;
chcrd_thrsh_m=110000;
chcrd_ref_perct=0.15;
chcrd_ref_thresh=11750;

%Local Tax Parameters
Detroit_ex=600;
Detroit_rate=0.025;
Mich_ex=3300;
Mich_ex_child=600;
Mich_rate=0.039;
Mich_cr_r1=0.2;
Mich_cr_r2=0.1;
Mich_cr_r3=0.05;
Mich_cr_lim1=100;
Mich_cr_lim2=150;
Mich_cr_max=10000;



 
end