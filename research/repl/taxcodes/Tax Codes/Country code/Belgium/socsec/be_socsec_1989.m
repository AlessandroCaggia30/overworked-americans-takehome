%  Social Security Contributions in Belgium for year


function[socsec,ssc_p ,ssc_s , workall_p , workall_s, ssc_empr]=be_socsec_1989(wage_principal,wage_spouse,ssc_r,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2,ssc_empr_r)
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
ssc_empr_p=round(max(0,wage_principal*ssc_empr_r)); 
ssc_empr_s=round(max(0,wage_spouse*ssc_empr_r)); 

ssc_empr=ssc_empr_s+ssc_empr_p;



end
