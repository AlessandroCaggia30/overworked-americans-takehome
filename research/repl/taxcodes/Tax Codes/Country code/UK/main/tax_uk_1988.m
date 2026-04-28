% Taxation in United Kingdom for the year 1988

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,emp_socsec]=tax_uk_1988(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************



[basic_all,married_all,singleparent_all,socseclimit1,socseclimit2,socseclimit3,socseclimit4,socsec_r1,socsec_r2,socsec_r3,taxbracket1,tax_r1,tax_r2,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp]=uk_parameters_1988;



%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

    [taxableinc_p,taxableinc_s,taxableinc_c]=uk_taxableinc_1988(wage_principal,wage_spouse,children,married,basic_all,married_all,singleparent_all);

% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,emp_socsec_p] =uk_socsec_1988(wage_principal,socseclimit1,socseclimit2,socseclimit3,socseclimit4,socsec_r1,socsec_r2,socsec_r3,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp);
[socsec_s,emp_socsec_s] =uk_socsec_1988(wage_spouse,socseclimit1,socseclimit2,socseclimit3,socseclimit4,socsec_r1,socsec_r2,socsec_r3,socseclim1_emp,socseclim2_emp,socseclim3_emp,socseclim4_emp,socsec_r1_emp,socsec_r2_emp,socsec_r3_emp,socsec_r4_emp);
	
emp_socsec=emp_socsec_p+emp_socsec_s;	

% ************************** 3) TAXATION ***************************************************************************


inctax_p=uk_tax_1988(taxableinc_p,taxbracket1,tax_r1,tax_r2);
inctax_s=uk_tax_1988(taxableinc_s,taxbracket1,tax_r1,tax_r2);
    
inctax_c=uk_tax_1988(taxableinc_c,taxbracket1,tax_r1,tax_r2); %Income tax of couple in case of joint taxation

%If joint taxation gives lower tax , couples prefer it.
if inctax_c<(inctax_p+inctax_s) && married==1
    inctax_p=round((inctax_c)/2);
    inctax_s=round((inctax_c)/2);
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

netincome=wage_principal+wage_spouse -inctax_p-inctax_s -socsec_p-socsec_s+benefit;

end
