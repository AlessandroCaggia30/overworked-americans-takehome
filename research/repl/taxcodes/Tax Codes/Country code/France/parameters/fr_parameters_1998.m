

% Parameter Assignment for year 1998 France.

function[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,decote,child_ben1,child_ben2,pens_empr1,pens_empr2,sick_empr,unemp_empr1,unemp_empr2,accid_empr,smic,fam_empr,penex_empr,others_empr1,others_empr2] = fr_parameters_1998

%Social Security Parameters
pension_r=0.0655;
penex_r=0.0275;
penwidow_r=0.001;

ssc_ceil=169080;
sick_r=0.0075;
unemp_r1=0.0301;
unemp_r2=0.036;

%Employer Social Security Parameters
pens_empr1=0.082;
pens_empr2=0.016;
sick_empr=0.128;
unemp_empr1=0.0538;
unemp_empr2=0.0551;
accid_empr=0.0;
smic=80311;
fam_empr=0.054;
penex_empr=0.04125;
others_empr1=0.0295;
others_empr2=0.0285;

%  Allowances
workall_min=2310;
workall_max=77460;
workall_r=0.1;
basicall_r=0.2;
csg_ded_r=0.04845;
 
 %Tax Schedule Parameters
taxbracket1=26100;
taxbracket2=51340;
taxbracket3=90370;
taxbracket4=146320;
taxbracket5=238080;
taxbracket6=293600;

tax_r1=0;
tax_r2=0.105;
tax_r3=0.24;
tax_r4=0.33;
tax_r5=0.43;
tax_r6=0.48;
tax_r7=0.54;

tax_min=400; % for tax adjustment
noded_r=0.02755; %csg and crds rate that is not deducted
decote=3330; %for tax adjustment

%Child benefit
child_ben1=8148;
child_ben2=10597;
 
end