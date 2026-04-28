function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, soc_sec_lim]=ger_parameters_socsec_2003

	pension_rate       = 0.0975;
	sickness_rate      = 0.072;
	unemployment_rate  = 0.0325;
	care_rate          = 0.0085;
	insurable_ceiling  = 61200  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 41400    ;     % insurable ceiling  for sikness and care 
    soc_sec_lim         =   4800    ;
end