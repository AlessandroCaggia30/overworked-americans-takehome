% returns the taxable income without and with children allowance, after deduction of  certain allowances like : work related, social security all., lone parent etc.

function [taxable_inc_child, ss_ded_couple] = ger_taxableinc_1994(wage_principal, wage_spouse, socsec_p, socsec_s, married, children, Avg_wage_couple, wr_all, child_all, ss_all,ssr_lim,ss_all_red)


% Tax deductions for social security payments 
% social security tax deductions for singles 

 
    function [ss_ded] = ss_ded(wage, ss_all_red, ss_all, ssr_lim, socsec)
        
                             
        ssc_intermediate = max(0,(ss_all)-(wage*ss_all_red)) ; 
        ssc_pay = socsec - ssc_intermediate;
        ss_ded = ssc_intermediate  ; 
         
         if ssr_lim > ssc_pay
             ss_ded = ss_ded + ssc_pay ;
         elseif ssr_lim <= ssc_pay;
             ss_ded = ss_ded + ssr_lim;
         end
         
         if ssr_lim < ssc_pay
            ssc_pay_2 = ssc_pay- ssr_lim ;
         else 
             ssc_pay_2 = 0;
         end
         
         if ssc_pay_2 > ssr_lim
             ss_ded = ss_ded + 0.5*ssr_lim;
         elseif ssc_pay_2 <= ssr_lim
             ss_ded = ss_ded + 0.5*ssc_pay_2;
         end
            
            
    end

ss_ded_p = ss_ded(wage_principal, ss_all_red, ss_all, ssr_lim, socsec_p);
ss_ded_s = ss_ded(wage_spouse,    ss_all_red, ss_all, ssr_lim, socsec_s);
ss_ded_couple = ss_ded((wage_principal+wage_spouse), ss_all_red, (2*ss_all), (2*ssr_lim), (socsec_s+socsec_p));




% computing the TAXABLE INCOME      

    
        if married == 0
            if children == 0
                taxable_inc_child = max(0,(wage_principal - ss_ded_p - wr_all ));
            else
                taxable_inc_child =  max(0,(wage_principal - ss_ded_p - wr_all - 2*children*child_all )) ;
            end
        else 
            if wage_spouse == 0 
                taxable_inc_child = max(0, ((2*Avg_wage_couple - ss_ded_couple - wr_all - children*2*child_all )/2)) ;
            elseif wage_principal == 0
                taxable_inc_child = max(0, ((2*Avg_wage_couple - ss_ded_couple - wr_all  - children*2*child_all)/2)) ;
            else
                taxable_inc_child = max(0, ((2*Avg_wage_couple - ss_ded_couple - 2*wr_all - children*2*child_all)/2)) ;
            end
         end
    
  
end