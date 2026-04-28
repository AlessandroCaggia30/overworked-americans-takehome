

% Parameter Assignment for year 1994 France.

function[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_max,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,noded_r,child_ben1,child_ben2] = fr_parameters_1994

%Social Security Parameters
pension_r=0.0655;
penex_r=0.02;
penwidow_r=0.001;

ssc_ceil=153120;
sick_r=0.068;
unemp_r1=0.0322;
unemp_r2=0.0386;

% %Employer Social Security Parameters
% pens_empr1=0.082;
% pens_empr2=0.016;
% sick_empr=0.128;
% unemp_empr1=0.0534;
% unemp_empr2=0.0547;
% accid_empr=0.0;
% smic=71375;
% fam_empr=0.054;
% penex_empr=0.03;
% others_empr1=0.0295;

%  Allowances
workall_min=2190;
workall_max=73270;
workall_r=0.1;
basicall_r=0.2;

 %Tax Schedule Parameters
taxbracket1=22210;
taxbracket2=48570;
taxbracket3=85480;
taxbracket4=138410;
taxbracket5=225210;
taxbracket6=277730;

tax_r1=0;
tax_r2=0.12;
tax_r3=0.25;
tax_r4=0.35;
tax_r5=0.45;
tax_r6=0.50;
tax_r7=0.568;

% tax_min=; % for tax adjustment
noded_r=0.0228; %csg
% decote=; %for tax adjustment

%Child benefit
child_ben1=7889;
child_ben2=10107;
%  
end