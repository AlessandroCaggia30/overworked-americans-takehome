%Taxation in France in year 2014

function[inctax,socsec,benefit,netincome,ssc_empr]=tax_fr_2014(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,decote_sing,decote_mar,child_ben1,child_ben2,ppe_lim1,ppe_lim2,ppe_lim3,ppe_lim4,ppe_lim5,ppe_r1,ppe_r2,ppe_r3,ppe_extraperson,ppe_ch1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,minrevtp,limit_demipart,limit_sp_demipart1,crds_special,csa,csg_crds_abat,cehr_rate1,cehr_rate2,cehr_ceil1,cehr_ceil2,cice_red,cice_max]=fr_parameters_2014;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec,ssc_empr] =fr_socsec_2014(wage_principal,wage_spouse,pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr,penex_empr,penex2_empr,others_empr1,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,minrevtp,csa,cice_red,cice_max);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[gross_taxable_income,csg_all_principal,csg_all_spouse]=fr_taxableinc_2012(wage_principal,wage_spouse,ssc_ceil,socsec,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,csg_crds_abat);

% ************************** 3) TAXATION ***************************************************************************


inctax=fr_tax_2014(gross_taxable_income,csg_all_principal,csg_all_spouse,(wage_principal + wage_spouse),wage_principal,wage_spouse,married,children,ssc_ceil,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,decote_sing,decote_mar,ppe_lim1,ppe_lim2,ppe_lim3,ppe_lim4,ppe_lim5,ppe_r1,ppe_r2,ppe_r3,ppe_extraperson,ppe_ch1,limit_demipart,limit_sp_demipart1,csg_crds_abat,cehr_rate1,cehr_rate2,cehr_ceil1,cehr_ceil2 );

       
%******************** 5)BENEFITS*********************************************************************

% Child Benefit

benefit_gross= max(0,min(children-1,1))*child_ben1 + max(0,children-2)*child_ben2;
benefit=round(benefit_gross-(benefit_gross*crds_special));

netincome=wage_principal+wage_spouse -inctax-socsec+benefit;

end
