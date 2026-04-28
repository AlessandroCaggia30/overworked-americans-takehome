% Taxation in Italy in year 1983

function[inctax,local_tax,socsec,benefit,netincome,netinc_wobenefit]=tax_it_1983(wage_principal,wage_spouse,married,children)

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5, taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,ssc_r1,sp_cred_1, sp_crd_lim,ch1_credit,tax_r8,tax_r9,taxbracket7,taxbracket8,basic_cred,earner_cred,expense_cred,trans_spouse,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,tax_r15,tax_r16,tax_r17,tax_r18,tax_r19,tax_r20,tax_r21,tax_r22,tax_r23,tax_r24,tax_r25,tax_r26,tax_r27,tax_r28,tax_r29, tax_r30, tax_r31, tax_r32,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,taxbracket14,taxbracket15,taxbracket16,taxbracket17,taxbracket18,taxbracket19,taxbracket20,taxbracket21,taxbracket22,taxbracket23,taxbracket24,taxbracket25,taxbracket26,taxbracket27,taxbracket28,taxbracket29,taxbracket30,taxbracket31] = it_parameters_1983;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
socsec_p =it_socsec_1993(wage_principal,ssc_r1);
socsec_s =it_socsec_1993(wage_spouse,ssc_r1);
		
socsec=round(socsec_p+socsec_s);


%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************

taxable_income_p=wage_principal-socsec_p;
taxable_income_s=wage_spouse-socsec_s;

% ************************** 3) TAXATION ***************************************************************************

[inctax_p, inctax_s]= it_tax_1983(married, children,taxable_income_p,taxable_income_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,sp_cred_1,sp_crd_lim,ch1_credit,tax_r8,tax_r9,taxbracket7,taxbracket8,basic_cred,earner_cred,expense_cred,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,tax_r15,tax_r16,tax_r17,tax_r18,tax_r19,tax_r20,tax_r21,tax_r22,tax_r23,tax_r24,tax_r25,tax_r26,tax_r27,tax_r28,tax_r29, tax_r30, tax_r31, tax_r32,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,taxbracket14,taxbracket15,taxbracket16,taxbracket17,taxbracket18,taxbracket19,taxbracket20,taxbracket21,taxbracket22,taxbracket23,taxbracket24,taxbracket25,taxbracket26,taxbracket27,taxbracket28,taxbracket29,taxbracket30,taxbracket31);

inctax=round(inctax_p+inctax_s);
local_tax=0;

%******************** 5)BENEFITS*********************************************************************

% Cash Benefit

wage=wage_principal+wage_spouse;

benefit=(married==1)*children*trans_spouse;

benefit=round(benefit);

netincome=wage -inctax-socsec-local_tax+benefit;

netinc_wobenefit=wage -inctax-socsec-local_tax;

end
