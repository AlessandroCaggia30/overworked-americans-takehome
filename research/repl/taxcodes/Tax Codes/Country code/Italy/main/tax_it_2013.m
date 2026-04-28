% Taxation in Italy in year 2013

function[inctax,local_tax,socsec,benefit,netincome,netinc_wobenefit,ssc_empr]=tax_it_2013(wage_principal,wage_spouse,married,children)

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,trans_sch_m_thresh2,trans_sch_m_thresh4,trans_sch_m_thresh5,trans_sch_m_thresh9,trans_sch_m_thresh11,sp_crd_lim,reg_rt,ssc_bracket1,ssc_bracket2,ssc_bracket3,ssc_r1,ssc_r2,ssc_r3,emp_ssc_bracket1,emp_ssc_bracket2,emp_ssc_r1,emp_ssc_r2,emp_cr_bracket1,emp_cr_bracket2,emp_cr_bracket3,emp_cr_bracket4,emp_cr_bracket5,emp_cr_bracket6,emp_cr_bracket7,emp_cr_bracket8,emp_cr_bracket9,emp_cr_bracket10,emp_cr1,emp_cr2,emp_cr3,emp_cr4,emp_cr5,emp_cr6,emp_cr7,emp_cr8,emp_cr9,emp_cr10,spouse_cr_bracket1,spouse_cr_bracket2,spouse_cr_bracket3,spouse_cr_bracket4,spouse_cr_bracket5,spouse_cr_bracket6,spouse_cr_bracket7,spouse_cr_bracket8,spouse_cr_bracket9,spouse_cr_bracket10,spouse_cr1,spouse_cr2,spouse_cr3,spouse_cr4,spouse_cr5,spouse_cr6,spouse_cr7,spouse_cr8,spouse_cr9,spouse_cr10,trans_sch_m_noch_thresh1,trans_sch_m_noch_thresh2,trans_sch_m_noch_thresh3,trans_sch_m_noch_thresh4,trans_sch_m_noch_thresh5,trans_sch_m1_noch,trans_sch_m2_noch,trans_sch_m3_noch,trans_sch_m4_noch,trans_sch_m5_noch,trans_sch_m_c1,trans_sch_m2_3_c1_red,trans_sch_m4_8_c1_red,trans_sch_m9_11_c1_red,trans_sch_m_c2,trans_sch_m2_4_c2_red,trans_sch_m5_8_c2_red,trans_sch_m9_11_c2_red,sol_tax,sol_inc_lim,child_cr]=it_parameters_2013;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,ssc_empr_p] =it_socsec_2006(wage_principal,ssc_bracket1,ssc_bracket2,ssc_bracket3,ssc_r1,ssc_r2,ssc_r3,emp_ssc_bracket1,emp_ssc_bracket2,emp_ssc_r1,emp_ssc_r2);
[socsec_s,ssc_empr_s] =it_socsec_2006(wage_spouse,ssc_bracket1,ssc_bracket2,ssc_bracket3,ssc_r1,ssc_r2,ssc_r3,emp_ssc_bracket1,emp_ssc_bracket2,emp_ssc_r1,emp_ssc_r2);
		
socsec=round(socsec_p+socsec_s);
ssc_empr=round(ssc_empr_p+ssc_empr_s);

%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
sol_tax_p=sol_tax*max(0, wage_principal-sol_inc_lim);
sol_tax_s=sol_tax*max(0, wage_spouse-sol_inc_lim);

taxable_income_p=wage_principal-socsec_p-sol_tax_p;
taxable_income_s=wage_spouse-socsec_s-sol_tax_s;
 
% ************************** 3) TAXATION ***************************************************************************


[inctax,local_tax]=it_tax_2012(taxable_income_p,taxable_income_s,married,children,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,reg_rt,sp_crd_lim,emp_cr_bracket1,emp_cr_bracket2,emp_cr_bracket3,emp_cr_bracket4,emp_cr_bracket5,emp_cr_bracket6,emp_cr_bracket7,emp_cr_bracket8,emp_cr_bracket9,emp_cr_bracket10,emp_cr1,emp_cr2,emp_cr3,emp_cr4,emp_cr5,emp_cr6,emp_cr7,emp_cr8,emp_cr9,emp_cr10,spouse_cr_bracket1,spouse_cr_bracket2,spouse_cr_bracket3,spouse_cr_bracket4,spouse_cr_bracket5,spouse_cr_bracket6,spouse_cr_bracket7,spouse_cr_bracket8,spouse_cr_bracket9,spouse_cr_bracket10,spouse_cr1,spouse_cr2,spouse_cr3,spouse_cr4,spouse_cr5,spouse_cr6,spouse_cr7,spouse_cr8,spouse_cr9,spouse_cr10,sol_tax_p,sol_tax_s,child_cr);

