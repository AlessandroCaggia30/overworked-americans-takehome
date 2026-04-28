% Social Security Contributions in France for year
% 1996

function[socsec,ssc_empr]=fr_socsec_1996(wage_principal,wage_spouse,pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,pens_empr1,pens_empr2,sick_empr,unemp_empr1,unemp_empr2,accid_empr,smic,fam_empr,penex_empr,others_empr1)

%%%Employee Social Security Contributions
%pension
pension= pension_r*min(wage_principal,ssc_ceil)+pension_r*min(wage_spouse,ssc_ceil)+ penex_r*min(wage_principal,3*ssc_ceil) +penex_r*min(wage_spouse,3*ssc_ceil) + penwidow_r*(wage_principal+wage_spouse);

%Ilness , pregnancy , disability death
illness=sick_r*wage_principal+sick_r*wage_spouse;

%Unemployment
unemployment=unemp_r1*min(wage_principal,ssc_ceil)+unemp_r2*max(0,min(wage_principal-ssc_ceil,3*ssc_ceil))+unemp_r1*min(wage_spouse,ssc_ceil)+unemp_r2*max(0,min(wage_spouse-ssc_ceil,3*ssc_ceil));

socsec=round(pension+illness+unemployment);

%%%Employer Social Security Contributions
%Pension, Illness, accidents, others
pension_empr=pens_empr1*min(wage_principal,ssc_ceil)+(pens_empr2+sick_empr+accid_empr+penex_empr+others_empr1)*wage_principal+penex_empr*min(wage_principal,3*ssc_ceil)+pens_empr1*min(wage_spouse,ssc_ceil)+(pens_empr2+sick_empr+accid_empr+penex_empr+others_empr1)*wage_spouse+penex_empr*min(wage_spouse,3*ssc_ceil);

% Family
if wage_principal<1.2*smic
    family_empr_principal=0;
elseif wage_principal<1.3*smic
      family_empr_principal=fam_empr*wage_principal*0.5;
else
    family_empr_principal=fam_empr*wage_principal;
end

if wage_spouse<1.2*smic
    family_empr_spouse=0;
elseif wage_principal<1.3*smic
      family_empr_spouse=fam_empr*wage_spouse*0.5;
else
    family_empr_spouse=fam_empr*wage_spouse;
end

%Unemployment 
unemployment_empr=unemp_empr1*min(wage_principal,ssc_ceil)+unemp_empr2*max(0,min(wage_principal-ssc_ceil,3*ssc_ceil))+unemp_empr1*min(wage_spouse,ssc_ceil)+unemp_empr2*max(0,min(wage_spouse-ssc_ceil,3*ssc_ceil));

ssc_empr=round(pension_empr+family_empr_principal+family_empr_spouse+unemployment_empr);

end