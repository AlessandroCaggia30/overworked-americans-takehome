% Social Security Contributions in United Kingdom
% for the year 1987

function[socsec,emp_socsec]=uk_socsec_1987(wage,socseclimit1,socseclimit2,socseclimit3,socseclimit4,socsec_r1,socsec_r2,socsec_r3,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp)

weeklywage=wage/52;


if weeklywage < socseclimit1
    weeklysocsec=0;
else if weeklywage<socseclimit2
        weeklysocsec=weeklywage*socsec_r1;
    else if weeklywage<socseclimit3
            weeklysocsec=weeklywage*socsec_r2;
        else if weeklywage<socseclimit4
            weeklysocsec=weeklywage*socsec_r3;
        else if weeklywage>socseclimit4
                weeklysocsec=socseclimit4*socsec_r3;
            end
            end
        end
    end
end
 
socsec=round(weeklysocsec*52);   %make it yearly

if wage<=socseclim1_emp
emp_socsec=0;
else if wage>socseclim1_emp && wage<=socseclim2_emp
        emp_socsec=wage*socsec_r1_emp ;
    else if wage>socseclim2_emp && wage <= socseclim3_emp
           emp_socsec=wage*socsec_r2_emp ;
        else if wage>socseclim3_emp && wage <= socseclim4_emp
               emp_socsec=wage*socsec_r3_emp ;
             else if wage>socseclim4_emp
                      emp_socsec=wage*socsec_r4_emp ;
                  end
            end
        end
    end
end

emp_socsec=round(max(0,emp_socsec)); 

end
