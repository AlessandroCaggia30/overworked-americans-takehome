% Social Security Contributions in Portugal for year
% 2000

function[socsec_p,socsec_s,socsec_emp]=pt_socsec_2000(wage_principal,wage_spouse,ssc_r,ssc_emp_r)

socsec_p=round(ssc_r*wage_principal);
socsec_s=round(ssc_r*wage_spouse);


socsec_emp_p=ssc_emp_r*wage_principal;
socsec_emp_s=ssc_emp_r*wage_spouse;

socsec_emp=round(socsec_emp_p+socsec_emp_s);

end
