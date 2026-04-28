% returns the taxable income taking into account the social security deductions and compensation for medical contributions.

function [taxable_inc_p,comp_allow_p,taxable_inc_s,comp_allow_s,employer_health,employer_health_s] = ne_taxableinc_1999(wage_principal,wage_spouse,married,children,work_rate,work_min,work_max,comp_rate,comp_max,unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil,single_par_all,single_par_rate,basic_all,transfer_all)
                                                                                                                 

work_expense_all_p=min(max(work_rate*(wage_principal), work_min),work_max);

% Deduction for social security contr.
 ss_unemp=max(0,unemp_r*(min((wage_principal/(1+comp_rate)),ssc_ceil)-unemp_fran));

% Employers health contribution increases taxable income
if wage_principal<=med_limit
    employer_health=max(0,med_empr*min((wage_principal/(1+comp_rate)),health_ceil)); 
else
    employer_health=0;
end

% Single Parent Allowance
if married==0&&(children>0)
       sing_par_all=single_par_all + min(single_par_rate*(wage_principal+employer_health-ss_unemp),single_par_all);
else
       sing_par_all=0;
end

comp_allow_p=comp_rate*min( comp_max,((wage_principal/(1+comp_rate))- work_expense_all_p - ss_unemp  + employer_health));




%Real values -----------------------------------------
    unemployment = max(0,(min((wage_principal-comp_allow_p),ssc_ceil)-unemp_fran))*unemp_r;
    
taxable_inc_p= wage_principal - basic_all -sing_par_all + (employer_health -work_expense_all_p-unemployment);

if married==1 && wage_spouse<transfer_all 
    taxable_inc_p=taxable_inc_p-transfer_all;
end

if taxable_inc_p<0
    taxable_inc_p=0;
end

%---------------%Same Calculations for the Spouse--------------------------------------------------------------------------------------------------------------


work_expense_all_s=min(max(work_rate*(wage_spouse), work_min),work_max);

% Deduction for social security contr.
 ss_unemp_s=max(0,unemp_r*(min((wage_spouse/(1+comp_rate)),ssc_ceil)-unemp_fran));

% Employers health contribution increases taxable income
if wage_spouse<=med_limit
    employer_health_s=max(0,med_empr*min((wage_spouse/(1+comp_rate)),health_ceil)); 
else
    employer_health_s=0;
end

comp_allow_s=comp_rate*min( comp_max,((wage_spouse/(1+comp_rate))- work_expense_all_s - ss_unemp_s  + employer_health_s));



%Real values -----------------------------------------
    unemployment_s = max(0,(min((wage_spouse-comp_allow_s),ssc_ceil)-unemp_fran))*unemp_r;

if wage_spouse>0
    if wage_spouse>transfer_all 
        taxable_inc_s= wage_spouse- basic_all+(employer_health_s -work_expense_all_s-unemployment_s);
    else
        taxable_inc_s= wage_spouse +(employer_health_s -work_expense_all_s-unemployment_s);
    end
else
    taxable_inc_s=0;
end

if taxable_inc_s<0
    taxable_inc_s=0;
end

end