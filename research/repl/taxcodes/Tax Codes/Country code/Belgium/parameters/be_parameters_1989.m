

% Parameter Assignment for year 1989 Belgium.

function[ssc_r,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,tax_r,local_r,cb_1,cb_2,cb_3,ssc_empr_r] = be_parameters_1989
        
 %Social Security Contribution Parameters
ssc_r=0.1207;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.2623;

% 
% % %Tax Allowance Parameters
workall_max=100000;
workall_lim1=150000;
workall_lim2=300000;
workall_lim3=500000;
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
taxbracket1=230000;
taxbracket2=305000;
taxbracket3=435000;
taxbracket4=1000000;
taxbracket5=1500000;
taxbracket6=2200000;
tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;
tax_r6=0.525;
tax_r7=0.55;
 
quote_r=0.3;
quote_max=270000;
  
 %Tax Credits
 child_cr1=35000;
 child_cr2=90000;
child_cr3=202500;
child_cr4=327500;
child_cr5=452500;
s_parent_cr=35000;
single_cr=165000;
married_cr=130000;

tax_r=1; % No extra crisis tax 

%Local Tax
local_r=0.07;
  

% Child Benefit
cb_1=37356;
cb_2=60924;
cb_3=86196;

end