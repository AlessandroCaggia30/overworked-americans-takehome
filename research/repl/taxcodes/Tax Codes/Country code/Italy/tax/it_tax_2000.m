
function [inctax_p, inctax_s, local_tax_p, local_tax_s] = it_tax_2000(married, children,taxable_income_p,taxable_income_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,reg_rt,emp_flat,emp_add_thresh1,emp_add_thresh2,emp_add_thresh3,emp_add_thresh4,emp_add_thresh5,emp_add_thresh6,emp_add_1,emp_add_2,emp_add_3,emp_add_4,emp_add_5,emp_add_6,sp_cred_thresh1,sp_cred_thresh2,sp_cred_thresh3,sp_cred_thresh4,sp_cred_thresh5,sp_cred_1,sp_cred_2,sp_cred_3,sp_cred_4,sp_cred_5,sp_crd_lim,ch1_credit,emp_add_thresh7,emp_add_thresh8,emp_add_thresh9,emp_add_thresh10,emp_add_thresh11,emp_add_thresh12,emp_add_thresh13,emp_add_thresh14,emp_add_thresh15,emp_add_thresh16,emp_add_thresh17,emp_add_thresh18,emp_add_thresh19,emp_add_thresh20,emp_add_thresh21,emp_add_thresh22,emp_add_7,emp_add_8,emp_add_9,emp_add_10,emp_add_11,emp_add_12,emp_add_13,emp_add_14,emp_add_15,emp_add_16,emp_add_17,emp_add_18,emp_add_19,emp_add_20,emp_add_21,emp_add_22)


