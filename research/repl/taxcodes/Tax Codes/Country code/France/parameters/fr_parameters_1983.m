

% Parameter Assignment for year 1983 France.

function[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_r,basicall_r,basic_max,workall_max,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,child_ben1,child_ben2,child_ben3,child_ben4,child_ben_extra,tax_limit,tax_limit2,tax_limit3,tax_adj,tax_inc,tax_inc2,tax_min] = fr_parameters_1983

%Social Security Parameters
pension_r=0.047;
penex_r=0.0184;
penwidow_r=0.001;

ssc_ceil=91680;
sick_r=0.055;
unemp_r1=0.0172; 
unemp_r2=0.00024;

%  Allowances
workall_min=1800;
workall_r=0.1;
workall_max=50900;
basicall_r=0.2;
basic_max=92000;
 
 %Tax Schedule Parameters
taxbracket1=13770;
taxbracket2=14390;
taxbracket3=17070;
taxbracket4=26990;
taxbracket5=34700;
taxbracket6=43610;
taxbracket7=52760;
taxbracket8=60870;
taxbracket9=101430;
taxbracket10=139500;
taxbracket11=165010;
taxbracket12=187700;
taxbracket13=212750;

tax_r1=0;
tax_r2=0.05;
tax_r3=0.1;
tax_r4=0.15;
tax_r5=0.2;
tax_r6=0.25;
tax_r7=0.3;
tax_r8=0.35;
tax_r9=0.4;
tax_r10=0.45;
tax_r11=0.5;
tax_r12=0.55;
tax_r13=0.6;
tax_r14=0.65;

tax_limit=20000;
tax_limit2=25000;
tax_limit3=30000;
tax_adj=1250;
tax_inc=0.05;
tax_inc2=0.08;
tax_min=295;

%Child benefit
child_ben1=5570;
child_ben2=12532;
child_ben3=19581;
child_ben4=26457;
child_ben_extra=6962;


end