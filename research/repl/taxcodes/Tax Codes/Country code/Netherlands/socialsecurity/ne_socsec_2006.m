

% Employee social security contributions 

 function [finalsocsec,empr_socsec] = ne_socsec_2006(wage_principal,wage_spouse,tax_cr_total,married,taxable_income,taxable_income_s,unemp_r,ssc_ceil,unemp_fran,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket2,rate_ssc,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,employer_health,employer_health_s)
                                   

    unemployment = max(0,( min(wage_principal,ssc_ceil)-unemp_fran ) )*unemp_r; 
    unemployment_s = max(0,( min(wage_spouse,ssc_ceil)-unemp_fran ) )*unemp_r;     
    
  health_ins= health_fixed;
  
  if wage_spouse>0
      health_ins_s=health_fixed;
  else
      health_ins_s=0;
  end
  
  
      
    socsec_earn=unemployment+health_ins; %Socsec based on gross earnings
     socsec_earn_s=unemployment_s+health_ins_s;
     
 	socsec_taxinc=(oldpen_r+widpen_r+ex_med_r)*min(taxable_income,taxbracket2);
    socsec_taxinc_s=(oldpen_r+widpen_r+ex_med_r)*min(taxable_income_s,taxbracket2);
    
    
    if married==0       %If not married no spouse socsec
        socsec_taxinc_s=0;
        socsec_earn_s=0;
    end
	

tax_cr_ssc=rate_ssc*(tax_cr_total);

%finalsocsec=round(socsec_earn+socsec_taxinc+socsec_earn_s+socsec_taxinc_s-tax_cr_ssc);
% Tax credit is non-refundable:
finalsocsec=round(max(0,socsec_earn+socsec_taxinc+socsec_earn_s+socsec_taxinc_s-tax_cr_ssc));

% Employer social security contributions 

unemp_empr=max(0,(min(wage_principal,ssc_ceil)-unemp_empr_fran1))*unemp_empr_r1+min(wage_principal,ssc_ceil)*unemp_empr_r2;
inval_empr=min(wage_principal,ssc_ceil)*inv_empr_r;

unemp_empr_s=max(0,(min(wage_spouse,ssc_ceil)-unemp_empr_fran1))*unemp_empr_r1+min(wage_spouse,ssc_ceil)*unemp_empr_r2;
inval_empr_s=min(wage_spouse,ssc_ceil)*inv_empr_r;

empr_socsec=round(unemp_empr+inval_empr+employer_health+unemp_empr_s+inval_empr_s+employer_health_s);

end