function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim ]=ger_parameters_socsec_1993

	pension_rate       = 0.096;
	sickness_rate      = 0.0655;
	unemployment_rate  = 0.0325;
	
	insurable_ceiling  = 91200  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 68400    ;     % insurable ceiling  for sikness and care 
	tax_free_inc 		= 0 ;
    soc_sec_lim         = 6720  ; %"geringfügigkeits-entgeltgrenze":560 DM per month
    
end