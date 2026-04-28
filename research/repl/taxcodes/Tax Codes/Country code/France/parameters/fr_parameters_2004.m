

% Parameter Assignment for year 2004 France.

function[pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,csgded_r,decote,child_ben1,child_ben2,ppe_lim1,ppe_lim2,ppe_lim3,ppe_lim4,ppe_lim5,ppe_r1,ppe_r2,ppe_r3,ppe_extraperson,ppe_ch1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,others_empr2,ssc_empr_redr1,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,minrevtp,limit_demipart,limit_sp_demipart1,crds_special] = fr_parameters_2004

%Social Security Parameters
pension_r=0.0655;
penex_r=0.038;
penex_r2=0.069;
penwidow_r=0.001;

ssc_ceil=29712;
sick_r=0.0075;
unemp_r1=0.0240;
unemp_r2=0.0240;

%Employer Social Security Parameters
pens_empr1=0.082;
pens_empr2=0.016;
sick_empr=0.128;
unemp_empr=0.0438;
accid_empr=0.0222;
smic=15007;
fam_empr=0.054;
penex_empr=0.057;
penex2_empr=0.103;
others_empr1=0.0295;
others_empr2=0.0285;
ssc_empr_redr1=0.607;
ssc_empr_redr2=0.55;
ssc_empr_red_max=0.234;
ssc_empr_smic_ref=1.6;
minrevtp=13468;

%  Allowances
workall_min=376; %work_rel_fl
workall_max=12648;
workall_r=0.1;
basicall_r=0.2;
csg_ded_r=0.04845; %CSG_rat_ded
 
 %Tax Schedule Parameters
taxbracket1=4261;
taxbracket2=8382;
taxbracket3=14753;
taxbracket4=23888;
taxbracket5=38868;
taxbracket6=47932;

tax_r1=0;
tax_r2=0.0683;
tax_r3=0.1914;
tax_r4=0.2826;
tax_r5=0.3738;
tax_r6=0.4262;
tax_r7=0.4809;

tax_min=61; % for tax adjustment
noded_r=0.02755; %csg and crds rate that is not deducted CSG_CRDS_rat_noded
csgded_r=0.04845; %csgrate that is deducted
decote=786; %for tax adjustment

%Child benefit
child_ben1=1358;
child_ben2=1740;
crds_special=0.005;

%PPE Credit
ppe_lim1=3372;
ppe_lim2=11239;
ppe_lim3=15735;
ppe_lim4=22478;
ppe_lim5=23968;

ppe_r1=0.046;
ppe_r2=0.115;
ppe_r3=0.055;

ppe_extraperson=80;
ppe_ch1=33;

limit_demipart=2086;
limit_sp_demipart1=3609;
 
end