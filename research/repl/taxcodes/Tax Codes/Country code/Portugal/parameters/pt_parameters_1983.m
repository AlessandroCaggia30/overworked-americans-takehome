

% Parameter Assignment for year 1983 Portugal.

function[ssc_r,perc,max_all,single_all,married_all,child_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,singtb1,singtb2,singtb3,singtb4,singtb5,singtb6,singtb7,singtb8,singtb9,singtb10,singtb11,sint_r1,sint_r2,sint_r3,sint_r4,sint_r5,sint_r6,sint_r7,sint_r8,sint_r9,sint_r10,sint_r11,sint_r12,martb1,martb2,martb3,martb4,martb5,martb6,martb7,martb8,martb9,martb10,martb11,mart_r1,mart_r2,mart_r3,mart_r4,mart_r5,mart_r6,mart_r7,mart_r8,mart_r9,mart_r10,mart_r11,mart_r12,child_ben,taxbracket11, tax_r12, child_ben3, child_ben4,ssc_emp_r] = pt_parameters_1983


%   Social Security Parameters
ssc_r=0.115; % 8% +3.5% unemployment
ssc_emp_r=0.255;

%   Allowances
perc=0.3;
max_all=50000;
single_all=120000; 
married_all=240000;
child_all=25000;  

 %Tax Schedule Parameters
taxbracket1=182000;
taxbracket2=210000;
taxbracket3=250000;
taxbracket4=300000;
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
singtb2=180000;
singtb3=360000;
singtb4=600000;
singtb5=840000;
singtb6=1080000;
singtb7=1580000;
singtb8=2080000;
singtb9=2580000;
singtb10=3080000;
singtb11=3580000;


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
sint_r11=0.72;
sint_r12=0.8;

martb1=0;
martb2=220000;
martb3=440000;
martb4=720000;
martb5=1080000;
martb6=1300000;
martb7=1900000;
martb8=2500000;
martb9=3100000;
martb10=3700000;
martb11=4300000;

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
mart_r11=0.6;
mart_r12=0.7;


%Child benefit
child_ben=550*12;
child_ben3=650*12;
child_ben4=750*12;

end