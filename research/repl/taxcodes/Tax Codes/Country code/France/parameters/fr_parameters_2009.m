

% Parameter Assignment for year 2009 France.

function[pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,csgded_r,decote,child_ben1,child_ben2,ppe_lim1,ppe_lim2,ppe_lim3,ppe_lim4,ppe_lim5,ppe_r1,ppe_r2,ppe_r3,ppe_extraperson,ppe_ch1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,others_empr2,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,minrevtp,min_thresh,max_thresh,limit_demipart,limit_sp_demipart1,crds_special] = fr_parameters_2009

%Social Security Parameters
pension_r=0.0665;
penex_r=0.038;
penex_r2=0.089;
penwidow_r=0.001;

ssc_ceil=34308;
sick_r=0.0075;
unemp_r1=0.0240;
unemp_r2=0.0240;

%Employer Social Security Parameters
pens_empr1=0.083;
pens_empr2=0.016;
sick_empr=0.131;
unemp_empr=0.0415;
accid_empr=0.023;
smic=15952;
fam_empr=0.054;
penex_empr=0.057;
penex2_empr=0.133;
others_empr1=0.0305;
others_empr2=0.0295;
ssc_empr_redr2=0.6;
ssc_empr_red_max=0.26;
ssc_empr_smic_ref=1.6;
minrevtp=15961.4;

%  Allowances
workall_min=413; %work_rel_fl
workall_max=13893;
workall_r=0.1;
basicall_r=0; % no basic allowance from 2007
csg_ded_r=0.04947; %CSG_rat_ded
 
 %Tax Schedule Parameters
taxbracket1=5852;
taxbracket2=11673;
taxbracket3=25926;
taxbracket4=69505;
taxbracket5=1000000000;
taxbracket6=1000000000;

tax_r1=0;
tax_r2=0.055;
tax_r3=0.14;
tax_r4=0.3;
tax_r5=0.40;
tax_r6=0.40;
tax_r7=0.40;

tax_min=61; % for tax adjustment
noded_r=0.02813; %csg and crds rate that is not deducted CSG_CRDS_rat_noded
csgded_r=0.04947; %csgrate that is deducted
decote=862; %for tax adjustment


%Child benefit
child_ben1=1493.53;
child_ben2=1914.86;

crds_special=0.005;

%PPE Credit
ppe_lim1=3743;
ppe_lim2=12475;
ppe_lim3=17451;
ppe_lim4=24950;
ppe_lim5=26572;

ppe_r1=0.077;
ppe_r2=0.193;
ppe_r3=0.051;

ppe_extraperson=83;
ppe_ch1=36;

%Tax credit for low earning households
min_thresh=11673;
max_thresh=12475;

limit_demipart=2292;
limit_sp_demipart1=3964;

end