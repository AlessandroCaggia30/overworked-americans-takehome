
function [inctax_p, inctax_s] = it_tax_1997(married, children,taxable_income_p,taxable_income_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,sp_cred_thresh1,sp_cred_thresh2,sp_cred_thresh3,sp_cred_thresh4,sp_cred_thresh5,sp_cred_1,sp_cred_2,sp_cred_3,sp_cred_4,sp_cred_5,sp_crd_lim,ch1_credit,ch2_credit,basic_cred)


inctax_p_gr=round(min(taxable_income_p,taxbracket1)*tax_r1+min(max(0,taxable_income_p-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_income_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3 + min(max(0,taxable_income_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4+ min(max(0,taxable_income_p-taxbracket4),(taxbracket5-taxbracket4))*tax_r5 + min(max(0,taxable_income_p-taxbracket5),(taxbracket6-taxbracket5))*tax_r6+ max(0,taxable_income_p-taxbracket6)*tax_r7);
inctax_s_gr=round(min(taxable_income_s,taxbracket1)*tax_r1+min(max(0,taxable_income_s-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_income_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3 + min(max(0,taxable_income_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4+ min(max(0,taxable_income_s-taxbracket4),(taxbracket5-taxbracket4))*tax_r5 + min(max(0,taxable_income_p-taxbracket5),(taxbracket6-taxbracket5))*tax_r6+ max(0,taxable_income_s-taxbracket6)*tax_r7);


%%%Tax Credits
%Basic credit

basic_cr_p=min(basic_cred, inctax_p_gr);
basic_cr_s=min(basic_cred, inctax_s_gr);

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

if child_crfull_s>0 && taxable_income_s>sp_crd_lim
    child_crpct_s=1;
else
    child_crpct_s=0;
end

child_cr_s=child_crfull_s*child_crpct_s;

%Principal
if married==1
    child_cr_p=((children==1)*ch1_credit+(children==2)*ch2_credit)*(2-child_crpct_s);
else
    child_cr_p=((children==1)*ch1_credit+(children==2)*ch2_credit)+(children>0)*((taxable_income_p>=sp_cred_thresh1 && taxable_income_p<sp_cred_thresh2)*sp_cred_1+(taxable_income_p>=sp_cred_thresh2&& taxable_income_p<sp_cred_thresh3)*sp_cred_2+(taxable_income_p>=sp_cred_thresh3&& taxable_income_p<sp_cred_thresh3)*sp_cred_3+(taxable_income_p>=sp_cred_thresh4&& taxable_income_p<sp_cred_thresh5)*sp_cred_4+(taxable_income_p>=sp_cred_thresh5)*sp_cred_5);
end


%%%%Total tax credit
tax_cr_p= min(inctax_p_gr, basic_cr_p+spouse_cr+child_cr_p);
tax_cr_s= min(inctax_s_gr,basic_cr_s+child_cr_s);

inctax_p=max(0,inctax_p_gr-tax_cr_p);
inctax_s=max(0,inctax_s_gr-tax_cr_s);


