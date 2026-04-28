

% Parameter Assignment for year 2002.

function[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,chcrd_max,chcrd_rdn,chcrd_thrsh_oth,chcrd_thrsh_m,chcrd_ref_perct,chcrd_ref_thresh,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,ded_unit] = us_parameters_2002

%Social Security Parameters
pen_fixed=0.0145;
pen_var=0.062;
pen_limit=84900;

%Tax Allowance Parameters
married_all=7850;
hh_all=6900;
single_all=4700;
pers_exem=3000;
dep_exemption=3000;
ded_rate=0.02;
exemlim_s=137300;
exemlim_hh=171650;
exemlim_m=206000;
ded_unit=2500;


 %Tax Schedule Parameters
taxbracket_s1=6000;
taxbracket_s2=27950;
taxbracket_s3=67700;
taxbracket_s4=141250;
taxbracket_s5=307050;

taxbracket_hh1=10000;
taxbracket_hh2=37450;
taxbracket_hh3=96700;
taxbracket_hh4=156600;
taxbracket_hh5=307050;

taxbracket_m1=12000;
taxbracket_m2=46700;
taxbracket_m3=112850;
taxbracket_m4=171950;
taxbracket_m5=307050;

tax_r1=0.1;
tax_r2=0.15;
tax_r3=0.27;
tax_r4=0.3;
tax_r5=0.35;
tax_r6=0.386;

%Tax Credit Parameters
r0=0.0765;
r1=0.34;
r2=0.4;
inclim0=4910;
inclim1=7370;
inclim2=10350;
threshold_s0=6150;
threshold_s1=13520;
threshold_s2=13520;
threshold_m0=7150;
threshold_m1=14520;
threshold_m2=14520;
phaseout0=0.0765;
phaseout1=0.1598;
phaseout2=0.2106;

chcrd_max=600;
chcrd_rdn=50;
chcrd_thrsh_oth=75000;
chcrd_thrsh_m=110000;
chcrd_ref_perct=0.1;
chcrd_ref_thresh=10350;

%Local Tax Parameters
Detroit_ex=750;
Detroit_rate=0.0265;
Mich_ex=3000;
Mich_ex_child=0;
Mich_rate=0.041;
Mich_cr_r1=0.2;
Mich_cr_r2=0.1;
Mich_cr_r3=0.05;
Mich_cr_lim1=100;
Mich_cr_lim2=150;
Mich_cr_max=10000;



 
end