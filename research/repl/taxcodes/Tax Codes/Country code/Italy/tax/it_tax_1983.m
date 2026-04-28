
function [inctax_p, inctax_s] = it_tax_1983(married, children,taxable_income_p,taxable_income_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,sp_cred_1,sp_crd_lim,ch1_credit,tax_r8,tax_r9,taxbracket7,taxbracket8,basic_cred,earner_cred,expense_cred,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,tax_r15,tax_r16,tax_r17,tax_r18,tax_r19,tax_r20,tax_r21,tax_r22,tax_r23,tax_r24,tax_r25,tax_r26,tax_r27,tax_r28,tax_r29, tax_r30, tax_r31, tax_r32,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,taxbracket14,taxbracket15,taxbracket16,taxbracket17,taxbracket18,taxbracket19,taxbracket20,taxbracket21,taxbracket22,taxbracket23,taxbracket24,taxbracket25,taxbracket26,taxbracket27,taxbracket28,taxbracket29,taxbracket30,taxbracket31)


inctax_p_gr=round(min(taxable_income_p,taxbracket1)*tax_r1+min(max(0,taxable_income_p-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_income_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3 + min(max(0,taxable_income_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4+ min(max(0,taxable_income_p-taxbracket4),(taxbracket5-taxbracket4))*tax_r5 + min(max(0,taxable_income_p-taxbracket5),(taxbracket6-taxbracket5))*tax_r6 + min(max(0,taxable_income_p-taxbracket6),(taxbracket7-taxbracket6))*tax_r7+ min(max(0,taxable_income_p-taxbracket7),(taxbracket8-taxbracket7))*tax_r8+min(max(0,taxable_income_p-taxbracket8),(taxbracket9-taxbracket8)) *tax_r9 + min(max(0,taxable_income_p-taxbracket9),(taxbracket10-taxbracket9))*tax_r10 + min(max(0,taxable_income_p-taxbracket10),(taxbracket11-taxbracket10))*tax_r11+ min(max(0,taxable_income_p-taxbracket11),(taxbracket12-taxbracket11))*tax_r12 + min(max(0,taxable_income_p-taxbracket12),(taxbracket13-taxbracket12))*tax_r13 + min(max(0,taxable_income_p-taxbracket13),(taxbracket14-taxbracket13))*tax_r14+  min(max(0,taxable_income_p-taxbracket14),(taxbracket15-taxbracket14))*tax_r15+min(max(0,taxable_income_p-taxbracket15),(taxbracket16-taxbracket15)) *tax_r16 + min(max(0,taxable_income_p-taxbracket16),(taxbracket17-taxbracket16))*tax_r17 + min(max(0,taxable_income_p-taxbracket17),(taxbracket18-taxbracket17))*tax_r18+ min(max(0,taxable_income_p-taxbracket18),(taxbracket19-taxbracket18))*tax_r19 + min(max(0,taxable_income_p-taxbracket19),(taxbracket20-taxbracket19))*tax_r20 + min(max(0,taxable_income_p-taxbracket20),(taxbracket21-taxbracket20))*tax_r21 + min(max(0,taxable_income_p-taxbracket21),(taxbracket22-taxbracket21))*tax_r22+min(max(0,taxable_income_p-taxbracket22),(taxbracket23-taxbracket22)) *tax_r23 + min(max(0,taxable_income_p-taxbracket23),(taxbracket24-taxbracket23))*tax_r24 + min(max(0,taxable_income_p-taxbracket24),(taxbracket25-taxbracket24))*tax_r25+ min(max(0,taxable_income_p-taxbracket25),(taxbracket26-taxbracket25))*tax_r26 + min(max(0,taxable_income_p-taxbracket26),(taxbracket27-taxbracket26))*tax_r27 + min(max(0,taxable_income_p-taxbracket27),(taxbracket28-taxbracket27))*tax_r28+ min(max(0,taxable_income_p-taxbracket28),(taxbracket29-taxbracket28))*tax_r29+min(max(0,taxable_income_p-taxbracket29),(taxbracket30-taxbracket29)) *tax_r30 + min(max(0,taxable_income_p-taxbracket30),(taxbracket31-taxbracket30))*tax_r31 +max(0,taxable_income_p-taxbracket31)*tax_r32);
inctax_s_gr=round(min(taxable_income_s,taxbracket1)*tax_r1+min(max(0,taxable_income_s-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_income_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3 + min(max(0,taxable_income_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4+ min(max(0,taxable_income_s-taxbracket4),(taxbracket5-taxbracket4))*tax_r5 + min(max(0,taxable_income_s-taxbracket5),(taxbracket6-taxbracket5))*tax_r6 + min(max(0,taxable_income_s-taxbracket6),(taxbracket7-taxbracket6))*tax_r7+ min(max(0,taxable_income_s-taxbracket7),(taxbracket8-taxbracket7))*tax_r8+min(max(0,taxable_income_s-taxbracket8),(taxbracket9-taxbracket8)) *tax_r9 + min(max(0,taxable_income_s-taxbracket9),(taxbracket10-taxbracket9))*tax_r10 + min(max(0,taxable_income_s-taxbracket10),(taxbracket11-taxbracket10))*tax_r11+ min(max(0,taxable_income_s-taxbracket11),(taxbracket12-taxbracket11))*tax_r12 + min(max(0,taxable_income_s-taxbracket12),(taxbracket13-taxbracket12))*tax_r13 + min(max(0,taxable_income_s-taxbracket13),(taxbracket14-taxbracket13))*tax_r14+  min(max(0,taxable_income_s-taxbracket14),(taxbracket15-taxbracket14))*tax_r15+min(max(0,taxable_income_s-taxbracket15),(taxbracket16-taxbracket15)) *tax_r16 + min(max(0,taxable_income_s-taxbracket16),(taxbracket17-taxbracket16))*tax_r17 + min(max(0,taxable_income_s-taxbracket17),(taxbracket18-taxbracket17))*tax_r18+ min(max(0,taxable_income_s-taxbracket18),(taxbracket19-taxbracket18))*tax_r19 + min(max(0,taxable_income_s-taxbracket19),(taxbracket20-taxbracket19))*tax_r20 + min(max(0,taxable_income_s-taxbracket20),(taxbracket21-taxbracket20))*tax_r21 + min(max(0,taxable_income_s-taxbracket21),(taxbracket22-taxbracket21))*tax_r22+min(max(0,taxable_income_s-taxbracket22),(taxbracket23-taxbracket22)) *tax_r23 + min(max(0,taxable_income_s-taxbracket23),(taxbracket24-taxbracket23))*tax_r24 + min(max(0,taxable_income_s-taxbracket24),(taxbracket25-taxbracket24))*tax_r25+ min(max(0,taxable_income_s-taxbracket25),(taxbracket26-taxbracket25))*tax_r26 + min(max(0,taxable_income_s-taxbracket26),(taxbracket27-taxbracket26))*tax_r27 + min(max(0,taxable_income_s-taxbracket27),(taxbracket28-taxbracket27))*tax_r28+ min(max(0,taxable_income_s-taxbracket28),(taxbracket29-taxbracket28))*tax_r29+min(max(0,taxable_income_s-taxbracket29),(taxbracket30-taxbracket29)) *tax_r30 + min(max(0,taxable_income_s-taxbracket30),(taxbracket31-taxbracket30))*tax_r31 +max(0,taxable_income_s-taxbracket31)*tax_r32);

%%%Tax Credits
%Basic credit

base_cr_p=basic_cred+expense_cred;

if married==1
    base_cr_s=basic_cred+expense_cred;
else
    base_cr_s=0;
end

if inctax_p_gr>0
   base_cr_p=base_cr_p+earner_cred;
end

if inctax_s_gr>0
   base_cr_s=base_cr_s+earner_cred;
end

%Spouse credit
if married==1
    if taxable_income_s>sp_crd_lim
        spouse_cr=0;
    else
        spouse_cr=sp_cred_1;
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
child_cr_p=(children*ch1_credit)*(2-child_crpct_s);

%%%%Total tax credit
tax_cr_p= min(inctax_p_gr, base_cr_p+spouse_cr+child_cr_p);
tax_cr_s= min(inctax_s_gr,base_cr_s+child_cr_s);

inctax_p=max(0,inctax_p_gr-tax_cr_p);
inctax_s=max(0,inctax_s_gr-tax_cr_s);

end
