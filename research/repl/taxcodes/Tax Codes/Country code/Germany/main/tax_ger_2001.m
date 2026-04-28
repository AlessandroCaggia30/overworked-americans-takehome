%  Taxation in the German system for the year 2001 


function [inctax,socsec_couple, netincome,ssc_empr] = tax_ger_2001(wage_principal, wage_spouse, married, children, taxyear)



%************************** execute the Parameter functions *************************************************************************************************

	[insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, soc_sec_lim]=ger_parameters_socsec_2001;
	[tx1, tx2, tx3, tx4, tx5, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13]=ger_parameters_tax_2001;
	[ss_all, ss_all_red, ssr_lim, wr_all, lone_par, se_all, child_all,child_credit, child_credit2,child_credit3] = ger_parameters_taxableinc_2001;
	[solid_ceiling, sol_sur_rate, sol_sur_rate2] = ger_parametrs_solsur_1998_2000_2001;   


	

% ********************************  1) SOCIAL CECURITY CONTRIBUTIONS ****************************************************************************************************	
   
	[socsec_p, socsec_p_emp] = ger_socsec_1996_2005( wage_principal, insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate,...
        unemployment_rate, care_rate, taxyear, married, children, soc_sec_lim);
	[socsec_s, socsec_s_emp] = ger_socsec_1996_2005( wage_spouse,    insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate,...
        unemployment_rate, care_rate, taxyear, married, children, soc_sec_lim);
	socsec_couple = socsec_p+socsec_s;
    ssc_empr = round(socsec_p_emp+socsec_s_emp);

%********************************************** 2)  TAX DEDUCTIONS   *********************************************************************************************
 
	Avg_wage_couple = (wage_principal + wage_spouse)/2   ; % wage if married computed as the average of the wages of the principal and the spouse

	[taxable_inc, taxable_inc_child] = ger_taxableinc_2002_2005(wage_principal, wage_spouse, married, children, taxyear, ...
        Avg_wage_couple, ss_all, ss_all_red, ssr_lim, socsec_p, socsec_s, socsec_couple, wr_all, lone_par, se_all, child_all, sickness_rate, ...
        unemployment_rate, care_rate, pension_rate);


	

% ************************** 3) TAXATION ***************************************************************************


	inctax      = ger_tax_2002_2006(taxable_inc,tx1, tx2, tx3, tx4, tx5, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13);
	inctax_ch   = ger_tax_2002_2006(taxable_inc_child,tx1, tx2, tx3, tx4, tx5, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13);

    
% ************************ 4) SOLIDARITY SURCHARGE *************************************************************************************************
 

        sol_sur = min(( inctax_ch*sol_sur_rate ), max( 0, (inctax_ch - solid_ceiling )*sol_sur_rate2 ));

      
% *************************************************************************
    
 if children < 3
        children_credit = children*child_credit;
 elseif children < 4    
        children_credit = ((children-2)*child_credit2 + 2*child_credit);
 else
        children_credit = (child_credit2 + 2*child_credit + (children-3)*child_credit3);
 end
    


	if married == 0
		inctax = min(inctax_ch + sol_sur, inctax + sol_sur - children_credit );
	else
		inctax = 2*min(inctax_ch + sol_sur, inctax + sol_sur - (children_credit/2));
	end
   
    netincome=round(wage_principal+wage_spouse-inctax-socsec_couple); 
   
 end