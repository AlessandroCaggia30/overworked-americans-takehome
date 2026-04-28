% Social Security Contributions in United States
% for the year 1993
function[socsec,emp_socsec]=us_socsec_1985(wage,pen_fixed,pen_var,pen_limit,unemp_lim_emp,unemp_r_emp)

pension=pen_fixed*wage + pen_var*min(wage,pen_limit);

socsec=round(pension);

emp_socsec=socsec+min(unemp_lim_emp, wage)*unemp_r_emp;

end
