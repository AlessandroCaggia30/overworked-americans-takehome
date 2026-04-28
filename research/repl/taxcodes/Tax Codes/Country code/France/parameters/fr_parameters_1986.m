

% Parameter Assignment for year 1986 France.

function[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,child_ben1,child_ben2,socexcep_r,socexcep_limit,tax_limit,tax_red] = fr_parameters_1986

%Social Security Parameters
pension_r=0.05992;
penex_r=0.0184;
penwidow_r=0.001;

ssc_ceil=106740;
sick_r=0.055;
unemp_r1=0.0231;


%  Allowances
workall_min=1800;
workall_r=0.1;
basicall_r=0.2;
 
 %Tax Schedule Parameters
taxbracket1=16030;
taxbracket2=17760;
taxbracket3=19870;
taxbracket4=31420;
taxbracket5=40390;
taxbracket6=50740;
taxbracket7=61390;
taxbracket8=70830;
taxbracket9=118020;
taxbracket10=162310;
taxbracket11=191990;
taxbracket12=218400;


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
tax_r13=0.58;

tax_limit=23280;
tax_red=0.11;

%Child benefit
child_ben1=6425;
child_ben2=8031;
 
socexcep_r=0.004;
socexcep_limit=1300;
end