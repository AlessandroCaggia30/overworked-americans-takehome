

% Parameter Assignment for year 2013 France.

function[pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,decote,child_ben1,child_ben2,ppe_lim1,ppe_lim2,ppe_lim3,ppe_lim4,ppe_lim5,ppe_r1,ppe_r2,ppe_r3,ppe_extraperson,ppe_ch1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,others_empr2,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,minrevtp,limit_demipart,limit_sp_demipart1,crds_special,csa, csg_crds_abat,cehr_rate1,cehr_rate2,cehr_ceil1,cehr_ceil2,cice_red,cice_max] = fr_parameters_2013

%Social Security Parameters
pension_r=0.0675;
penex_r=0.038;
penex_r2=0.089;
penwidow_r=0.001;

ssc_ceil=37032;
sick_r=0.0075;
unemp_r1=0.0240;

%Employer Social Security Parameters
pens_empr1=0.084;
pens_empr2=0.016;
sick_empr=0.128;
csa=0.003;
unemp_empr=0.0430;
accid_empr=0.0243;
smic=17162.6;
fam_empr=0.054;
penex_empr=0.057;
penex2_empr=0.133;
others_empr1=0.0323;
others_empr2=0.0323;
ssc_empr_redr2=0.6;
ssc_empr_red_max=0.26;
ssc_empr_smic_ref=1.6;
minrevtp=17163;

cice_red=0.04;
cice_max=2.5;

%  Allowances
workall_min=424; %work_rel_fl
workall_max=12096;
workall_r=0.1;
basicall_r=0; % no basic allowance from 2007
csg_ded_r=0.0510; %CSG_rat_ded
 
 %Tax Schedule Parameters
taxbracket1=6011;
taxbracket2=11991;
taxbracket3=26631;
taxbracket4=71397;
taxbracket5=151200;
taxbracket6=1000000000;

tax_r1=0;
tax_r2=0.055;
tax_r3=0.14;
tax_r4=0.3;
tax_r5=0.41;
tax_r6=0.45;
tax_r7=0.45;

tax_min=61; % for tax adjustment
noded_r=0.0290; %csg and crds rate that is not deducted CSG_CRDS_rat_noded
decote=1016; %for tax adjustment
csg_crds_abat=0.0175;

cehr_rate1=0.03;
cehr_rate2=0.04;
cehr_ceil1=250000;
cehr_ceil2=500000;

%Child benefit
child_ben1=1545.95;
child_ben2=1980.74;

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

ppe_extraperson=83; %ppe_mar_1earn
ppe_ch1=36; %extra_pers

limit_demipart=1500;
limit_sp_demipart1=3540;

end