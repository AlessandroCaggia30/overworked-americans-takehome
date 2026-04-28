

% Parameter Assignment for year 1990 Belgium.

function[ssc_r,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,tax_r,local_r,cb_1,cb_2,cb_3,ssc_empr_r] = be_parameters_1990

 %Social Security Contribution Parameters
ssc_r=0.1207;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.2618;
% 
% % %Tax Allowance Parameters
workall_max=103000;
workall_lim1=155000;
workall_lim2=309000;
workall_lim3=516000;
workall_r1=0.2;
workall_r2=0.1;
workall_r3=0.05;
workall_r4=0.03;

 %Special Socsec
sscspec_lim1=0;
sscspec_lim2=0;
sscspec_lim3=0;
sscspec_r1=0;
sscspec_r2=0;

%Income Tax Parameters
taxbracket1=237000;
taxbracket2=314000;
taxbracket3=449000;
taxbracket4=1031000;
taxbracket5=1547000;
taxbracket6=2268000;
tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;
tax_r6=0.525;
tax_r7=0.55;
 
quote_r=0.3;
quote_max=278000;
  
 %Tax Credits
 child_cr1=36000;
 child_cr2=93000;
child_cr3=209500;
child_cr4=338500;
child_cr5=467500;
s_parent_cr=36000;
single_cr=170000;
married_cr=134000;

tax_r=1; % No extra crisis tax 

%Local Tax
local_r=0.07;
  

% Child Benefit
cb_1=38856;
cb_2=63372;
cb_3=89676;

end