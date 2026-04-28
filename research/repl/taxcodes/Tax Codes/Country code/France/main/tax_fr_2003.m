% Taxation in France in year 2003

function[inctax,socsec,benefit,netincome,ssc_empr]=tax_fr_2003(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,csgded_r,decote,child_ben1,child_ben2 ,ppe_lim1,ppe_lim2,ppe_lim3,ppe_lim4,ppe_lim5,ppe_r1,ppe_r2,ppe_r3,ppe_extraperson,ppe_ch1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,others_empr2,limit_demipart,limit_sp_demipart1,crds_special ]=fr_parameters_2003;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec, ssc_empr] =fr_socsec_2003(wage_principal,wage_spouse,pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,unemp_r2,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,others_empr2);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[gross_taxable_income]=fr_taxableinc_2003((wage_principal+wage_spouse),socsec,workall_min,workall_max,workall_r,basicall_r,csg_ded_r);

% ************************** 3) TAXATION ***************************************************************************


inctax=fr_tax_2003(gross_taxable_income,(wage_principal + wage_spouse),wage_principal,wage_spouse,married,children,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,csgded_r,decote,ppe_lim1,ppe_lim2,ppe_lim3,ppe_lim4,ppe_lim5,ppe_r1,ppe_r2,ppe_r3,ppe_extraperson,ppe_ch1,limit_demipart,limit_sp_demipart1  );

       
%******************** 5)BENEFITS*********************************************************************

% Child Benefit

benefit_gross= max(0,min(children-1,1))*child_ben1 + max(0,children-2)*child_ben2;
benefit=round(benefit_gross-(benefit_gross*crds_special));

netincome=wage_principal+wage_spouse -inctax-socsec+benefit;

end
