% Social Security Contributions in United Kingdom
% for the year 1999

function[socsec,emp_socsec]=uk_socsec_1999(wage,socseclimit1,socseclimit2,socsec_r1,socsec_r2,ssc_r2,st)

weeklywage= wage/52;
%socseclimit1= 52;
%socseclimit2=390;
% socsec_r1=0.02;
% socsec_r2=0.09;

if weeklywage < socseclimit1
    weeklysocsec=0;
else
    weeklysocsec= (socsec_r1*socseclimit1) + (socsec_r2)*(min(weeklywage,socseclimit2)-socseclimit1);
end
 
socsec=round(weeklysocsec*52);   %make it yearly

if wage<st
    emp_socsec=0;
else
    emp_socsec=round((wage-st)*ssc_r2);

end
