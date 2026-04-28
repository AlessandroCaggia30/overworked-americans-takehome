% Social Security Contributions in France for year
% 1997

function[socsec,ssc_empr]=fr_socsec_1997(wage_principal,wage_spouse,pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,pens_empr1,pens_empr2,sick_empr,unemp_empr1,unemp_empr2,accid_empr,smic,fam_empr,penex_empr,others_empr1,others_empr2)

%%%Employee Social Security Contributions
%pension
pension= pension_r*min(wage_principal,ssc_ceil)+pension_r*min(wage_spouse,ssc_ceil)+ penex_r*min(wage_principal,3*ssc_ceil) +penex_r*min(wage_spouse,3*ssc_ceil) + penwidow_r*(wage_principal+wage_spouse);

%Ilness , pregnancy , disability death
illness=sick_r*wage_principal+sick_r*wage_spouse;

%Unemployment
unemployment=unemp_r1*min(wage_principal,ssc_ceil)+unemp_r2*max(0,min(wage_principal-ssc_ceil,3*ssc_ceil))+unemp_r1*min(wage_spouse,ssc_ceil)+unemp_r2*max(0,min(wage_spouse-ssc_ceil,3*ssc_ceil));

socsec=round(pension+illness+unemployment);

%%%Employer Social Security Contributions
%Pension and others
pension_empr=(pens_empr1+others_empr1)*min(wage_principal,ssc_ceil)+(pens_empr1+others_empr1)*min(wage_spouse,ssc_ceil)+(pens_empr2+others_empr2)*max(0,wage_principal-ssc_ceil)+(pens_empr2+others_empr2)*max(0,wage_spouse-ssc_ceil)+penex_empr*min(wage_principal,3*smic)+penex_empr*min(wage_spouse,3*smic);

%Illness , family, accidents,
illness_empr=(sick_empr+fam_empr+accid_empr)*wage_principal+(sick_empr+fam_empr+accid_empr)*wage_spouse;

%Unemployment 
unemployment_empr=unemp_empr1*wage_principal+(unemp_empr2-unemp_empr1)*max(0,wage_principal-ssc_ceil)+unemp_empr1*wage_spouse+(unemp_empr2-unemp_empr1)*max(0,wage_spouse-ssc_ceil);

ssc_empr_gross=round(pension_empr+illness_empr+unemployment_empr);

%Reduction of employer SSC
if wage_principal<=smic && wage_principal>0
    ssc_red_empr_principal=round(0.182*wage_principal);
elseif wage_principal>smic && wage_principal<=1.33*smic
    ssc_red_empr_principal=round((1.33*smic-wage_principal)*0.55);
else
    ssc_red_empr_principal=0;
end

if wage_spouse<=smic && wage_spouse>0
    ssc_red_empr_spouse=round(0.182*wage_spouse);
elseif wage_spouse>smic && wage_spouse<=1.33*smic
    ssc_red_empr_spouse=round((1.33*smic-wage_spouse)*0.55);
else
    ssc_red_empr_spouse=0;
end

ssc_empr=ssc_empr_gross-ssc_red_empr_spouse-ssc_red_empr_principal;

end
