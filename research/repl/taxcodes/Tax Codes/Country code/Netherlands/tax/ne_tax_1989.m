function [inctax] = ne_tax_1989(taxable_inc,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9)


                %first bracket                                 %Second 
               
inctax=round( min(taxable_inc,taxbracket1)*tax_r1  +min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,taxable_inc-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,taxable_inc-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,taxable_inc-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    +min(max(0,taxable_inc-taxbracket6),(taxbracket7-taxbracket6))*tax_r7    +min(max(0,taxable_inc-taxbracket7),(taxbracket8-taxbracket7))*tax_r8    +max(0,taxable_inc-taxbracket8)*tax_r9  ) ;

if taxable_inc<0
    inctax=0;
end

		
end