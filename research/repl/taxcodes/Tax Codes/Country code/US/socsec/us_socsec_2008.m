% Social Security Contributions in United States
% for the year 2008
function[socsec,emp_socsec]=us_socsec_2008(wage,pen_fixed,pen_var,pen_limit,unemp_r,unemp_max)

pension=pen_fixed*wage + pen_var*min(wage,pen_limit);

socsec=round(pension);

emp_socsec=socsec+min(wage,unemp_max)*unemp_r;

end
