% Social Security Contributions in Italy for year
% 2006

function[socsec, ssc_empr]=it_socsec_2006(wage,ssc_bracket1,ssc_bracket2,ssc_bracket3,ssc_r1,ssc_r2,ssc_r3,emp_ssc_bracket1,emp_ssc_bracket2,emp_ssc_r1,emp_ssc_r2)

%%%Employee Social Security Contributions
socsec=ssc_r1*min(wage,ssc_bracket1)+ssc_r2*min(max(0,wage-ssc_bracket1),(ssc_bracket2-ssc_bracket1)) +ssc_r3*min(max(0,wage-ssc_bracket2),(ssc_bracket3-ssc_bracket2)) ;

%%%Employer Social Security Contributions

ssc_empr=emp_ssc_r1*min(wage,emp_ssc_bracket1)+emp_ssc_r2*min(max(0,wage-emp_ssc_bracket1),(emp_ssc_bracket2-emp_ssc_bracket1));

end
