function [inctax_p, inctax_s, local_tax_p, local_tax_s,emp_cr_p,spouse_cr,child_cr_p] = it_tax_2004(married, children,taxable_income_p,taxable_income_s,taxable_income_xal2_p,taxable_income_xal2_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,reg_rt,emp_flat,emp_add_thresh1,emp_add_thresh2,emp_add_thresh3,emp_add_thresh4,emp_add_thresh5,emp_add_thresh6,emp_add_1,emp_add_2,emp_add_3,emp_add_4,emp_add_5,emp_add_6,sp_cred_thresh1,sp_cred_thresh2,sp_cred_thresh3,sp_cred_thresh4,sp_cred_thresh5,sp_cred_1,sp_cred_2,sp_cred_3,sp_cred_4,sp_cred_5,sp_crd_lim,child_cred_m_thresh1,child_cred_m_thresh2,child_cred_m_thresh3,child_cred_m_thresh4,child_cred_m_thresh5,child_cred_m_ch1_1,child_cred_m_ch1_2,child_cred_m_ch1_3,child_cred_m_ch1_4,child_cred_m_ch1_5,child_cred_m_ch2_1,child_cred_m_ch2_2,child_cred_m_ch2_3,child_cred_m_ch2_4,child_cred_m_ch2_5,child_cred_m_ch3_1,child_cred_m_ch3_2,child_cred_m_ch3_3,child_cred_m_ch3_4,child_cred_m_ch3_5,child_cred_m_ch4_1,child_cred_m_ch4_2,child_cred_m_ch4_3,child_cred_m_ch4_4,child_cred_m_ch4_5,child_cred_sp_thresh1,child_cred_sp_thresh2,child_cred_sp_thresh3,child_cred_sp_thresh4,child_cred_sp_thresh5,child_cred_sp_thresh6,child_cred_sp_thresh7,child_cred_sp_ch1_1,child_cred_sp_ch1_2,child_cred_sp_ch1_3,child_cred_sp_ch1_4,child_cred_sp_ch1_5,child_cred_sp_ch1_6,child_cred_sp_ch1_7,child_cred_sp_ch2_1,child_cred_sp_ch2_2,child_cred_sp_ch2_3,child_cred_sp_ch2_4,child_cred_sp_ch2_5,child_cred_sp_ch2_6,child_cred_sp_ch2_7,child_cred_sp_ch3_1,child_cred_sp_ch3_2,child_cred_sp_ch3_3,child_cred_sp_ch3_4,child_cred_sp_ch3_5,child_cred_sp_ch3_6,child_cred_sp_ch3_7,child_cred_sp_ch4_1,child_cred_sp_ch4_2,child_cred_sp_ch4_3,child_cred_sp_ch4_4,child_cred_sp_ch4_5,child_cred_sp_ch4_6,child_cred_sp_ch4_7)


