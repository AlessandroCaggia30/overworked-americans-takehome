% Social Security Contributions in United Kingdom
% for the year 2009
function[socsec,emp_socsec]=uk_socsec_2009(wage,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,ssc_r2,st)

if wage < socseclimit1
    socsec=0;
else
    socsec= round((socsec_r1*socseclimit1) + (socsec_r2)*(min(wage,socseclimit2)-socseclimit1) + socsec_r3*max(0,wage-socseclimit2))    ;
end


if wage<st
    emp_socsec=0;
else
    emp_socsec=round((wage-st)*ssc_r2);

end
