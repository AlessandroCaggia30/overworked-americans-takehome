% Taxable Income in United States for the year
% 2008

function[taxableinc]=us_taxableinc_2008(wage_principal,wage_spouse,married,children,single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,ded_unit)

%Basic allowance and personal exemption
if married==0 && children==0
    basic_all=single_all+ pers_exem+dep_exemption*children - (ded_rate/ded_unit)*max(0,(wage_principal-exemlim_s));
else if married==0 && children>0
        basic_all=hh_all +pers_exem+dep_exemption*children - (ded_rate/ded_unit)*max(0,(wage_principal-exemlim_hh));
    else if married==1
            basic_all=married_all +pers_exem*2+dep_exemption*children - (ded_rate/ded_unit)*max(0,(wage_principal-exemlim_m));
        end
    end
end


taxableinc=wage_principal+wage_spouse-basic_all;


%Basic allowance and personal exemption
if married==0 && children==0
    basic_all=single_all+ pers_exem+dep_exemption*children - ded_rate*max(0,(wage_principal-exemlim_s));
else if married==0 && children>0
        basic_all=hh_all +pers_exem+dep_exemption*children - ded_rate*max(0,(wage_principal-exemlim_hh));
    else if married==1
            basic_all=married_all +pers_exem*2+dep_exemption*children - ded_rate*max(0,(wage_principal-exemlim_m));
        end
    end
end


taxableinc=wage_principal+wage_spouse-basic_all;


end

