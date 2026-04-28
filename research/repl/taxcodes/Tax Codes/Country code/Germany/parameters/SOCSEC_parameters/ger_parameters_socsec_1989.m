function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim ]=ger_parameters_socsec_1989

	pension_rate       = 0.0935;
	sickness_rate      = 0.0645;
	unemployment_rate  = 0.0215;
	
	insurable_ceiling  = 73200  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 54900    ;     % insurable ceiling  for sikness and care 
	tax_free_inc 		= 1300	;       % other tax-free income
    soc_sec_lim         = 5400  ;
    
end