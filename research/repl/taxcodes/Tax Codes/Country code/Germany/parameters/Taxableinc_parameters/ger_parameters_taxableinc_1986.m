

function [ basic_relief, wr_all,ss_rate, child_all, child_credit, child_credit2,child_credit3, child_credit4, net_inc_ceiling, net_inc_ceiling2, net_inc_ceiling_child, add_child_transfer, child_credit_spec , ssc_limit_sing, ssc_limit_coup] = ger_parameters_taxableinc_1986

 
	 basic_relief	= 1080	;			% basic relief per gainfully employed person
	 wr_all		= 564	;               % Work related allowance 
	 ss_rate	= 0.18	;               % social security contributions are deducible up to specific per cent fo the gross wage,  and specific ceiling

	 child_credit	= 600	;			% child cash transfers (credit) for the first  child
	 child_credit2	= 1200	;			% child cash transfers (credit) for the second chil 
     child_credit3	= 2640	;			% child cash transfers (credit) for the third  child
	 child_credit4	= 2880	;			% child cash transfers (credit) for the fourth and the subsequent children 
     	
	 child_credit_spec 	= 840 ;      		% child cash transfers (credit) for the second  child if the worker earns more than the specific ceilings
	 child_all      	= 1242 ;            % child allowance multiplied by two (2) ( for couples is multiplied by four (4))


     net_inc_ceiling       = 19000 ;          % net income ceiling amount for a single person, taken when children cash transfers are computed
     net_inc_ceiling2      = 26600 ;          % net income ceiling amount for a married couple, taken when children cash transfers are computed
     net_inc_ceiling_child = 9200 ;           % net income ceiling amount extra per child, taken when children cash transfers are computed
    
        add_child_transfer     = 552  ;             % additional cash transfers per child for non-taxpayers, taken when children cash transfers are computed
     	ssc_limit_sing         = 3510  ;            % upper limit for the deductions for social security contributions for a single person
     	ssc_limit_coup         = 6671 ;             % upper limit for the deductions for social security contributions  for a couple
end