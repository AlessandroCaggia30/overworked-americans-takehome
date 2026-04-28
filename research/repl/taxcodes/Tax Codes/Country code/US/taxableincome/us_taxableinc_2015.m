% Taxable Income in United States for the year
% 2015

function[taxableinc]=us_taxableinc_2015(wage_principal,wage_spouse,married,children,single_all,hh_all,married_all,dep_exemption,pers_exem,ded_rate,ded_unit,exemlim_s,exemlim_hh,exemlim_m)

%Basic allowance and personal exemption
if married==0 && children==0
    basic_all=single_all+ pers_exem+dep_exemption*children-max(0,wage_principal+wage_spouse-exemlim_s)/ded_unit*ded_rate*pers_exem;
else if married==0 && children>0
        basic_all=hh_all +pers_exem+dep_exemption*children-max(0,wage_principal+wage_spouse-exemlim_hh)/ded_unit*ded_rate*(pers_exem+children*dep_exemption) ;
    else if married==1
            basic_all=married_all +pers_exem*2+dep_exemption*children-max(0,wage_principal+wage_spouse-exemlim_m)/ded_unit*ded_rate*(2*pers_exem+children*dep_exemption);
        end
    end
end

taxableinc=wage_principal+wage_spouse-basic_all;



end

