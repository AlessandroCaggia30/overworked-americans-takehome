%  Taxation in Portugal in year 1997

function[inctax,socsec_p,socsec_s,benefit,netincome,socsec_emp]=tax_pt_1997(wage_principal,wage_spouse,married,children)
%uses socialsecurity and taxable income  function of 2000 because they
%are the same

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,perc,max_all,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,married_cred,single_cred,child_cred ,echelon1,echelon2,chben_e1_1,chben_e1_2,chben_e2_1,chben_e2_2,chben_e3_1,chben_e3_2,ssc_emp_r]=pt_parameters_1997;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,socsec_s, socsec_emp] =pt_socsec_2000(wage_principal,wage_spouse,ssc_r,ssc_emp_r);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[taxable_income]=pt_taxableinc_2000(wage_principal,wage_spouse,socsec_p,socsec_s,perc,max_all);

% ************************** 3) TAXATION ***************************************************************************

inctax=pt_tax_1998(taxable_income,married,children,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,married_cred,single_cred,child_cred );
     
%******************** 5)BENEFITS*********************************************************************

% Child Benefit
if (wage_principal+wage_spouse)<=echelon1
    benefit=min(2,children)*chben_e1_1+max(0,children-2)*chben_e1_2;
else if (wage_principal+wage_spouse)>echelon1 &&(wage_principal+wage_spouse)<=echelon2
        benefit=min(2,children)*chben_e2_1+max(0,children-2)*chben_e2_2;
    else 
        benefit=min(2,children)*chben_e3_1+max(0,children-2)*chben_e3_2;
    end
end



netincome=wage_principal+wage_spouse-inctax-socsec_p-socsec_s +benefit;

end
