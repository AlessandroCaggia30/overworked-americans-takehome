%Taxation in France in year 2015

function[inctax,socsec,benefit,netincome,ssc_empr]=tax_fr_2015(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,decote_sing,decote_mar,decote_pente,child_ben1,child_ben2,cb_c1,cb_c2,cb_ceil_extra_c,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr1,fam_empr2,penex_empr,penex2_empr,others_empr1,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,minrevtp,limit_demipart,limit_sp_demipart1,crds_special,csa,csg_crds_abat,cehr_rate1,cehr_rate2,cehr_ceil1,cehr_ceil2,cice_red,cice_max]=fr_parameters_2015;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec,ssc_empr] =fr_socsec_2015(wage_principal,wage_spouse,pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr1,fam_empr2,penex_empr,penex2_empr,others_empr1,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,minrevtp,csa,cice_red,cice_max);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[gross_taxable_income,csg_all_principal,csg_all_spouse]=fr_taxableinc_2012(wage_principal,wage_spouse,ssc_ceil,socsec,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,csg_crds_abat);

% ************************** 3) TAXATION ***************************************************************************


inctax=fr_tax_2015(gross_taxable_income,csg_all_principal,csg_all_spouse,wage_principal,wage_spouse,married,children,ssc_ceil,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,decote_sing,decote_mar,decote_pente,limit_demipart,limit_sp_demipart1,csg_crds_abat,cehr_rate1,cehr_rate2,cehr_ceil1,cehr_ceil2 );

       
%******************** 5)BENEFITS*********************************************************************

% Child Benefit

benefit_gross= max(0,min(children-1,1))*child_ben1 + max(0,children-2)*child_ben2;

if gross_taxable_income<(cb_c1+cb_ceil_extra_c*children)
    benefit_gross=benefit_gross*1;
elseif gross_taxable_income<=(cb_c2+cb_ceil_extra_c*children)
    benefit_gross=benefit_gross*(0.5+0.5/2);
else 
    benefit_gross=benefit_gross*(0.5+0.25/2);    
end

benefit=round(benefit_gross-(benefit_gross*crds_special));

netincome=wage_principal+wage_spouse -inctax-socsec+benefit;

end
