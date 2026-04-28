% Taxation in the German system for the year 1994

function [inctax_fin,socsec_couple, netincome,ssc_empr] = tax_ger_1994(wage_principal, wage_spouse, married, children, taxyear)



%************************** execute the Parameter functions *************************************************************************************************

	[insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim ]=ger_parameters_socsec_1994;
	[tx1, tx3, tx4, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13]=ger_parameters_tax_1990_1993;
	[ wr_all,ss_all_red, child_all, child_credit, child_credit2,child_credit3, child_credit4, net_inc_ceiling,...
        net_inc_ceiling2, net_inc_ceiling_child, add_child_transfer, child_credit_spec ,ss_all,ssr_lim] = ger_parameters_taxableinc_1994;
	  


	

% ********************************  1) SOCIAL CECURITY CONTRIBUTIONS ****************************************************************************************************	
   
	socsec_p = ger_socsec_1982_1993( wage_principal, insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate,...
        unemployment_rate, tax_free_inc, soc_sec_lim);
	socsec_s = ger_socsec_1982_1993( wage_spouse,    insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate,...
        unemployment_rate, tax_free_inc, soc_sec_lim );
	socsec_couple = round(socsec_p+socsec_s);
    ssc_empr=round(socsec_couple);

%********************************************** 2)  TAX DEDUCTIONS   *********************************************************************************************
 
	Avg_wage_couple = (wage_principal + wage_spouse)/2   ; % wage if married computed as the average of the wages of the principal and the spouse

	[taxable_inc_child] = ger_taxableinc_1994(wage_principal, wage_spouse, socsec_p, socsec_s, married, children, Avg_wage_couple, wr_all, child_all, ss_all,ssr_lim,ss_all_red);


	

% ************************** 3) TAXATION ***************************************************************************


	inctax      = ger_tax_1990_1993(taxable_inc_child,tx1, tx3, tx4, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13);
	


if married == 1
        net_inc    =  wage_principal + wage_spouse - inctax - socsec_couple;
else 
	net_inc    =  wage_principal - inctax - socsec_p;
end

% *************************************************************************

    if married == 0
        net_inc_ceiling = net_inc_ceiling;
    else
        net_inc_ceiling = net_inc_ceiling2;
    end



	if net_inc > (net_inc_ceiling + net_inc_ceiling_child*children)
		if children < 2
        		children_credit = children*child_credit;
 		elseif children < 3    
        		children_credit = max((child_credit + child_credit_spec),(child_credit2 + child_credit)-0.5*(net_inc-(net_inc_ceiling + ...
                    net_inc_ceiling_child*children)));
 		elseif children < 4
 		       children_credit = max((child_credit + 3*child_credit_spec),(child_credit3 + child_credit2 + child_credit)-0.5*(net_inc- ...
                   (net_inc_ceiling + net_inc_ceiling_child*children)));
        else
                children_credit = max((2*(children - 2)*child_credit_spec + child_credit + child_credit_spec),((child_credit3 + ...
                    child_credit2 + child_credit) + (children-3)*child_credit4 - 0.5*((net_inc-(net_inc_ceiling + net_inc_ceiling_child*children)))));
		end
	else 
		if children < 2
      			  children_credit = children*child_credit;
 		elseif children < 3    
  		      children_credit = (child_credit2 + child_credit);
		 elseif children < 4
 		       children_credit = (child_credit3 + child_credit2 + child_credit);
		 else
			children_credit = (child_credit3 + child_credit2 + child_credit) + (children-3)*child_credit4 ;
		 end
    end
  
    
    
  if (children > 0) && (inctax < 1)
      children_credit = children_credit + (add_child_transfer*children)   ;
  else
      children_credit = children_credit;
  end
     
    
     
if married == 0
	inctax_fin = inctax - children_credit ;
else
	inctax_fin =  2*(inctax - (children_credit/2)) ;
        
end
 
     netincome=round(wage_principal+wage_spouse-inctax_fin-socsec_couple); 
  
 end