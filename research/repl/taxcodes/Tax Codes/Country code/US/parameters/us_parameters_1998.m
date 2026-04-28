

% Parameter Assignment for year 1998.

function[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,ded_unit] = us_parameters_1998

%Social Security Parameters
pen_fixed=0.0145;
pen_var=0.062;
pen_limit=68400;

%Tax Allowance Parameters
married_all=7100;
hh_all=6250;
single_all=4250;
pers_exem=2700;
dep_exemption=2700;
ded_rate=0.02;
exemlim_s=124500;
exemlim_hh=155650;
exemlim_m=186800;
ded_unit=2500;


 %Tax Schedule Parameters
taxbracket_s1=0;
taxbracket_s2=25350;
taxbracket_s3=61400;
taxbracket_s4=128100;
taxbracket_s5=278450;

taxbracket_hh1=0;
taxbracket_hh2=33950;
taxbracket_hh3=87700;
taxbracket_hh4=142000;
taxbracket_hh5=278450;

taxbracket_m1=0;
taxbracket_m2=42350;
taxbracket_m3=102300;
taxbracket_m4=155590;
taxbracket_m5=278450;

tax_r1=0;
tax_r2=0.15;
tax_r3=0.28;
tax_r4=0.31;
tax_r5=0.36;
tax_r6=0.396;

%Tax Credit Parameters
r0=0.0765;
r1=0.34;
r2=0.4;
inclim0=4460;
inclim1=6680;
inclim2=9390;
threshold_s0=5770;
threshold_s1=12260;
threshold_s2=12260;
threshold_m0=5770;
threshold_m1=12260;
threshold_m2=12260;
phaseout0=0.0765;
phaseout1=0.1598;
phaseout2=0.2106;




%Local Tax Parameters
Detroit_ex=750;
Detroit_rate=0.03;
Mich_ex=2800;
Mich_ex_child=0;
Mich_rate=0.044;
Mich_cr_r1=0.2;
Mich_cr_r2=0.1;
Mich_cr_r3=0.05;
Mich_cr_lim1=100;
Mich_cr_lim2=150;
Mich_cr_max=10000;



 
end