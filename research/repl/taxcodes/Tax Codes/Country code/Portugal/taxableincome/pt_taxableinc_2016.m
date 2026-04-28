% Taxable Income in Portugal for year 2016

function[taxable_income_joint,taxable_income_p,taxable_income_s]=pt_taxableinc_2016(wage_principal,wage_spouse,socsec_p,socsec_s,perc,max_all)



%Work Related Expenses
tax_all=max( ( min(perc*wage_principal,max_all) + min(perc*wage_spouse,max_all) ),(socsec_p + socsec_s) );

taxable_income_joint=wage_principal+wage_spouse-tax_all;% taxable income of the household

tax_all_p=max(  min(perc*wage_principal,max_all) ,socsec_p  );
tax_all_s=max(  min(perc*wage_spouse,   max_all) ,socsec_s  );

taxable_income_p=wage_principal-tax_all_p;
taxable_income_s=wage_spouse-tax_all_s;


end
