% Social Security Contributions in United States
% for the year 2011
function[socsec,emp_socsec]=us_socsec_2011(wage,pen_fixed,pens_rate_er,pen_limit,unemp_r,unemp_max,mich_unemp_rate,mich_unemp_max,pens_rate_ee)

pension=pen_fixed*wage + pens_rate_ee*min(wage,pen_limit);

socsec=round(pension);

emp_socsec=round(pen_fixed*wage + pens_rate_er*min(wage,pen_limit)+min(wage,unemp_max)*unemp_r+min(wage,mich_unemp_max)*mich_unemp_rate);

end
