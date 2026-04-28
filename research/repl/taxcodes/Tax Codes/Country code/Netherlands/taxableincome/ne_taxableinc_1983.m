% returns the taxable income taking into account the social security deductions and compensation for medical contributions.


function [taxable_inc_p,taxable_inc_s] = ne_taxableinc_1983(wage_principal,wage_spouse,married,children,supp_marriedmen,supp_marriedwoman,supp_single,work_rate,work_min,work_max,unemp_r,inv_r,inv_fran,sick_r,ssc_ceil,med_limit,med_empr,health_ceil,oldpen_r,widpen_r,gen_ceil)


%Standard Allowances

%Supplement for married man
if married==1 && wage_principal >0 
    marmen_all=supp_marriedmen;
else
    marmen_all=0;
end


%Single person allowance
if married==0
    single_all=supp_single;
else
    single_all=0;
end




%Work Related Expenses
work_expense=work_min+min(max(work_rate*(wage_principal), work_min),work_max);

% Deduction for social security contr.

  sickness=min(wage_principal,ssc_ceil)*sick_r;
  unemployment=min(wage_principal,ssc_ceil)*unemp_r;
  disability=max(0,(min(wage_principal,ssc_ceil)-inv_fran ) )*inv_r;
 
  %General Scheme Calculations
  if (wage_principal)<med_limit   
    employer_health=med_empr * min(wage_principal,health_ceil) ;  
  else
     employer_health=0;
  end
    
adjusted_grossinc=wage_principal-(unemployment+disability+sickness)-work_expense+employer_health;

   old_age=min(adjusted_grossinc,gen_ceil)*oldpen_r;
    widow=min(adjusted_grossinc,gen_ceil)*widpen_r;

%deductions=unemployment+disability+sickness+old_age+widow;

 taxable_inc_p=wage_principal -marmen_all -single_all -work_expense  -(unemployment+disability+sickness+old_age+widow) +employer_health ;
 
if taxable_inc_p<0
    taxable_inc_p=0;
end


% ------------------Calculations for the    Spouse--------

%Supplement for married woman
if married==1&& wage_spouse >0
    marwoman_all=supp_marriedwoman;
else
    marwoman_all=0;
end

%Work Related Expenses
work_expense_s=work_min+min(max(work_rate*wage_spouse ,work_min),work_max);

% Deduction for social security contr.

  sickness_s=min(wage_spouse,ssc_ceil)*sick_r;
  unemployment_s=min(wage_spouse,ssc_ceil)*unemp_r;
  disability_s=max(0,(min(wage_spouse,ssc_ceil)    -inv_fran ) )*inv_r;

%General Scheme Calculations
  if (wage_spouse)<med_limit   
    employer_health_s=med_empr * min(wage_spouse,health_ceil) ;  
  else
     employer_health_s=0;
  end
    
adjusted_grossinc_s=wage_spouse-(unemployment_s+disability_s+sickness_s) -work_expense_s +employer_health_s;

   old_age_s=min(adjusted_grossinc_s,gen_ceil)*oldpen_r;
    widow_s=min(adjusted_grossinc_s,gen_ceil)*widpen_r;

    
taxable_inc_s=max(0,wage_spouse -marwoman_all -work_expense_s  -(unemployment_s +disability_s +sickness_s +old_age_s + widow_s)+employer_health_s) ;

if taxable_inc_s<0
    taxable_inc_s=0;
end



end