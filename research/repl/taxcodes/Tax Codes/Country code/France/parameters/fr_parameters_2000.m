

% Parameter Assignment for year 2000 France.

function[pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,csgded_r,decote,child_ben1,child_ben2,pens_empr1,pens_empr2,sick_empr,unemp_empr1,unemp_empr2,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,others_empr2] = fr_parameters_2000

%Social Security Parameters
pension_r=0.0655;
penex_r=0.03;
penex_r2=0.05;
penwidow_r=0.001;

ssc_ceil=176400;
sick_r=0.0075;
unemp_r1=0.0301;
unemp_r2=0.036;

%Employer Social Security Parameters
pens_empr1=0.082;
pens_empr2=0.016;
sick_empr=0.128;
unemp_empr1=0.0531;
unemp_empr2=0.0544;
accid_empr=0.0202;
smic=83898;
fam_empr=0.054;
penex_empr=0.045;
penex2_empr=0.075;
others_empr1=0.0295;
others_empr2=0.0285;

%  Allowances
workall_min=2320;
workall_max=77850;
workall_r=0.1;
basicall_r=0.2;
csg_ded_r=0.04845;
 
 %Tax Schedule Parameters
taxbracket1=26600;
taxbracket2=51600;
taxbracket3=92090;
taxbracket4=149110;
taxbracket5=242620;
taxbracket6=299200;

tax_r1=0;
tax_r2=0.0825;
tax_r3=0.2175;
tax_r4=0.3175;
tax_r5=0.4175;
tax_r6=0.4725;
tax_r7=0.5325;

tax_min=400; % for tax adjustment
noded_r=0.02755; %csg and crds rate that is not deducted
csgded_r=0.04845; %csgrate that is deducted
decote=3350; %for tax adjustment

%Child benefit
child_ben1=8244;
child_ben2=10560;
 
end