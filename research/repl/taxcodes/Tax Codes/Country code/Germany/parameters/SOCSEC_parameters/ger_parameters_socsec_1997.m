function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, soc_sec_lim]=ger_parameters_socsec_1997

	pension_rate       = 0.1015;
	sickness_rate      = 0.068;
	unemployment_rate  = 0.0325;
	care_rate          = 0.0085;
	insurable_ceiling  = 98400  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 73800    ;     % insurable ceiling  for sikness and care 
    soc_sec_lim         =   7320    ;
end