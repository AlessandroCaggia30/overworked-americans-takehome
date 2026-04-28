

% Parameter Assignment for year 1985 Portugal.

function[ssc_r,perc,max_all,single_all,married_all,child_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,singtb1,singtb2,singtb3,singtb4,singtb5,singtb6,singtb7,singtb8,singtb9,singtb10,singtb11,sint_r1,sint_r2,sint_r3,sint_r4,sint_r5,sint_r6,sint_r7,sint_r8,sint_r9,sint_r10,sint_r11,sint_r12,martb1,martb2,martb3,martb4,martb5,martb6,martb7,martb8,martb9,martb10,martb11,mart_r1,mart_r2,mart_r3,mart_r4,mart_r5,mart_r6,mart_r7,mart_r8,mart_r9,mart_r10,mart_r11,mart_r12,child_ben,taxbracket11, tax_r12, child_ben3, child_ben4,ssc_emp_r] = pt_parameters_1985


% Social Security Parameters
ssc_r=0.115; % 8% +3.5% unemployment
ssc_emp_r=0.255; %21.5+4%

%   Allowances
perc=0.3;
max_all=105000;
single_all=180000; %Here I use the number from the OECD table for a single person with average income, rather than the number from the OECD documentation
married_all=360000;
child_all=40000;  

 %Tax Schedule Parameters
taxbracket1=268800;
taxbracket2=350000;
taxbracket3=400000;
taxbracket4=450000;
taxbracket5=580000;
taxbracket6=780000;
taxbracket7=970000;
taxbracket8=1170000;
taxbracket9=1360000;
taxbracket10=1560000;
taxbracket11=1750000;

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
singtb2=270000;
singtb3=520000;
singtb4=870000;
singtb5=1210000;
singtb6=1560000;
singtb7=2240000;
singtb8=2960000;
singtb9=3650000;
singtb10=4400000;
singtb11=5000000;


sint_r1=0;
sint_r2=0.048;
sint_r3=0.072;
sint_r4=0.096;
sint_r5=0.144;
sint_r6=0.216;
sint_r7=0.288;
sint_r8=0.36;
sint_r9=0.432;
sint_r10=0.504;
sint_r11=0.576;
sint_r12=0.6;

martb1=0;
martb2=320000;
martb3=630000;
martb4=1040000;
martb5=1550000;
martb6=1900000;
martb7=2700000;
martb8=3530000;
martb9=4450000;
martb10=5250000;
martb11=6050000;

mart_r1=0;
mart_r2=0.04;
mart_r3=0.06;
mart_r4=0.08;
mart_r5=0.12;
mart_r6=0.18;
mart_r7=0.24;
mart_r8=0.3;
mart_r9=0.36;
mart_r10=0.42;
mart_r11=0.48;
mart_r12=0.5;



%Child benefit
child_ben=660*12;
child_ben3=780*12;
child_ben4=900*12;

end