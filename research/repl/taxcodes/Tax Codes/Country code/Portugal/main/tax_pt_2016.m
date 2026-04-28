% Taxation in Portugal in year 2016

function[inctax,socsec_p,socsec_s,benefit,netincome,socsec_emp]=tax_pt_2016(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,perc,max_all,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,child_cred,echelon1,echelon2,echelon3,chben_e1,chben_e2,chben_e3,ssc_emp_r,surtax_r,ch_ben_lone, surtax_r2,surtax_thrs,add_surtax_cred,mw,add_surtax_r1,add_surtax_r2,add_surtax_r3,add_surtax_r4,add_surtax_r5,add_surtax_bracket1,add_surtax_bracket2,add_surtax_bracket3,add_surtax_bracket4] = pt_parameters_2016;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,socsec_s,socsec_emp] =pt_socsec_2000(wage_principal,wage_spouse,ssc_r,ssc_emp_r);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[taxable_income_joint,taxable_income_p,taxable_income_s]=pt_taxableinc_2016(wage_principal,wage_spouse,socsec_p,socsec_s,perc,max_all);

% ************************** 3) TAXATION ***************************************************************************

[inctax]=pt_tax_2016(taxable_income_joint,taxable_income_p,taxable_income_s,wage_principal,wage_spouse,married,children,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,child_cred, surtax_r,surtax_r2,surtax_thrs, add_surtax_cred,mw,add_surtax_r1,add_surtax_r2,add_surtax_r3,add_surtax_r4,add_surtax_r5,add_surtax_bracket1,add_surtax_bracket2,add_surtax_bracket3,add_surtax_bracket4);
     
%******************** 5)BENEFITS*********************************************************************

% Child Benefit
refincome=((wage_principal+wage_spouse)/(children+1));

if refincome<=echelon1
    benefit=round(children*chben_e1);
else if refincome>echelon1 && refincome<=echelon2
        benefit=round(children*chben_e2);
    else if refincome>echelon2 && refincome<=echelon3
        benefit=round(children*chben_e3);
            else
                benefit=0;
        end
    end
end

if married==0 && children>0
    benefit=round(benefit*(1+ch_ben_lone));
else
    benefit=round(benefit*1);
end


netincome=wage_principal+wage_spouse-inctax-socsec_p-socsec_s +benefit;

end
