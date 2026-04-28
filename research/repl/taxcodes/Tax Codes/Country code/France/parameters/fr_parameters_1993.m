

% Parameter Assignment for year 1993 France.

function[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_max,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,noded_r,child_ben1,child_ben2] = fr_parameters_1993

%Social Security Parameters
pension_r=0.0655;
penex_r=0.02;
penwidow_r=0.001;

ssc_ceil=149820;
sick_r=0.068;
unemp_r1=0.0294;
unemp_r2=0.006;

%  Allowances
workall_min=2160;
workall_max=72250;
workall_r=0.1;
basicall_r=0.2;
 
 %Tax Schedule Parameters
taxbracket1=21900;
taxbracket2=47900;
taxbracket3=84300;
taxbracket4=136500;
taxbracket5=222100;
taxbracket6=273900;

tax_r1=0;
tax_r2=0.12;
tax_r3=0.25;
tax_r4=0.35;
tax_r5=0.45;
tax_r6=0.50;
tax_r7=0.568;

%tax_min=??; % for tax adjustment . Unknown for 1993 therefore excluded.
noded_r=0.016625; %csg and crds rate that is not deducted(1.1% of 95%grosswage until mid 1993, 2.4% of 95%grosswage after mid 1993)
%decote=4180; %for tax adjustment

%Child benefit
child_ben1=7735;
child_ben2=9911;
 
end