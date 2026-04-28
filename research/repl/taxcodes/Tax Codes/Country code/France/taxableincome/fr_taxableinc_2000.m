%  Taxable Income in France for year 2000

function[gross_taxable_income]=fr_taxableinc_2000(wage,ssc_all,workall_min,workall_max,workall_r,basicall_r,csg_ded_r)

% workall_min=2320;
% workall_max=77850;
% workall_r=0.1;
% basicall_r=0.2;
% csg_ded_r=0.04845;


%Work Related Expenses
work_all= min (workall_max , max(workall_r*(wage-ssc_all),min(workall_min,wage)));

%Basic Allowance
basic_all= basicall_r *(wage-work_all-ssc_all); 

%Deduction for universal social contribution
csg_all=csg_ded_r*wage;


gross_taxable_income=wage-basic_all-ssc_all-csg_all-work_all ;




end
