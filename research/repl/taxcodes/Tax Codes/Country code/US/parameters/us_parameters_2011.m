

% Parameter Assignment for year 2011

function[single_all,hh_all,married_all,dep_exemption,pers_exem,pen_fixed,pens_rate_er,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,chcrd_max,chcrd_rdn,chcrd_thrsh_oth,chcrd_thrsh_m,chcrd_ref_perct,chcrd_ref_thresh,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,unemp_r,unemp_max,unemp_dedn_rate,mich_unemp_rate,mich_unemp_max,r3,inclim3,threshold_s3,threshold_m3,phaseout3,pens_rate_ee,Mich_eic_r] = us_parameters_2011

%Social Security Parameters
pen_fixed=0.0145; 
pens_rate_er=0.062; 
pens_rate_ee=0.042;
pen_limit=106800;

unemp_r=0.062;
unemp_max=7000;
unemp_dedn_rate=0.054;
mich_unemp_rate=0.049;
mich_unemp_max=9000;

%Tax Allowance Parameters
married_all=11600;
hh_all=8500;
single_all=5800;
pers_exem=3700;
dep_exemption=3700;

 %Tax Schedule Parameters
taxbracket_s1=8500;
taxbracket_s2=34500;
taxbracket_s3=83600;
taxbracket_s4=174400;
taxbracket_s5=379150;

taxbracket_m1=17000;
taxbracket_m2=69000;
taxbracket_m3=139350;
taxbracket_m4=212300;
taxbracket_m5=379150;

taxbracket_hh1=12150;
taxbracket_hh2=46250;
taxbracket_hh3=119400;
taxbracket_hh4=193350;
taxbracket_hh5=379150;

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
inclim0=6070;
inclim1=9100;
inclim2=12780;
inclim3=12780;
threshold_s0=7590;
threshold_s1=16690;
threshold_s2=16690;
threshold_s3=16690;
threshold_m0=12670;
threshold_m1=21770;
threshold_m2=21770;
threshold_m3=21770;
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
Detroit_rate=0.025;
Mich_ex=3700;
Mich_ex_child=600;
Mich_rate=0.0435;
Mich_cr_r1=0.2;
Mich_cr_r2=0.1;
Mich_cr_r3=0.05;
Mich_cr_lim1=100;
Mich_cr_lim2=150;
Mich_cr_max=10000; 
Mich_eic_r=0.2;
end