% Taxation in France in year 2016

function[incometax,socsec,benefit,netincome,ssc_empr]=tax_fr_2016(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,decote_sing,decote_mar,decote_pente,red_taux,red_seuil_1,red_seuil_2,red_seuil_dp,child_ben1,child_ben2,cb_c1,cb_c2,cb_isol,cb_ceil_extra_c,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr1,fam_empr2,penex_empr,penex2_empr,others_empr1,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,ssc_empr_smic2,limit_demipart,limit_sp_demipart1,crds_special,csa,csg_crds_abat,cehr_rate1,cehr_rate2,cehr_ceil1,cehr_ceil2,cice_red,cice_max,pa_forf,pa_maj1,pa_maj2,pa_maj3,pa_maj_isol1,pa_maj_isol2,pa_pct,pa_bonus,pa_bonus1,pa_bonus2,pa_forf_logement1,pa_forf_logement2,pa_forf_logement3]=fr_parameters_2016;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec,ssc_principal, ssc_spouse, ssc_empr] =fr_socsec_2016(wage_principal,wage_spouse,pension_r,penex_r,penex_r2,penwidow_r,ssc_ceil,sick_r,unemp_r1,pens_empr1,pens_empr2,sick_empr,unemp_empr,accid_empr,smic,fam_empr1,fam_empr2,penex_empr,penex2_empr,others_empr1,ssc_empr_redr2,ssc_empr_red_max,ssc_empr_smic_ref,ssc_empr_smic2,csa,cice_red,cice_max);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[gross_taxable_income,csg_all_principal,csg_all_spouse,wage_dec,wage_dec_principal,wage_dec_spouse]=fr_taxableinc_2016(wage_principal,wage_spouse,ssc_ceil,ssc_principal, ssc_spouse,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,csg_crds_abat);

% ************************** 3) TAXATION ***************************************************************************


[incometax,cs_noded_principal,cs_noded_spouse]=fr_tax_2016(gross_taxable_income,csg_all_principal,csg_all_spouse,wage_principal,wage_spouse,married,children,ssc_ceil,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,decote_sing,decote_mar,decote_pente,red_taux,red_seuil_1,red_seuil_2,red_seuil_dp,limit_demipart,limit_sp_demipart1,csg_crds_abat,cehr_rate1,cehr_rate2,cehr_ceil1,cehr_ceil2 );

       
%******************** 5)BENEFITS*********************************************************************

% Child Benefit
benefit_gross= max(0,min(children-1,1))*child_ben1 + max(0,children-2)*child_ben2;

if gross_taxable_income<(cb_c1+cb_ceil_extra_c*(children-2))
    benefit_gross=benefit_gross*1;
elseif gross_taxable_income<=(cb_c2+cb_ceil_extra_c*(children-2))
    benefit_gross=benefit_gross*0.5;
else 
    benefit_gross=benefit_gross*0.25;    
end

if married==0 && children>0
    benefit_gross=benefit_gross+cb_isol*children;
end

%In Work Benefit
if married==0 && children>0
    isolated=1;
else
    isolated=0;
end

if isolated==1
    inwork_cr=12*pa_forf*(1+pa_maj_isol1+pa_maj_isol2*children)+pa_pct*(wage_dec-cs_noded_principal-cs_noded_spouse);
else
   inwork_cr=12*pa_forf*(1+max(married,0)*pa_maj1+pa_maj2*min(1,max(3-children,0))*children+pa_maj3*min(1,max(children-2,0))*(children-2))+pa_pct*(wage_dec-cs_noded_principal-cs_noded_spouse);
end

if pa_bonus1*smic<(wage_dec_principal-cs_noded_principal) && pa_bonus2*smic>(wage_dec_principal-cs_noded_principal)
    inwork_cr=inwork_cr+pa_bonus*pa_forf/(pa_bonus2-pa_bonus1)*12*(wage_dec_principal-cs_noded_principal)/(smic-pa_bonus1);
else
    inwork_cr=inwork_cr+0;
end

if pa_bonus1*smic<(wage_dec_spouse-cs_noded_spouse) && pa_bonus2*smic>(wage_dec_spouse-cs_noded_spouse)
    inwork_cr=inwork_cr+pa_bonus*pa_forf/(pa_bonus2-pa_bonus1)*12*(wage_dec_spouse-cs_noded_spouse)/(smic-pa_bonus1);
else
    inwork_cr=inwork_cr+0;
end   

if pa_bonus2*smic<=(wage_dec_principal-cs_noded_principal)
    inwork_cr=inwork_cr+pa_bonus*pa_forf*12;
else
    inwork_cr=inwork_cr+0;
end

if pa_bonus2*smic<=(wage_dec_spouse-cs_noded_spouse)
    inwork_cr=inwork_cr+pa_bonus*pa_forf*12;
else
    inwork_cr=inwork_cr+0;
end

if married+children==0
    inwork_cr_int=pa_forf_logement1*pa_forf*12;
elseif married+children==1
   inwork_cr_int=pa_forf_logement2*pa_forf*1.5*12;
else
    inwork_cr_int=pa_forf_logement3*pa_forf*1.8*12;
end


if married==0 && children==0
    inwork_cr_int2=12*pa_forf*(1+pa_maj_isol1+pa_maj_isol2*children);
else
   inwork_cr_int2=pa_forf*12*(1+max(married,0)*pa_maj1+pa_maj2*min(1,max(3-children,0))*children+pa_maj3*min(1,max(children-2,0))*(children-2));
end

inwork_cr2= inwork_cr-max(wage_dec-(cs_noded_principal+cs_noded_spouse)+(benefit_gross-max(isolated,0)*cb_isol*children*(1-(0.225/0.2815)))+inwork_cr_int,inwork_cr_int2);

inwork_cr2=max(inwork_cr2,0);

benefit=round(benefit_gross-(benefit_gross*crds_special)+inwork_cr2);

netincome=wage_principal+wage_spouse -incometax-socsec+benefit;

end
