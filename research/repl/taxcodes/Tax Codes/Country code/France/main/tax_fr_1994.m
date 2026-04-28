%  Taxation in France in year 1994

function[inctax,socsec,benefit,netincome]=tax_fr_1994(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_max,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,noded_r,child_ben1,child_ben2  ]=fr_parameters_1994;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec] =fr_socsec_1993(wage_principal,wage_spouse,pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[gross_taxable_income]=fr_taxableinc_1993((wage_principal+wage_spouse),socsec,workall_min,workall_max,workall_r,basicall_r);

% ************************** 3) TAXATION ***************************************************************************


inctax=fr_tax_1993(gross_taxable_income,(wage_principal + wage_spouse),married,children,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,noded_r );

       
%******************** 5)BENEFITS*********************************************************************

% Child Benefit

benefit= max(0,min(children-1,1))*child_ben1 + max(0,children-2)*child_ben2;

netincome=wage_principal+wage_spouse -inctax-socsec+benefit;

end
