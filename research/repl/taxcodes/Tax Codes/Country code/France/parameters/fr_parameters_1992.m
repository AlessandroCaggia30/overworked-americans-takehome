

% Parameter Assignment for year 1992 France.

function[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_max,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,noded_r,child_ben1,child_ben2,tax_limit,tax_red] = fr_parameters_1992

%Social Security Parameters
pension_r=0.0655;
penex_r=0.02;
penwidow_r=0.001;

ssc_ceil=144120;
sick_r=0.068;
unemp_r1=0.0167;
unemp_r2=0.005;

%  Allowances
workall_min=2120;
workall_max=70900;
workall_r=0.1;
basicall_r=0.2;
 
 %Tax Schedule Parameters
taxbracket1=19220;
taxbracket2=20080;
taxbracket3=23800;
taxbracket4=37620;
taxbracket5=48350;
taxbracket6=60690;
taxbracket7=73450;
taxbracket8=84740;
taxbracket9=141190;
taxbracket10=194190;
taxbracket11=229710;
taxbracket12=261290;


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

tax_limit=26990;
tax_red=0.11;


noded_r=0.01045; %csg and crds rate that is not deducted(1.1% of 95%grosswage )


%Child benefit
child_ben1=7515;
child_ben2=9629;
 
end