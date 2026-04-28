

function [tx1, tx2, tx3, tx4,  tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13, tx14, tx15, tx16] =  ger_parameters_tax_2009

	tx1 = 7834  ;  	% y variable calculation constant
	tx2 = 13139   ;   % z variable calculation constant

	tx3 = 0.42 ;	% 4th bracket, tax rate
	tx4 = 8064  ;	% 4th bracket reduction

	tx6 = 228.74 ;	% 3rd bracket squared
	tx7 = 2397   ;	% 3rd bracket single
	tx8 = 1007    ;	% 3rd bracket constant

	tx9 = 939.68 ;	% 2nd bracket squared
	tx10 = 1400  ;	% 2nd bracket single

	tx11 = 7834  ;	% 1st income bracket upper limit
	tx12 = 13139  ;	% 2nd income bracket upper limit
	tx13 = 52551 ;	% 3rd income bracket upper limit

	tx14 = 0.45 ;   % 5th bracket, rate
	tx15 = 15576;	% 5th bracket reduction
	tx16 = 250400;	% 5th bracket lower limit


end