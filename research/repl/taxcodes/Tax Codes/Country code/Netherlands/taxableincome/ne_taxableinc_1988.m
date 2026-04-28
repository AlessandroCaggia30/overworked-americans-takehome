% returns the taxable income taking into account the social security deductions and compensation for medical contributions.


function [taxable_inc_p,taxable_inc_s] = ne_taxableinc_1988(wage_principal,wage_spouse,married,children,basic_all,supp_oneperson,supp_soleearner,single_par_all,single_par_all_two,work_supplement,extrawork_supplement,work_min,unemp_r,inv_r,inv_fran,sick_r,ssc_ceil,med_limit,med_empr,health_ceil,oldpen_r,widpen_r,gen_ceil,transfer_all)


%Standard Allowances


%One person households supplement
if married==0 && children==0
    oneperson_all=supp_oneperson;
else
    oneperson_all=0;
end

%Sole Earner Supplement
if married==1 && wage_spouse==0
    sole_earner_all=supp_soleearner;
else
   sole_earner_all=0;
end

% Single Parent Allowance
if married==0&&(children>0)
       sing_par_all=single_par_all + single_par_all_two;
else
       sing_par_all=0;
end

%Work Supplement
if wage_principal>0
    work_supp=work_supplement;
else
    work_supp=0;
end

% %Extra work Supplement
% if children>0 && wage_principal > basic_all
%     extrawork_supp=extrawork_supplement;
% else
%     extrawork_supp=0;
% end



%Work Related Expenses
work_rate=0.04;     % work raletd expenses calculation rate
work_max=800;
work_expense=work_min+min(max(work_rate*(wage_principal), work_min),work_max);
  
  
% Deduction for social security contr.

  sickness=min(wage_principal,ssc_ceil)*sick_r;
  unemployment=min(wage_principal,ssc_ceil)*unemp_r;
  disability=max(0,(min(wage_principal,ssc_ceil)    -inv_fran ) )*inv_r;
 
  %General Scheme Calculations
  if (wage_principal)<med_limit   
    employer_health=med_empr * min(wage_principal,health_ceil) ;  
  else
     employer_health=0;
  end
    
adjusted_grossinc=wage_principal-(unemployment+disability+sickness)-work_expense+employer_health;

   old_age=min(adjusted_grossinc,gen_ceil)*oldpen_r;
    widow=min(adjusted_grossinc,gen_ceil)*widpen_r;

    % ded=old_age + widow +sickness+unemployment + disability;
    
 taxable_inc_p=wage_principal -basic_all -oneperson_all -sole_earner_all -sing_par_all -work_supp -work_expense  -(unemployment+disability+sickness+old_age+widow) +employer_health ;
 

if married==1 && wage_spouse<transfer_all && wage_spouse ~=0 
    taxable_inc_p=taxable_inc_p-(transfer_all-wage_spouse);
end

if taxable_inc_p<0
    taxable_inc_p=0;
end
% ------------------Calculations for the    Spouse--------

%Sole Earner Supplement
if married==1 && wage_principal==0
    sole_earner_all_s=supp_soleearner;
else
   sole_earner_all_s=0;
end

%Work Supplement
if wage_spouse>0
    work_supp_s=413;
else
    work_supp_s=0;
end

% %Extra work Supplement
% if children>0 && wage_spouse > basic_all
%     extrawork_supp_s=797;
% else
%     extrawork_supp_s=0;
% end

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

 
    
taxable_inc_s=max(0,wage_spouse -basic_all -sole_earner_all_s -work_supp_s  -work_expense_s  -(unemployment_s +disability_s +sickness_s +old_age_s + widow_s)+employer_health_s) ;

if taxable_inc_s<0
    taxable_inc_s=0;
end

% if wage_spouse>transfer_all 
%     taxable_inc_s=wage_spouse -basic_all -sole_earner_all_s -work_supp_s -extrawork_supp_s -work_expense_s  -(unemployment_s +disability_s +sickness_s +old_age_s + widow_s);
% else
%     taxable_inc_s=wage_spouse -sole_earner_all_s -work_supp_s -extrawork_supp_s -work_expense_s  -(unemployment_s +disability_s +sickness_s +old_age_s + widow_s);
% end







end