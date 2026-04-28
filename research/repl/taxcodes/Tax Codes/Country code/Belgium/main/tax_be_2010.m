%Taxation in Belgium in year 2010
%uses tax 2008
%socsec 2009
function[inctax,local_tax,socsec,benefit,netincome,ssc_empr]=tax_be_2010(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,socsec_lim4,sscred_r,sscred_r2,sscred_r3,sscred_r4,sscred_r5,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3]=be_parameters_2010;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   

[socsec,ssc_p ,ssc_s , workall_p , workall_s, ssc_empr]=be_socsec_2009(wage_principal,wage_spouse,ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,socsec_lim4,sscred_r,sscred_r2,sscred_r3,sscred_r4,sscred_r5,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3);	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

% ************************** 3) TAXATION ***************************************************************************

[inctax,local_tax]=be_tax_2008(wage_principal , wage_spouse ,married,children,ssc_p ,ssc_s ,workall_p , workall_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4);

       
%******************** 5)BENEFITS*********************************************************************

benefit=round(min(children,1)*cb_1 + max(0,min(children-1,1))*cb_2+ max(0,min(children-2,1))*cb_3);

netincome=wage_principal+wage_spouse -inctax-local_tax-socsec+benefit;

end
