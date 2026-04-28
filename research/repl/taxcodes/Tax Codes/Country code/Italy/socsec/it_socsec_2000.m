% Social Security Contributions in Italy for year
% 2000

function[socsec, ssc_empr]=it_socsec_2000(wage,ssc_bracket1,ssc_r1,ssc_r2,emp_ssc_bracket1,emp_ssc_r1,emp_ssc_r2)

%%%Employee Social Security Contributions
socsec=ssc_r1*min(wage,ssc_bracket1)+ssc_r2*max(0,wage-ssc_bracket1);

%%%Employer Social Security Contributions

ssc_empr=emp_ssc_r1*min(wage,emp_ssc_bracket1)+emp_ssc_r2*max(0,wage-emp_ssc_bracket1);

end
