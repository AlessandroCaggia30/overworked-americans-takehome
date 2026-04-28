

% Parameter Assignment for year 1986 Belgium.

function[ssc_r,workall_max,workall_lim1,workall_lim2,workall_r1,workall_r2,workall_r3 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,max_rate,quote_r,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,cb_1,cb_2,cb_3,cb_4,cb_5,ssc_empr_r] = be_parameters_1986

 %Social Security Contribution Parameters
ssc_r=0.1209;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.4042;
 
% % %Tax Allowance Parameters
workall_max=125000;
workall_lim1=150000;
workall_lim2=300000;
workall_r1=0.2;
workall_r2=0.1;
workall_r3=0.05;




%Income Tax Parameters
taxbracket1=107000;
taxbracket2=204000;
taxbracket3=255000;
taxbracket4=306000;
taxbracket5=408000;
taxbracket6=510000;
taxbracket7=765000;
taxbracket8=1020000;
taxbracket9=1530000;
taxbracket10=2040000;
taxbracket11=3060000;
taxbracket12=4080000;

tax_r1=0;
tax_r2=0.242;
tax_r3=0.279;
tax_r4=0.358;
tax_r5=0.39823;
tax_r6=0.421;
tax_r7=0.456;
tax_r8=0.472;
tax_r9=0.522;
tax_r10=0.571;
tax_r11=0.626;
tax_r12=0.686;
tax_r13=0.716;

max_rate=0.671;
 
quote_r=0.73; 

  
 %Tax Credits
child_cr1=8000;
child_cr2=19500;
child_cr3=44000;
child_cr4=90000;
child_cr5=144000;
s_parent_cr=4618;

single_cr=0;
 married_cr=0;


%Local Tax
local_r=0.07;
  

% Child Benefit
cb_1=14*2051;
cb_2=14*3705;
cb_3=14*5197;
cb_4=14*5300;
cb_5=14*5339;
end