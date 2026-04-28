%  Taxable Income in France for year 1997

function[gross_taxable_income]=fr_taxableinc_1997(wage,ssc_all,workall_min,workall_max,workall_r,basicall_r,csg_ded_r)


%Work Related Expenses
work_all= min (workall_max , max(workall_r*(wage-ssc_all),min(workall_min,wage)));

%Basic Allowance
basic_all= basicall_r *(wage-work_all-ssc_all); 

%Deduction for universal social contribution
csg_all=csg_ded_r*wage;


gross_taxable_income=wage-basic_all-ssc_all-csg_all-work_all ;




end
