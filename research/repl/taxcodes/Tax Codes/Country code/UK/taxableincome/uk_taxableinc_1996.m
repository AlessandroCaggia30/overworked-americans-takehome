% Taxable Income in United Kingdom for the year
% 1996

function[taxableinc_p,taxableinc_s]=uk_taxableinc_1996(wage_principal,wage_spouse,married,basic_all,married_all)

%Basic allowance
taxableinc_p=wage_principal-basic_all;
taxableinc_s=wage_spouse-basic_all;




end
