

function [ss_all, ss_all_red, ssr_lim, wr_all, lone_par, se_all, child_all, child_credit, child_credit2] = ger_parameters_taxableinc_2002


	lone_par        = 2340   ;       		% lone parent allowance if you are single and have children
	 wr_all		= 1044	;			% Work related allowance 
	 se_all		= 36	;			% special expences allowance
	 ss_all  	= 3068	;			% Social Security allowance 
	 ss_all_red 	= 0.16	;			% Reduction in SS allowance 
	 ssr_lim	= 1334	;			% Bottom Limit for SS allowance 

	 child_credit	= 1848	;			% child credit for each of the first 3 children 
	 child_credit2	= 2148	;			% child credit for each of the fourth and the subsequent children 
	 child_all      = 2904	;			% child allowance (1848 child + 1080 education/ for couples its multiplied by two)

end