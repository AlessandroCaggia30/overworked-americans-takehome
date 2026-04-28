%  Taxation in France in year 1986

function[inctax,socsec,benefit,netincome]=tax_fr_1986(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,child_ben1,child_ben2,socexcep_r,socexcep_limit,tax_limit,tax_red ]=fr_parameters_1986;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec] =fr_socsec_1986(wage_principal,wage_spouse,pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[gross_taxable_income]=fr_taxableinc_1986((wage_principal+wage_spouse),socsec,workall_min,workall_r,basicall_r);

% ************************** 3) TAXATION ***************************************************************************


inctax=fr_tax_1986(gross_taxable_income,(wage_principal + wage_spouse),married,children,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_limit,tax_red );

       
%******************** 5)BENEFITS*********************************************************************
%Exceptional Social contribution
if inctax>socexcep_limit
    soc_excep=round(socexcep_r*gross_taxable_income);
else
    soc_excep=0;
end

socsec=socsec+soc_excep;


% Child Benefit

benefit= max(0,min(children-1,1))*child_ben1 + max(0,children-2)*child_ben2;

netincome=wage_principal+wage_spouse -inctax-socsec+benefit;

end
