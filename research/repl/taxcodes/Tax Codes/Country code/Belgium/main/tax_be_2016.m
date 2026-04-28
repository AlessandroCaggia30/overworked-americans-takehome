%Taxation in Belgium in year 2016
%uses tax 2016
%socsec 2016
function[inctax,local_tax,socsec,benefit,netincome,ssc_empr,region_tax,family_credit,spouse_credit]=tax_be_2016(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_r1,workall_r2,workall_r3,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2 ,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,cb_1,cb_2,cb_3,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3,prp_red,lic_r, lic_max,add_local_r,red_r,reg_r,ex_lim1,ex_lim2,ex_lim3,ex_lim4,ex_r1,ex_r2,ex_r3,ex_r4,ex_r5]=be_parameters_2016;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   

[socsec,ssc_p ,ssc_s , workall_p , workall_s,ssc_empr, red_p,red_s]=be_socsec_2016(wage_principal,wage_spouse,ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_r1,workall_r2,workall_r3,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,sscred_empr_r,sscred_empr_r2,sscred_empr_r3, prp_red);	

%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

% ************************** 3) TAXATION ***************************************************************************

[inctax,local_tax,region_tax,family_credit,spouse_credit]=be_tax_2016(wage_principal ,wage_spouse,married,children,ssc_p ,ssc_s ,red_p,red_s,workall_p , workall_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4, lic_r, lic_max,add_local_r,reg_r, red_r,ex_lim1,ex_lim2,ex_lim3,ex_lim4,ex_r1,ex_r2,ex_r3,ex_r4,ex_r5);

       
%******************** 5)BENEFITS*********************************************************************

benefit=round(min(children,1)*cb_1 + max(0,min(children-1,1))*cb_2+ max(0,min(children-2,1))*cb_3);

netincome=wage_principal+wage_spouse -inctax-local_tax-socsec+benefit;

end
