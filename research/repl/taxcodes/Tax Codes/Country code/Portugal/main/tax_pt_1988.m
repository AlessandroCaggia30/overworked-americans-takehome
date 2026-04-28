% Taxation in Portugal in year 1988

function[inctax,socsec_p,socsec_s,benefit,netincome,socsec_emp]=tax_pt_1988(wage_principal,wage_spouse,married,children)
%uses socialsecurity function of 2000 because they
%are the same

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,perc,max_all,single_all,married_all,child_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,singtb1,singtb2,singtb3,singtb4,singtb5,singtb6,singtb7,singtb8,singtb9,singtb10,singtb11,sint_r1,sint_r2,sint_r3,sint_r4,sint_r5,sint_r6,sint_r7,sint_r8,sint_r9,sint_r10,sint_r11,sint_r12,martb1,martb2,martb3,martb4,martb5,martb6,martb7,martb8,martb9,martb10,martb11,mart_r1,mart_r2,mart_r3,mart_r4,mart_r5,mart_r6,mart_r7,mart_r8,mart_r9,mart_r10,mart_r11,mart_r12,child_ben,ssc_emp_r]=pt_parameters_1988;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,socsec_s,socsec_emp] =pt_socsec_2000(wage_principal,wage_spouse,ssc_r,ssc_emp_r);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[taxable_income]=pt_taxableinc_1988(wage_principal,wage_spouse,married,children,socsec_p,socsec_s,perc,max_all,single_all,married_all,child_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11);

% ************************** 3) TAXATION ***************************************************************************

inctax=pt_tax_1988(taxable_income,married,wage_principal,wage_spouse,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,singtb1,singtb2,singtb3,singtb4,singtb5,singtb6,singtb7,singtb8,singtb9,singtb10,singtb11,sint_r1,sint_r2,sint_r3,sint_r4,sint_r5,sint_r6,sint_r7,sint_r8,sint_r9,sint_r10,sint_r11,sint_r12,martb1,martb2,martb3,martb4,martb5,martb6,martb7,martb8,martb9,martb10,martb11,mart_r1,mart_r2,mart_r3,mart_r4,mart_r5,mart_r6,mart_r7,mart_r8,mart_r9,mart_r10,mart_r11,mart_r12);
     
%******************** 5)BENEFITS*********************************************************************

% Child Benefit
benefit= children*child_ben;


netincome=wage_principal+wage_spouse-inctax-socsec_p-socsec_s +benefit;

end
