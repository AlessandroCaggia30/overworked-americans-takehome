%Taxation in Belgium in year 1993
%uses social security function of 1999
%uses tax function 1998
function[inctax,local_tax,socsec,benefit,netincome,ssc_empr]=tax_be_1993(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,tax_r,local_r,cb_1,cb_2,cb_3,ssc_empr_r]=be_parameters_1993;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   

[socsec,ssc_p ,ssc_s , workall_p , workall_s,ssc_empr] =be_socsec_1989(wage_principal,wage_spouse,ssc_r,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2,ssc_empr_r);	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

% ************************** 3) TAXATION ***************************************************************************

[inctax,local_tax]=be_tax_1998(wage_principal , wage_spouse,married,children,ssc_p ,ssc_s ,workall_p , workall_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,tax_r,local_r );

       
%******************** 5)BENEFITS*********************************************************************


benefit=min(children,1)*cb_1 + max(0,min(children-1,1))*cb_2+ max(0,min(children-2,1))*cb_3;

netincome=wage_principal+wage_spouse -inctax-local_tax-socsec+benefit;

end
