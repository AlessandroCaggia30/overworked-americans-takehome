function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, soc_sec_lim,pension_rate_emp,sickness_rate_emp,unemployment_rate_emp,care_rate_emp, soc_sec_lim2,ssc_factor,ssc_rate_tot]=ger_parameters_socsec_2007

%Employee
	pension_rate       = 0.0995;
	sickness_rate      = 0.0755;
	unemployment_rate  = 0.0225;
	care_rate          = 0.0085;
	insurable_ceiling  = 63000  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 42750  ;       % insurable ceiling  for sikness and care 
    soc_sec_lim         = 4800  ;
    
     soc_sec_lim2        = 9600  ;
    ssc_factor          = 0.7673;
    ssc_rate_tot        = 0.391;
%Employer
	pension_rate_emp      = 0.0995;
	sickness_rate_emp     = 0.0665;
	unemployment_rate_emp  = 0.0225;
	care_rate_emp          = 0.0085;
    
    
end