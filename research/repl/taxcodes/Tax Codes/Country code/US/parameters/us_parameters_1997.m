

% Parameter Assignment for year 1997.

function[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,ded_unit] = us_parameters_1997

%Social Security Parameters
pen_fixed=0.0145;
pen_var=0.062;
pen_limit=65400;

%Tax Allowance Parameters
married_all=6900;
hh_all=6050;
single_all=4150;
pers_exem=2650;
dep_exemption=2650;
ded_rate=0.02;
exemlim_s=121200;
exemlim_hh=151500;
exemlim_m=181800;
ded_unit=2650;


 %Tax Schedule Parameters
taxbracket_s1=0;
taxbracket_s2=24650;
taxbracket_s3=59750;
taxbracket_s4=124650;
taxbracket_s5=271050;

taxbracket_hh1=0;
taxbracket_hh2=33050;
taxbracket_hh3=85350;
taxbracket_hh4=138200;
taxbracket_hh5=271050;

taxbracket_m1=0;
taxbracket_m2=41200;
taxbracket_m3=99600;
taxbracket_m4=151750;
taxbracket_m5=271050;

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
inclim0=4340;
inclim1=6500;
inclim2=9140;
threshold_s0=5450;
threshold_s1=11950;
threshold_s2=11950;
threshold_m0=5450;
threshold_m1=11950;
threshold_m2=11950;
phaseout0=0.0765;
phaseout1=0.1598;
phaseout2=0.2106;




%Local Tax Parameters
Detroit_ex=600;
Detroit_rate=0.03;
Mich_ex=2500;
Mich_ex_child=0;
Mich_rate=0.044;
Mich_cr_r1=0.2;
Mich_cr_r2=0.1;
Mich_cr_r3=0.05;
Mich_cr_lim1=100;
Mich_cr_lim2=150;
Mich_cr_max=10000;



 
end