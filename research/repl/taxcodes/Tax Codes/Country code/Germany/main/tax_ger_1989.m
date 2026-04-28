% Taxation in the German system for the year 1989  polyzig@yahoo.com

function [inctax,socsec_couple, netincome,ssc_empr] = tax_ger_1989(wage_principal, wage_spouse, married, children, taxyear)



%************************** execute the Parameter functions *************************************************************************************************

	[insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, tax_free_inc, soc_sec_lim ]=ger_parameters_socsec_1989 ;
	[tx1,tx2, tx3, tx4, tx5, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13, tx14, tx15, tx16, tx17, tx18] =  ger_parameters_tax_1988_1989 ;
	[ basic_relief, wr_all,ss_rate, child_all, child_credit, child_credit2,child_credit3, child_credit4, net_inc_ceiling, net_inc_ceiling2, ...
        net_inc_ceiling_child, add_child_transfer, child_credit_spec, ssc_limit_sing, ssc_limit_coup] = ger_parameters_taxableinc_1989;
	  


	

% ********************************  1) SOCIAL CECURITY CONTRIBUTIONS ****************************************************************************************************	
   
	socsec_p = ger_socsec_1982_1993( wage_principal, insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, ...
        unemployment_rate, tax_free_inc, soc_sec_lim );
	socsec_s = ger_socsec_1982_1993( wage_spouse,    insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate,...
        unemployment_rate, tax_free_inc, soc_sec_lim );
	socsec_couple = round(socsec_p+socsec_s);
    ssc_empr=socsec_couple;
    
%********************************************** 2)  TAX DEDUCTIONS   *********************************************************************************************
 
	Avg_wage_couple = (wage_principal + wage_spouse)/2   ; % wage if married computed as the average of the wages of the principal and the spouse

	[taxable_inc_child, ss_ded_p] = ger_taxableinc_1982_1989(wage_principal, wage_spouse, socsec_p,socsec_couple, married, children, taxyear, ...
        Avg_wage_couple, ss_rate, basic_relief,  wr_all, child_all, ssc_limit_sing, ssc_limit_coup, tax_free_inc);


	

% ************************** 3) TAXATION ***************************************************************************


	inctax = ger_tax_1986_1989(taxable_inc_child, tx1,tx2, tx3, tx4, tx5, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13, tx14, tx15, tx16, tx17, tx18);
	

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
		inctax = round(inctax - children_credit) ;
	else
		inctax =   round(2*(inctax - (children_credit/2))) ;
        
    end
    
    
 netincome=round(wage_principal+wage_spouse-inctax-socsec_couple);   
 
 end