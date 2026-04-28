function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim ]=ger_parameters_socsec_1992

	pension_rate       = 0.0885;
	sickness_rate      = 0.0625;
	unemployment_rate  = 0.0315;
	
	insurable_ceiling  = 81600  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 61200    ;     % insurable ceiling  for sikness and care 
	tax_free_inc 		= 0 ;
    soc_sec_lim         =   6000    ;
    
end