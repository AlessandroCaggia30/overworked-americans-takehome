%  Taxation in United States for the year 2009

function[inctax,localtax,socsec_p,socsec_s,benefit,netincome,statetax,emp_ssc]=tax_us_2009(wage_principal,wage_spouse,married,children)

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,chcrd_max,chcrd_rdn,chcrd_thrsh_oth,chcrd_thrsh_m,chcrd_ref_perct,chcrd_ref_thresh,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,unemp_r,unemp_max,ded_unit,unemp_dedn_rate,mich_unemp_rate,mich_unemp_max,r3,inclim3,threshold_s3,threshold_m3,phaseout3,mwp_r,mwp_max,mwp_thresh,mwp_taper]=us_parameters_2009;

%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[taxable_inc]=us_taxableinc_2008(wage_principal,wage_spouse,married,children,single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,ded_unit);

% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,emp_socsec_p] =us_socsec_2009(wage_principal ,pen_fixed,pen_var,pen_limit,unemp_r,unemp_max,mich_unemp_rate,mich_unemp_max);
[socsec_s,emp_socsec_s] =us_socsec_2009(wage_spouse ,pen_fixed,pen_var,pen_limit,unemp_r,unemp_max,mich_unemp_rate,mich_unemp_max);
	
emp_ssc=emp_socsec_p+emp_socsec_s;

% ************************** 3) TAXATION ***************************************************************************

[inctax,localtax,statetax]=us_tax_2009(taxable_inc,wage_principal,wage_spouse,married,children,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,chcrd_max,chcrd_rdn,chcrd_thrsh_oth,chcrd_thrsh_m,chcrd_ref_perct,chcrd_ref_thresh,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,r3,inclim3,threshold_s3,threshold_m3,phaseout3,mwp_r,mwp_max,mwp_thresh,mwp_taper,unemp_max,unemp_dedn_rate);
                
%******************** 5)BENEFITS*********************************************************************
%No cash benefits
benefit=0;

netincome=round(wage_principal+wage_spouse -inctax-localtax-socsec_p-socsec_s);

end
