

function [tx1, tx2, tx3, tx4,  tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13, tx14, tx15, tx16] =  ger_parameters_tax_2016

	tx1 = 8652  ;  	% y variable calculation constant
	tx2 = 13669   ;   % z variable calculation constant

	tx3 = 0.42 ;	% 4th bracket, tax rate
	tx4 = 8394.14  ;	% 4th bracket reduction

	tx6 = 225.40 ;	% 3rd bracket squared
	tx7 = 2397   ;	% 3rd bracket single
	tx8 = 952.48   ;	% 3rd bracket constant

	tx9 = 993.62 ;	% 2nd bracket squared
	tx10 = 1400  ;	% 2nd bracket single

	tx11 = 8652  ;	% 1st income bracket upper limit
	tx12 = 13669  ;	% 2nd income bracket upper limit
	tx13 = 53665 ;	% 3rd income bracket upper limit

	tx14 = 0.45 ;   % 5th bracket, rate
	tx15 = 16027.52;	% 5th bracket reduction
	tx16 = 254446;	% 5th bracket lower limit


end