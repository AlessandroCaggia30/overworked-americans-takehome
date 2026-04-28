% Taxation in Belgium in year 1987
%uses social security function of 1999
%uses tax function 1988
function[inctax,local_tax,socsec,benefit,netincome,ssc_empr]=tax_be_1987(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,workall_max,workall_lim1,workall_lim2,workall_r1,workall_r2,workall_r3 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,max_rate,quote_r,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,cb_1,cb_2,cb_3,ssc_empr_r]=be_parameters_1987;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   

[socsec,ssc_p ,ssc_s , workall_p , workall_s,ssc_empr]=be_socsec_1987(wage_principal,wage_spouse,ssc_r,workall_max,workall_lim1,workall_lim2,workall_r1,workall_r2,workall_r3,ssc_empr_r);
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

% ************************** 3) TAXATION ***************************************************************************

[inctax,local_tax]=be_tax_1988(wage_principal , wage_spouse ,married,children,ssc_p ,ssc_s ,workall_p , workall_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,max_rate,quote_r,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r);

       
%******************** 5)BENEFITS*********************************************************************


benefit=min(children,1)*cb_1 + max(0,min(children-1,1))*cb_2+ max(0,children-2)*cb_3;

netincome=wage_principal+wage_spouse -inctax-local_tax-socsec+benefit;

end
