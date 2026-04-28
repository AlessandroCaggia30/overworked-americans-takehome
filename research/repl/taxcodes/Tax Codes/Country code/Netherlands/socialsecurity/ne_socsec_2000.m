

% Employee social security contributions for principal earner 

 function [socsec,empr_ssc] = ne_socsec_2000(wage,wage_partner,married,comp_allow,taxableinc,unemp_r,ssc_ceil,unemp_fran,med_limit,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket2,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,employer_health)
                                   
%For 2000-----------------------------------
% work_rate=0.12;
% work_min=263;
% work_max=3538;
% comp_rate=0.0215;
% 
% unemp_r=0.0625;    %unemployment contribution rate for gross earnings between 15921-46205
% ssc_ceil=83259;   %Social Security Ceiling
% unemp_fran=28971;   %Unemployment contribution lower bound for wage
% 
% med_limit=64600;
% med_empr=0.0635;
% health_ceil=56115;   %Medical insurance net wage ceiling
% 
% health_r=0.0175;      %Med insurance rate 
% health_fixed= 414;   %basic insurance
% 
%  oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
%  widpen_r=0.0125;   %Widows and Orphans pension rate for 1st &2nd tax bracket
%  ex_med_r=0.1025;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket
% 
%  taxbracket2=48994;


 
 
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