%******************** 5)BENEFITS*********************************************************************

% Cash Benefit

wage=wage_principal+wage_spouse-socsec;

if children==0 && married==1 
    transfer=((wage<trans_sch_m_noch_thresh2)*trans_sch_m1_noch+(wage>trans_sch_m_noch_thresh2 && wage<=trans_sch_m_noch_thresh3)*trans_sch_m2_noch+(wage>trans_sch_m_noch_thresh3 && wage<=trans_sch_m_noch_thresh4)*trans_sch_m3_noch+(wage>trans_sch_m_noch_thresh4 && wage<=trans_sch_m_noch_thresh5)*trans_sch_m4_noch+(wage>trans_sch_m_noch_thresh5)*trans_sch_m5_noch);
elseif children==1 && married==0
    transfer=(trans_sch_m_c1-(min(max(0,wage-trans_sch_m_thresh2),(trans_sch_m_thresh4-trans_sch_m_thresh2))*trans_sch_m2_3_c1_red+min(max(0,wage-trans_sch_m_thresh4),(trans_sch_m_thresh9-trans_sch_m_thresh4)) *trans_sch_m4_8_c1_red + min(max(0,wage-trans_sch_m_thresh9),(trans_sch_m_thresh11-trans_sch_m_thresh9))*trans_sch_m9_11_c1_red));
elseif children==1 && married==1
    transfer=(trans_sch_m_c1-(min(max(0,wage-trans_sch_m_thresh2),(trans_sch_m_thresh4-trans_sch_m_thresh2))*trans_sch_m2_3_c1_red+min(max(0,wage-trans_sch_m_thresh4),(trans_sch_m_thresh9-trans_sch_m_thresh4)) *trans_sch_m4_8_c1_red + min(max(0,wage-trans_sch_m_thresh9),(trans_sch_m_thresh11-trans_sch_m_thresh9))*trans_sch_m9_11_c1_red));
elseif children==2 && married==0
    transfer=(trans_sch_m_c2-(min(max(0,wage-trans_sch_m_thresh2),(trans_sch_m_thresh5-trans_sch_m_thresh2))*trans_sch_m2_4_c2_red+min(max(0,wage-trans_sch_m_thresh5),(trans_sch_m_thresh9-trans_sch_m_thresh5)) *trans_sch_m5_8_c2_red + min(max(0,wage-trans_sch_m_thresh9),(trans_sch_m_thresh11-trans_sch_m_thresh9))*trans_sch_m9_11_c2_red));
elseif children==2 && married==1
    transfer=(trans_sch_m_c2-(min(max(0,wage-trans_sch_m_thresh2),(trans_sch_m_thresh5-trans_sch_m_thresh2))*trans_sch_m2_4_c2_red+min(max(0,wage-trans_sch_m_thresh5),(trans_sch_m_thresh9-trans_sch_m_thresh5)) *trans_sch_m5_8_c2_red + min(max(0,wage-trans_sch_m_thresh9),(trans_sch_m_thresh11-trans_sch_m_thresh9))*trans_sch_m9_11_c2_red));
else
    transfer=0;
end

%no information on 3 or 4 children in OECD reports, hence I interpolate
%child benefits for more than 2 kids
if children>2
    trans1=(trans_sch_m_c1-(min(max(0,wage-trans_sch_m_thresh2),(trans_sch_m_thresh4-trans_sch_m_thresh2))*trans_sch_m2_3_c1_red+min(max(0,wage-trans_sch_m_thresh4),(trans_sch_m_thresh9-trans_sch_m_thresh4)) *trans_sch_m4_8_c1_red + min(max(0,wage-trans_sch_m_thresh9),(trans_sch_m_thresh11-trans_sch_m_thresh9))*trans_sch_m9_11_c1_red));
    trans2=(trans_sch_m_c2-(min(max(0,wage-trans_sch_m_thresh2),(trans_sch_m_thresh5-trans_sch_m_thresh2))*trans_sch_m2_4_c2_red+min(max(0,wage-trans_sch_m_thresh5),(trans_sch_m_thresh9-trans_sch_m_thresh5)) *trans_sch_m5_8_c2_red + min(max(0,wage-trans_sch_m_thresh9),(trans_sch_m_thresh11-trans_sch_m_thresh9))*trans_sch_m9_11_c2_red));
    transfer=trans2+(trans2-trans1)*(children-2);
end

benefit=round(transfer);
        
netincome=wage -inctax-local_tax+benefit;

netinc_wobenefit=wage -inctax-local_tax;

end
