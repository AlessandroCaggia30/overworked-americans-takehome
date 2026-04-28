%  Taxation in the Netherlands for the year 1999

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,empr_socsec]=tax_ne_1999(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[work_rate,work_min,work_max,comp_rate,comp_max,unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,single_par_all,single_par_rate,basic_all,transfer_all,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,child_ben,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r] = ne_parameters_1999;
	   
%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
	
[taxableinc_p,compall_p,taxableinc_s,compall_s,employer_health,employer_health_s]=ne_taxableinc_1999(wage_principal,wage_spouse,married,children,work_rate,work_min,work_max,comp_rate,comp_max,unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil,single_par_all,single_par_rate,basic_all,transfer_all);
	


% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,empr_socsec_p] =ne_socsec_1999(wage_principal,wage_spouse,married,compall_p,taxableinc_p,unemp_r,ssc_ceil,unemp_fran,med_limit,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket2,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,employer_health);
[socsec_s,empr_socsec_s] =ne_socsec_1999(wage_spouse,wage_principal,married,compall_s,taxableinc_s,unemp_r,ssc_ceil,unemp_fran,med_limit,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket2,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,employer_health_s);
	
empr_socsec=empr_socsec_p+empr_socsec_s;

% ************************** 3) TAXATION ***************************************************************************


inctax_p=ne_tax_2000(taxableinc_p,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4);
inctax_s=ne_tax_2000(taxableinc_s,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4);
    
	
    


    
%******************** 5)BENEFITS*********************************************************************

% Child Benefit

%This is the value used in OECD outputs , although the calculations are not given

if children >=2
    benefit=child_ben;  
elseif children==1   % If only 1 child, estimated benefit
    benefit=child_ben/2;
else
    benefit=0;
end
              

netincome=wage_principal+wage_spouse -inctax_p-inctax_s -socsec_p-socsec_s+benefit;

end
