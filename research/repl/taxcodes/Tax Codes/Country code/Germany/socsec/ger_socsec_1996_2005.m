% Social security contributions for principal earner 

 function [socsec, socsec_emp] = ger_socsec_1996_2005( wage, insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, ...
     unemployment_rate, care_rate, taxyear, married, children, soc_sec_lim)

 %Employee 	
	pension_p = min(pension_rate*insurable_ceiling, pension_rate*wage);
	
	sickness_p = min(sickness_rate*insurable_ceiling2, sickness_rate*wage) ;
 	
	unemployment_p = min(unemployment_rate*insurable_ceiling, unemployment_rate*wage) ;
	
    care_p = min(care_rate*insurable_ceiling2, care_rate*wage) ;

    
	socsec = pension_p + sickness_p + unemployment_p + care_p ;

    
if  wage < soc_sec_lim
	socsec = 0;
elseif taxyear >= 2003 && wage < 9600
    socsec = ((wage-4800)*0.341)+0.04*wage;
end


%Employer
if wage> soc_sec_lim || taxyear<2003
	socsec_emp =  socsec ;
elseif wage<=soc_sec_lim && taxyear >= 2003
    socsec_emp=wage*0.25;
end



end