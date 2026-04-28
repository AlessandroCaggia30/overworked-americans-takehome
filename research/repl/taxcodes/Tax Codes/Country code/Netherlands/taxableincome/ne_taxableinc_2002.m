% returns the taxable income taking into account the social security deductions and compensation for medical contributions.

function [taxable_income,taxable_income_s,employer_health,employer_health_s] = ne_taxableinc_2002(wage_principal,wage_spouse,unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil)



unemployment = max(0,( min(wage_principal,ssc_ceil)-unemp_fran ) )*unemp_r; 

if wage_principal<=med_limit
employer_health=med_empr*min(wage_principal,health_ceil); 
else
    employer_health=0;
end


%---------------%Same Calculations for the Spouse--------------------------------------------------------------------------------------------------------------

% Deduction for social security contr.
 unemployment_s=max(0,( min(wage_spouse,ssc_ceil)-unemp_fran ) )*unemp_r; 

% Employers health contribution increases taxable income
if wage_spouse<=med_limit
 employer_health_s=med_empr*min(wage_spouse,health_ceil); 
else
    employer_health_s=0;
end


taxable_income=max(0,wage_principal-unemployment+employer_health);

taxable_income_s=max(0,wage_spouse-unemployment_s+employer_health_s);



end