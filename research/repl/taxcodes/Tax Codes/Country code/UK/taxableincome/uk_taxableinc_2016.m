% Taxable Income in United Kingdom for the year
% 2016

function[taxableinc_p,taxableinc_s]=uk_taxableinc_2016(wage_principal,wage_spouse,basic_all,basic_thres,married_all,taxbracket1,married)

%Basic allowance
if wage_principal<basic_thres
    if wage_spouse<basic_all && married==1 && wage_principal<(basic_all+taxbracket1)
        if wage_principal>wage_spouse
            taxableinc_p=wage_principal-basic_all-married_all;
        else
            taxableinc_p=wage_principal-basic_all+married_all;
        end
    else
        taxableinc_p=wage_principal-basic_all;
    end
else
    taxableinc_p=wage_principal-(max(0,basic_all-(wage_principal-basic_thres)/2));
end

    
    
if wage_spouse<basic_thres   
    if wage_principal<basic_all && married==1 && wage_spouse<(basic_all+taxbracket1)
        if wage_principal<wage_spouse
            taxableinc_s=wage_spouse-basic_all-married_all;
        else
            taxableinc_s=wage_spouse-basic_all+married_all;
        end
    else
        taxableinc_s=wage_spouse-basic_all;
    end    
else
    taxableinc_s=wage_spouse-(max(0,basic_all-(wage_spouse-basic_thres)/2));
end

end

