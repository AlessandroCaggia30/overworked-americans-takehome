

% Parameter Assignment for year 2015 France.

function[pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,decote_sing,decote_mar,decote_pente,child_ben1,child_ben2,cb_c1,cb_c2,cb_ceil_extra_c,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr1,fam_empr2,penex_empr,penex2_empr,others_empr1,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,minrevtp,limit_demipart,limit_sp_demipart1,crds_special,csa, csg_crds_abat,cehr_rate1,cehr_rate2,cehr_ceil1,cehr_ceil2,cice_red,cice_max] = fr_parameters_2015

%Social Security Parameters
pension_r=0.0685;
penex_r=0.039;
penex_r2=0.090;
penwidow_r=0.003;

ssc_ceil=38040;
sick_r=0.0075;
unemp_r1=0.0240;

%Employer Social Security Parameters
pens_empr1=0.085;
pens_empr2=0.018;
sick_empr=0.128;
csa=0.003;
unemp_empr=0.0430;
accid_empr=0.0244;
smic=17490.2;
fam_empr1=0.0525;
fam_empr2=0.0345;
penex_empr=0.0585;
penex2_empr=0.1345;
others_empr1=0.0263;
ssc_empr_redr2=0.6;
ssc_empr_red_max=0.2835;
ssc_empr_smic_ref=1.6;
minrevtp=17490.2;

cice_red=0.06;
cice_max=2.5;

%  Allowances
workall_min=426; %work_rel_fl
workall_max=12169;
workall_r=0.1;
basicall_r=0; % no basic allowance from 2007
csg_ded_r=0.0510; %CSG_rat_ded
 
 %Tax Schedule Parameters
taxbracket1=9700;
taxbracket2=26791;
taxbracket3=71826;
taxbracket4=152108;
taxbracket5=1000000000;
taxbracket6=1000000000;

tax_r1=0;
tax_r2=0.14;
tax_r3=0.3;
tax_r4=0.41;
tax_r5=0.45;
tax_r6=0.45;
tax_r7=0.45;

tax_min=61; % for tax adjustment
noded_r=0.0290; %csg and crds rate that is not deducted CSG_CRDS_rat_noded
decote_sing=1553; %for tax adjustment
decote_mar=2560; %for tax adjustment
decote_pente=0.75;
csg_crds_abat=0.0175;

cehr_rate1=0.03;
cehr_rate2=0.04;
cehr_ceil1=250000;
cehr_ceil2=500000;

%Child benefit
child_ben1=1559.96;
child_ben2=1998.58;
cb_c1=55950;
cb_c2=78300;
cb_ceil_extra_c=5595;
crds_special=0.005;


limit_demipart=1510;
limit_sp_demipart1=3562;

end