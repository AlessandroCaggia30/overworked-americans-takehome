% Taxable Income in United Kingdom for the year
% 1990

function[taxableinc_p,taxableinc_s]=uk_taxableinc_1990(wage_principal,wage_spouse,children,married,basic_all,married_all,singleparent_all)


taxableinc_p=wage_principal-basic_all;

taxableinc_s=wage_spouse-basic_all;

%Married couple allowance
if married==1
        taxableinc_s=taxableinc_s- max(0,married_all-taxableinc_p);
        taxableinc_p=max(0,taxableinc_p-married_all);
end

if married==0 && children>0
    taxableinc_p = taxableinc_p-singleparent_all;
end

end
