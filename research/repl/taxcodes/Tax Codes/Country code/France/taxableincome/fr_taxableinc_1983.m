%Taxable Income in France for year 1983

function[gross_taxable_income]=fr_taxableinc_1983(wage,ssc_all,workall_min,workall_r,basicall_r,basic_max,workall_max)


%Work Related Expenses
work_all= min (workall_max , max(workall_r*(wage-ssc_all),min(workall_min,wage)));
% work_all= max(workall_r*(wage-ssc_all),min(workall_min,wage));

%Basic Allowance
basic_all= min(basic_max,basicall_r *(wage-work_all-ssc_all)); 


gross_taxable_income=max(0,wage-basic_all-ssc_all-work_all) ;




end
