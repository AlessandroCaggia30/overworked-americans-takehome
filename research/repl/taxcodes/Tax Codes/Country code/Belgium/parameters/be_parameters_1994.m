

% Parameter Assignment for year 1994 Belgium.

function[ssc_r,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_lim4,sscspec_lim5, sscspec_m1 ,sscspec_m2, sscspec_m3, sscspec_m4,sscspec_m5, taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,tax_r,local_r,cb_1,cb_2,cb_3,ssc_empr_r] = be_parameters_1994

 %Social Security Contribution Parameters
ssc_r=0.1307;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.3478;


%Tax Allowance Parameters
workall_max=110000;
workall_lim1=165000;
workall_lim2=330000;
workall_lim3=550000;
workall_r1=0.2;
workall_r2=0.1;
workall_r3=0.05;
workall_r4=0.03;

 %Special Socsec
sscspec_lim1=750000;
sscspec_lim2=829000;
sscspec_lim3=1120000;
sscspec_lim4=1411000;
sscspec_lim5=2000000;
sscspec_m1=3150;
sscspec_m2=6750;
sscspec_m3=9000;
sscspec_m4=13500;
sscspec_m5=18000;

 %Income Tax Parameters
taxbracket1=253000;
taxbracket2=335000;
taxbracket3=478000;
taxbracket4=1100000;
taxbracket5=1650000;
taxbracket6=2420000;
tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;
tax_r6=0.525;
tax_r7=0.55;
 
quote_r=0.3;
quote_max=297000;

%Tax Credits
child_cr1=41000;
child_cr2=104000;
child_cr3=234000;
child_cr4=379000;
child_cr5=534000;
s_parent_cr=41000;
single_cr=191000;
married_cr=150000;

tax_r=1.03;

 %Local Tax
local_r=0.07;
  

% Child Benefit
cb_1=41301;
cb_2=67361;
cb_3=95319;

end