%  Taxation in the Netherlands for the year 2016

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,empr_socsec]=tax_ne_2016(wage_principal,wage_spouse,married,children)

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[unemp_r,ssc_ceil,unemp_fran,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,gen_cred1,gen_cred1_thr,gen_cred2_thr,gen_cred_r,red_gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,ch_cr2,decrease_r,rate_cr,rate_ssc,ch1_trans,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,work_cred3,emp_cr_thr3,incdep_combcred1,incdep_combcred_max,incdep_combcred_per,extra_cash_single_par]=ne_parameters_2016;
                                                                                                                                                                                                              
%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 	
taxableinc_p=wage_principal;
taxableinc_s=wage_spouse;
                                                                                
% ************************** 2) TAXATION ***************************************************************************

[incometax,tax_cr,tax_cr_s]=ne_tax_2016(children,married,taxableinc_p,taxableinc_s,wage_principal,wage_spouse,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,gen_cred1,gen_cred1_thr,gen_cred2_thr,gen_cred_r,red_gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,rate_cr,work_cred3,emp_cr_thr3,incdep_combcred1,incdep_combcred_max,incdep_combcred_per,oldpen_r,widpen_r,ex_med_r);

% ********************************  3) SOCIAL SECURITY CONTRIBUTIONS *****************	
    
[socsec,empr_socsec] =ne_socsec_2011(wage_principal,wage_spouse,tax_cr,tax_cr_s,married,taxableinc_p,taxableinc_s,unemp_r,ssc_ceil,unemp_fran,oldpen_r,widpen_r,ex_med_r,taxbracket2,rate_ssc,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,taxbracket1,tax_r1,tax_r2);


%******************** 5)BENEFITS*********************************************************************

% Child Benefit

child_benefit=min(2,children)*ch1_trans;   

if children==2
    child_benefit2=(ch_cr2+(max((1-married),0))*extra_cash_single_par);
else
    child_benefit2=0;
end


if children==2 && (taxableinc_p+taxableinc_s)>ch_cr_thr 
    child_ben_red=decrease_r*(taxableinc_p+taxableinc_s-ch_cr_thr);
else
    child_ben_red=0;
end


benefit=round(child_benefit+max(0,child_benefit2-child_ben_red));

netincome=wage_principal+wage_spouse -incometax -socsec+benefit;

%Incometax and social securtiy contributions are calculated jointly after
%2002 , therefore we assign half to spouse and principal to comply with the
%previous version of the outputs

inctax_p=round(incometax/2);
inctax_s=round(incometax/2);
socsec_p=round(socsec/2);
socsec_s=round(socsec/2);

end
