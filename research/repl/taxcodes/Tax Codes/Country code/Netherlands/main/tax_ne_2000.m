%  Taxation in the Netherlands for the year 2000 

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome, empr_socsec]=tax_ne_2000(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[work_rate,work_min,work_max,comp_rate,comp_max,unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,single_par_all,single_par_rate,basic_all,transfer_all,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r]=ne_parameters_2000;
	   
%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
	
[taxableinc_p,comp_allow_p,taxableinc_s,comp_allow_s,employer_health,employer_health_s]=ne_taxableinc_2000(wage_principal,wage_spouse,married,children,work_rate,work_min,work_max,comp_rate,comp_max,unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil,single_par_all,single_par_rate,basic_all,transfer_all);
	


% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p, empr_socsec_p] =ne_socsec_2000(wage_principal,wage_spouse,married,comp_allow_p,taxableinc_p,unemp_r,ssc_ceil,unemp_fran,med_limit,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket2,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,employer_health);
[socsec_s, empr_socsec_s] =ne_socsec_2000(wage_spouse,wage_principal,married,comp_allow_s,taxableinc_s,unemp_r,ssc_ceil,unemp_fran,med_limit,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,taxbracket2,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r,employer_health_s);
	
empr_socsec=empr_socsec_p+empr_socsec_s;


% ************************** 3) TAXATION ***************************************************************************


inctax_p=ne_tax_2000(taxableinc_p,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4);
inctax_s=ne_tax_2000(taxableinc_s,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4);
    
	
    


    
%******************** 5)BENEFITS*********************************************************************

% Child Benefit

%This is the value used in OECD outputs , although the calculations are not given

if children >=2
    benefit=3861;  
else
    benefit=0;
end



%Child benefit depending on the age of the Children
% if child9_12>0
%     if child9_12>1
%         if child9_12>2
%             if child9_12>3
%                 cb_9_12=cb_12_4;
%             else
%                 cb_9_12=cb_12_3;
%             end
%         else
%             cb_9_12=cb_12_2;
%         end
%     else
%            cb_9_12=cb_12_1;
%     end
% else
%     cb_9_12=0;
% end
% 
% if child12_18>0
%     if child12_18>1
%         if child12_18>2
%             if child12_18>3
%                 cb_12_18=cb_18_4;
%             else
%                 cb_12_18=cb_18_3;
%             end
%         else
%             cb_12_18=cb_18_2;
%         end
%     else
%            cb_12_18=cb_18_1;
%     end
% else
%     cb_12_18=0;
% end
% 
% benefit=round( (cb_6*childunder6) + (cb_6_9*child6_9) + cb_9_12 + cb_12_18);               
%                

netincome=wage_principal+wage_spouse -inctax_p-inctax_s -socsec_p-socsec_s+benefit;

end
