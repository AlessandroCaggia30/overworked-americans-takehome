% Taxation in Italy in year 1987

function[inctax,local_tax,socsec,benefit,netincome,netinc_wobenefit]=tax_it_1987(wage_principal,wage_spouse,married,children)

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5, taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,trans_sch_m_thresh1,trans_sch_m_thresh2,trans_sch_m_thresh3,trans_sch_m_thresh4,trans_sch_m1_c2,trans_sch_m2_c2,trans_sch_m3_c2,ssc_r1,sp_cred_1, sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred1,furth_cred2,tax_r8,tax_r9,taxbracket7,taxbracket8] = it_parameters_1987;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
socsec_p =it_socsec_1993(wage_principal,ssc_r1);
socsec_s =it_socsec_1993(wage_spouse,ssc_r1);
		
socsec=round(socsec_p+socsec_s);


%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************

taxable_income_p=wage_principal;
taxable_income_s=wage_spouse;

% ************************** 3) TAXATION ***************************************************************************

[inctax_p, inctax_s]= it_tax_1987(married, children,taxable_income_p,taxable_income_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,sp_cred_1,sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred1,furth_cred2,tax_r8,tax_r9,taxbracket7,taxbracket8);

inctax=round(inctax_p+inctax_s);
local_tax=0;

%******************** 5)BENEFITS*********************************************************************

% Cash Benefit

wage=wage_principal+wage_spouse;

if married==1 && children>0
    if wage>trans_sch_m_thresh1 && (wage)<=trans_sch_m_thresh2
        transfer1=trans_sch_m1_c2;
    elseif (wage)>trans_sch_m_thresh2 && (wage)<=trans_sch_m_thresh3
        transfer1=(wage-trans_sch_m_thresh2)*((trans_sch_m2_c2-trans_sch_m1_c2)/(trans_sch_m_thresh3-trans_sch_m_thresh2))+trans_sch_m1_c2;
    elseif (wage)>trans_sch_m_thresh3 && (wage)<=trans_sch_m_thresh4
        transfer1=(wage-trans_sch_m_thresh3)*((trans_sch_m3_c2-trans_sch_m2_c2)/(trans_sch_m_thresh4-trans_sch_m_thresh3))+trans_sch_m2_c2;
    else
        transfer1=0;
    end
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
