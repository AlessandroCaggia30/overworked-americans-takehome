% Taxation in Italy in year 1992

function[inctax,local_tax,socsec,benefit,netincome,netinc_wobenefit]=tax_it_1992(wage_principal,wage_spouse,married,children)

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5, taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,trans_sch_m_thresh1,trans_sch_m_thresh2,trans_sch_m_thresh3,trans_sch_m_thresh4,trans_sch_m_thresh5,trans_sch_m_thresh6,trans_sch_m_thresh7,trans_sch_m_thresh8,trans_sch_m_thresh9,trans_sch_m1_c2,trans_sch_m2_c2,trans_sch_m3_c2,trans_sch_m4_c2,trans_sch_m5_c2,trans_sch_m6_c2,trans_sch_m7_c2,trans_sch_m8_c2,trans_sch_m9_c2,ssc_r1,sp_cred_1, sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred1,furth_cred2] = it_parameters_1992;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
socsec_p =it_socsec_1993(wage_principal,ssc_r1);
socsec_s =it_socsec_1993(wage_spouse,ssc_r1);
		
socsec=round(socsec_p+socsec_s);


%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************

taxable_income_p=wage_principal-socsec_p;
taxable_income_s=wage_spouse-socsec_s;

% ************************** 3) TAXATION ***************************************************************************

[inctax_p, inctax_s]= it_tax_1992(married, children,taxable_income_p,taxable_income_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,sp_cred_1,sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred1,furth_cred2);

inctax=round(inctax_p+inctax_s);
local_tax=0;

%******************** 5)BENEFITS*********************************************************************

% Cash Benefit

wage=wage_principal+wage_spouse;

%note: 0.86 corresponds to the value of (tax_inc_pr1/awp) in 1996 and serves as an approximation here as there is no info available for years prior to 1996. 
if married==1 && children>0
    transfer1=((wage*0.86)>trans_sch_m_thresh1 && (wage*0.86)<=trans_sch_m_thresh2)*trans_sch_m1_c2+((wage*0.86)>trans_sch_m_thresh2 && (wage*0.86)<=trans_sch_m_thresh3)*trans_sch_m2_c2+((wage*0.86)>trans_sch_m_thresh3 && (wage*0.86)<=trans_sch_m_thresh4)*trans_sch_m3_c2+((wage*0.86)>trans_sch_m_thresh4 && (wage*0.86)<=trans_sch_m_thresh5)*trans_sch_m4_c2+((wage*0.86)>trans_sch_m_thresh5 && (wage*0.86)<=trans_sch_m_thresh6)*trans_sch_m5_c2+((wage*0.86)>trans_sch_m_thresh6 && (wage*0.86)<=trans_sch_m_thresh7)*trans_sch_m6_c2+((wage*0.86)>trans_sch_m_thresh7 && (wage*0.86)<=trans_sch_m_thresh8)*trans_sch_m7_c2+((wage*0.86)>trans_sch_m_thresh8 && (wage*0.86)<=trans_sch_m_thresh9)*trans_sch_m8_c2+((wage*0.86)>trans_sch_m_thresh9)*trans_sch_m9_c2 ;
else
    transfer1=0;
end

%Child benefit from OECD report refers to family with two children,
%interpolation for 1 or >2 children
if married==1  && children>0
    transfer1=transfer1/2*children;
end

benefit=round(transfer1);
        
netincome=wage -inctax-socsec-local_tax+benefit;

netinc_wobenefit=wage -inctax-socsec-local_tax;

end
