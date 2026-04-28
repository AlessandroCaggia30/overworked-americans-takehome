% returns the taxable income without and with children allowance, after deduction of  sertain allowances like : work related, social security all., lone parent etc.

function [taxable_inc_child, ss_ded_couple] = ger_taxableinc_1990_1993(wage_principal, wage_spouse, socsec_p,socsec_couple, married, children, taxyear, Avg_wage_couple, ss_rate , wr_all, child_all, ssc_limit_sing, ssc_limit_coup)



% Tax deductions for social security payments ( work related and special expenses allowances ) 
% social security tax deductions for singles 

    function [ss_ded] = ss_ded(wage,ss_rate)

        if married == 0
            ss_ded = min(ssc_limit_sing,ss_rate*wage) ;       
        else
            ss_ded = min(ssc_limit_coup,ss_rate*wage) ;
        end

    end

ss_ded_p = ss_ded(wage_principal, ss_rate);
ss_ded_s = ss_ded(wage_spouse,  ss_rate);
ss_ded_couple = ss_ded((wage_principal+wage_spouse), ss_rate);

 





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