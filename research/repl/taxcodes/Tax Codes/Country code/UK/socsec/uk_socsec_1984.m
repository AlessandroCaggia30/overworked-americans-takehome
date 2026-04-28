% Social Security Contributions in United Kingdom
% for the year 1984

function[socsec,emp_socsec]=uk_socsec_1984(wage,socseclimit1,socseclimit2,socsec_r1,socseclim1_emp,socsec_r1_emp)

weeklywage=wage/52;

if weeklywage < socseclimit1
    weeklysocsec=0;
else 
    weeklysocsec=socsec_r1*min(weeklywage,socseclimit2);
end 


socsec=round(weeklysocsec*52);   %make it yearly

emp_socsec=round(max(0,socsec_r1_emp*min(wage,socseclim1_emp))) ;


end
