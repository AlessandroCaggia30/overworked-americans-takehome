% Taxable Income in Portugal for year 1993

function[taxable_income]=pt_taxableinc_1993(wage_principal,wage_spouse,married,socsec_p,socsec_s,perc,max_all,single_all,married_all)



%Work Related Expenses
tax_all=max( ( min(perc*wage_principal,max_all) + min(perc*wage_spouse,max_all) ),(socsec_p + socsec_s) );

other_all= single_all + married*(married_all-single_all);  % allowance depending on the marital status
taxable_income=wage_principal+wage_spouse-tax_all-other_all;% taxable income of the household




end
