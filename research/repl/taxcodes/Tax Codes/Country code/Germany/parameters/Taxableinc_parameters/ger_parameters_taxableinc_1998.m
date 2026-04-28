

function [ss_all, ss_all_red, ssr_lim, wr_all, lone_par, se_all, child_all, child_credit, child_credit2,child_credit3] = ger_parameters_taxableinc_1998


	lone_par        = 5616   ;       		% lone parent allowance if you are single and have children
	 wr_all		= 2000	;			% Work related allowance 
	 se_all		= 108	;			% special expences allowance
	 ss_all  	= 6000	;			% Social Security allowance 
	 ss_all_red 	= 0.16	;			% Reduction in SS allowance 
	 ssr_lim	= 2610	;			% Bottom Limit for SS allowance 

	 child_credit	= 2640	;			% child credit for each of the first and second children 
	 child_credit2	= 3600	;			% child credit for the third chil 
     	 child_credit3	= 4200	;			% child credit for each of the fourth and the subsequent children 
	 child_all      = 3456	;			% child allowance (1848 child + 1080 education/ for couples its multiplied by two)

end