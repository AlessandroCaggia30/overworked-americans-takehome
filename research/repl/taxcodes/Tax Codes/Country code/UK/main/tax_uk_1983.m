%Taxation in United Kingdom for the year 1983

function[inctax_p,inctax_s,socsec_p,socsec_s,benefit,netincome,emp_socsec]=tax_uk_1983(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************



[basic_all,married_all,singleparent_all,socseclimit1,socseclimit2,socsec_r1,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,child_ben1,child_ben2,singlebenefit,socseclim1_emp,socsec_r1_emp]=uk_parameters_1983;



%********************************** 1)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 

    [taxableinc_p,taxableinc_s,taxableinc_c]=uk_taxableinc_1983(wage_principal,wage_spouse,children,married,basic_all,married_all,singleparent_all);

% ********************************  2) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec_p,emp_socsec_p] =uk_socsec_1984(wage_principal,socseclimit1,socseclimit2,socsec_r1,socseclim1_emp,socsec_r1_emp);
[socsec_s,emp_socsec_s] =uk_socsec_1984(wage_spouse,socseclimit1,socseclimit2,socsec_r1,socseclim1_emp,socsec_r1_emp);
	
emp_socsec=emp_socsec_p+emp_socsec_s;

% ************************** 3) TAXATION ***************************************************************************


inctax_p=uk_tax_1983(taxableinc_p,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6);
inctax_s=uk_tax_1983(taxableinc_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6);
    
inctax_c=uk_tax_1983(taxableinc_c,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6); %Income tax of couple in case of joint taxation

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

benefit=round(weeklybenefit*52);

netincome=wage_principal+wage_spouse -inctax_p-inctax_s -socsec_p-socsec_s+benefit;

end
