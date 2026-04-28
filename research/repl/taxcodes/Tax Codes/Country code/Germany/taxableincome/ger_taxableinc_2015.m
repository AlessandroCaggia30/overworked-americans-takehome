% returns the taxable income without and with children allowance, after deduction of  certain allowances like : work related, social security all., lone parent etc.

function [taxable_inc, taxable_inc_child] = ger_taxableinc_2015(wage_principal, wage_spouse, married, children, ...
    taxyear, Avg_wage_couple, ss_all, ss_all_red, ssr_lim, socsec_p , socsec_s, socsec_couple, wr_all, lone_par,...
    se_all, child_all, sickness_rate, unemployment_rate, care_rate,pension_rate, insurable_ceiling, insurable_ceiling2, limit, ssc_p_limit,lone_add )


% Tax deductions for social security payments ( work related and special expenses allowances ) 
% social security tax deductions for singles 

% Tax allowance Calculation OLD Scheme----------------------------------------------------------------- 
    function [ss_ded, ss_ded_new, ss_ded_old] = socsec_ded(wage, ss_all_red, ss_all, ssr_lim, socsec, limit, ssc_p_limit, children,insurable_ceiling,insurable_ceiling2)
        
        ssc_intermediate = max(0,(ss_all)-(wage*ss_all_red)) ; 
        ssc_pay = socsec - ssc_intermediate;
         ss_ded_old = ssc_intermediate  ; 
         
         if ssr_lim > ssc_pay
             ss_ded_old  = ss_ded_old  + ssc_pay ;
         elseif ssr_lim <= ssc_pay;
             ss_ded_old  = ss_ded_old  + ssr_lim;
         end
         
         if ssr_lim < ssc_pay
            ssc_pay_2 = ssc_pay- ssr_lim ;
         else 
             ssc_pay_2 = 0;
         end
         
         if ssc_pay_2 > ssr_lim
             ss_ded_old  = ss_ded_old  + 0.5*ssr_lim;
         elseif ssc_pay_2 <= ssr_lim
             ss_ded_old  = ss_ded_old  + 0.5*ssc_pay_2;
         end
%-------------------------------------------------------------------------------------------------------------        
% the NEW Scheme for tax allowances from 2010

        pension = ((0.60+(0.02*(taxyear-2005)))*(min(ssc_p_limit, min(2*pension_rate*(wage), 2*pension_rate*insurable_ceiling  ))))-min(pension_rate*(wage), pension_rate*insurable_ceiling);  
        
        if children == 0
             care = min((care_rate+0.0025)*insurable_ceiling2, (care_rate+0.0025)*wage) ;
        else 
             care = min(care_rate*insurable_ceiling2, care_rate*wage) ;
        end
        
        others =  min(sickness_rate*insurable_ceiling2, sickness_rate*wage)*0.96+care ;
        	 
        
        if others<limit
        others =  min(limit , (others+min(unemployment_rate*insurable_ceiling, unemployment_rate*wage)));
        end
        
        ss_ded_new = pension + others;
                
%-------------- Decision between the two schemes -----------------------------------------------------------------------------------------------------------------------------    
            
           if ss_ded_new > ss_ded_old
               ss_ded = ss_ded_new;
           else
               ss_ded = ss_ded_old;
           end

            
    end

ss_ded_p = socsec_ded(wage_principal, ss_all_red, ss_all, ssr_lim, socsec_p, limit, ssc_p_limit,children,insurable_ceiling,insurable_ceiling2);
ss_ded_s = socsec_ded(wage_spouse,    ss_all_red, ss_all, ssr_lim, socsec_s, limit, ssc_p_limit,children,insurable_ceiling,insurable_ceiling2);
ss_ded_couple = socsec_ded((wage_principal+wage_spouse), ss_all_red, (2*ss_all), (2*ssr_lim), (socsec_s+socsec_p), 2*limit,  2*ssc_p_limit, children,2*insurable_ceiling,2*insurable_ceiling2);

 



% computing the TAXABLE INCOME   

% TAXABLE INCOME without taking into account the children alowance 
	   

    if married == 0
        if children == 0
            taxable_inc = max(0,(wage_principal - ss_ded_p - wr_all -se_all ));
        else
            taxable_inc =  max(0,(wage_principal - ss_ded_p - wr_all - lone_par -lone_add*(children-1)- se_all )) ;
        end
    else 
        if wage_spouse == 0 
            taxable_inc = max(0, ((2*Avg_wage_couple - ss_ded_couple - wr_all - 2*se_all )/2)) ;
        elseif wage_principal == 0
            taxable_inc = max(0, ((2*Avg_wage_couple - ss_ded_couple - wr_all - 2*se_all)/2)) ;
        else
            taxable_inc = max(0, ((2*Avg_wage_couple - ss_ded_couple - 2*wr_all - 2*se_all)/2)) ;
        end
    end
    
    
% TAXABLE INCOME  taking into account the children allowance 

    
        if married == 0
            if children == 0
                taxable_inc_child = max(0,(wage_principal - ss_ded_p - wr_all -se_all- children*child_all ));
            else
                taxable_inc_child =  max(0,(wage_principal - ss_ded_p - wr_all - lone_par -lone_add*(children-1) - se_all - 2*children*child_all )) ;
            end
        else 
            if wage_spouse == 0 
                taxable_inc_child = max(0, ((2*Avg_wage_couple - ss_ded_couple - wr_all - 2*se_all - children*2*child_all )/2)) ;
            elseif wage_principal == 0
                taxable_inc_child = max(0, ((2*Avg_wage_couple - ss_ded_couple - wr_all - 2*se_all  - children*2*child_all)/2)) ;
            else
                taxable_inc_child = max(0, ((2*Avg_wage_couple - ss_ded_couple - 2*wr_all - 2*se_all - children*2*child_all)/2)) ;
            end
         end
    
    
    


end