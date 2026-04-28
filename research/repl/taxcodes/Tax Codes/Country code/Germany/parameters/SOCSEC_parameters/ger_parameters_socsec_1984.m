function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim ]=ger_parameters_socsec_1984

	pension_rate       = 0.0925;
	sickness_rate      = 0.058;
	unemployment_rate  = 0.023;
	
	insurable_ceiling  = 62400  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 46800  ;       % insurable ceiling  for sikness and care 
	tax_free_inc 		= 1094	;       % Other tax-free income
    soc_sec_lim         =   4680    ;
    
end