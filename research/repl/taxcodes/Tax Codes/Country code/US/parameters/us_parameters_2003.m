

% Parameter Assignment for year 2003.

function[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,chcrd_max,chcrd_rdn,chcrd_thrsh_oth,chcrd_thrsh_m,chcrd_ref_perct,chcrd_ref_thresh,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,ded_unit] = us_parameters_2003

%Social Security Parameters
pen_fixed=0.0145;
pen_var=0.062;
pen_limit=87000;

%Tax Allowance Parameters
married_all=9500;
hh_all=7000;
single_all=4750;
pers_exem=3050;
dep_exemption=3050;
ded_rate=0.02;
exemlim_s=139500;
exemlim_hh=174400;
exemlim_m=209250;
ded_unit=2500;


 %Tax Schedule Parameters
taxbracket_s1=7000;
taxbracket_s2=28400;
taxbracket_s3=68800;
taxbracket_s4=143500;
taxbracket_s5=311950;

taxbracket_hh1=10000;
taxbracket_hh2=38050;
taxbracket_hh3=98250;
taxbracket_hh4=159100;
taxbracket_hh5=311950;

taxbracket_m1=14000;
taxbracket_m2=56800;
taxbracket_m3=114650;
taxbracket_m4=174700;
taxbracket_m5=311950;

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
inclim0=4990;
inclim1=7490;
inclim2=10510;
threshold_s0=6240;
threshold_s1=13730;
threshold_s2=13730;
threshold_m0=7240;
threshold_m1=14730;
threshold_m2=14730;
phaseout0=0.0765;
phaseout1=0.1598;
phaseout2=0.2106;

chcrd_max=1000;
chcrd_rdn=50;
chcrd_thrsh_oth=75000;
chcrd_thrsh_m=110000;
chcrd_ref_perct=0.1;
chcrd_ref_thresh=10500;

%Local Tax Parameters
Detroit_ex=750;
Detroit_rate=0.0255;
Mich_ex=3100;
Mich_ex_child=0;
Mich_rate=0.04;
Mich_cr_r1=0.2;
Mich_cr_r2=0.1;
Mich_cr_r3=0.05;
Mich_cr_lim1=100;
Mich_cr_lim2=150;
Mich_cr_max=10000;



 
end