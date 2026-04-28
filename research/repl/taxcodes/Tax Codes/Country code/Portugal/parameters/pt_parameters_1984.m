

% Parameter Assignment for year 1984 Portugal.

function[ssc_r,perc,max_all,single_all,married_all,child_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,singtb1,singtb2,singtb3,singtb4,singtb5,singtb6,singtb7,singtb8,singtb9,singtb10,singtb11,sint_r1,sint_r2,sint_r3,sint_r4,sint_r5,sint_r6,sint_r7,sint_r8,sint_r9,sint_r10,sint_r11,sint_r12,martb1,martb2,martb3,martb4,martb5,martb6,martb7,martb8,martb9,martb10,martb11,mart_r1,mart_r2,mart_r3,mart_r4,mart_r5,mart_r6,mart_r7,mart_r8,mart_r9,mart_r10,mart_r11,mart_r12,child_ben,taxbracket11, tax_r12, child_ben3, child_ben4,ssc_emp_r] = pt_parameters_1984


%   Social Security Parameters
ssc_r=0.115; % 8% +3.5% unemployment
ssc_emp_r=0.255; %21.5+4%

%   Allowances
perc=0.3;
max_all=65000;
single_all=150000; 
married_all=300000;
child_all=30000;  

 %Tax Schedule Parameters
taxbracket1=218400;
taxbracket2=250000;
taxbracket3=300000;
taxbracket4=350000;
taxbracket5=450000;
taxbracket6=600000;
taxbracket7=750000;
taxbracket8=900000;
taxbracket9=1050000;
taxbracket10=1200000;
taxbracket11=1350000;

tax_r1=0;
tax_r2=0.02;
tax_r3=0.04;
tax_r4=0.06;
tax_r5=0.08;
tax_r6=0.10;
tax_r7=0.12;
tax_r8=0.14;
tax_r9=0.16;
tax_r10=0.18;
tax_r11=0.20;
tax_r12=0.22;

singtb1=0;
singtb2=230000;
singtb3=450000;
singtb4=750000;
singtb5=1050000;
singtb6=1350000;
singtb7=1950000;
singtb8=2600000;
singtb9=3200000;
singtb10=3850000;
singtb11=4450000;


sint_r1=0;
sint_r2=0.048;
sint_r3=0.072;
sint_r4=0.096;
sint_r5=0.144;
sint_r6=0.216;
sint_r7=0.312;
sint_r8=0.408;
sint_r9=0.504;
sint_r10=0.60;
sint_r11=0.648;
sint_r12=0.7;

martb1=0;
martb2=280000;
martb3=550000;
martb4=900000;
martb5=1350000;
martb6=1650000;
martb7=2350000;
martb8=3100000;
martb9=3900000;
martb10=4600000;
martb11=5300000;

mart_r1=0;
mart_r2=0.04;
mart_r3=0.06;
mart_r4=0.08;
mart_r5=0.12;
mart_r6=0.18;
mart_r7=0.26;
mart_r8=0.34;
mart_r9=0.42;
mart_r10=0.50;
mart_r11=0.54;
mart_r12=0.6;


%Child benefit
child_ben=660*12;
child_ben3=780*12;
child_ben4=900*12;

end