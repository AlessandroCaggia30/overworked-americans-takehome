

% Parameter Assignment for year 1984 Belgium.

function[ssc_r,workall_max,workall_lim1,workall_lim2,workall_r1,workall_r2,workall_r3 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,taxbracket14,taxbracket15,taxbracket16,taxbracket17,taxbracket18,taxbracket19,taxbracket20,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,tax_r15,tax_r16,tax_r17,tax_r18,tax_r19,tax_r20,tax_r21,quote_r,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,local_r,cb_1,cb_2,cb_3,cb_4,cb_5,ssc_empr_r] = be_parameters_1984

 %Social Security Contribution Parameters
ssc_r=0.1207;

%Employer Social Security Contribution Parameters
ssc_empr_r=0.3882;

% % %Tax Allowance Parameters
workall_max=10000000;% it`s not binding
workall_lim1=150000;
workall_lim2=300000;
workall_r1=0.2;
workall_r2=0.1;
workall_r3=0.05;

%Income Tax Parameters
taxbracket1=100000;
taxbracket2=152000;
taxbracket3=204000;
taxbracket4=224000;
taxbracket5=236500;
taxbracket6=248500;
taxbracket7=281000;
taxbracket8=291500;
taxbracket9=328000;
taxbracket10=364500;
taxbracket11=400000;
taxbracket12=500000;
taxbracket13=692000;
taxbracket14=750000;
taxbracket15=1000000;
taxbracket16=1500000;
taxbracket17=2000000;
taxbracket18=3000000;
taxbracket19=4000000;
taxbracket20=14194400;

tax_r1=0;
tax_r2=0.241;
tax_r3=0.245;
tax_r4=0.269;
tax_r5=0.28;
tax_r6=0.3;
tax_r7=0.3475;
tax_r8=0.37;
tax_r9=0.384;
tax_r10=0.403;
tax_r11=0.408;
tax_r12=0.415;
tax_r13=0.458;
tax_r14=0.459;
tax_r15=0.475;
tax_r16=0.525;
tax_r17=0.575;
tax_r18=0.63;
tax_r19=0.69;
tax_r20=0.72;
tax_r21=0.675;

quote_r=0.74;
  
 %Tax Credits
child_cr1=8000;
child_cr2=19500;
child_cr3=44000;
child_cr4=90000;
child_cr5=144000;

%Local Tax
local_r=0.07;
  
% Child Benefit
cb_1=14*2051;
cb_2=14*3795;
cb_3=14*5197;
cb_4=14*5300;
cb_5=14*5339;
end