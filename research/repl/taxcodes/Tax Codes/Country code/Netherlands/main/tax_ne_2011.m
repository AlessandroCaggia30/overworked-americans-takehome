%Taxation in the Netherlands for the year 2011

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,empr_socsec]=tax_ne_2011(wage_principal,wage_spouse,married,children)

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[unemp_r,ssc_ceil,unemp_fran,med_empr,health_ceil,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,ch_cr2,decrease_r,rate_cr,rate_ssc,ch1_trans,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,work_cred3,emp_cr_thr3,emp_cr_thr4,work_max_red,incdep_combcred1,incdep_combcred_max,incdep_combcred_per,addsinglepcr_max,work_red_max]=ne_parameters_2011;
	   
%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 	
[taxableinc_p,taxableinc_s]=ne_taxableinc_2011(wage_principal,wage_spouse,unemp_r,ssc_ceil,unemp_fran,med_empr,health_ceil);                                                                                

% ************************** 2) TAXATION ***************************************************************************

[incometax,tax_cr,tax_cr_s]=ne_tax_2011(children,married,taxableinc_p,taxableinc_s,wage_principal,wage_spouse,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,rate_cr,work_cred3,emp_cr_thr3,emp_cr_thr4,work_max_red,incdep_combcred1,incdep_combcred_max,incdep_combcred_per,addsinglepcr_max,work_red_max,oldpen_r,widpen_r,ex_med_r);

% ********************************  3) SOCIAL SECURITY CONTRIBUTIONS *****************	
    
[socsec,empr_socsec] =ne_socsec_2011(wage_principal,wage_spouse,tax_cr,tax_cr_s,married,taxableinc_p,taxableinc_s,unemp_r,ssc_ceil,unemp_fran,oldpen_r,widpen_r,ex_med_r,taxbracket2,rate_ssc,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,taxbracket1,tax_r1,tax_r2);


%******************** 5)BENEFITS*********************************************************************

% Child Benefit

child_benefit=min(2,children)*ch1_trans;   

if(taxableinc_p+taxableinc_s)<=adch_thr
    if children==1
       child_benefit2=ch_cr;
    elseif children==2
       child_benefit2=ch_cr2;
    else
       child_benefit2=0;
    end
end

if (taxableinc_p+taxableinc_s)>ch_cr_thr && (taxableinc_p+taxableinc_s) <=adch_thr
    child_benefit2=max(0,child_benefit2 - decrease_r*(taxableinc_p+taxableinc_s-ch_cr_thr));
else
    child_benefit2=0;
end

benefit=round(child_benefit+child_benefit2);

netincome=wage_principal+wage_spouse -incometax -socsec+benefit;


%Incometax and social securtiy contributions are calculated jointly after
%2002 , therefore we assign half to spouse and principal to comply with the
%previous version of the outputs

inctax_p=round(incometax/2);
inctax_s=round(incometax/2);
socsec_p=round(socsec/2);
socsec_s=round(socsec/2);

end
