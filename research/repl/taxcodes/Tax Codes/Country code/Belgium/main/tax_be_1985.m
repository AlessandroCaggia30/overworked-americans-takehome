%Taxation in Belgium in year 1985
%uses social security function of 1988
%uses tax function 1985
function[inctax,local_tax,socsec,benefit,netincome,ssc_empr]=tax_be_1985(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,workall_max,workall_lim1,workall_lim2,workall_r1,workall_r2,workall_r3 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,taxbracket14,taxbracket15,taxbracket16,taxbracket17,taxbracket18,taxbracket19,taxbracket20,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,tax_r15,tax_r16,tax_r17,tax_r18,tax_r19,tax_r20,tax_r21,quote_r,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,local_r,cb_1,cb_2,cb_3,cb_4,cb_5,ssc_empr_r]=be_parameters_1985;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   

[socsec,ssc_p ,ssc_s , workall_p , workall_s,ssc_empr]=be_socsec_1987(wage_principal,wage_spouse,ssc_r,workall_max,workall_lim1,workall_lim2,workall_r1,workall_r2,workall_r3,ssc_empr_r);
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

% ************************** 3) TAXATION ***************************************************************************

[inctax,local_tax]=be_tax_1985(wage_principal , wage_spouse ,married,children,ssc_p ,ssc_s ,workall_p , workall_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,taxbracket14,taxbracket15,taxbracket16,taxbracket17,taxbracket18,taxbracket19,taxbracket20,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,tax_r15,tax_r16,tax_r17,tax_r18,tax_r19,tax_r20,tax_r21,quote_r,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,local_r);

       
%******************** 5)BENEFITS*********************************************************************


benefit=min(children,1)*cb_1 + max(0,min(children-1,1))*cb_2  +max(0,min(children-2,1))*cb_3 +max(0,min(children-3,1))*cb_4  +max(0,children-4)*cb_5;

netincome=wage_principal+wage_spouse -inctax-local_tax-socsec+benefit;

end
