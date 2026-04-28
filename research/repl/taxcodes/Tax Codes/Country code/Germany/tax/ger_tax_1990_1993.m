function [inctax] = ger_tax_1990_1993(taxable_inc,tx1, tx3, tx4,tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13)


% Income tax Function without children

 new = taxable_inc/54;
 taxable_inc = (floor(new))*54;

	y_principal = (taxable_inc -tx1 ) / 10000  ;


	if taxable_inc <= tx11 
		inctax = 0 ;
	elseif taxable_inc <= tx12
		inctax = (taxable_inc*tx9)-tx10;
	elseif taxable_inc <= tx13   
		inctax = ((tx6 * y_principal) + tx7) * y_principal+tx8;
	else 
		inctax = (tx3*taxable_inc) - tx4 ;
	end 

		
end