%  Social Security Contributions in United States
% for the year 2004
function[socsec,emp_socsec]=us_socsec_2004(wage,pen_fixed,pen_var,pen_limit)

pension=pen_fixed*wage + pen_var*min(wage,pen_limit);

socsec=round(pension);

emp_socsec=socsec;

end
