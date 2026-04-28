% Social Security Contributions in United Kingdom
% for the year 2003
function[socsec,emp_socsec]=uk_socsec_2003(wage,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,ssc_r2,st)

weeklywage= wage/52;


if weeklywage < socseclimit1
    weeklysocsec=0;
else
    weeklysocsec= (socsec_r1*socseclimit1) + (socsec_r2)*(min(weeklywage,socseclimit2)-socseclimit1) + socsec_r3*max(0,weeklywage-socseclimit2)    ;
end
 
socsec=round(weeklysocsec*52);   %make it yearly


if wage<st
    emp_socsec=0;
else
    emp_socsec=round((wage-st)*ssc_r2);

end
