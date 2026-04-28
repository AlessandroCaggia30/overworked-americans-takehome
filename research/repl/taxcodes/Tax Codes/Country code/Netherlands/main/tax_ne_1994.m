%  Taxation in the Netherlands for the year 1994

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,empr_socsec]=tax_ne_1994(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************


[unemp_r,unemp_fran,inv_r,inv_fran,sick_r,health_fixed,med_child,health_ceil,health_r,oldpen_r,widpen_r,ex_med_r,ex_med_fixed,ex_med_child,disab_r,ssc_ceil,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,work_rate,work_min,work_max,med_empr,comp_rate,comp_max,med_limit,single_par_all,single_par_rate,basic_all,transfer_all,child_ben,unemp_empr_r1,sick_empr_r]=ne_parameters_1994;



%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

    [taxableinc_p,taxableinc_s,comp_allow_p,comp_allow_s,employer_health,employer_health_s]=ne_taxableinc_1993(wage_principal,wage_spouse,married,children,basic_all,work_rate,work_min,work_max,unemp_r,unemp_fran,inv_r,inv_fran,sick_r,ssc_ceil,med_limit,med_empr,health_ceil,single_par_all,single_par_rate,transfer_all,comp_rate,comp_max);

% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,empr_socsec_p] =ne_socsec_1993(wage_principal,wage_spouse,children,comp_allow_p,married,taxableinc_p,unemp_r,unemp_fran,inv_r,inv_fran,sick_r,health_fixed,med_child,health_ceil,health_r,oldpen_r,widpen_r,ex_med_r,ex_med_fixed,ex_med_child,disab_r,ssc_ceil,taxbracket2,work_rate,work_min,work_max,med_empr,comp_rate,med_limit,unemp_empr_r1,sick_empr_r, employer_health);
[socsec_s,empr_socsec_s] =ne_socsec_1993(wage_spouse,wage_principal,children,comp_allow_s,married,taxableinc_s,unemp_r,unemp_fran,inv_r,inv_fran,sick_r,health_fixed,med_child,health_ceil,health_r,oldpen_r,widpen_r,ex_med_r,ex_med_fixed,ex_med_child,disab_r,ssc_ceil,taxbracket2,work_rate,work_min,work_max,med_empr,comp_rate,med_limit,unemp_empr_r1,sick_empr_r, employer_health_s);
	
empr_socsec=empr_socsec_p+empr_socsec_s;

% ************************** 3) TAXATION ***************************************************************************


inctax_p=ne_tax_2000((taxableinc_p),taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4);
inctax_s=ne_tax_2000((taxableinc_s),taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4);
    
	
    


    
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
