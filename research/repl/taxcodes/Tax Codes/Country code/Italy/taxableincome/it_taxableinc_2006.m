% Taxable Income in Italy for year 2006

function[taxable_income_p,taxable_income_s,tax_al2_p,tax_al_3_actual_p,tax_al2_s,tax_al_3s_actualtaken]=it_taxableinc_2006(wage_principal,wage_spouse,socsec_p, socsec_s,married, children,b_all,c_all_s1,c_all_s2,c_all_m,sp_crd_lim,s_all,taxbracket1,taxbracket2,taxbracket3)

%Allowances

%Tax_al2
if wage_principal>0
    tax_al2_p=min((wage_principal-socsec_p) , b_all*min(1, max((1-(wage_principal-socsec_p-b_all)/26000),0)));
else 
    tax_al2_p=0; 
end

if wage_spouse>0
    tax_al2_s=min((wage_spouse-socsec_s) , b_all*min(1, max((1-(wage_spouse-socsec_s-b_all)/26000),0)));
else 
    tax_al2_s=0; 
end

%Tax_al3
%Spouse
if children>0 && (wage_spouse-socsec_s-tax_al2_s)>0
    if wage_principal-socsec_p>78000
        tax_al3s_max=c_all_m*children;
    elseif (wage_principal-socsec_p<taxbracket1 && wage_spouse-socsec_s<taxbracket1) || (wage_principal-socsec_p>taxbracket1 && wage_principal-socsec_p<=taxbracket2 && wage_spouse-socsec_s>taxbracket1 && wage_spouse-socsec_s<=taxbracket2) || (wage_principal-socsec_p>taxbracket2 && wage_principal-socsec_p<=taxbracket3 && wage_spouse-socsec_s>taxbracket2 && wage_spouse-socsec_s<=taxbracket3) || (wage_principal-socsec_p>taxbracket3 && wage_spouse-socsec_s>taxbracket3)
        tax_al3s_max=c_all_m*children;
    else
        tax_al3s_max=0;
    end
else
    tax_al3s_max=0;
end

tax_al_3_actual_s=(tax_al3s_max>0)*min(wage_spouse-socsec_s,tax_al3s_max*min(1,(max((1-(wage_spouse-socsec_s-tax_al3s_max)/78000),0))));
tax_al_3s_actualtaken=max(0,min(wage_spouse-socsec_s-tax_al2_s,tax_al_3_actual_s));
tax_al_3s_max_effect=min(wage_spouse- socsec_s, tax_al_3s_actualtaken*max(1,(max((78000/(78000-wage_spouse+socsec_s+tax_al_3s_actualtaken)),0))));

if tax_al3s_max>0
    tax_al_3_toPrinc=(children>0)*1-(tax_al_3s_max_effect/tax_al3s_max);
else
    tax_al_3_toPrinc=(children>0)*1;
end

%Principal
if married==1
    if wage_spouse-socsec_s>sp_crd_lim
        if children>0
            tax_al3p_max=(c_all_m*children)*tax_al_3_toPrinc;
        else
            tax_al3p_max=0;
        end
    else 
        if children>0
            tax_al3p_max=c_all_m*children+s_all;
        else
            tax_al3p_max=s_all;
        end
    end
else
    if children>0
        tax_al3p_max=c_all_s1+c_all_s2*(children-1)*(children>1);
    else
        tax_al3p_max=0;
    end
end

tax_al_3_actual_p=(tax_al3p_max>0)*min(wage_principal-socsec_p,tax_al3p_max*min(1,(max((1-(wage_principal-socsec_p-tax_al3p_max)/78000),0))));

%Taxable income
taxable_income_p=wage_principal-socsec_p-tax_al2_p-tax_al_3_actual_p;
taxable_income_s=wage_spouse-socsec_s-tax_al2_s-tax_al_3s_actualtaken;


end
