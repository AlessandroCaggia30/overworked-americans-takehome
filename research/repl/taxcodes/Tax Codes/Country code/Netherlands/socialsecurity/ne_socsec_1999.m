

% Employee social security contributions 

 function [socsec,empr_ssc] = ne_socsec_1999(wage,wage_partner,married,comp_allow,taxableinc,unemp_r,ssc_ceil,unemp_fran,med_limit,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket2,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,employer_health)
                                                                                  
    
    %Real Values
    unemployment = max(0,( min((wage-comp_allow),ssc_ceil)-unemp_fran ) )*unemp_r; 
        
     if wage<=med_limit
         if married==1&&wage_partner==0
             health_ins=min(max(0,wage-comp_allow),health_ceil)*health_r + health_fixed*2;
         else
             health_ins=min(max(0,wage-comp_allow),health_ceil)*health_r + health_fixed;
         end
     else
         health_ins=0;
     end
     
     
     
        
    socsec_earn=unemployment+health_ins; %Socsec based on gross earnings
        
 	socsec_taxinc=(oldpen_r+widpen_r+ex_med_r)*min(taxableinc,taxbracket2);
    
    
    
    if wage==0      %If income is zero no socsec contributions are paid
        socsec_taxinc=0;
        socsec_earn=0;
    end
	
%socsec=round(socsec_earn);
%socsec=round(socsec_taxinc);

socsec=round(socsec_earn+socsec_taxinc);

% Employer social security contributions 

unemp_empr=max(0,(min(wage,ssc_ceil)-unemp_empr_fran1))*unemp_empr_r1+min(wage,ssc_ceil)*unemp_empr_r2;
inval_empr=min(wage,ssc_ceil)*inv_empr_r;

empr_ssc=round(unemp_empr+inval_empr+employer_health);

end