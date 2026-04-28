

% Parameter Assignment for year 1984 France.

function[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,child_ben1,child_ben2,child_ben3,child_ben4,child_ben_extra,tax_limit,tax_red,tax_min] = fr_parameters_1984

%Social Security Parameters
pension_r=0.057;
penex_r=0.0184;
penwidow_r=0.001;

ssc_ceil=99600;
sick_r=0.055;
unemp_r1=0.0172; 

%  Allowances
workall_min=1800;
workall_r=0.1;
basicall_r=0.2;
 
 %Tax Schedule Parameters
taxbracket1=14820;
taxbracket2=15490;
taxbracket3=18370;
taxbracket4=29050;
taxbracket5=37340;
taxbracket6=46920;
taxbracket7=56770;
taxbracket8=65500;
taxbracket9=109140;
taxbracket10=150100;
taxbracket11=177550;
taxbracket12=201970;
taxbracket13=228920;

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

tax_limit=21520;
tax_red=0.05;
tax_min=320;

%Child benefit
child_ben1=5881;
child_ben2=13232;
child_ben3=20676;
child_ben4=27935;
child_ben_extra=7351;


end