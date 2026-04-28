% Social Security Contributions in United States
% for the year 1993
function[socsec]=us_socsec_1993(wage,pen_fixed,pen_var,pen_limit)

pension=pen_fixed*wage + pen_var*min(wage,pen_limit);

socsec=round(pension);

end
