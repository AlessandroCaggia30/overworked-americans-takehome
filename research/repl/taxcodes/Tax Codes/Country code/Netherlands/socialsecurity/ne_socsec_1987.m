

% Social security contributions for principal earner 

 function [socsec, empr_ssc] = ne_socsec_1987(wage,sick_r,ssc_ceil,unemp_r,inv_r,inv_fran,med_limit,health_ceil,health_r,med_empr,oldpen_r,widpen_r,gen_ceil,work_rate,work_min,work_max,unemp_empr_r1,sick_empr_r,exepmed_r_empr,dis_r_empr,fam_r_empr)
   
 %Schemes for Employees
  sickness=min(wage,ssc_ceil)*sick_r;
  unemployment=min(wage,ssc_ceil)*unemp_r;
  disability=max(0,(min(wage,ssc_ceil)-inv_fran ) )*inv_r;
  
  
  if wage<=med_limit
      health_ins=min(wage,health_ceil)*health_r ;
  else
      health_ins=0;
  end
  
  
  %General Scheme Calculations
  if (wage)<med_limit   
    employer_health=med_empr * min(wage,health_ceil) ;  
  else
     employer_health=0;
  end
  
  %Work Related Expenses
  work_expense=work_min + min(max(work_rate*wage,work_min),work_max);
  
  adjusted_grossinc=wage-(unemployment+disability+sickness)-work_expense+employer_health;

   old_age=min(adjusted_grossinc,gen_ceil)*oldpen_r;
    widow=min(adjusted_grossinc,gen_ceil)*widpen_r;

    
    
  

socsec=round(sickness +unemployment+disability+health_ins+old_age+widow );

if wage==0      %If income is zero no socsec contributions are paid
       socsec=0;
end
    
% Employer social security contributions 

unemp_empr=min(wage,ssc_ceil)*unemp_empr_r1;
sick_empr=min(wage,ssc_ceil)*sick_empr_r;

  %General Scheme Calculations
   exepmed_empr=min(adjusted_grossinc,gen_ceil)*exepmed_r_empr;
   dis_empr=min(adjusted_grossinc,gen_ceil)*dis_r_empr;
   fam_empr=min(adjusted_grossinc,gen_ceil)*fam_r_empr;
    

empr_ssc=round(unemp_empr+sick_empr+employer_health+exepmed_empr+dis_empr+fam_empr);

end