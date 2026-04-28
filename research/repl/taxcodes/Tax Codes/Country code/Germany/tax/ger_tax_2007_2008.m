function [inctax] = ger_tax_2007_2008(taxable_inc,tx1, tx2, tx3, tx4, tx5, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13, tx14, tx15, tx16)


% Income tax Function without children


	y_principal = (taxable_inc -tx1 ) / 10000  ;

	z_principal = (taxable_inc -tx2) / 10000  ;

	if taxable_inc <= tx11 
		inctax = 0 ;
	elseif taxable_inc < tx12
		inctax = ((tx9 * y_principal) + tx10)* y_principal;
	elseif taxable_inc < tx13   
		inctax = ((tx6 * z_principal) + tx7) * z_principal+tx8;
	elseif taxable_inc < tx16 
		inctax = (tx3*taxable_inc) - tx4 ;
	else
		inctax = (tx14*taxable_inc) - tx15 ;
	end 


		
end