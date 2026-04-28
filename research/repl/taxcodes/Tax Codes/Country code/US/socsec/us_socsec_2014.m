% Social Security Contributions in United States
% for the year 2014
function[socsec,emp_socsec]=us_socsec_2014(wage,pen_fixed,pens_rate_er,pen_limit,unemp_r,unemp_max,mich_unemp_rate,mich_unemp_max,pens_rate_ee,add_hosp_rate,add_hosp_thresh_m, add_hosp_thresh_oth,married)

pension=pen_fixed*wage + pens_rate_ee*min(wage,pen_limit)+add_hosp_rate*max(0,wage-(married==1)*add_hosp_thresh_m-(married==0)*add_hosp_thresh_oth);

socsec=round(pension);

emp_socsec=round(pen_fixed*wage + pens_rate_er*min(wage,pen_limit)+min(wage,unemp_max)*unemp_r+min(wage,mich_unemp_max)*mich_unemp_rate);

end
