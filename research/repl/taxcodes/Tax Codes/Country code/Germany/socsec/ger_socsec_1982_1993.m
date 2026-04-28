% Social security contributions for principal earner 

 function [socsec] = ger_socsec_1982_1993( wage, insurable_ceiling, insurable_ceiling2, pension_rate,...
     sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim )
        
	wage_new = wage - tax_free_inc ;
 	
	pension_p = max(0, min(pension_rate*insurable_ceiling, pension_rate*wage_new));
	
	sickness_p = max(0, min(sickness_rate*insurable_ceiling2, sickness_rate*wage_new)) ;
 	
	unemployment_p = max(0, min(unemployment_rate*insurable_ceiling, unemployment_rate*wage_new)) ;
	

	socsec = pension_p + sickness_p + unemployment_p  ;


if wage < soc_sec_lim
	socsec = 0;
end

end