inctax_p_gr=round(min(taxable_income_p,taxbracket1)*tax_r1+min(max(0,taxable_income_p-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_income_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3 + min(max(0,taxable_income_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4+ + min(max(0,taxable_income_p-taxbracket4),(taxbracket5-taxbracket4))*tax_r5);
inctax_s_gr=round(min(taxable_income_s,taxbracket1)*tax_r1+min(max(0,taxable_income_s-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_income_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3 + min(max(0,taxable_income_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4+ + min(max(0,taxable_income_s-taxbracket4),(taxbracket5-taxbracket4))*tax_r5);


%%%Tax Credits
%Employment credit

emp_cr_p=min((emp_flat+(taxable_income_p>=emp_add_thresh1 && taxable_income_p<emp_add_thresh2)*emp_add_1+(taxable_income_p>=emp_add_thresh2 && taxable_income_p<emp_add_thresh3)*emp_add_2+(taxable_income_p>=emp_add_thresh3&& taxable_income_p<emp_add_thresh4)*emp_add_3+(taxable_income_p>=emp_add_thresh4&& taxable_income_p<emp_add_thresh5)*emp_add_4+(taxable_income_p>=emp_add_thresh5&& taxable_income_p<emp_add_thresh6)*emp_add_5+(taxable_income_p>=emp_add_thresh6&& taxable_income_p<emp_add_thresh7)*emp_add_6+(taxable_income_p>=emp_add_thresh7&& taxable_income_p<emp_add_thresh8)*emp_add_7+(taxable_income_p>=emp_add_thresh8&& taxable_income_p<emp_add_thresh9)*emp_add_8+(taxable_income_p>=emp_add_thresh9&& taxable_income_p<emp_add_thresh10)*emp_add_9+(taxable_income_p>=emp_add_thresh10&& taxable_income_p<emp_add_thresh11)*emp_add_10+(taxable_income_p>=emp_add_thresh11&& taxable_income_p<emp_add_thresh12)*emp_add_11)+(taxable_income_p>=emp_add_thresh12&& taxable_income_p<emp_add_thresh13)*emp_add_12+(taxable_income_p>=emp_add_thresh13&& taxable_income_p<emp_add_thresh14)*emp_add_13+(taxable_income_p>=emp_add_thresh14&& taxable_income_p<emp_add_thresh15)*emp_add_14+(taxable_income_p>=emp_add_thresh15&& taxable_income_p<emp_add_thresh16)*emp_add_15+(taxable_income_p>=emp_add_thresh16&& taxable_income_p<emp_add_thresh17)*emp_add_16+(taxable_income_p>=emp_add_thresh17&& taxable_income_p<emp_add_thresh18)*emp_add_17+(taxable_income_p>=emp_add_thresh18&& taxable_income_p<emp_add_thresh19)*emp_add_18+(taxable_income_p>=emp_add_thresh19&& taxable_income_p<emp_add_thresh20)*emp_add_19+(taxable_income_p>=emp_add_thresh20&& taxable_income_p<emp_add_thresh21)*emp_add_20+(taxable_income_p>=emp_add_thresh21&& taxable_income_p<emp_add_thresh22)*emp_add_21+(taxable_income_p>=emp_add_thresh22)*emp_add_22, inctax_p_gr);
emp_cr_s=min((emp_flat+(taxable_income_s>=emp_add_thresh1 && taxable_income_s<emp_add_thresh2)*emp_add_1+(taxable_income_s>=emp_add_thresh2 && taxable_income_s<emp_add_thresh3)*emp_add_2+(taxable_income_s>=emp_add_thresh3&& taxable_income_s<emp_add_thresh4)*emp_add_3+(taxable_income_s>=emp_add_thresh4&& taxable_income_s<emp_add_thresh5)*emp_add_4+(taxable_income_s>=emp_add_thresh5&& taxable_income_s<emp_add_thresh6)*emp_add_5+(taxable_income_s>=emp_add_thresh6&& taxable_income_s<emp_add_thresh7)*emp_add_6+(taxable_income_s>=emp_add_thresh7&& taxable_income_s<emp_add_thresh8)*emp_add_7+(taxable_income_s>=emp_add_thresh8&& taxable_income_s<emp_add_thresh9)*emp_add_8+(taxable_income_s>=emp_add_thresh9&& taxable_income_s<emp_add_thresh10)*emp_add_9+(taxable_income_s>=emp_add_thresh10&& taxable_income_s<emp_add_thresh11)*emp_add_10+(taxable_income_s>=emp_add_thresh11&& taxable_income_s<emp_add_thresh12)*emp_add_11)+(taxable_income_s>=emp_add_thresh12&& taxable_income_s<emp_add_thresh13)*emp_add_12+(taxable_income_s>=emp_add_thresh13&& taxable_income_s<emp_add_thresh14)*emp_add_13+(taxable_income_s>=emp_add_thresh14&& taxable_income_s<emp_add_thresh15)*emp_add_14+(taxable_income_s>=emp_add_thresh15&& taxable_income_s<emp_add_thresh16)*emp_add_15+(taxable_income_s>=emp_add_thresh16&& taxable_income_s<emp_add_thresh17)*emp_add_16+(taxable_income_s>=emp_add_thresh17&& taxable_income_s<emp_add_thresh18)*emp_add_17+(taxable_income_s>=emp_add_thresh18&& taxable_income_s<emp_add_thresh19)*emp_add_18+(taxable_income_s>=emp_add_thresh19&& taxable_income_s<emp_add_thresh20)*emp_add_19+(taxable_income_s>=emp_add_thresh20&& taxable_income_s<emp_add_thresh21)*emp_add_20+(taxable_income_s>=emp_add_thresh21&& taxable_income_s<emp_add_thresh22)*emp_add_21+(taxable_income_s>=emp_add_thresh22)*emp_add_22, inctax_s_gr);


%Spouse credit
if married==1
    if taxable_income_s>sp_crd_lim
        spouse_cr=0;
    else
        spouse_cr=(taxable_income_p>=sp_cred_thresh1 && taxable_income_p<sp_cred_thresh2)*sp_cred_1+(taxable_income_p>=sp_cred_thresh2&& taxable_income_p<sp_cred_thresh3)*sp_cred_2+(taxable_income_p>=sp_cred_thresh3&& taxable_income_p<sp_cred_thresh3)*sp_cred_3+(taxable_income_p>=sp_cred_thresh4&& taxable_income_p<sp_cred_thresh5)*sp_cred_4+(taxable_income_p>=sp_cred_thresh5)*sp_cred_5;        
    end
else    
    spouse_cr=0;
end

%%%%Child credit
%Spouse
child_crfull_s=children*ch1_credit;

if child_crfull_s>0
    child_crpct_s=min(1,(inctax_s_gr-emp_cr_s)/child_crfull_s);
else
    child_crpct_s=0;
end

child_cr_s=child_crfull_s*child_crpct_s;

%Principal
if married==1
    child_cr_p=children*ch1_credit*(2-child_crpct_s);
else
    child_cr_p=children*ch1_credit+(children>0)*((taxable_income_p>=sp_cred_thresh1 && taxable_income_p<sp_cred_thresh2)*sp_cred_1+(taxable_income_p>=sp_cred_thresh2&& taxable_income_p<sp_cred_thresh3)*sp_cred_2+(taxable_income_p>=sp_cred_thresh3&& taxable_income_p<sp_cred_thresh3)*sp_cred_3+(taxable_income_p>=sp_cred_thresh4&& taxable_income_p<sp_cred_thresh5)*sp_cred_4+(taxable_income_p>=sp_cred_thresh5)*sp_cred_5);
end


%%%%Total tax credit
tax_cr_p= min(inctax_p_gr, emp_cr_p+spouse_cr+child_cr_p);
tax_cr_s= min(inctax_s_gr,emp_cr_s+child_cr_s);

inctax_p=max(0,inctax_p_gr-tax_cr_p);
inctax_s=max(0,inctax_s_gr-tax_cr_s);

%%%%Local Taxation
if inctax_p>0
    local_tax_p=taxable_income_p*reg_rt;
else
    local_tax_p=0;
end

if inctax_s>0
    local_tax_s=taxable_income_s*reg_rt;
else
    local_tax_s=0;
end

