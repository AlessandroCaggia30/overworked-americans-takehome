function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim ]=ger_parameters_socsec_1986

	pension_rate       = 0.096;
	sickness_rate      = 0.061;
	unemployment_rate  = 0.02;
	
	insurable_ceiling  = 67200  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 48747    ;     % insurable ceiling  for sikness and care 
	tax_free_inc 		= 1162	;       % other tax-free income
    soc_sec_lim         = 4920  ;
    
end