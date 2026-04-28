

% Parameter Assignment for year 1998 Belgium.

function[ssc_r,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,tax_r,local_r,cb_1,cb_2,cb_3,ssc_empr_r1,ssc_empr_r2,ssc_empr_r3,ssc_empr_r4,ssc_empr_r5,socsec_empr_lim1,socsec_empr_lim2,socsec_empr_lim3,socsec_empr_lim4] = be_parameters_1998

 %Social Security Contribution Parameters
ssc_r=0.1307;

%Employer Social Security Contribution Parameters
ssc_empr_r1=0.1857;
ssc_empr_r2=0.2348;
ssc_empr_r3=0.2840;
ssc_empr_r4=0.3138;
ssc_empr_r5=0.3496;
socsec_empr_lim1=524425;
socsec_empr_lim2=565765;
socsec_empr_lim3=607105;
socsec_empr_lim4=744637;

% 
% % %Tax Allowance Parameters
workall_max=111000;
workall_lim1=165000;
workall_lim2=330000;
workall_lim3=550000;
workall_r1=0.2;
workall_r2=0.1;
workall_r3=0.05;
workall_r4=0.03;

 %Special Socsec
sscspec_lim1=750000;
sscspec_lim2=850000;
sscspec_lim3=2426924;
sscspec_r1=0.09;
sscspec_r2=0.013;

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
tax_r6=0.53;
tax_r7=0.55;
 
quote_r=0.3;
quote_max=297000;
%  
 %Tax Credits
 child_cr1=44000;
 child_cr2=112000;
child_cr3=253000;
child_cr4=408000;
child_cr5=564000;
 s_parent_cr=44000;
single_cr=206000;
married_cr=162000;

tax_r=1.03;
%Local Tax
local_r=0.07;
  


% Child Benefit
cb_1=43752;
cb_2=71364;
cb_3=100992;

end