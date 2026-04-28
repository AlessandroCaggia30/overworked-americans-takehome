function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim ]=ger_parameters_socsec_1983

	pension_rate       = 0.09;
	sickness_rate      = 0.06;
	unemployment_rate  = 0.023;
	
	insurable_ceiling  = 60000  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 45000  ;       % insurable ceiling  for sikness and care 
	tax_free_inc 		= 1094 ;        % Other tax-free income
    soc_sec_lim         = 4680  ;
    
end