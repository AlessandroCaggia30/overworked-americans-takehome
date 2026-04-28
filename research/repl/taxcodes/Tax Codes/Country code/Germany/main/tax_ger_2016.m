%  Taxation in the German system for the year 2016


function [inctax,socsec_couple, netincome,ssc_empr] = tax_ger_2016(wage_principal, wage_spouse, married, children, taxyear)


%**************************  Parameter functions *************************************************************************************************

	[insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, soc_sec_lim,pension_rate_emp,sickness_rate_emp,unemployment_rate_emp,care_rate_emp,soc_sec_lim2,ssc_factor]=ger_parameters_socsec_2016;
	[tx1, tx2, tx3, tx4, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13, tx14, tx15, tx16]=ger_parameters_tax_2016;
	[ss_all, ss_all_red, ssr_lim, wr_all, lone_par, se_all, child_all,child_credit, child_credit2, limit, ssc_p_limit,child_credit3,lone_add] = ger_parameters_taxableinc_2016;
	[solid_ceiling, sol_sur_rate, sol_sur_rate2] = ger_parametrs_solsur_2009;   


	

% ********************************  1) SOCIAL CECURITY CONTRIBUTIONS ****************************************************************************************************	
   
	[socsec_p, socsec_p_emp] = ger_socsec_2013(wage_principal, insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, taxyear, married, children, soc_sec_lim,pension_rate_emp,sickness_rate_emp,unemployment_rate_emp,care_rate_emp,soc_sec_lim2,ssc_factor);
    [socsec_s, socsec_s_emp]  = ger_socsec_2013(wage_spouse,    insurable_ceiling, insurable_ceiling2, pension_rate, sickness_rate, unemployment_rate, care_rate, taxyear, married, children, soc_sec_lim,pension_rate_emp,sickness_rate_emp,unemployment_rate_emp,care_rate_emp,soc_sec_lim2,ssc_factor);
	socsec_couple = round(socsec_p+socsec_s);
    ssc_empr = round(socsec_p_emp+socsec_s_emp);


%********************************************** 2)  TAX DEDUCTIONS   *********************************************************************************************
 
	Avg_wage_couple = (wage_principal + wage_spouse)/2   ; % wage if married computed as the average of the wages of the principal and the spouse

	[taxable_inc, taxable_inc_child] = ger_taxableinc_2015(wage_principal, wage_spouse, married, children, taxyear, ... 
        Avg_wage_couple, ss_all, ss_all_red, ssr_lim, socsec_p, socsec_s, socsec_couple, wr_all, lone_par, se_all, child_all, sickness_rate, ...
        unemployment_rate, care_rate,pension_rate,insurable_ceiling,insurable_ceiling2, limit, ssc_p_limit, lone_add);


	

% ************************** 3) TAXATION ***************************************************************************


	inctax      = ger_tax_2009(taxable_inc,tx1, tx2, tx3, tx4, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13, tx14, tx15, tx16);
	inctax_ch   = ger_tax_2009(taxable_inc_child,tx1, tx2, tx3, tx4, tx6, tx7, tx8, tx9, tx10, tx11, tx12, tx13, tx14, tx15, tx16);

    
% ************************ 4) SOLIDARITY SURCHARGE *************************************************************************************************
 

        sol_sur = min(( inctax_ch*sol_sur_rate ), max( 0, (inctax_ch - solid_ceiling )*sol_sur_rate2 ));
	
% *************************************************************************

    
    if children<=2
        children_credit = children*child_credit;
    elseif children==3    
        children_credit = child_credit2 + child_credit*2;
    elseif children>3   
        children_credit = child_credit2 + child_credit+(children-3)*child_credit3;
    end
    

	if married == 0
		inctax = round(min( (inctax_ch + sol_sur), (inctax + sol_sur - children_credit) ));
	else
		inctax = round(2*min( (inctax_ch + sol_sur), (inctax + sol_sur - (children_credit/2)) ));
    end

    netincome=round(wage_principal+wage_spouse-inctax-socsec_couple);

   
 end