%  Taxation in the Netherlands for the year 2006 

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,empr_socsec]=tax_ne_2006(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[unemp_r,ssc_ceil,unemp_fran,med_empr,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,comb_credit,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,decrease_r,rate_cr,rate_ssc,ch_ben,adcomb_cred,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r]=ne_parameters_2006;
	   
%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 	
[taxableinc_p,taxableinc_s,employer_health,employer_health_s]=ne_taxableinc_2006(wage_principal,wage_spouse,unemp_r,ssc_ceil,unemp_fran,med_empr,health_ceil);
	

% ************************** 2) TAXATION ***************************************************************************

[incometax,tax_cr_total]=ne_tax_2006(children,married,taxableinc_p,taxableinc_s,wage_principal,wage_spouse,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,comb_credit,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,decrease_r,rate_cr,adcomb_cred);

% ********************************  3) SOCIAL SECURITY CONTRIBUTIONS *****************	
    
[socsec,empr_socsec] =ne_socsec_2006(wage_principal,wage_spouse,tax_cr_total,married,taxableinc_p,taxableinc_s,unemp_r,ssc_ceil,unemp_fran,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket2,rate_ssc,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,employer_health,employer_health_s);
	   
	
    
%******************** 5)BENEFITS*********************************************************************

% Child Benefit
benefit=min(2,children)*ch_ben;         
netincome=wage_principal+wage_spouse -incometax -socsec+benefit;

%Incometax and social securtiy contributions are calculated jointly after
%2002 , therefore we assign half to spouse and principal to comply with the
%previous version of the outputs

inctax_p=incometax/2;
inctax_s=incometax/2;
socsec_p=socsec/2;
socsec_s=socsec/2;


end
