%  Taxation in United States for the year 1985

function[inctax,localtax,socsec_p,socsec_s,benefit,netincome,statetax, emp_ssc]=tax_us_1985(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem,pen_fixed,pen_var,pen_limit,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_s6,taxbracket_s7,taxbracket_s8,taxbracket_s9,taxbracket_s10,taxbracket_s11,taxbracket_s12,taxbracket_s13,taxbracket_s14,taxbracket_s15,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_hh6,taxbracket_hh7,taxbracket_hh8,taxbracket_hh9,taxbracket_hh10,taxbracket_hh11,taxbracket_hh12,taxbracket_hh13,taxbracket_hh14,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,taxbracket_m6,taxbracket_m7,taxbracket_m8,taxbracket_m9,taxbracket_m10,taxbracket_m11,taxbracket_m12,taxbracket_m13,taxbracket_m14,tax_r1_s,tax_r2_s,tax_r3_s,tax_r4_s,tax_r5_s,tax_r6_s,tax_r7_s,tax_r8_s,tax_r9_s,tax_r10_s,tax_r11_s,tax_r12_s,tax_r13_s,tax_r14_s,tax_r15_s,tax_r16_s,tax_r1_hh,tax_r2_hh,tax_r3_hh,tax_r4_hh,tax_r5_hh,tax_r6_hh,tax_r7_hh,tax_r8_hh,tax_r9_hh,tax_r10_hh,tax_r11_hh,tax_r12_hh,tax_r13_hh,tax_r14_hh,tax_r15_hh,tax_r1_m,tax_r2_m,tax_r3_m,tax_r4_m,tax_r5_m,tax_r6_m,tax_r7_m,tax_r8_m,tax_r9_m,tax_r10_m,tax_r11_m,tax_r12_m,tax_r13_m,tax_r14_m,tax_r15_m,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,unemp_lim_emp,unemp_r_emp]=us_parameters_1985;


%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[taxable_inc]=us_taxableinc_1993(wage_principal,wage_spouse,married,children,single_all,exemlim_s,hh_all,exemlim_hh,married_all,exemlim_m,dep_exemption,ded_rate,pers_exem);

% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,emp_socsec_p] =us_socsec_1985(wage_principal,pen_fixed,pen_var,pen_limit,unemp_lim_emp,unemp_r_emp);
[socsec_s,emp_socsec_s] =us_socsec_1985(wage_spouse,pen_fixed,pen_var,pen_limit,unemp_lim_emp,unemp_r_emp);

emp_ssc=emp_socsec_p+emp_socsec_s;
	
% ************************** 3) TAXATION ***************************************************************************

[inctax,localtax,statetax]=us_tax_1986(taxable_inc,wage_principal,wage_spouse,married,children,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_s6,taxbracket_s7,taxbracket_s8,taxbracket_s9,taxbracket_s10,taxbracket_s11,taxbracket_s12,taxbracket_s13,taxbracket_s14,taxbracket_s15,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_hh6,taxbracket_hh7,taxbracket_hh8,taxbracket_hh9,taxbracket_hh10,taxbracket_hh11,taxbracket_hh12,taxbracket_hh13,taxbracket_hh14,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,taxbracket_m6,taxbracket_m7,taxbracket_m8,taxbracket_m9,taxbracket_m10,taxbracket_m11,taxbracket_m12,taxbracket_m13,taxbracket_m14,tax_r1_s,tax_r2_s,tax_r3_s,tax_r4_s,tax_r5_s,tax_r6_s,tax_r7_s,tax_r8_s,tax_r9_s,tax_r10_s,tax_r11_s,tax_r12_s,tax_r13_s,tax_r14_s,tax_r15_s,tax_r16_s,tax_r1_hh,tax_r2_hh,tax_r3_hh,tax_r4_hh,tax_r5_hh,tax_r6_hh,tax_r7_hh,tax_r8_hh,tax_r9_hh,tax_r10_hh,tax_r11_hh,tax_r12_hh,tax_r13_hh,tax_r14_hh,tax_r15_hh,tax_r1_m,tax_r2_m,tax_r3_m,tax_r4_m,tax_r5_m,tax_r6_m,tax_r7_m,tax_r8_m,tax_r9_m,tax_r10_m,tax_r11_m,tax_r12_m,tax_r13_m,tax_r14_m,tax_r15_m,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max);

%Have a look whether to put or nor
% health_cred=min(socsec_p+socsec_s,(wage_principal+wage_spouse)*0.06);
% inctax=round(inctax-health_cred);

%******************** 5)BENEFITS*********************************************************************
%No cash benefits
benefit=0;

netincome=round(wage_principal+wage_spouse -inctax-localtax-socsec_p-socsec_s);

end
