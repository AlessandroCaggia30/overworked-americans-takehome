% Taxation in Italy in year 1985

function[inctax,local_tax,socsec,benefit,netincome,netinc_wobenefit]=tax_it_1985(wage_principal,wage_spouse,married,children)

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5, taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,ssc_r1,sp_cred_1, sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred1,furth_cred2,tax_r8,tax_r9,taxbracket7,taxbracket8,basic_cred,earner_cred,expense_cred,trans_spouse,trans_child,phaseout_lim,add_trans_child,add_low_lim,add_upper_lim] = it_parameters_1985;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
socsec_p =it_socsec_1993(wage_principal,ssc_r1);
socsec_s =it_socsec_1993(wage_spouse,ssc_r1);
		
socsec=round(socsec_p+socsec_s);


%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************

taxable_income_p=wage_principal;
taxable_income_s=wage_spouse;

% ************************** 3) TAXATION ***************************************************************************

[inctax_p, inctax_s]= it_tax_1985(married, children,taxable_income_p,taxable_income_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,sp_cred_1,sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred1,furth_cred2,tax_r8,tax_r9,taxbracket7,taxbracket8,basic_cred,earner_cred,expense_cred);

inctax=round(inctax_p+inctax_s);
local_tax=0;

%******************** 5)BENEFITS*********************************************************************

% Cash Benefit

wage=wage_principal+wage_spouse;

benefit=(married==1)*children*trans_spouse+children*trans_child;

if wage>phaseout_lim
    benefit=max(0,benefit-(wage-28000000)^2);
end

if wage>add_low_lim && wage<=add_upper_lim
    benefit= benefit+(add_trans_child*children)/(add_upper_lim-add_low_lim)*(add_upper_lim-wage);
end

benefit=round(benefit);      

netincome=wage -inctax-socsec-local_tax+benefit;

netinc_wobenefit=wage -inctax-socsec-local_tax;

end
