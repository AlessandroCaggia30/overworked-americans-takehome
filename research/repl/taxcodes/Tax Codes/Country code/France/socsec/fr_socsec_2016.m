% Social Security Contributions in France for year
% 2016

function[socsec,ssc_principal, ssc_spouse, ssc_empr]=fr_socsec_2016(wage_principal,wage_spouse,pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr1,fam_empr2,penex_empr,penex2_empr,others_empr1,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,ssc_empr_smic2,csa,cice_red,cice_max)

%%%Employee Social Security Contributions

%principal
ssc_principal=pension_r*min(wage_principal,ssc_ceil)+ penex_r*min(wage_principal,ssc_ceil)+ penex_r2* max(0,min(wage_principal-ssc_ceil,2*ssc_ceil))+ penwidow_r*(wage_principal)+sick_r*wage_principal+unemp_r1*min(wage_principal,4*ssc_ceil);

%spouse
ssc_spouse=pension_r*min(wage_spouse,ssc_ceil) +penex_r*min(wage_spouse,ssc_ceil)+ penex_r2* max(0,min(wage_spouse-ssc_ceil,2*ssc_ceil)) + penwidow_r*(wage_spouse)+sick_r*wage_spouse+unemp_r1*min(wage_spouse,4*ssc_ceil);

socsec=round(ssc_spouse+ssc_principal);


%%%Employer Social Security Contributions
%Pension
pension_empr=(pens_empr1)*min(wage_principal,ssc_ceil)+(pens_empr1)*min(wage_spouse,ssc_ceil)+penex_empr*min(wage_principal,ssc_ceil)+ penex2_empr* max(0,min(wage_principal-ssc_ceil,2*ssc_ceil)) +penex_empr*min(wage_spouse,ssc_ceil)+ penex2_empr* max(0,min(wage_spouse-ssc_ceil,2*ssc_ceil));

%Illness, accidents,pension, others
illness_empr=(sick_empr+accid_empr+csa+pens_empr2+others_empr1)*wage_principal+(sick_empr+accid_empr+csa+pens_empr2+others_empr1)*wage_spouse;

%Unemployment 
unemployment_empr=unemp_empr*min(wage_principal,4*ssc_ceil)+unemp_empr*min(wage_spouse,4*ssc_ceil);

%Family
if wage_principal<ssc_empr_smic_ref*smic
    family_empr_principal=1/4*(fam_empr2*wage_principal);
else
    family_empr_principal=1/4*(fam_empr1*wage_principal);
end

if wage_spouse<ssc_empr_smic_ref*smic
    family_empr_spouse=1/4*(fam_empr2*wage_spouse);
else
    family_empr_spouse=1/4*(fam_empr1*wage_spouse);
end

if wage_principal<ssc_empr_smic2*smic
    family_empr_principal=family_empr_principal+3/4*(fam_empr2*wage_principal);
else
    family_empr_principal=family_empr_principal+3/4*(fam_empr1*wage_principal);
end

if wage_spouse<ssc_empr_smic2*smic
    family_empr_spouse=family_empr_spouse+3/4*(fam_empr2*wage_spouse);
else
    family_empr_spouse=family_empr_spouse+3/4*(fam_empr1*wage_spouse);
end

ssc_empr_gross=round(pension_empr+illness_empr+unemployment_empr+family_empr_principal+family_empr_spouse);

%Reduction of employer SSC

if wage_principal<=ssc_empr_smic_ref*smic && wage_principal>0
    ssc_red_empr_principal=round(min(ssc_empr_red_max*wage_principal,(ssc_empr_red_max/ssc_empr_redr2)*(ssc_empr_smic_ref*smic/wage_principal-1)*wage_principal));
else
    ssc_red_empr_principal=0;
end

if wage_principal<cice_max*smic && wage_principal>0
    ssc_red_empr_principal=ssc_red_empr_principal+wage_principal*cice_red;
end

if wage_spouse<=ssc_empr_smic_ref*smic && wage_spouse>0
    ssc_red_empr_spouse=round(min(ssc_empr_red_max*wage_spouse,(ssc_empr_red_max/ssc_empr_redr2)*(ssc_empr_smic_ref*smic/wage_spouse-1)*wage_spouse));
else
    ssc_red_empr_spouse=0;
end

if wage_spouse<cice_max*smic && wage_spouse>0
    ssc_red_empr_spouse=ssc_red_empr_spouse+wage_spouse*cice_red;
end

ssc_empr=round(ssc_empr_gross-ssc_red_empr_spouse-ssc_red_empr_principal);

end
