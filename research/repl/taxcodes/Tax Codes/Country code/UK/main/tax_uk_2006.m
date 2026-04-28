% Taxation in United Kingdom for the year 2006

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,emp_socsec]=tax_uk_2006(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************



[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st]=uk_parameters_2006;



%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

    [taxableinc_p,taxableinc_s]=uk_taxableinc_1996(wage_principal,wage_spouse,married,basic_all,married_all);

% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,emp_socsec_p] =uk_socsec_2003(wage_principal ,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,ssc_r2,st);
[socsec_s,emp_socsec_s] =uk_socsec_2003(wage_spouse,socseclimit1,socseclimit2,socsec_r1,socsec_r2,socsec_r3,ssc_r2,st);
	
emp_socsec=emp_socsec_p+emp_socsec_s;

% ************************** 3) TAXATION ***************************************************************************


inctax_p=uk_tax_1992(taxableinc_p,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3);
inctax_s=uk_tax_1992(taxableinc_s,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3);

%Tax Credit
if children>0
    ct_credit=545+1765*children;
    wft_credit= (1665+1640+680);  
    credit_discount=0.37*max(0,wage_principal+wage_spouse-5220);
    final_credit=max(0,max(545,ct_credit+ wft_credit-credit_discount)- 0.067*max(0,wage_principal+wage_spouse-50000));
else
     wft_credit= (1665+1640+680);  
     credit_discount=0.37*max(0,wage_principal+wage_spouse-5220);
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
