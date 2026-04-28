function [inctax] = uk_tax_1990(taxable_inc,taxbracket1,tax_r1,tax_r2)


 
inctax=round(   min(taxable_inc,taxbracket1)*tax_r1     +  max(0,taxable_inc-taxbracket1)*tax_r2     ) ;

if taxable_inc<0
    inctax=0;
end

		
end