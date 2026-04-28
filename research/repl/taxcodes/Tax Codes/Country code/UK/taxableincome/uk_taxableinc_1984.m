% Taxable Income in United Kingdom for the year
% 1984

function[taxableinc_p,taxableinc_s,taxableinc_c]=uk_taxableinc_1984(wage_principal,wage_spouse,children,married,basic_all,married_all,singleparent_all)

taxableinc_p=max(0,wage_principal-basic_all);
taxableinc_s=max(0,wage_spouse-basic_all);

if married==0 && children>0
    taxableinc_p = max(0,taxableinc_p-singleparent_all);
end

%Joint Taxation , married couple allowance taken into account
if married==1
    taxableinc_c=max(0,taxableinc_p+taxableinc_s-married_all); %taxable income of the couple
else
    taxableinc_c=0;
end


end
