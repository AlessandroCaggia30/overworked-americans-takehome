

% Parameter Assignment for year 1985 France.

function[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,child_ben1,child_ben2,child_ben3,child_ben4,child_ben_extra,tax_limit,tax_red] = fr_parameters_1985

%Social Security Parameters
pension_r=0.057;
penex_r=0.0184;
penwidow_r=0.001;

ssc_ceil=106740;
sick_r=0.055;
unemp_r1=0.02052;


%  Allowances
workall_min=1800;
workall_r=0.1;
basicall_r=0.2;
 
 %Tax Schedule Parameters
taxbracket1=15650;
taxbracket2=16360;
taxbracket3=19400;
taxbracket4=30680;
taxbracket5=39440;
taxbracket6=49550;
taxbracket7=59950;
taxbracket8=69170;
taxbracket9=115250;
taxbracket10=158510;
taxbracket11=187490;
taxbracket12=213280;
taxbracket13=241740;

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

tax_limit=22730;
tax_red=0.08;

%Child benefit
child_ben1=6228;
child_ben2=14014;
child_ben3=21800;
child_ben4=29586;
child_ben_extra=7786;


end