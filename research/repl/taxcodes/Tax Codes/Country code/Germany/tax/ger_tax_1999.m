function [inctax] = ger_tax_1999(taxable_inc ,tx1, tx2, tx3, tx4, tx5, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13,tx14, tx15, tx16, tx17, tx18)


% Income tax Function without children
 new = taxable_inc/54;
 taxable_inc = (floor(new))*54;

	y_principal = (taxable_inc -tx1 ) / 10000  ;

	z_principal = (taxable_inc -tx2) / 10000  ;

	q_principal = (taxable_inc -tx14) / 10000  ;

	if taxable_inc <= tx11 
		inctax = 0 ;
	elseif taxable_inc < tx12
		inctax = ((tx9 * y_principal) + tx10)* y_principal;
	elseif taxable_inc < tx18   
		inctax = ((tx6 * z_principal) + tx7) * z_principal+tx8;
	elseif taxable_inc < tx5
		inctax = ((tx15 * q_principal) + tx16) * q_principal+tx17;
	else 
		inctax = (tx3*taxable_inc) - tx4 ;
	end 

		
end