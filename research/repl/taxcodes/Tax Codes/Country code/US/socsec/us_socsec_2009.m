% Social Security Contributions in United States
% for the year 2009
function[socsec,emp_socsec]=us_socsec_2009(wage,pen_fixed,pen_var,pen_limit,unemp_r,unemp_max,mich_unemp_rate,mich_unemp_max)

pension=pen_fixed*wage + pen_var*min(wage,pen_limit);

socsec=round(pension);

emp_socsec=socsec+min(wage,unemp_max)*unemp_r+min(wage,mich_unemp_max)*mich_unemp_rate;

end
