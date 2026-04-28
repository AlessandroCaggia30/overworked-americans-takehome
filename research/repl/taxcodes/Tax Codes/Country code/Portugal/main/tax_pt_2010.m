% Taxation in Portugal in year 2010

function[inctax,socsec_p,socsec_s,benefit,netincome,socsec_emp]=tax_pt_2010(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,perc,max_all,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,married_cred,single_cred,child_cred ,singlepar_cred,echelon1,echelon2,echelon3,echelon4,echelon5,chben_e1,chben_e2,chben_e3,chben_e4,chben_e5,ssc_emp_r]=pt_parameters_2010;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,socsec_s,socsec_emp] =pt_socsec_2000(wage_principal,wage_spouse,ssc_r,ssc_emp_r);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[taxable_income]=pt_taxableinc_2000(wage_principal,wage_spouse,socsec_p,socsec_s,perc,max_all);

% ************************** 3) TAXATION ***************************************************************************

inctax=pt_tax_2010(taxable_income,wage_principal,wage_spouse,married,children,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,married_cred,single_cred,child_cred ,singlepar_cred);
     
%******************** 5)BENEFITS*********************************************************************

% Child Benefit
refincome=((wage_principal+wage_spouse)/(children+1));

if refincome<=echelon1
    benefit=round(children*chben_e1);
else if refincome>echelon1 && refincome<=echelon2
        benefit=round(children*chben_e2);
    else if refincome>echelon2 && refincome<=echelon3
        benefit=round(children*chben_e3);
        else if refincome >echelon3 && refincome<=echelon4
            benefit=round(children*chben_e4);
             else if refincome>echelon4 && refincome<=echelon5
                     benefit=round(children*chben_e5);
            else
                benefit=0;
                 end
            end
        end
    end
end

if married==0 && children>0
    benefit=benefit*1.2;
else
    benefit=benefit*1;
end

benefit=round(benefit);


netincome=wage_principal+wage_spouse-inctax-socsec_p-socsec_s +benefit;

end
