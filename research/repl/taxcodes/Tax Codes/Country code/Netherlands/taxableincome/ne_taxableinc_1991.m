% returns the taxable income taking into account the social security deductions and compensation for medical contributions.


function [taxable_inc_p,taxable_inc_s,comp_allow_p,comp_allow_s,employer_health,employer_health_s] = ne_taxableinc_1991(wage_principal,wage_spouse,married,children,basic_all,work_rate,work_min,work_max,unemp_r,unemp_fran,inv_r,inv_fran,sick_r,ssc_ceil,med_limit,med_empr,health_ceil,single_par_all,single_par_rate,transfer_all,comp_rate,comp_max,sup_limit,sup_all)

work_expense=min(max(work_rate*(wage_principal), work_min),work_max);

% Deduction for social security contr.
    ss_unemp=max(0,unemp_r*(min((wage_principal/(1+comp_rate)),ssc_ceil)-unemp_fran));
    disab=max(0,inv_r*(min((wage_principal/(1+comp_rate)),ssc_ceil)-inv_fran));
    sick=max(0, min((wage_principal/(1+comp_rate)),ssc_ceil) )*sick_r;
% Employers medical care contribution increases taxable income
  if (wage_principal/(1+comp_rate))<med_limit
    employer_health=max(0,med_empr*min((wage_principal/(1+comp_rate)),health_ceil)) ;
  else
    employer_health=0;
  end

  comp_allow_p=comp_rate*min( comp_max,((wage_principal/(1+comp_rate))- work_expense -disab- ss_unemp -sick + employer_health));

  
%Real values -----------------------------------------
    unemployment = max(0,(min((wage_principal-comp_allow_p),ssc_ceil)-unemp_fran)*unemp_r);
    disability=max(0,(min((wage_principal-comp_allow_p),ssc_ceil)-inv_fran)*inv_r);   
    sickness=max(0, min((wage_principal-comp_allow_p),ssc_ceil) )*sick_r;
 % Single Parent Allowance
if married==0&&(children>0)
       sing_par_all=single_par_all + min(single_par_rate*(wage_principal+employer_health-unemployment-disability),single_par_all);
else
       sing_par_all=0;
end

 taxable_inc_p=wage_principal-basic_all-sing_par_all-work_expense-(unemployment+disability+sickness)+employer_health;
 
  if married==0 && children==0 && taxable_inc_p<sup_limit
     taxable_inc_p=taxable_inc_p-sup_all;
 end

if married==1 && wage_spouse<transfer_all 
    taxable_inc_p=taxable_inc_p-transfer_all;
end

if taxable_inc_p<0
    taxable_inc_p=0;
end
% -------------------------Same Calculations for spouse---------------------------------

work_expense_s=min(max(work_rate*(wage_spouse),work_min),work_max);

% Deduction for social security contr.
    ss_unemp_s=max(0,unemp_r*(min((wage_spouse/(1+comp_rate)),ssc_ceil)-unemp_fran));
    disab_s=max(0,inv_r*(min((wage_spouse/(1+comp_rate)),ssc_ceil)-inv_fran));  
    sick_s=max(0, min((wage_spouse/(1+comp_rate)),ssc_ceil) )*sick_r;
% Employers medical care contribution increases taxable income
   if (wage_spouse/(1+comp_rate))<med_limit
    employer_health_s=max(0,med_empr*min((wage_spouse/(1+comp_rate)),health_ceil)) ;
  else
    employer_health_s=0;
  end
    
  comp_allow_s=comp_rate*min(comp_max,((wage_spouse/(1+comp_rate))- work_expense_s -disab_s- ss_unemp_s -sick_s +employer_health_s));

  
%Real values ----------------------------
    unemployment_s= max(0,(min((wage_spouse-comp_allow_s),ssc_ceil)-unemp_fran)*unemp_r);
    disability_s=max(0,(min((wage_spouse-comp_allow_s),ssc_ceil)-inv_fran)*inv_r);
    sickness_s=max(0, min((wage_spouse-comp_allow_s),ssc_ceil) )*sick_r;
%taxable income calculation

if wage_spouse>transfer_all 
    taxable_inc_s=wage_spouse -basic_all- work_expense_s-unemployment_s-disability_s-sickness_s +employer_health_s ;
else
    taxable_inc_s=wage_spouse - work_expense_s-unemployment_s-disability_s-sickness_s +employer_health_s ;
end


if taxable_inc_s<0
    taxable_inc_s=0;
end



end