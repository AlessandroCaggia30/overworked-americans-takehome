

% Social security contributions for principal earner 

 function [socsec,empr_ssc] = ne_socsec_1998(wage,wage_partner,comp_allow,married,taxableinc,unemp_r,ssc_ceil,unemp_fran,med_limit,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket2,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,employer_health)
                                  
    
        
    %Real values 
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

unemp_empr=max(0,(min(wage,ssc_ceil)-unemp_empr_fran1))*(unemp_empr_r1+unemp_empr_r2);
inval_empr=min(wage,ssc_ceil)*inv_empr_r;

empr_ssc=round(unemp_empr+inval_empr+employer_health);
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
%     %Real values 
%     unemployment = max(0,( min((wage-comp_allow),ssc_ceil)-unemp_fran ) )*unemp_r; 
%     disability=max(0,( min((wage-comp_allow),ssc_ceil)-inv_fran ) )*inv_r;
%     sickness=max(0, min((wage-comp_allow),ssc_ceil) )*sick_r;
%     
%     if wage<=med_limit %Medical care
%         if married==1
%             if wage_partner==0
%                 health_ins=min(max(0,wage-comp_allow),health_ceil)*health_r +health_fixed*2 + med_child*min(2,children) ;
%             else
%                 health_ins=min(max(0,wage-comp_allow),health_ceil)*health_r +health_fixed+ (med_child*min(2,children))/2; %they share
%             end    
%         else
%             health_ins=min(max(0,wage-comp_allow),health_ceil)*health_r +health_fixed + med_child*min(2,children);
%         end
%     else
%         health_ins=0;
%     end
%     
%     
%  socsec_earn=unemployment+disability+health_ins+sickness; %Socsec based on gross earnings
%  
%  
%         if married==1  %fixed part of exceptional medical expenses
%             if wage_partner==0
%                 exmed_fixed=2*ex_med_fixed + ex_med_child*min(2,children);
%             else
%                 exmed_fixed=ex_med_fixed +(ex_med_child*min(2,children))/2; %they share
%             end    
%         else
%             exmed_fixed=ex_med_fixed + ex_med_child*min(2,children);
%         end
%     
%  
%     
%  socsec_taxinc=(oldpen_r+widpen_r+ex_med_r+disab_r)*min(taxableinc,taxbracket2)+exmed_fixed; %socsec based on taxable income  
%     
%     
%     
%     if wage==0      %If income is zero no socsec contributions are paid
%         socsec_taxinc=0;
%         socsec_earn=0;
%     end
% 	
% %socsec=round(socsec_earn);
% %socsec=round(socsec_taxinc);
% 
% socsec=round(socsec_earn+socsec_taxinc);

end