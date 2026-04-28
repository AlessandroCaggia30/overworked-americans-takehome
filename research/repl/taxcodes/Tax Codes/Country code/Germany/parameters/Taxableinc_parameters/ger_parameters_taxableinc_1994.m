

function [ wr_all,ss_all_red, child_all, child_credit, child_credit2,child_credit3, child_credit4, net_inc_ceiling, net_inc_ceiling2, net_inc_ceiling_child, add_child_transfer, child_credit_spec ,ss_all,ssr_lim] = ger_parameters_taxableinc_1994



wr_all		= 2000	;			% Work related allowance 
ss_all  	= 6000	;			% Social Security allowance 
 ss_all_red = 0.16	;			% Reduction in SS allowance 
ssr_lim	= 2610	;			% Bottom Limit for SS allowance 

child_credit	= 840	;			% child cash transfers (credit) for the first  child
child_credit2	= 1560	;			% child cash transfers (credit) for the second child
child_credit3	= 2640	;			% child cash transfers (credit) for the third  child
child_credit4	= 2880	;			% child cash transfers (credit) for the fourth and the subsequent children 
child_credit_spec = 840 ;          % child cash transfers (credit) for the second  child if the worker earns more than the specific ceilings
child_all      = 2052	;			% child allowance multiplied by two (2) ( for couples is multiplied by four (4))

net_inc_ceiling       = 19000 ;          % net income ceiling amount for a single person taken when children cash transfers are computed
net_inc_ceiling2      = 26600 ;          % net income ceiling amount for a married couple taken when children cash transfers are computed
net_inc_ceiling_child = 9200 ;            % net income ceiling amount extra per child , taken when children cash transfers are computed
add_child_transfer     = 780  ;            % additional cash transfers per child for non-taxpayers, taken when children cash transfers are computed
end