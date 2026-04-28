%  Social Security Contributions in Belgium for year
% 1999

function[socsec,ssc_p ,ssc_s , workall_p , workall_s,ssc_empr]=be_socsec_1999(wage_principal,wage_spouse,ssc_r,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2,ssc_empr_r1,ssc_empr_r2,ssc_empr_r3,ssc_empr_r4,ssc_empr_r5,socsec_empr_lim1,socsec_empr_lim2,socsec_empr_lim3,socsec_empr_lim4)

ssc_p=round(wage_principal*ssc_r);
ssc_s=round(wage_spouse*ssc_r);


%Work Related Expenses-Annual basis
netpay_p=wage_principal-ssc_p;
workall_p=min(workall_max, min(netpay_p,workall_lim1)*workall_r1 + max((min(netpay_p,workall_lim2)-workall_lim1),0)*workall_r2  +max((min(netpay_p,workall_lim3)-workall_lim2),0)*workall_r3    +max(netpay_p-workall_lim3,0)*workall_r4 ); 

netpay_s=wage_spouse-ssc_s;
workall_s=min(workall_max, min(netpay_s,workall_lim1)*workall_r1 + max((min(netpay_s,workall_lim2)-workall_lim1),0)*workall_r2 +max((min(netpay_s,workall_lim3)-workall_lim2),0)*workall_r3     +max(netpay_s-workall_lim3,0)*workall_r4 ); 


%Special Social Security Contribution
agg_inc=wage_principal + wage_spouse -ssc_p-ssc_s-workall_p-workall_s;
ssc_spec=round(max((min(agg_inc , sscspec_lim2)-sscspec_lim1),0)*sscspec_r1 + max((min(agg_inc , sscspec_lim3)-sscspec_lim2),0)*sscspec_r2 );

socsec=ssc_p+ssc_s+ssc_spec;



%Employer's soc sec
if wage_principal<=socsec_empr_lim1
empsocsec_p=wage_principal*ssc_empr_r1;
else if wage_principal>socsec_empr_lim1 && wage_principal<=socsec_empr_lim2
        empsocsec_p=wage_principal*ssc_empr_r2;
    else if wage_principal>socsec_empr_lim2 && wage_principal <= socsec_empr_lim3
            empsocsec_p=wage_principal*ssc_empr_r3;
        else if wage_principal>socsec_empr_lim3 && wage_principal <= socsec_empr_lim4
                empsocsec_p=wage_principal*ssc_empr_r4;
             else if wage_principal>socsec_empr_lim4
                      empsocsec_p=wage_principal*ssc_empr_r5;
                  end
            end
        end
    end
end

ssc_empr_p=round(max(0,empsocsec_p)); 

if wage_spouse<=socsec_empr_lim1
empsocsec_s=wage_spouse*ssc_empr_r1;
else if wage_spouse>socsec_empr_lim1 &&wage_spouse<=socsec_empr_lim2
        empsocsec_s=wage_spouse*ssc_empr_r2;
    else if wage_spouse>socsec_empr_lim2 && wage_spouse <= socsec_empr_lim3
            empsocsec_s=wage_spouse*ssc_empr_r3;
        else if wage_spouse>socsec_empr_lim3 && wage_spouse <= socsec_empr_lim4
                empsocsec_s=wage_spouse*ssc_empr_r4;
             else if wage_spouse>socsec_empr_lim4
                empsocsec_s=wage_spouse*ssc_empr_r5;
                  end
            end
        end
    end
end

ssc_empr_s=round(max(0,empsocsec_s)); 

ssc_empr=ssc_empr_s+ssc_empr_p;

end
