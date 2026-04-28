

% Parameter Assignment for year 1986 Portugal.

function[ssc_r,perc,max_all,single_all,married_all,child_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,singtb1,singtb2,singtb3,singtb4,singtb5,singtb6,singtb7,singtb8,singtb9,singtb10,singtb11,sint_r1,sint_r2,sint_r3,sint_r4,sint_r5,sint_r6,sint_r7,sint_r8,sint_r9,sint_r10,sint_r11,sint_r12,martb1,martb2,martb3,martb4,martb5,martb6,martb7,martb8,martb9,martb10,martb11,mart_r1,mart_r2,mart_r3,mart_r4,mart_r5,mart_r6,mart_r7,mart_r8,mart_r9,mart_r10,mart_r11,mart_r12,child_ben,ssc_emp_r] = pt_parameters_1986

%Social Security Parameters
ssc_r=0.11375; %(0.115*9 + 0.11*3)/12
ssc_emp_r=0.2525; %(0.255*9+0.245*3)/12

 %  Allowances
perc=0.3;
max_all=115000;
single_all=200000;
married_all=390000;
child_all=50000;  

%  %Tax Schedule Parameters
taxbracket1=350000;
taxbracket2=460000;
taxbracket3=510000;
taxbracket4=660000;
taxbracket5=890000;
taxbracket6=1100000;
taxbracket7=1330000;
taxbracket8=1560000;
taxbracket9=1770000;
taxbracket10=2000000;

tax_r1=0;
tax_r2=0.025;
tax_r3=0.045;
tax_r4=0.065;
tax_r5=0.085;
tax_r6=0.105;
tax_r7=0.125;
tax_r8=0.145;
tax_r9=0.165;
tax_r10=0.185;
tax_r11=0.205;

singtb1=0;
singtb2=295000;
singtb3=570000;
singtb4=950000;
singtb5=1320000;
singtb6=1700000;
singtb7=2440000;
singtb8=3230000;
singtb9=3980000;
singtb10=4800000;
singtb11=5450000;


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
martb2=350000;
martb3=690000;
martb4=1140000;
martb5=1700000;
martb6=2070000;
martb7=2950000;
martb8=3850000;
martb9=4850000;
martb10=5720000;
martb11=6590000;

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



% %Child benefit
child_ben=1000*12;

 
end