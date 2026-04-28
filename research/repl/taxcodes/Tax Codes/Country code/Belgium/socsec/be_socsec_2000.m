%  Social Security Contributions in Belgium for year
% 2000

function[socsec,ssc_p ,ssc_s , workall_p , workall_s,ssc_empr]=be_socsec_2000(wage_principal,wage_spouse,ssc_r,socsec_lim1,socsec_lim2,socsec_lim3,sscred_r,sscred_r2,sscred_r3,workall_max,workall_lim1,workall_lim2,workall_lim3,workall_r1,workall_r2,workall_r3,workall_r4,sscspec_lim1,sscspec_lim2,sscspec_lim3,sscspec_r1,sscspec_r2,ssc_empr_r,socsec_empr_lim1,socsec_empr_lim2,socsec_empr_lim3,socsec_empr_lim4,sscred_empr_r,sscred_empr_r2,sscred_empr_r3,sscred_empr_r4)
% ssc_r=0.1307;
% socsec_lim1=34000;
% socsec_lim2=42500;
% socsec_lim3=49000;
% sscred_r=2600;
% sscred_r2=0.4;
% sscred_r3=0;
% 
% workall_max=112000;
% workall_lim1=168000;
% workall_lim2=337000;
% workall_lim3=561000;
% workall_r1=0.2;
% workall_r2=0.1;
% workall_r3=0.05;
% workall_r4=0.03;
% 
% sscspec_lim1=750000;
% sscspec_lim2=850000;
% sscspec_lim3=2426924;
% sscspec_r1=0.09;
% sscspec_r2=0.013;

%%%%%%%%%---------------------------------
mwage_p=wage_principal/12;
mwage_s=wage_spouse/12;

%Compulsory Social Security Contributions-monthly base
comsocsec_p=mwage_p*ssc_r;
comsocsec_s=mwage_s*ssc_r;

%Reduction of individual social security contributions-monthly base
if mwage_p<=socsec_lim1
red_p=0;
else if mwage_p>socsec_lim1 && mwage_p<=socsec_lim2
        red_p=sscred_r;
    else if mwage_p>socsec_lim2 && mwage_p <= socsec_lim3
            red_p=sscred_r- sscred_r2*(mwage_p-socsec_lim2);
        else if mwage_p>socsec_lim3
                red_p=sscred_r3;
            end
        end
    end
end

ssc_p=round(12*max(0,comsocsec_p-red_p)); % Transform it to annual basis


if mwage_s<=socsec_lim1
red_s=0;
else if mwage_s>socsec_lim1 && mwage_s<=socsec_lim2
        red_s=sscred_r;
    else if mwage_s>socsec_lim2 && mwage_s <= socsec_lim3
            red_s=sscred_r- sscred_r2*(mwage_s-socsec_lim2);
        else if mwage_s>socsec_lim3
                red_s=sscred_r3;
            end
        end
    end
end

ssc_s=round(12*max(0,comsocsec_s-red_s)); % Transform it to annual basis


%Work Related Expenses-Annual basis
netpay_p=wage_principal-ssc_p;
workall_p=min(workall_max, min(netpay_p,workall_lim1)*workall_r1 + max((min(netpay_p,workall_lim2)-workall_lim1),0)*workall_r2 + max((min(netpay_p,workall_lim3)-workall_lim2),0)*workall_r3 +max(netpay_p-workall_lim3,0)*workall_r4 ); 

netpay_s=wage_spouse-ssc_s;
workall_s=min(workall_max, min(netpay_s,workall_lim1)*workall_r1 + max((min(netpay_s,workall_lim2)-workall_lim1),0)*workall_r2 + max((min(netpay_s,workall_lim3)-workall_lim2),0)*workall_r3 +max(netpay_s-workall_lim3,0)*workall_r4 ); 


%Special Social Security Contribution
agg_inc=wage_principal + wage_spouse -ssc_p-ssc_s-workall_p-workall_s;
ssc_spec=round(max((min(agg_inc , sscspec_lim2)-sscspec_lim1),0)*sscspec_r1 + max((min(agg_inc , sscspec_lim3)-sscspec_lim2),0)*sscspec_r2 );

socsec=ssc_p+ssc_s+ssc_spec;


%Employer's soc sec
empsocsec_p=wage_principal*ssc_empr_r;
empsocsec_s=wage_spouse*ssc_empr_r;

%Reduction of employer social security contributions
if wage_principal<=socsec_empr_lim1
redempr_p=sscred_empr_r;
else if wage_principal>socsec_empr_lim1 && wage_principal<=socsec_empr_lim2
        redempr_p=sscred_empr_r3;
    else if wage_principal>socsec_empr_lim2 && wage_principal <= socsec_empr_lim3
            redempr_p=sscred_empr_r3- sscred_empr_r2*(wage_principal-socsec_empr_lim2);
        else if wage_principal>socsec_empr_lim3 && wage_principal <= socsec_empr_lim4
                redempr_p=sscred_empr_r4;
             else if wage_principal>socsec_empr_lim4
                redempr_p=sscred_empr_r;
                  end
            end
        end
    end
end

ssc_empr_p=round(max(0,empsocsec_p-redempr_p)); 


%Reduction of employer social security contributions
if wage_spouse<=socsec_empr_lim1
redempr_s=sscred_empr_r;
else if wage_spouse>socsec_empr_lim1 &&wage_spouse<=socsec_empr_lim2
        redempr_s=sscred_empr_r3;
    else if wage_spouse>socsec_empr_lim2 && wage_spouse <= socsec_empr_lim3
            redempr_s=sscred_empr_r3- sscred_empr_r2*(wage_spouse-socsec_empr_lim2);
        else if wage_spouse>socsec_empr_lim3 && wage_spouse <= socsec_empr_lim4
                redempr_s=sscred_empr_r4;
             else if wage_spouse>socsec_empr_lim4
                redempr_s=sscred_empr_r;
                  end
            end
        end
    end
end

ssc_empr_s=round(max(0,empsocsec_s-redempr_s)); 

ssc_empr=ssc_empr_s+ssc_empr_p;

end
