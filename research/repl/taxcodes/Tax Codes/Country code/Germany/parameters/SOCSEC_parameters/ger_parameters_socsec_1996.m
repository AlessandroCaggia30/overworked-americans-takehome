function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, soc_sec_lim]=ger_parameters_socsec_1996

	pension_rate       = 0.096;
	sickness_rate      = 0.067;
	unemployment_rate  = 0.0325;
	care_rate          = 0.00675;
	insurable_ceiling  = 96000  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 72000    ;     % insurable ceiling  for sikness and care 
    soc_sec_lim         = 7080  ;
    
end