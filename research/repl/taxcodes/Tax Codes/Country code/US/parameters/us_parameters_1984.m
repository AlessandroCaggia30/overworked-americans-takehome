

% Parameter Assignment for year 1984

function[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_s6,taxbracket_s7,taxbracket_s8,taxbracket_s9,taxbracket_s10,taxbracket_s11,taxbracket_s12,taxbracket_s13,taxbracket_s14,taxbracket_s15,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_hh6,taxbracket_hh7,taxbracket_hh8,taxbracket_hh9,taxbracket_hh10,taxbracket_hh11,taxbracket_hh12,taxbracket_hh13,taxbracket_hh14,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,taxbracket_m6,taxbracket_m7,taxbracket_m8,taxbracket_m9,taxbracket_m10,taxbracket_m11,taxbracket_m12,taxbracket_m13,taxbracket_m14,tax_r1_s,tax_r2_s,tax_r3_s,tax_r4_s,tax_r5_s,tax_r6_s,tax_r7_s,tax_r8_s,tax_r9_s,tax_r10_s,tax_r11_s,tax_r12_s,tax_r13_s,tax_r14_s,tax_r15_s,tax_r16_s,tax_r1_hh,tax_r2_hh,tax_r3_hh,tax_r4_hh,tax_r5_hh,tax_r6_hh,tax_r7_hh,tax_r8_hh,tax_r9_hh,tax_r10_hh,tax_r11_hh,tax_r12_hh,tax_r13_hh,tax_r14_hh,tax_r15_hh,tax_r1_m,tax_r2_m,tax_r3_m,tax_r4_m,tax_r5_m,tax_r6_m,tax_r7_m,tax_r8_m,tax_r9_m,tax_r10_m,tax_r11_m,tax_r12_m,tax_r13_m,tax_r14_m,tax_r15_m,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,unemp_lim_emp,unemp_r_emp] = us_parameters_1984

%Social Security Parameters
pen_fixed=0;
pen_var=0.067;
pen_limit=37800;

unemp_lim_emp=7000;
unemp_r_emp=0.035;
%Tax Allowance Parameters
% married_all=3400;
% hh_all=2300;
% single_all=2300;
% pers_exem=1000;
% dep_exemption=1000;

married_all=0;
hh_all=0;
single_all=0;
pers_exem=1000;
dep_exemption=1000;
 
ded_rate=0;  %not used
exemlim_s=0;
exemlim_hh=0;
exemlim_m=0;


%Tax Schedule Parameters
taxbracket_s1=2300;
taxbracket_s2=3400;
taxbracket_s3=4400;
taxbracket_s4=6500;
taxbracket_s5=8500;
taxbracket_s6=10800;
taxbracket_s7=12900;
taxbracket_s8=15000;
taxbracket_s9=18200;
taxbracket_s10=23500;
taxbracket_s11=28800;
taxbracket_s12=34100;
taxbracket_s13=41500;
taxbracket_s14=55300;
taxbracket_s15=81800;
 

taxbracket_hh1=2300;
taxbracket_hh2=4400;
taxbracket_hh3=6500;
taxbracket_hh4=8700;
taxbracket_hh5=11800;
taxbracket_hh6=15000;
taxbracket_hh7=18200;
taxbracket_hh8=23500;
taxbracket_hh9=28800;
taxbracket_hh10=34100;
taxbracket_hh11=44700;
taxbracket_hh12=60600;
taxbracket_hh13=81800;
taxbracket_hh14=108300;

taxbracket_m1=3400;
taxbracket_m2=5500;
taxbracket_m3=7600;
taxbracket_m4=11900;
taxbracket_m5=16000;
taxbracket_m6=20200;
taxbracket_m7=24600;
taxbracket_m8=29900;
taxbracket_m9=35200;
taxbracket_m10=45800;
taxbracket_m11=60000;
taxbracket_m12=85600;
taxbracket_m13=109400;
taxbracket_m14=162400;

tax_r1_s=0;
tax_r2_s=0.11;
tax_r3_s=0.12;
tax_r4_s=0.14;
tax_r5_s=0.15;
tax_r6_s=0.16;
tax_r7_s=0.18;
tax_r8_s=0.20;
tax_r9_s=0.23;
tax_r10_s=0.26;
tax_r11_s=0.30;
tax_r12_s=0.34;
tax_r13_s=0.38;
tax_r14_s=0.42;
tax_r15_s=0.48;
tax_r16_s=0.50;

tax_r1_hh=0;
tax_r2_hh=0.11;
tax_r3_hh=0.12;
tax_r4_hh=0.14;
tax_r5_hh=0.17;
tax_r6_hh=0.18;
tax_r7_hh=0.20;
tax_r8_hh=0.24;
tax_r9_hh=0.28;
tax_r10_hh=0.32;
tax_r11_hh=0.35;
tax_r12_hh=0.42;
tax_r13_hh=0.45;
tax_r14_hh=0.48;
tax_r15_hh=0.50;

tax_r1_m=0;
tax_r2_m=0.11;
tax_r3_m=0.12;
tax_r4_m=0.14;
tax_r5_m=0.16;
tax_r6_m=0.18;
tax_r7_m=0.22;
tax_r8_m=0.25;
tax_r9_m=0.28;
tax_r10_m=0.33;
tax_r11_m=0.38;
tax_r12_m=0.42;
tax_r13_m=0.45;
tax_r14_m=0.49;
tax_r15_m=0.50;

%Tax Credit Parameters
r0=0.00; %Extra credit
r1=0.10;
r2=0.10;
inclim0=0;
inclim1=5000;
inclim2=5000;
threshold_s0=0;
threshold_s1=6000;
threshold_s2=6000;
threshold_m0=0;
threshold_m1=6000;
threshold_m2=6000;
phaseout0=0;
phaseout1=0.125;
phaseout2=0.125;
 
%Local Tax Parameters-missing info from 1993 backwards
Detroit_ex=600;
Detroit_rate=0.03;
Mich_ex=1500;
Mich_ex_child=0; 
Mich_rate=0.0635; %does not correspond to documents from Michigan Department of Treasury
Mich_cr_r1=0.2;
Mich_cr_r2=0.075;
Mich_cr_r3=0.05;
Mich_cr_lim1=100;
Mich_cr_lim2=200;
Mich_cr_max=10000;
  
 end