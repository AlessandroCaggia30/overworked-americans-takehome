

% Parameter Assignment for year 1988 Portugal.

function[ssc_r,perc,max_all,single_all,married_all,child_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,singtb1,singtb2,singtb3,singtb4,singtb5,singtb6,singtb7,singtb8,singtb9,singtb10,singtb11,sint_r1,sint_r2,sint_r3,sint_r4,sint_r5,sint_r6,sint_r7,sint_r8,sint_r9,sint_r10,sint_r11,sint_r12,martb1,martb2,martb3,martb4,martb5,martb6,martb7,martb8,martb9,martb10,martb11,mart_r1,mart_r2,mart_r3,mart_r4,mart_r5,mart_r6,mart_r7,mart_r8,mart_r9,mart_r10,mart_r11,mart_r12,child_ben,ssc_emp_r] = pt_parameters_1988

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.245;

 %  Allowances
perc=0.3;
max_all=115000;
single_all=200000;
married_all=390000;
child_all=50000;  

%  %Tax Schedule Parameters
taxbracket1=410000;
taxbracket2=530000;
taxbracket3=590000;
taxbracket4=765000;
taxbracket5=1030000;
taxbracket6=1270000;
taxbracket7=1540000;
taxbracket8=1800000;
taxbracket9=2045000;
taxbracket10=2310000;

tax_r1=0;
tax_r2=0.02;
tax_r3=0.04;
tax_r4=0.06;
tax_r5=0.08;
tax_r6=0.1;
tax_r7=0.12;
tax_r8=0.14;
tax_r9=0.16;
tax_r10=0.18;
tax_r11=0.2;

singtb1=250000;
singtb2=315000;
singtb3=610000;
singtb4=1015000;
singtb5=1415000;
singtb6=1820000;
singtb7=2620000;
singtb8=3465000;
singtb9=4260000;
singtb10=5135000;
singtb11=5830000;

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

martb1=350000;
martb2=365000;
martb3=740000;
martb4=1220000;
martb5=1820000;
martb6=2215000;
martb7=3160000;
martb8=4120000;
martb9=5190000;
martb10=6120000;
martb11=7050000;

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
child_ben=1250*12;

 
end