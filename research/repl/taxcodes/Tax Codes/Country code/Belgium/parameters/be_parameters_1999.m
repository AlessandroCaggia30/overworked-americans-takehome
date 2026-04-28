

% Parameter Assignment for year 1999 Belgium.

function[ssc_r,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,surtax_lim1,surtax_lim2,surtax_r1,surtax_r2,surtax_rtph,cb_1,cb_2,cb_3,ssc_empr_r1,ssc_empr_r2,ssc_empr_r3,ssc_empr_r4,ssc_empr_r5,socsec_empr_lim1,socsec_empr_lim2,socsec_empr_lim3,socsec_empr_lim4] = be_parameters_1999

% %Social Security Contribution Parameters
ssc_r=0.1307;


%Employer Social Security Contribution Parameters
ssc_empr_r1=0.1857;
ssc_empr_r2=0.2348;
ssc_empr_r3=0.2840;
ssc_empr_r4=0.3138;
ssc_empr_r5=0.3482;
socsec_empr_lim1=524425;
socsec_empr_lim2=565766;
socsec_empr_lim3=607101;
socsec_empr_lim4=744640;


% %Tax Allowance Parameters
workall_max=111000;
workall_lim1=167000;
workall_lim2=333000;
workall_lim3=555000;
workall_r1=0.2;
workall_r2=0.1;
workall_r3=0.05;
workall_r4=0.03;
% 
% %Special Socsec
sscspec_lim1=750000;
sscspec_lim2=850000;
sscspec_lim3=2426924;
sscspec_r1=0.09;
sscspec_r2=0.013;
% 
% %Income Tax Parameters
taxbracket1=255000;
taxbracket2=339000;
taxbracket3=483000;
taxbracket4=1110000;
taxbracket5=1665000;
taxbracket6=2443000;
tax_r1=0.25;
tax_r2=0.3;
tax_r3=0.4;
tax_r4=0.45;
tax_r5=0.5;
tax_r6=0.53;
tax_r7=0.55;

quote_r=0.3;
quote_max=300000;
 
% %Tax Credits
child_cr1=44000;
child_cr2=113000;
child_cr3=255000;
child_cr4=412000;
child_cr5=569000;
s_parent_cr=44000;
single_cr=208000;
married_cr=165000;
% 
% %Local Tax
local_r=0.07;
 
% %Surtax
surtax_lim1=800000;
surtax_lim2=850000;
surtax_r1=0.02;
surtax_r2=0.03;
surtax_rtph=0.0000002; 

% Child Benefit
cb_1=44190;
cb_2=72078;
cb_3=102000;

end