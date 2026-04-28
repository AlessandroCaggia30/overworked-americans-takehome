%  Taxation in the Netherlands for the year 1984

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,empr_ssc]=tax_ne_1984(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************



[basic_all,supp_oneperson,supp_soleearner,single_par_all,single_par_all_two,work_rate,work_min,work_max,sick_r,ssc_ceil,unemp_r,inv_r,inv_fran,med_limit,health_ceil,health_r,med_empr,oldpen_r,widpen_r,gen_ceil,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,child_ben,spouselim,spouselim2,supp_couple,unemp_empr_r1,sick_empr_r,exepmed_r_empr,dis_r_empr,fam_r_empr, inval_r_empr]=ne_parameters_1984;



%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

    [taxableinc_p,taxableinc_s]=ne_taxableinc_1984(wage_principal,wage_spouse,married,children,basic_all,supp_oneperson,supp_soleearner,single_par_all,single_par_all_two,work_rate,work_min,work_max,unemp_r,inv_r,inv_fran,sick_r,ssc_ceil,med_limit,med_empr,health_ceil,oldpen_r,widpen_r,gen_ceil,spouselim,spouselim2,supp_couple);

% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p, empr_ssc_p] =ne_socsec_1984(wage_principal,sick_r,ssc_ceil,unemp_r,inv_r,inv_fran,med_limit,health_ceil,health_r,med_empr,oldpen_r,widpen_r,gen_ceil,work_rate,work_min,work_max,unemp_empr_r1,sick_empr_r,exepmed_r_empr,dis_r_empr,fam_r_empr, inval_r_empr);
[socsec_s, empr_ssc_s] =ne_socsec_1984(wage_spouse,sick_r,ssc_ceil,unemp_r,inv_r,inv_fran,med_limit,health_ceil,health_r,med_empr,oldpen_r,widpen_r,gen_ceil,work_rate,work_min,work_max,unemp_empr_r1,sick_empr_r,exepmed_r_empr,dis_r_empr,fam_r_empr, inval_r_empr);
	
empr_ssc=empr_ssc_p+empr_ssc_s;

% ************************** 3) TAXATION ***************************************************************************


inctax_p=ne_tax_1989(taxableinc_p,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9);
inctax_s=ne_tax_1989(taxableinc_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9);
    
	
    


    
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
