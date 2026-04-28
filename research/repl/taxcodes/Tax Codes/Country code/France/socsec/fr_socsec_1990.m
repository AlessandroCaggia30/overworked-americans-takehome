% Social Security Contributions in France for year
% 1990

function[socsec]=fr_socsec_1990(wage_principal,wage_spouse,pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2)

%pension
pension= pension_r*min(wage_principal,ssc_ceil)+pension_r*min(wage_spouse,ssc_ceil)+ penex_r*min(wage_principal,3*ssc_ceil) +penex_r*min(wage_spouse,3*ssc_ceil) + penwidow_r*(wage_principal+wage_spouse);

%Ilness , pregnancy , disability death
illness=sick_r*wage_principal+sick_r*wage_spouse;

%Unemployment
unemployment=unemp_r1*min(wage_principal,4*ssc_ceil)+unemp_r2*max(0,min(wage_principal-ssc_ceil,3*ssc_ceil))+unemp_r1*min(wage_spouse,4*ssc_ceil)+unemp_r2*max(0,min(wage_spouse-ssc_ceil,3*ssc_ceil));

socsec=round(pension+illness+unemployment);

end
