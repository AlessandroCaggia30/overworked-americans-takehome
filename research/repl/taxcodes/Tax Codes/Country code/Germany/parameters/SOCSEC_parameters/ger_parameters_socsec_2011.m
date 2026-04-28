function [insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, soc_sec_lim,pension_rate_emp,sickness_rate_emp,unemployment_rate_emp,care_rate_emp, soc_sec_lim2,ssc_factor]=ger_parameters_socsec_2011

%Employee
	pension_rate       = 0.0995;
	sickness_rate      = 0.082;
	unemployment_rate  = 0.015;
	care_rate          = 0.00975;
	insurable_ceiling  = 66000  ;       % insurable ceiling  for pension and unemployment 
	insurable_ceiling2 = 44500  ;       % insurable ceiling  for sikness and care 
    soc_sec_lim        = 4800  ;
   
    soc_sec_lim2       = 9600  ;
    ssc_factor         = 0.7435;

%Employer
	pension_rate_emp      = 0.0995;
	sickness_rate_emp     = 0.073;
	unemployment_rate_emp = 0.015;
	care_rate_emp         = 0.00975;

end

