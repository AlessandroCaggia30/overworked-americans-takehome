

function [tx1, tx2, tx3, tx4,  tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13, tx14, tx15, tx16] =  ger_parameters_tax_2015

	tx1 = 8472  ;  	% y variable calculation constant
	tx2 = 13469   ;   % z variable calculation constant

	tx3 = 0.42 ;	% 4th bracket, tax rate
	tx4 = 8261.29  ;	% 4th bracket reduction

	tx6 = 228.74 ;	% 3rd bracket squared
	tx7 = 2397   ;	% 3rd bracket single
	tx8 = 948.68   ;	% 3rd bracket constant

	tx9 = 997.60 ;	% 2nd bracket squared
	tx10 = 1400  ;	% 2nd bracket single

	tx11 = 8472  ;	% 1st income bracket upper limit
	tx12 = 13469  ;	% 2nd income bracket upper limit
	tx13 = 52881 ;	% 3rd income bracket upper limit

	tx14 = 0.45 ;   % 5th bracket, rate
	tx15 = 15783.19;	% 5th bracket reduction
	tx16 = 250730;	% 5th bracket lower limit


end