function [inctax] = uk_tax_1992(taxable_inc,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3)


 
inctax=round(   min(taxable_inc,taxbracket1)*tax_r1     +min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1))*tax_r2 +max(0,taxable_inc-taxbracket2)*tax_r3     ) ;

if taxable_inc<0
    inctax=0;
end

		
end