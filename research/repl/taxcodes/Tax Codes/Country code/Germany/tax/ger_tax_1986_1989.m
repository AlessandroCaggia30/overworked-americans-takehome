function [inctax] = ger_tax_1986_1989(taxable_inc,tx1,tx2, tx3, tx4, tx5, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13, tx14, tx15, tx16, tx17, tx18)


% Income tax Function without children

 new = taxable_inc/54;
 taxable_inc = (floor(new))*54;

	y_principal = (taxable_inc - tx1 ) / 10000  ;
	z_principal =  (taxable_inc - tx2 ) / 10000  ;

	if taxable_inc <= tx3 
		inctax = 0 ;
	elseif taxable_inc <= tx6
		inctax = (taxable_inc*tx4)-tx5;
	elseif taxable_inc <= tx12   
		inctax = (((((tx7 * y_principal) - tx8) * y_principal+tx9)* y_principal + tx10)*y_principal) + tx11;
	elseif  taxable_inc <= tx16
		inctax = ((tx13*z_principal) + tx14)*z_principal + tx15 ;
	else
		inctax =  taxable_inc*tx17 - tx18 ; 
	end 

		
end