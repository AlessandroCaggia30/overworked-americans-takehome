% Social Security Contributions in France for year
% 2003

function[socsec, ssc_empr]=fr_socsec_2003(wage_principal,wage_spouse,pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,others_empr2)
	
%%%Employee Social Security Contributions
%pension
pension= pension_r*min(wage_principal,ssc_ceil)+pension_r*min(wage_spouse,ssc_ceil)+ penex_r*min(wage_principal,ssc_ceil)+ penex_r2* max(0,min(wage_principal-ssc_ceil,2*ssc_ceil)) +penex_r*min(wage_spouse,ssc_ceil)+ penex_r2* max(0,min(wage_spouse-ssc_ceil,2*ssc_ceil)) + penwidow_r*(wage_principal+wage_spouse);

%Illness , pregnancy , disability death
illness=sick_r*wage_principal+sick_r*wage_spouse;

%Unemployment
unemployment=unemp_r1*min(wage_principal,ssc_ceil)+unemp_r2*max(0,min(wage_principal-ssc_ceil,3*ssc_ceil))+unemp_r1*min(wage_spouse,ssc_ceil)+unemp_r2*max(0,min(wage_spouse-ssc_ceil,3*ssc_ceil));

socsec=round(pension+illness+unemployment);

%%%Employer Social Security Contributions


%Pension and others

pension_empr=(pens_empr1+others_empr1)*min(wage_principal,ssc_ceil)+(pens_empr1+others_empr1)*min(wage_spouse,ssc_ceil)+(pens_empr2+others_empr2)*max(0,wage_principal-ssc_ceil)+(pens_empr2+others_empr2)*max(0,wage_spouse-ssc_ceil)+penex_empr*min(wage_principal,ssc_ceil)+ penex2_empr* max(0,min(wage_principal-ssc_ceil,2*ssc_ceil)) +penex_empr*min(wage_spouse,ssc_ceil)+ penex2_empr* max(0,min(wage_spouse-ssc_ceil,2*ssc_ceil));

%Illness , family, accidents,
illness_empr=(sick_empr+fam_empr+accid_empr)*wage_principal+(sick_empr+fam_empr+accid_empr)*wage_spouse;

%Unemployment (according to the "taxing wages"-report it should be implemented
%that way. The tax equations seem wrong as they include the parameter
%unemp2_empr that does not exist in the parameters
unemployment_empr=unemp_empr*min(wage_principal,4*ssc_ceil)+unemp_empr*min(wage_spouse,4*ssc_ceil);

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
