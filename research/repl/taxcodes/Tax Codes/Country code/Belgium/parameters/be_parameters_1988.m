

% Parameter Assignment for year 1988 Belgium.

function[ssc_r,workall_max,workall_lim1,workall_lim2,workall_r1,workall_r2,workall_r3 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,max_rate,quote_r,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,cb_1,cb_2,cb_3,ssc_empr_r] = be_parameters_1988

 %Social Security Contribution Parameters
ssc_r=0.1207;


%Employer Social Security Contribution Parameters
ssc_empr_r=0.4224;

% % %Tax Allowance Parameters
workall_max=100000;
workall_lim1=150000;
workall_lim2=300000;
workall_r1=0.2;
workall_r2=0.1;
workall_r3=0.05;




%Income Tax Parameters
taxbracket1=120000;
taxbracket2=209500;
taxbracket3=262000;
taxbracket4=317000;
taxbracket5=419000;
taxbracket6=524000;
taxbracket7=787000;
taxbracket8=1049000;
taxbracket9=1574000;
taxbracket10=2099000;
taxbracket11=3148000;
taxbracket12=4977000;

tax_r1=0;
tax_r2=0.24;
tax_r3=0.277;
tax_r4=0.358;
tax_r5=0.3944;
tax_r6=0.436;
tax_r7=0.45;
tax_r8=0.466;
tax_r9=0.516;
tax_r10=0.565;
tax_r11=0.619;
tax_r12=0.678;
tax_r13=0.708;

 max_rate=0.663;
 
quote_r=0.71;

  
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
cb_1=35892;
cb_2=58548;
cb_3=82848;

end