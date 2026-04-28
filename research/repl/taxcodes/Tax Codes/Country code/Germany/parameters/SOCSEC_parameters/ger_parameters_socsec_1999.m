function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, soc_sec_lim]=ger_parameters_socsec_1999

	pension_rate       = 0.0985;
	sickness_rate      = 0.068;
	unemployment_rate  = 0.0325;
	care_rate          = 0.0085;
	insurable_ceiling  = 102000  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 76500    ;     % insurable ceiling  for sikness and care 
    soc_sec_lim         =   7560    ;    % 3865 euro 1.958 dm for 1 euro
end