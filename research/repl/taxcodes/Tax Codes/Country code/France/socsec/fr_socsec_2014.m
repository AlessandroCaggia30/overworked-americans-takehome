% Social Security Contributions in France for year
% 2014

function[socsec, ssc_empr]=fr_socsec_2014(wage_principal,wage_spouse,pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,minrevtp,csa,cice_red,cice_max)

%%%Employee Social Security Contributions
%pension
pension= pension_r*min(wage_principal,ssc_ceil)+pension_r*min(wage_spouse,ssc_ceil)+ penex_r*min(wage_principal,ssc_ceil)+ penex_r2* max(0,min(wage_principal-ssc_ceil,2*ssc_ceil)) +penex_r*min(wage_spouse,ssc_ceil)+ penex_r2* max(0,min(wage_spouse-ssc_ceil,2*ssc_ceil)) + penwidow_r*(wage_principal+wage_spouse);

%Illness , pregnancy , disability death
illness=sick_r*wage_principal+sick_r*wage_spouse;
 
%Unemployment
unemployment=unemp_r1*min(wage_principal,4*ssc_ceil)+unemp_r1*min(wage_spouse,4*ssc_ceil);

socsec=round(pension+illness+unemployment);


%%%Employer Social Security Contributions
%Pension and others

pension_empr=(pens_empr1)*min(wage_principal,ssc_ceil)+(pens_empr1)*min(wage_spouse,ssc_ceil)+penex_empr*min(wage_principal,ssc_ceil)+ penex2_empr* max(0,min(wage_principal-ssc_ceil,2*ssc_ceil)) +penex_empr*min(wage_spouse,ssc_ceil)+ penex2_empr* max(0,min(wage_spouse-ssc_ceil,2*ssc_ceil));

%Illness , family, accidents,
illness_empr=(sick_empr+fam_empr+accid_empr+csa+pens_empr2+others_empr1)*wage_principal+(sick_empr+fam_empr+accid_empr+csa+pens_empr2+others_empr1)*wage_spouse;

%Unemployment 
unemployment_empr=unemp_empr*min(wage_principal,4*ssc_ceil)+unemp_empr*min(wage_spouse,4*ssc_ceil);

ssc_empr_gross=round(pension_empr+illness_empr+unemployment_empr);

%Reduction of employer SSC

if wage_principal<=ssc_empr_smic_ref*smic && wage_principal>0
    ssc_red_empr_principal=round(min(ssc_empr_red_max*wage_principal,(ssc_empr_red_max/ssc_empr_redr2)*(ssc_empr_smic_ref*minrevtp/wage_principal-1)*wage_principal));
else
    ssc_red_empr_principal=0;
end

if wage_principal<cice_max*minrevtp && wage_principal>0
    ssc_red_empr_principal=ssc_red_empr_principal+wage_principal*cice_red;
end

if wage_spouse<=ssc_empr_smic_ref*smic && wage_spouse>0
    ssc_red_empr_spouse=round(min(ssc_empr_red_max*wage_spouse,(ssc_empr_red_max/ssc_empr_redr2)*(ssc_empr_smic_ref*minrevtp/wage_spouse-1)*wage_spouse));
else
    ssc_red_empr_spouse=0;
end

if wage_spouse<cice_max*minrevtp && wage_spouse>0
    ssc_red_empr_spouse=ssc_red_empr_spouse+wage_spouse*cice_red;
end

ssc_empr=round(ssc_empr_gross-ssc_red_empr_spouse-ssc_red_empr_principal);

end
