%Taxation in United Kingdom for the year 2002

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,emp_socsec]=tax_uk_2002(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************



[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st]=uk_parameters_2002;



%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
[taxableinc_p,taxableinc_s]=uk_taxableinc_1996(wage_principal,wage_spouse,married,basic_all,married_all);

% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,emp_socsec_p] =uk_socsec_1999(wage_principal ,socseclimit1,socseclimit2,socsec_r1,socsec_r2,ssc_r2,st);
[socsec_s,emp_socsec_s] =uk_socsec_1999(wage_spouse,socseclimit1,socseclimit2,socsec_r1,socsec_r2,ssc_r2,st);
	
emp_socsec=emp_socsec_p+emp_socsec_s;

% ************************** 3) TAXATION ***************************************************************************


inctax_p=uk_tax_1992(taxableinc_p,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3);
inctax_s=uk_tax_1992(taxableinc_s,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3);

%children Tax Credit
if children >0
    ct_credit=max(0,529 - 1*max(0,wage_principal+wage_spouse-34515));
else
    ct_credit=0;
end

%Working Family Tax Credit
if children >0
    wft_credit=max(0,(60+26.45*children+11.65)*52   -0.55*max(0,wage_principal+wage_spouse-inctax_p-inctax_s-socsec_p-socsec_s+ct_credit-94.50*52));
else
    wft_credit=0;
end

if married==0
    inctax_p=inctax_p-wft_credit-ct_credit;
else if married==1 && inctax_p>=inctax_s
        inctax_s=max(0,inctax_s-max(0,wft_credit+ct_credit-inctax_p));
        inctax_p=max(0,inctax_p-wft_credit-ct_credit);
    else if married==1 && inctax_p<inctax_s
          inctax_p=max(0,inctax_p-max(0,wft_credit+ct_credit-inctax_s));
          inctax_s=max(0,inctax_s-wft_credit-ct_credit);  
        end
    end
end

            



    
%******************** 5)BENEFITS*********************************************************************

% Child Benefit
weeklybenefit=0;

if children==1
    weeklybenefit=child_ben1;  
else if children>1
    weeklybenefit=child_ben1 + child_ben2* (children-1);
    end      
end

if married==0 && children >0
    weeklybenefit=weeklybenefit+ singlebenefit;
end

benefit=weeklybenefit*52;

netincome=round(wage_principal+wage_spouse -inctax_p-inctax_s -socsec_p-socsec_s+benefit);

end
