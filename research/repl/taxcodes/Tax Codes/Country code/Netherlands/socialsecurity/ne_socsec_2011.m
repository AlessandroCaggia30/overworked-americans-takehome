

% Employee social security contributions 

 function [finalsocsec,empr_socsec] = ne_socsec_2011(wage_principal,wage_spouse,tax_cr,tax_cr_s,married,taxable_income,taxable_income_s,unemp_r,ssc_ceil,unemp_fran,oldpen_r,widpen_r,ex_med_r,taxbracket2,rate_ssc,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,taxbracket1,tax_r1,tax_r2)
                                   

    unemployment = max(0,( min(wage_principal,ssc_ceil)-unemp_fran ) )*unemp_r; 
    unemployment_s = max(0,( min(wage_spouse,ssc_ceil)-unemp_fran ) )*unemp_r;     
   
    socsec_earn=unemployment; %Socsec based on gross earnings
    socsec_earn_s=unemployment_s; 
     
 	socsec_taxinc=(oldpen_r+widpen_r+ex_med_r)*min(taxable_income,taxbracket2);
    socsec_taxinc_s=(oldpen_r+widpen_r+ex_med_r)*min(taxable_income_s,taxbracket2);
    
    
    if married==0       %If not married no spouse socsec
        socsec_taxinc_s=0;
        socsec_earn_s=0;
    end
	

if tax_cr>taxbracket1*(oldpen_r+ widpen_r+ex_med_r+tax_r1)
    tax_cr_ssc_p=((oldpen_r+ widpen_r+ex_med_r)/(oldpen_r+ widpen_r+ex_med_r+tax_r2))*(tax_cr-((oldpen_r+ widpen_r+ex_med_r+tax_r1)*taxbracket1))+rate_ssc*(taxbracket1*(oldpen_r+ widpen_r+ex_med_r+tax_r1));
else 
    tax_cr_ssc_p=rate_ssc*tax_cr;
end

if tax_cr_s>taxbracket1*(oldpen_r+ widpen_r+ex_med_r+tax_r1)
    tax_cr_ssc_s=((oldpen_r+ widpen_r+ex_med_r)/(oldpen_r+ widpen_r+ex_med_r+tax_r2))*(tax_cr_s-((oldpen_r+ widpen_r+ex_med_r+tax_r1)*taxbracket1))+rate_ssc*(taxbracket1*(oldpen_r+ widpen_r+ex_med_r+tax_r1));
else 
    tax_cr_ssc_s=rate_ssc*tax_cr_s;
end

tax_cr_ssc=tax_cr_ssc_p+tax_cr_ssc_s;

%finalsocsec=round(socsec_earn+socsec_taxinc+socsec_earn_s+socsec_taxinc_s-tax_cr_ssc);
finalsocsec=round(max(0,socsec_earn+socsec_taxinc+socsec_earn_s+socsec_taxinc_s-tax_cr_ssc));

% Employer social security contributions 

unemp_empr=max(0,(min(wage_principal,ssc_ceil)-unemp_empr_fran1))*unemp_empr_r1+min(wage_principal,ssc_ceil)*unemp_empr_r2;
inval_empr=min(wage_principal,ssc_ceil)*inv_empr_r;

unemp_empr_s=max(0,(min(wage_spouse,ssc_ceil)-unemp_empr_fran1))*unemp_empr_r1+min(wage_spouse,ssc_ceil)*unemp_empr_r2;
inval_empr_s=min(wage_spouse,ssc_ceil)*inv_empr_r;

empr_socsec=round(unemp_empr+inval_empr+unemp_empr_s+inval_empr_s);
end