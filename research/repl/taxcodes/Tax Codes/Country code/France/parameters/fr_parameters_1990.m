

% Parameter Assignment for year 1990 France.

function[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,child_ben1,child_ben2,socexcep_r,socexcep_limit,tax_limit,tax_red] = fr_parameters_1990

%Social Security Parameters
pension_r=0.076;
penex_r=0.0192;
penwidow_r=0.001;

ssc_ceil=131040;
sick_r=0.059;
unemp_r1=0.0247;
unemp_r2=0.005;

%  Allowances
workall_min=1800;
workall_r=0.1;
basicall_r=0.2;
 
 %Tax Schedule Parameters
taxbracket1=18140;
taxbracket2=18960;
taxbracket3=22470;
taxbracket4=35520;
taxbracket5=45660;
taxbracket6=57320;
taxbracket7=69370;
taxbracket8=80030;
taxbracket9=133340;
taxbracket10=183200;
taxbracket11=216940;
taxbracket12=246770;


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

tax_limit=25480;
tax_red=0.11;

%Child benefit
child_ben1=7146;
child_ben2=9155;
 
socexcep_r=0.004;
socexcep_limit=1550;
end