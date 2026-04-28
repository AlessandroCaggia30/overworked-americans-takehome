%  Taxation in France in year 1984

function[inctax,socsec,benefit,netincome]=tax_fr_1984(wage_principal,wage_spouse,married,children)


%************************** EXECUTE THE PARAMETER FUNCTION ************************

[pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1,workall_min,workall_r,basicall_r,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,child_ben1,child_ben2,child_ben3,child_ben4,child_ben_extra,tax_limit,tax_red,tax_min ]=fr_parameters_1984;

% ********************************  1) SOCIAL SECURITY CONTRIBUTIONS *****************	
   
[socsec] =fr_socsec_1984(wage_principal,wage_spouse,pension_r,penex_r,penwidow_r,ssc_ceil,sick_r,unemp_r1);
	
%********************************** 2)  TAXABLE INCOME CALCULATION   *********************************************************************************************
 
[gross_taxable_income]=fr_taxableinc_1984((wage_principal+wage_spouse),socsec,workall_min,workall_r,basicall_r);

% ************************** 3) TAXATION ***************************************************************************


inctax=fr_tax_1984(gross_taxable_income,married,children,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,tax_limit,tax_red ,tax_min );

       
%******************** 5)BENEFITS*********************************************************************

% Child Benefit

if children==2
    benefit=child_ben1;
else if children==3
        benefit=child_ben2;
    else if children==4
            benefit=child_ben3;
        else if children>=5
                benefit=child_ben4+ max(0,children-5)*child_ben_extra;
            else
                benefit=0;         
            end
        end
    end
end


netincome=wage_principal+wage_spouse -inctax-socsec+benefit;

end
