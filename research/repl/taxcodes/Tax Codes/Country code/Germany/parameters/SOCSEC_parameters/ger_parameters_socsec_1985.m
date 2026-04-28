function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim ]=ger_parameters_socsec_1985

	pension_rate       = 0.095;
	sickness_rate      = 0.059;
	unemployment_rate  = 0.0211;

	insurable_ceiling  = 64800  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 48600    ;     % insurable ceiling  for sikness and care 
	tax_free_inc 		= 1135	;       % other tax-free income
    soc_sec_lim         =   4800    ;
    
end