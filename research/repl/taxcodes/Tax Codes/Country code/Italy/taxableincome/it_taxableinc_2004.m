% Taxable Income in Italy for year 2004

function[taxable_income_p,taxable_income_s,taxable_income_xal2_p,taxable_income_xal2_s]=it_taxableinc_2004(wage_principal,wage_spouse,socsec_p, socsec_s,b_all)

%Allowances

%Tax_al2
if wage_principal>0
    tax_al2_p=min((wage_principal-socsec_p) , b_all*min(1, max((1-(wage_principal-socsec_p-b_all)/26000),0)));
else 
    tax_al2_p=0; 
end

if wage_spouse>0
    tax_al2_s=min((wage_spouse-socsec_s) , b_all*min(1, max((1-(wage_spouse-socsec_s-b_all)/26000),0)));
else 
    tax_al2_s=0; 
end


%Taxable income
taxable_income_xal2_p=wage_principal-socsec_p;
taxable_income_xal2_s=wage_spouse-socsec_s;

taxable_income_p=wage_principal-socsec_p-tax_al2_p;
taxable_income_s=wage_spouse-socsec_s-tax_al2_s;


end
