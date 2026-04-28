

% Parameter Assignment for year 2006.

function[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,chcrd_max,chcrd_rdn,chcrd_thrsh_oth,chcrd_thrsh_m,chcrd_ref_perct,chcrd_ref_thresh,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,unemp_r,unemp_max,ded_unit] = us_parameters_2006

%Social Security Parameters
pen_fixed=0.0145;
pen_var=0.062;
pen_limit=94200;

unemp_r=0.008;
unemp_max=7000;

%Tax Allowance Parameters
married_all=10300;
hh_all=7550;
single_all=5150;
pers_exem=3300;
dep_exemption=3300;
ded_rate=0.0133;
exemlim_s=150500;
exemlim_hh=188150;
exemlim_m=225750;
ded_unit=2500;


 %Tax Schedule Parameters
taxbracket_s1=7550;
taxbracket_s2=30650;
taxbracket_s3=74200;
taxbracket_s4=154800;
taxbracket_s5=336500;

taxbracket_hh1=10750;
taxbracket_hh2=41050;
taxbracket_hh3=106000;
taxbracket_hh4=171650;
taxbracket_hh5=336550;

taxbracket_m1=15100;
taxbracket_m2=61300;
taxbracket_m3=123700;
taxbracket_m4=188450;
taxbracket_m5=336550;

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
inclim0=5380;
inclim1=8080;
inclim2=11340;
threshold_s0=6740;
threshold_s1=14810;
threshold_s2=14810;
threshold_m0=8740;
threshold_m1=16810;
threshold_m2=16810;
phaseout0=0.0765;
phaseout1=0.1598;
phaseout2=0.2106;

chcrd_max=1000;
chcrd_rdn=50;
chcrd_thrsh_oth=75000;
chcrd_thrsh_m=110000;
chcrd_ref_perct=0.15;
chcrd_ref_thresh=11300;

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