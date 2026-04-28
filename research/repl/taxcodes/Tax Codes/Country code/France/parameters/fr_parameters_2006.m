

% Parameter Assignment for year 2006 France.

function[pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,csgded_r,decote,child_ben1,child_ben2,ppe_lim1,ppe_lim2,ppe_lim3,ppe_lim4,ppe_lim5,ppe_r1,ppe_r2,ppe_r3,ppe_extraperson,ppe_ch1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,others_empr2,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,minrevtp,limit_demipart,limit_sp_demipart1,crds_special] = fr_parameters_2006

%Social Security Parameters
pension_r=0.0655;
penex_r=0.038;
penex_r2=0.089;
penwidow_r=0.001;

ssc_ceil=31608;
sick_r=0.0075;
unemp_r1=0.0240;
unemp_r2=0.0240;

%Employer Social Security Parameters
pens_empr1=0.083;
pens_empr2=0.016;
sick_empr=0.128;
unemp_empr=0.0438;
accid_empr=0.023;
smic=15051;
fam_empr=0.054;
penex_empr=0.057;
penex2_empr=0.133;
others_empr1=0.0317;
others_empr2=0.0307;
ssc_empr_redr2=0.6;
ssc_empr_red_max=0.26;
ssc_empr_smic_ref=1.6;
minrevtp=14833;


%  Allowances
workall_min=389; %work_rel_fl
workall_max=13093;
workall_r=0.1;
basicall_r=0.2;
csg_ded_r=0.04947; %CSG_rat_ded
 
 %Tax Schedule Parameters
taxbracket1=4412;
taxbracket2=8677;
taxbracket3=15274;
taxbracket4=24731;
taxbracket5=40241;
taxbracket6=49624;

tax_r1=0;
tax_r2=0.0683;
tax_r3=0.1914;
tax_r4=0.2826;
tax_r5=0.3738;
tax_r6=0.4262;
tax_r7=0.4809;

tax_min=61; % for tax adjustment
noded_r=0.02813; %csg and crds rate that is not deducted CSG_CRDS_rat_noded
csgded_r=0.04947; %csgrate that is deducted
decote=829; %for tax adjustment

%Child benefit
child_ben1=1388;
child_ben2=1778;
crds_special=0.005;

%PPE Credit
ppe_lim1=3570;
ppe_lim2=11899;
ppe_lim3=16659;
ppe_lim4=23798;
ppe_lim5=25376;

ppe_r1=0.06;
ppe_r2=0.015;
ppe_r3=0.055;

ppe_extraperson=81;
ppe_ch1=35;

limit_demipart=2159;
limit_sp_demipart1=3736;
 
end