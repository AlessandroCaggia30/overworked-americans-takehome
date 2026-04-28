% Taxable Income in United States for the year
% 2010

function[taxableinc]=us_taxableinc_2010(wage_principal,wage_spouse,married,children,single_all,hh_all,married_all,dep_exemption,pers_exem)

%Basic allowance and personal exemption
if married==0 && children==0
    basic_all=single_all+ pers_exem+dep_exemption*children;
else if married==0 && children>0
        basic_all=hh_all +pers_exem+dep_exemption*children ;
    else if married==1
            basic_all=married_all +pers_exem*2+dep_exemption*children;
        end
    end
end


taxableinc=wage_principal+wage_spouse-basic_all;



end

