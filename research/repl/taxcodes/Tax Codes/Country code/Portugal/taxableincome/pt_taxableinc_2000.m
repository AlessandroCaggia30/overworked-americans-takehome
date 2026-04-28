%Taxable Income in Portugal for year 2000

function[taxable_income]=pt_taxableinc_2000(wage_principal,wage_spouse,socsec_p,socsec_s,perc,max_all)



%Work Related Expenses
tax_all=max( ( min(perc*wage_principal,max_all) + min(perc*wage_spouse,max_all) ),(socsec_p + socsec_s) );

taxable_income=wage_principal+wage_spouse-tax_all;% taxable income of the household




end
