% Taxable Income in United Kingdom for the year
% 2010

function[taxableinc_p,taxableinc_s]=uk_taxableinc_2010(wage_principal,wage_spouse,basic_all,basic_thres)

%Basic allowance
if wage_principal<basic_thres
    taxableinc_p=wage_principal-basic_all;
else
    taxableinc_p=wage_principal-(max(0,basic_all-(wage_principal-basic_thres)/2));
end

    
    
if wage_spouse<basic_thres    
    taxableinc_s=wage_spouse-basic_all;
else
    taxableinc_s=wage_spouse-(max(0,basic_all-(wage_spouse-basic_thres)/2));
end


end
