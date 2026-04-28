%  Taxation in United Kingdom for the year 2013

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,emp_socsec]=tax_uk_2013(wage_principal,wage_spouse,married,children)

%************************** EXECUTE THE PARAMETER FUNCTION ************************

[basic_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,taxbracket1,taxbracket2, tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st,wtc_basic,wtc_couplelone,wtc_30hr,ctc_family,ctc_child,ntc_1st_thres,ntc_1st_taper,basic_thres,cb_1st_thres,cb_2nd_thres,cb_taper1,cb_taper2,CB_first, CB_others]=uk_parameters_2013;

%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************

[taxableinc_p,taxableinc_s]=uk_taxableinc_2010(wage_principal,wage_spouse,basic_all,basic_thres);

% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,emp_socsec_p] =uk_socsec_2009(wage_principal,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,ssc_r2,st);
[socsec_s,emp_socsec_s] =uk_socsec_2009(wage_spouse,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,ssc_r2,st);
	
emp_socsec=emp_socsec_p+emp_socsec_s;

% ************************** 3) TAXATION ***************************************************************************

inctax_p=uk_tax_1992(taxableinc_p,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3);
inctax_s=uk_tax_1992(taxableinc_s,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3);
          

%Tax Credit
if children>0
    ct_credit=ctc_family+ctc_child*children;
    wft_credit= (wtc_basic+wtc_couplelone+wtc_30hr);  
    credit_discount=ntc_1st_taper*max(0,wage_principal+wage_spouse-ntc_1st_thres);
    final_credit=max(0,max(0,ct_credit+ wft_credit-credit_discount));
else
    wft_credit= (wtc_basic+wtc_couplelone*(married==1)+wtc_30hr); 
    credit_discount=ntc_1st_taper*max(0,wage_principal+wage_spouse-ntc_1st_thres);
    final_credit=max(0,max(0,wft_credit-credit_discount));
end


if married==0
    inctax_p=inctax_p-final_credit;
else if married==1 && inctax_p>=inctax_s
        inctax_s=max(0,inctax_s-max(0,final_credit-inctax_p));
        inctax_p=max(0,inctax_p-final_credit);
else if married==1 && inctax_p<inctax_s
      inctax_p=max(0,inctax_p-max(0,final_credit-inctax_s));
      inctax_s=max(0,inctax_s-final_credit);  
    end
end
end
         
    
%******************** 5)BENEFITS*********************************************************************

% Child Benefit
benefit=0;

if children>0
    benefit=(365/7)*(child_ben1 + child_ben2* max(0,(children-1)))*(3/4);
        if wage_principal<cb_1st_thres
            benefit=benefit+(365/7)*(child_ben1 + child_ben2* max(0,(children-1)))*(1/4);
        elseif wage_principal>=cb_1st_thres && wage_principal<cb_2nd_thres
            benefit=benefit+((1-(wage_principal-cb_1st_thres)/(cb_taper2/cb_taper1)))*(365/7)*(CB_first+CB_others*max(0,(children-1)));
        else 
            benefit=benefit+0;
        end
end


if married==0 && children >0
    benefit=benefit+ singlebenefit;
end

netincome=round(wage_principal+wage_spouse -inctax_p-inctax_s -socsec_p-socsec_s+benefit);

end
