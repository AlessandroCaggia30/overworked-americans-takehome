function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim ]=ger_parameters_socsec_1991

	pension_rate       = 0.08975;
	sickness_rate      = 0.061;
	unemployment_rate  = 0.030875;
	
	insurable_ceiling  = 78000  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 58500    ;     % insurable ceiling  for sikness and care 
	tax_free_inc = 0 ;
    soc_sec_lim     =   5760    ;
    
end