%  Taxable Income in United Kingdom for the year 1991

function[taxableinc_p,taxableinc_s]=uk_taxableinc_1991(wage_principal,wage_spouse,married,basic_all,married_all)
%Basic Allowance
%basic_all=3295;

taxableinc_p=wage_principal-basic_all;

taxableinc_s=wage_spouse-basic_all;

%Married couple allowance
if married==1
        taxableinc_s=taxableinc_s- max(0,married_all-taxableinc_p);
        taxableinc_p=max(0,taxableinc_p-married_all);
end



end
