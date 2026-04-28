% Taxation in Portugal in year 1994

function[inctax,socsec_p,socsec_s,benefit,netincome,socsec_emp]=tax_pt_1994(wage_principal,wage_spouse,married,children)
%uses taxable income  function of 2000 

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,perc,max_all,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,married_cred,single_cred,child_cred,child_ben,taxinc_var,ssc_emp_r]=pt_parameters_1994;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,socsec_s,socsec_emp] =pt_socsec_2000(wage_principal,wage_spouse,ssc_r,ssc_emp_r);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[taxable_income]=pt_taxableinc_2000(wage_principal,wage_spouse,socsec_p,socsec_s,perc,max_all);

% ************************** 3) TAXATION ***************************************************************************

inctax=pt_tax_1996(taxable_income,married,wage_principal,wage_spouse,children,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,married_cred,single_cred,child_cred ,taxinc_var);
     
%******************** 5)BENEFITS*********************************************************************

% Child Benefit
benefit= children*child_ben;


netincome=wage_principal+wage_spouse-inctax-socsec_p-socsec_s +benefit;

end
