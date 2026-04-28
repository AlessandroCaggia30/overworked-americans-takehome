

% Parameter Assignment for year 1988.

function[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max] = us_parameters_1988

%Social Security Parameters
pen_fixed=0;
pen_var=0.0751;
pen_limit=45000;

%Tax Allowance Parameters
married_all=5000;
hh_all=3000;
single_all=3000;
pers_exem=1950;
dep_exemption=1950;

ded_rate=0;  %not used
exemlim_s=0;
exemlim_hh=0;
exemlim_m=0;



 %Tax Schedule Parameters
taxbracket_s1=0;
taxbracket_s2=0;
taxbracket_s3=0;
taxbracket_s4=0;
taxbracket_s5=17850;

taxbracket_hh1=0;
taxbracket_hh2=0;
taxbracket_hh3=0;
taxbracket_hh4=0;
taxbracket_hh5=29750;

taxbracket_m1=0;
taxbracket_m2=0;
taxbracket_m3=0;
taxbracket_m4=0;
taxbracket_m5=29750;

tax_r1=0;
tax_r2=0;
tax_r3=0;
tax_r4=0;
tax_r5=0.15;
tax_r6=0.28;

%Tax Credit Parameters
r0=0.05; %Extra credit
r1=0.14;
r2=0.14;
inclim0=0;
inclim1=6240;
inclim2=6240;
threshold_s0=0;
threshold_s1=9840;
threshold_s2=9840;
threshold_m0=0;
threshold_m1=9840;
threshold_m2=9840;
phaseout0=0;
phaseout1=0.1;
phaseout2=0.1;




%Local Tax Parameters-missing info fromm 1993 backwards
Detroit_ex=600;
Detroit_rate=0.03;
Mich_ex=1800;
Mich_ex_child=0;
Mich_rate=0.046;
Mich_cr_r1=0.2;
Mich_cr_r2=0.1;
Mich_cr_r3=0.05;
Mich_cr_lim1=100;
Mich_cr_lim2=150;
Mich_cr_max=10000;



 
end