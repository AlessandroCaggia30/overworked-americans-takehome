function [inctax] = ne_tax_2000(taxable_inc,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4)


 
inctax=round(min(taxable_inc,taxbracket1)*tax_r1+min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1))*tax_r2+ min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3+ max(0,taxable_inc-taxbracket3)*tax_r4) ;

if taxable_inc<0
    inctax=0;
end

		
end