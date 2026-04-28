% Taxation in United Kingdom for the year 1999

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,emp_socsec]=tax_uk_1999(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************



[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st]=uk_parameters_1999;



%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

    [taxableinc_p,taxableinc_s]=uk_taxableinc_1996(wage_principal,wage_spouse,married,basic_all,married_all);

% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,emp_socsec_p] =uk_socsec_1999(wage_principal ,socseclimit1,socseclimit2,socsec_r1,socsec_r2,ssc_r2,st);
[socsec_s,emp_socsec_s] =uk_socsec_1999(wage_spouse,socseclimit1,socseclimit2,socsec_r1,socsec_r2,ssc_r2,st);
	
emp_socsec=emp_socsec_p+emp_socsec_s;

% ************************** 3) TAXATION ***************************************************************************


inctax_p=uk_tax_1992(taxableinc_p,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3);
inctax_s=uk_tax_1992(taxableinc_s,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3);
    
%Single parent allowance
if married==0 && children>0
    inctax_p=max(0,inctax_p-married_all*0.1);
end	

%Married couple allowance
if married==1
        inctax_s=round(max(0,inctax_s- max(0,married_all*0.15-inctax_p)));
        inctax_p=round(max(0,inctax_p-married_all*0.1));
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
