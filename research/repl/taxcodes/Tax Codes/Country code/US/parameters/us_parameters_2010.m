

% Parameter Assignment for year 2010

function[single_all,hh_all,married_all,dep_exemption,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,chcrd_max,chcrd_rdn,chcrd_thrsh_oth,chcrd_thrsh_m,chcrd_ref_perct,chcrd_ref_thresh,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,unemp_r,unemp_max,unemp_dedn_rate,mich_unemp_rate,mich_unemp_max,r3,inclim3,threshold_s3,threshold_m3,phaseout3,mwp_r,mwp_max,mwp_thresh,mwp_taper] = us_parameters_2010

%Social Security Parameters
pen_fixed=0.0145;
pen_var=0.062; %hosp_rate
pen_limit=106800;

unemp_r=0.062;
unemp_max=7000;
unemp_dedn_rate=0.054;
mich_unemp_rate=0.049;
mich_unemp_max=9000;

%Tax Allowance Parameters
married_all=11400;
hh_all=8400;
single_all=5700;
pers_exem=3650;
dep_exemption=3650;

 %Tax Schedule Parameters
taxbracket_s1=8375;
taxbracket_s2=34000;
taxbracket_s3=82400;
taxbracket_s4=171850;
taxbracket_s5=373650;

taxbracket_m1=16750;
taxbracket_m2=68000;
taxbracket_m3=137300;
taxbracket_m4=209250;
taxbracket_m5=373650;

taxbracket_hh1=11950;
taxbracket_hh2=45500;
taxbracket_hh3=117650;
taxbracket_hh4=190550;
taxbracket_hh5=373650;

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
r3=0.45;
inclim0=5980;
inclim1=8970;
inclim2=12590;
inclim3=12590;
threshold_s0=7480;
threshold_s1=16450;
threshold_s2=16450;
threshold_s3=16450;
threshold_m0=12490;
threshold_m1=21460;
threshold_m2=21460;
threshold_m3=21460;
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

%Making work pay credit
mwp_r=0.062;
mwp_max=400;
mwp_thresh=75000;
mwp_taper=0.02;

%Local Tax Parameters
Detroit_ex=600;
Detroit_rate=0.025;
Mich_ex=3300;
Mich_ex_child=600;
Mich_rate=0.0435;
Mich_cr_r1=0.2;
Mich_cr_r2=0.1;
Mich_cr_r3=0.05;
Mich_cr_lim1=100;
Mich_cr_lim2=150;
Mich_cr_max=10000; 
end