

% Parameter Assignment for year 1988 France.

function[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,child_ben1,child_ben2,socexcep_r,socexcep_limit,tax_limit,tax_red] = fr_parameters_1988

%Social Security Parameters
pension_r=0.066;
penex_r=0.0192;
penwidow_r=0.001;

ssc_ceil=120360;
sick_r=0.059;
unemp_r1=0.0247;


%  Allowances
workall_min=1800;
workall_r=0.1;
basicall_r=0.2;
 
 %Tax Schedule Parameters
taxbracket1=17000;
taxbracket2=17780;
taxbracket3=21070;
taxbracket4=33310;
taxbracket5=42820;
taxbracket6=53770;
taxbracket7=65070;
taxbracket8=75070;
taxbracket9=125080;
taxbracket10=172030;
taxbracket11=203490;
taxbracket12=231480;


tax_r1=0;
tax_r2=0.05;
tax_r3=0.096;
tax_r4=0.144;
tax_r5=0.192;
tax_r6=0.24;
tax_r7=0.288;
tax_r8=0.336;
tax_r9=0.384;
tax_r10=0.432;
tax_r11=0.49;
tax_r12=0.539;
tax_r13=0.568;

tax_limit=23890;
tax_red=0.11;

%Child benefit
child_ben1=6750;
child_ben2=8648;
 
socexcep_r=0.004;
socexcep_limit=1500;
end