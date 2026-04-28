

% Parameter Assignment for year 1987.

function[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max] = us_parameters_1987

%Social Security Parameters
pen_fixed=0;
pen_var=0.0715;
pen_limit=43800;

%Tax Allowance Parameters
married_all=3760;
hh_all=2540;
single_all=2540;
pers_exem=1900;
dep_exemption=1900;

ded_rate=0;  %not used
exemlim_s=0;
exemlim_hh=0;
exemlim_m=0;



 %Tax Schedule Parameters
taxbracket_s1=0;
taxbracket_s2=1800;
taxbracket_s3=16800;
taxbracket_s4=27000;
taxbracket_s5=54000;

taxbracket_hh1=0;
taxbracket_hh2=3000;
taxbracket_hh3=28000;
taxbracket_hh4=45000;
taxbracket_hh5=90000;

taxbracket_m1=0;
taxbracket_m2=3000;
taxbracket_m3=28000;
taxbracket_m4=45000;
taxbracket_m5=90000;

tax_r1=0;
tax_r2=0.11;
tax_r3=0.15;
tax_r4=0.28;
tax_r5=0.35;
tax_r6=0.385;

%Tax Credit Parameters
r0=0.05; %Extra credit
r1=0.14;
r2=0.14;
inclim0=0;
inclim1=6080;
inclim2=6080;
threshold_s0=0;
threshold_s1=6920;
threshold_s2=6920;
threshold_m0=0;
threshold_m1=6920;
threshold_m2=6920;
phaseout0=0;
phaseout1=0.1;
phaseout2=0.1;




%Local Tax Parameters-missing info fromm 1993 backwards
Detroit_ex=600;
Detroit_rate=0.03;
Mich_ex=1500;
Mich_ex_child=0;
Mich_rate=0.0635;
Mich_cr_r1=0.2;
Mich_cr_r2=0.075;
Mich_cr_r3=0.05;
Mich_cr_lim1=100;
Mich_cr_lim2=200;
Mich_cr_max=10000;
 
end