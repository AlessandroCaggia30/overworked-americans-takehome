%  Taxation in Portugal in year 2002

function[inctax,socsec_p,socsec_s,benefit,netincome,socsec_emp]=tax_pt_2002(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,perc,max_all,tax_floor,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,married_cred,single_cred,child_cred ,singlepar_cred,echelon1,echelon2,echelon3,chben_e1_1,chben_e1_2,chben_e2_1,chben_e2_2,chben_e3_1,chben_e3_2,chben_e4_1,chben_e4_2,ssc_emp_r]=pt_parameters_2002;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,socsec_s,socsec_emp] =pt_socsec_2000(wage_principal,wage_spouse,ssc_r,ssc_emp_r);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[taxable_income]=pt_taxableinc_2000(wage_principal,wage_spouse,socsec_p,socsec_s,perc,max_all);

% ************************** 3) TAXATION ***************************************************************************

inctax=pt_tax_2002(taxable_income,married,children,tax_floor,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,married_cred,single_cred,child_cred ,singlepar_cred);
     
%******************** 5)BENEFITS*********************************************************************

% Child Benefit

if (wage_principal+wage_spouse)<=echelon1
    benefit=round(min(2,children)*chben_e1_1+max(0,children-2)*chben_e1_2);
else if (wage_principal+wage_spouse)>echelon1 &&(wage_principal+wage_spouse)<=echelon2
        benefit=round(min(2,children)*chben_e2_1+max(0,children-2)*chben_e2_2);
    else if (wage_principal+wage_spouse)>echelon2 &&(wage_principal+wage_spouse)<=echelon3
        benefit=round(min(2,children)*chben_e3_1+max(0,children-2)*chben_e3_2);
        else
            benefit=round(min(2,children)*chben_e4_1+max(0,children-2)*chben_e4_2);
        end
    end
end








netincome=wage_principal+wage_spouse-inctax-socsec_p-socsec_s +benefit;

end
