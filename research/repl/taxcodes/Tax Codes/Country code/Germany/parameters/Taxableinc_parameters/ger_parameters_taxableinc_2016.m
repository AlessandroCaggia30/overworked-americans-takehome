

function [ss_all, ss_all_red, ssr_lim, wr_all, lone_par, se_all, child_all, child_credit, child_credit2, limit, ssc_p_limit,child_credit3,lone_add ] = ger_parameters_taxableinc_2016


	 lone_par   = 1908  ;       	% lone parent allowance if you are single and have children
     lone_add   = 240   ;
	 wr_all		= 1000	;			% Work related allowance 
	 se_all		= 36	;			% special expences allowance
	 ss_all  	= 1500	;			% Social Security allowance 
	 ss_all_red	= 0.16	;			% Reduction in SS allowance 
	 ssr_lim	= 1334	;			% Bottom Limit for SS allowance 

	 child_credit	= 2280	;			% child credit for first & second child
	 child_credit2	= 2352	;			% child credit for third child
     child_credit3  = 2652 ;            % child credit subsequent children
	 child_all      = 3624	;           % child allowance 
     limit          = 1900  ;           % limit for other social security expences (health, unemployment, and care insuarance)
     ssc_p_limit    = 20000 ;           % limit for the computation os the soc. sec. deductions for the NEW SCHEME
     
end