% Taxation in Portugal in year 1989

function[inctax,socsec_p,socsec_s,benefit,netincome,socsec_emp]=tax_pt_1989(wage_principal,wage_spouse,married,children)
%uses socialsecurity function of 2000 because they
%are the same
%uses taxableincome function of 1993
%uses tax function of 1990
%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,perc,max_all,single_all,married_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,married_cred,single_cred,child_cred ,child_ben,taxinc_var,ssc_emp_r]=pt_parameters_1989;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,socsec_s,socsec_emp] =pt_socsec_2000(wage_principal,wage_spouse,ssc_r,ssc_emp_r);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[taxable_income]=pt_taxableinc_1993(wage_principal,wage_spouse,married,socsec_p,socsec_s,perc,max_all,single_all,married_all);

% ************************** 3) TAXATION ***************************************************************************

inctax=pt_tax_1990(taxable_income,married,wage_principal,wage_spouse,children,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,married_cred,single_cred,child_cred,taxinc_var );
     
%******************** 5)BENEFITS*********************************************************************

% Child Benefit
benefit= children*child_ben;


netincome=wage_principal+wage_spouse-inctax-socsec_p-socsec_s +benefit;

end