inctax_p_gr=round(min(taxable_income_p,taxbracket1)*tax_r1+min(max(0,taxable_income_p-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_income_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3 + min(max(0,taxable_income_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4+ + min(max(0,taxable_income_p-taxbracket4),(taxbracket5-taxbracket4))*tax_r5);
inctax_s_gr=round(min(taxable_income_s,taxbracket1)*tax_r1+min(max(0,taxable_income_s-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_income_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3 + min(max(0,taxable_income_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4+ + min(max(0,taxable_income_s-taxbracket4),(taxbracket5-taxbracket4))*tax_r5);


%%%Tax Credits
%Employment credit

emp_cr_p=min((emp_flat+(taxable_income_xal2_p>=emp_add_thresh1 && taxable_income_xal2_p<emp_add_thresh2)*emp_add_1+(taxable_income_xal2_p>=emp_add_thresh2 && taxable_income_xal2_p<emp_add_thresh3)*emp_add_2+(taxable_income_xal2_p>=emp_add_thresh3&& taxable_income_xal2_p<emp_add_thresh4)*emp_add_3+(taxable_income_xal2_p>=emp_add_thresh4&& taxable_income_xal2_p<emp_add_thresh5)*emp_add_4+(taxable_income_xal2_p>=emp_add_thresh5&& taxable_income_xal2_p<emp_add_thresh6)*emp_add_5+(taxable_income_xal2_p>=emp_add_thresh6)*emp_add_6), inctax_p_gr);
emp_cr_s=min((emp_flat+(taxable_income_xal2_s>=emp_add_thresh1 && taxable_income_xal2_s<emp_add_thresh2)*emp_add_1+(taxable_income_xal2_s>=emp_add_thresh2&& taxable_income_xal2_s<emp_add_thresh3)*emp_add_2+(taxable_income_xal2_s>=emp_add_thresh3&& taxable_income_xal2_s<emp_add_thresh4)*emp_add_3+(taxable_income_xal2_s>=emp_add_thresh4&& taxable_income_xal2_s<emp_add_thresh5)*emp_add_4+(taxable_income_xal2_s>=emp_add_thresh5&& taxable_income_xal2_s<emp_add_thresh6)*emp_add_5+(taxable_income_xal2_s>=emp_add_thresh6)*emp_add_6), inctax_s_gr);


%Spouse credit
if married==1
    if taxable_income_xal2_s>sp_crd_lim
        spouse_cr=0;
    else
        spouse_cr=(taxable_income_p>=sp_cred_thresh1 && taxable_income_p<sp_cred_thresh2)*sp_cred_1+(taxable_income_p>=sp_cred_thresh2&& taxable_income_p<sp_cred_thresh3)*sp_cred_2+(taxable_income_p>=sp_cred_thresh3&& taxable_income_p<sp_cred_thresh3)*sp_cred_3+(taxable_income_p>=sp_cred_thresh4&& taxable_income_p<sp_cred_thresh5)*sp_cred_4+(taxable_income_p>=sp_cred_thresh5)*sp_cred_5;        
    end
else    
    spouse_cr=0;
end

%Child credit
if children==0
    child_crfull_s=0;
elseif children==1
    child_crfull_s=(spouse_cr==0)*married*((taxable_income_xal2_s>=child_cred_m_thresh1 && taxable_income_xal2_s<child_cred_m_thresh2)*child_cred_m_ch1_1+(taxable_income_xal2_s>=child_cred_m_thresh2 && taxable_income_xal2_s<child_cred_m_thresh3)*child_cred_m_ch1_2+(taxable_income_xal2_s>=child_cred_m_thresh3 && taxable_income_xal2_s<child_cred_m_thresh4)*child_cred_m_ch1_3+(taxable_income_xal2_s>=child_cred_m_thresh4 && taxable_income_xal2_s<child_cred_m_thresh5)*child_cred_m_ch1_4+(taxable_income_xal2_s>=child_cred_m_thresh5)*child_cred_m_ch1_5);
elseif children==2
    child_crfull_s=(spouse_cr==0)*married*((taxable_income_xal2_s>=child_cred_m_thresh1 && taxable_income_xal2_s<child_cred_m_thresh2)*child_cred_m_ch2_1+(taxable_income_xal2_s>=child_cred_m_thresh2 && taxable_income_xal2_s<child_cred_m_thresh3)*child_cred_m_ch2_2+(taxable_income_xal2_s>=child_cred_m_thresh3 && taxable_income_xal2_s<child_cred_m_thresh4)*child_cred_m_ch2_3+(taxable_income_xal2_s>=child_cred_m_thresh4 && taxable_income_xal2_s<child_cred_m_thresh5)*child_cred_m_ch2_4+(taxable_income_xal2_s>=child_cred_m_thresh5)*child_cred_m_ch2_5);
elseif children==3
    child_crfull_s=(spouse_cr==0)*married*((taxable_income_xal2_s>=child_cred_m_thresh1 && taxable_income_xal2_s<child_cred_m_thresh2)*child_cred_m_ch3_1+(taxable_income_xal2_s>=child_cred_m_thresh2 && taxable_income_xal2_s<child_cred_m_thresh3)*child_cred_m_ch3_2+(taxable_income_xal2_s>=child_cred_m_thresh3 && taxable_income_xal2_s<child_cred_m_thresh4)*child_cred_m_ch3_3+(taxable_income_xal2_s>=child_cred_m_thresh4 && taxable_income_xal2_s<child_cred_m_thresh5)*child_cred_m_ch3_4+(taxable_income_xal2_s>=child_cred_m_thresh5)*child_cred_m_ch3_5);
elseif children==4
    child_crfull_s=(spouse_cr==0)*married*((taxable_income_xal2_s>=child_cred_m_thresh1 && taxable_income_xal2_s<child_cred_m_thresh2)*child_cred_m_ch4_1+(taxable_income_xal2_s>=child_cred_m_thresh2 && taxable_income_xal2_s<child_cred_m_thresh3)*child_cred_m_ch4_2+(taxable_income_xal2_s>=child_cred_m_thresh3 && taxable_income_xal2_s<child_cred_m_thresh4)*child_cred_m_ch4_3+(taxable_income_xal2_s>=child_cred_m_thresh4 && taxable_income_xal2_s<child_cred_m_thresh5)*child_cred_m_ch4_4+(taxable_income_xal2_s>=child_cred_m_thresh5)*child_cred_m_ch4_5);
end

if child_crfull_s>0
    child_crpct_s=min(1,(inctax_s_gr-emp_cr_s)/child_crfull_s);
else
    child_crpct_s=0;
end


child_cr_s=child_crfull_s*child_crpct_s;

if married==1
    if children==0
        child_cr_p=0;
    elseif children==1
        child_cr_p=(1-child_crpct_s)*((taxable_income_xal2_p>=child_cred_m_thresh1 && taxable_income_xal2_p<child_cred_m_thresh2)*child_cred_m_ch1_1+(taxable_income_xal2_p>=child_cred_m_thresh2 && taxable_income_xal2_p<child_cred_m_thresh3)*child_cred_m_ch1_2+(taxable_income_xal2_p>=child_cred_m_thresh3 && taxable_income_xal2_p<child_cred_m_thresh4)*child_cred_m_ch1_3+(taxable_income_xal2_p>=child_cred_m_thresh4 && taxable_income_xal2_p<child_cred_m_thresh5)*child_cred_m_ch1_4+(taxable_income_xal2_p>=child_cred_m_thresh5)*child_cred_m_ch1_5);
    elseif children==2
        child_cr_p=(1-child_crpct_s)*((taxable_income_xal2_p>=child_cred_m_thresh1 && taxable_income_xal2_p<child_cred_m_thresh2)*child_cred_m_ch2_1+(taxable_income_xal2_p>=child_cred_m_thresh2 && taxable_income_xal2_p<child_cred_m_thresh3)*child_cred_m_ch2_2+(taxable_income_xal2_p>=child_cred_m_thresh3 && taxable_income_xal2_p<child_cred_m_thresh4)*child_cred_m_ch2_3+(taxable_income_xal2_p>=child_cred_m_thresh4 && taxable_income_xal2_p<child_cred_m_thresh5)*child_cred_m_ch2_4+(taxable_income_xal2_p>=child_cred_m_thresh5)*child_cred_m_ch2_5);
    elseif children==3
        child_cr_p=(1-child_crpct_s)*((taxable_income_xal2_p>=child_cred_m_thresh1 && taxable_income_xal2_p<child_cred_m_thresh2)*child_cred_m_ch3_1+(taxable_income_xal2_p>=child_cred_m_thresh2 && taxable_income_xal2_p<child_cred_m_thresh3)*child_cred_m_ch3_2+(taxable_income_xal2_p>=child_cred_m_thresh3 && taxable_income_xal2_p<child_cred_m_thresh4)*child_cred_m_ch3_3+(taxable_income_xal2_p>=child_cred_m_thresh4 && taxable_income_xal2_p<child_cred_m_thresh5)*child_cred_m_ch3_4+(taxable_income_xal2_p>=child_cred_m_thresh5)*child_cred_m_ch3_5);
    elseif children==4
        child_cr_p=(1-child_crpct_s)*((taxable_income_xal2_p>=child_cred_m_thresh1 && taxable_income_xal2_p<child_cred_m_thresh2)*child_cred_m_ch4_1+(taxable_income_xal2_p>=child_cred_m_thresh2 && taxable_income_xal2_p<child_cred_m_thresh3)*child_cred_m_ch4_2+(taxable_income_xal2_p>=child_cred_m_thresh3 && taxable_income_xal2_p<child_cred_m_thresh4)*child_cred_m_ch4_3+(taxable_income_xal2_p>=child_cred_m_thresh4 && taxable_income_xal2_p<child_cred_m_thresh5)*child_cred_m_ch4_4+(taxable_income_xal2_p>=child_cred_m_thresh5)*child_cred_m_ch4_5);
    end
else
    if children==0
        child_cr_p=0;
    elseif children==1
        child_cr_p=((taxable_income_xal2_p>=child_cred_sp_thresh1 && taxable_income_xal2_p<child_cred_sp_thresh2)*child_cred_sp_ch1_1+(taxable_income_xal2_p>=child_cred_sp_thresh2 && taxable_income_xal2_p<child_cred_sp_thresh3)*child_cred_sp_ch1_2+(taxable_income_xal2_p>=child_cred_sp_thresh3 && taxable_income_xal2_p<child_cred_sp_thresh4)*child_cred_sp_ch1_3+(taxable_income_xal2_p>=child_cred_sp_thresh4 && taxable_income_xal2_p<child_cred_sp_thresh5)*child_cred_sp_ch1_4+(taxable_income_xal2_p>=child_cred_sp_thresh5 && taxable_income_xal2_p<child_cred_sp_thresh6)*child_cred_sp_ch1_5+(taxable_income_xal2_p>=child_cred_sp_thresh6 && taxable_income_xal2_p<child_cred_sp_thresh7)*child_cred_sp_ch1_6+(taxable_income_xal2_p>=child_cred_sp_thresh7)*child_cred_sp_ch1_7);
    elseif children==2
        child_cr_p=((taxable_income_xal2_p>=child_cred_sp_thresh1 && taxable_income_xal2_p<child_cred_sp_thresh2)*child_cred_sp_ch2_1+(taxable_income_xal2_p>=child_cred_sp_thresh2 && taxable_income_xal2_p<child_cred_sp_thresh3)*child_cred_sp_ch2_2+(taxable_income_xal2_p>=child_cred_sp_thresh3 && taxable_income_xal2_p<child_cred_sp_thresh4)*child_cred_sp_ch2_3+(taxable_income_xal2_p>=child_cred_sp_thresh4 && taxable_income_xal2_p<child_cred_sp_thresh5)*child_cred_sp_ch2_4+(taxable_income_xal2_p>=child_cred_sp_thresh5 && taxable_income_xal2_p<child_cred_sp_thresh6)*child_cred_sp_ch2_5+(taxable_income_xal2_p>=child_cred_sp_thresh6 && taxable_income_xal2_p<child_cred_sp_thresh7)*child_cred_sp_ch2_6+(taxable_income_xal2_p>=child_cred_sp_thresh7)*child_cred_sp_ch2_7);
    elseif children==3
        child_cr_p=((taxable_income_xal2_p>=child_cred_sp_thresh1 && taxable_income_xal2_p<child_cred_sp_thresh2)*child_cred_sp_ch3_1+(taxable_income_xal2_p>=child_cred_sp_thresh2 && taxable_income_xal2_p<child_cred_sp_thresh3)*child_cred_sp_ch3_2+(taxable_income_xal2_p>=child_cred_sp_thresh3 && taxable_income_xal2_p<child_cred_sp_thresh4)*child_cred_sp_ch3_3+(taxable_income_xal2_p>=child_cred_sp_thresh4 && taxable_income_xal2_p<child_cred_sp_thresh5)*child_cred_sp_ch3_4+(taxable_income_xal2_p>=child_cred_sp_thresh5 && taxable_income_xal2_p<child_cred_sp_thresh6)*child_cred_sp_ch3_5+(taxable_income_xal2_p>=child_cred_sp_thresh6 && taxable_income_xal2_p<child_cred_sp_thresh7)*child_cred_sp_ch3_6+(taxable_income_xal2_p>=child_cred_sp_thresh7)*child_cred_sp_ch3_7);
    elseif children==4
        child_cr_p=((taxable_income_xal2_p>=child_cred_sp_thresh1 && taxable_income_xal2_p<child_cred_sp_thresh2)*child_cred_sp_ch4_1+(taxable_income_xal2_p>=child_cred_sp_thresh2 && taxable_income_xal2_p<child_cred_sp_thresh3)*child_cred_sp_ch4_2+(taxable_income_xal2_p>=child_cred_sp_thresh3 && taxable_income_xal2_p<child_cred_sp_thresh4)*child_cred_sp_ch4_3+(taxable_income_xal2_p>=child_cred_sp_thresh4 && taxable_income_xal2_p<child_cred_sp_thresh5)*child_cred_sp_ch4_4+(taxable_income_xal2_p>=child_cred_sp_thresh5 && taxable_income_xal2_p<child_cred_sp_thresh6)*child_cred_sp_ch4_5+(taxable_income_xal2_p>=child_cred_sp_thresh6 && taxable_income_xal2_p<child_cred_sp_thresh7)*child_cred_sp_ch4_6+(taxable_income_xal2_p>=child_cred_sp_thresh7)*child_cred_sp_ch4_7);;
    end 
end


%Total tax credit
tax_cr_p= min(inctax_p_gr, emp_cr_p+spouse_cr+child_cr_p);
tax_cr_s= min(inctax_s_gr,emp_cr_s+child_cr_s);

inctax_p=max(0,inctax_p_gr-tax_cr_p);
inctax_s=max(0,inctax_s_gr-tax_cr_s);

%Local Taxation
if inctax_p>0
    local_tax_p=taxable_income_xal2_p*reg_rt;
else
    local_tax_p=0;
end

if inctax_s>0
    local_tax_s=taxable_income_xal2_s*reg_rt;
else
    local_tax_s=0;
end

