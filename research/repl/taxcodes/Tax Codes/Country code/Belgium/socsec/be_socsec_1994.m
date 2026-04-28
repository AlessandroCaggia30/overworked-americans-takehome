% Social Security Contributions in Belgium for year
% 1994

function[socsec,ssc_p ,ssc_s , workall_p , workall_s,ssc_empr]=be_socsec_1994(wage_principal,wage_spouse,ssc_r,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_lim4,sscspec_lim5, sscspec_m1 ,sscspec_m2, sscspec_m3, sscspec_m4,sscspec_m5,ssc_empr_r)

ssc_p=round(wage_principal*ssc_r);
ssc_s=round(wage_spouse*ssc_r);


%Work Related Expenses-Annual basis
netpay_p=wage_principal-ssc_p;
workall_p=min(workall_max, min(netpay_p,workall_lim1)*workall_r1 + max((min(netpay_p,workall_lim2)-workall_lim1),0)*workall_r2  +max((min(netpay_p,workall_lim3)-workall_lim2),0)*workall_r3    +max(netpay_p-workall_lim3,0)*workall_r4 ); 

netpay_s=wage_spouse-ssc_s;
workall_s=min(workall_max, min(netpay_s,workall_lim1)*workall_r1 + max((min(netpay_s,workall_lim2)-workall_lim1),0)*workall_r2 +max((min(netpay_s,workall_lim3)-workall_lim2),0)*workall_r3     +max(netpay_s-workall_lim3,0)*workall_r4 ); 


%Special Social Security Contribution
agg_inc=wage_principal + wage_spouse -ssc_p-ssc_s-workall_p-workall_s;

if agg_inc<sscspec_lim1 
    ssc_spec=0;
elseif agg_inc>=sscspec_lim1 && agg_inc<sscspec_lim2
    ssc_spec=sscspec_m1;
elseif agg_inc>=sscspec_lim2 && agg_inc<sscspec_lim3
    ssc_spec=sscspec_m2;
elseif agg_inc>=sscspec_lim3 && agg_inc<sscspec_lim4
    ssc_spec=sscspec_m3;
elseif agg_inc>=sscspec_lim4 && agg_inc<sscspec_lim5
    ssc_spec=sscspec_m4;
elseif agg_inc>=sscspec_lim5 
    ssc_spec=sscspec_m5;  
end

ssc_spec=round(3/4*(ssc_spec));

socsec=ssc_p+ssc_s+ssc_spec;



%Employer's soc sec
ssc_empr_p=round(max(0,wage_principal*ssc_empr_r)); 
ssc_empr_s=round(max(0,wage_spouse*ssc_empr_r)); 

ssc_empr=ssc_empr_s+ssc_empr_p;

end
