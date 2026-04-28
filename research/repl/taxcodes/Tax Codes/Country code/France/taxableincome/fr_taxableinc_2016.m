% Taxable Income in France for year 2016

function[gross_taxable_income,csg_all_principal,csg_all_spouse,wage_dec,wage_dec_principal,wage_dec_spouse]=fr_taxableinc_2016(wage_principal,wage_spouse,ssc_ceil,ssc_principal, ssc_spouse,workall_min,workall_max,workall_r,basicall_r,csg_ded_r,csg_crds_abat)

%Deduction for universal social contribution
csg_all_principal=csg_ded_r*((1-csg_crds_abat)*min(wage_principal,4*ssc_ceil)+max(0,wage_principal-4*ssc_ceil));
csg_all_spouse=csg_ded_r*((1-csg_crds_abat)*min(wage_spouse,4*ssc_ceil)+max(0,wage_spouse-4*ssc_ceil));

wage_dec_principal=wage_principal-csg_all_principal-ssc_principal;
wage_dec_spouse=wage_spouse-csg_all_spouse-ssc_spouse;

wage_dec=wage_dec_principal+wage_dec_spouse;

%Work Related Expenses
work_all= min (workall_max , max(workall_r*(wage_dec),min(workall_min,wage_dec)));

%Basic Allowance
basic_all= basicall_r *(wage_dec-work_all); 




gross_taxable_income=wage_dec-basic_all-work_all;




end
