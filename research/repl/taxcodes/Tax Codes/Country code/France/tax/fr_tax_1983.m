function [finc_tax] = fr_tax_1983(gross_taxable_income,married,children,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,tax_limit,tax_limit2,tax_limit3,tax_adj,tax_inc ,tax_inc2,tax_min)

%Family Quotient (takes into account the +3 children)
share=1+married*1 + min(children ,2)*0.5 + max((children-2),0) *1;
taxable_inc=gross_taxable_income/share;
inctax=round(min(taxable_inc,taxbracket1)*tax_r1   +min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,taxable_inc-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,taxable_inc-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,taxable_inc-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    +min(max(0,taxable_inc-taxbracket6),(taxbracket7-taxbracket6))*tax_r7  +min(max(0,taxable_inc-taxbracket7),(taxbracket8-taxbracket7))*tax_r8     +min(max(0,taxable_inc-taxbracket8),(taxbracket9-taxbracket8))*tax_r9    +min(max(0,taxable_inc-taxbracket9),(taxbracket10-taxbracket9))*tax_r10  +min(max(0,taxable_inc-taxbracket10),(taxbracket11-taxbracket10))*tax_r11         +min(max(0,taxable_inc-taxbracket11),(taxbracket12-taxbracket11))*tax_r12 +min(max(0,taxable_inc-taxbracket12),(taxbracket13-taxbracket12))*tax_r13   +max(0,taxable_inc-taxbracket13)*tax_r14 );

%Deduction if tax is below some rate

   if inctax>tax_limit && inctax<tax_limit2
        inc_tax=inctax*(1+tax_inc)-4*(tax_adj-(tax_inc*inctax)) ;
        else if inctax >=tax_limit2 && inctax <tax_limit3
        inc_tax=inctax*(1+tax_inc);
            else if inctax>=tax_limit3
                inc_tax=inctax*(1+tax_inc2);
                else
                inc_tax=inctax;
                end
         end
    end


finc_tax=round(share*inc_tax);

if finc_tax<tax_min
    finc_tax=0;
end


end