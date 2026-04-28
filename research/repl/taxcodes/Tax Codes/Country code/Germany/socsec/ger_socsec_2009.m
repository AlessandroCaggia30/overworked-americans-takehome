% Social security contributions for principal earner 

 function [socsec,socsec_emp] = ger_socsec_2009( wage, insurable_ceiling,insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, taxyear, married, children, soc_sec_lim,pension_rate_emp,sickness_rate_emp,unemployment_rate_emp,care_rate_emp,soc_sec_lim2,ssc_factor)
                   
  	
 %Employee
	pension_p = min(pension_rate*insurable_ceiling, pension_rate*wage);
	
	sickness_p = min(sickness_rate*insurable_ceiling2, sickness_rate*wage) ;
 	
	unemployment_p = min(unemployment_rate*insurable_ceiling, unemployment_rate*wage) ;
	
if children == 0
    care_p = min((care_rate+0.0025)*insurable_ceiling2, (care_rate+0.0025)*wage) ;
else 
    care_p = min(care_rate*insurable_ceiling2, care_rate*wage) ;
end

	socsec = pension_p + sickness_p + unemployment_p + care_p ;


if wage < soc_sec_lim
	socsec = 0;
elseif wage <= soc_sec_lim2
	socsec = (0.3/ssc_factor)*(((ssc_factor*soc_sec_lim)+((2-ssc_factor)*(wage-soc_sec_lim)))-(wage/2));
end

%Employer
	pension_p_emp = min(pension_rate_emp*insurable_ceiling, pension_rate_emp*wage);
	
	sickness_p_emp = min(sickness_rate_emp*insurable_ceiling2, sickness_rate_emp*wage) ;
 	
	unemployment_p_emp = min(unemployment_rate_emp*insurable_ceiling, unemployment_rate_emp*wage) ;
	
    care_p_emp = min(care_rate_emp*insurable_ceiling2, care_rate_emp*wage) ;

	socsec_emp = pension_p_emp + sickness_p_emp + unemployment_p_emp + care_p_emp ;


if wage <= soc_sec_lim
    socsec_emp=wage*0.3;
end


