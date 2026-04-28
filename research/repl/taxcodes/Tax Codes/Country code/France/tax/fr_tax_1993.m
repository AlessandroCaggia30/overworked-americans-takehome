function [f_inctax] = fr_tax_1993(gross_taxable_income,wage,married,children,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,noded_r)

%Family Quotient (takes into account the +3 children)
share=1+married*1 + min(children ,2)*0.5 + max((children-2),0) *1;
taxable_inc=gross_taxable_income/share;
inctax=round(min(taxable_inc,taxbracket1)*tax_r1   +min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,taxable_inc-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,taxable_inc-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,taxable_inc-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +max(0,taxable_inc-taxbracket6)*tax_r7 );

if taxable_inc<0
    inctax=0;
end

inc_tax=share*inctax;

cs_noded=max(0,noded_r*wage);
f_inctax=round(inc_tax+cs_noded);

end