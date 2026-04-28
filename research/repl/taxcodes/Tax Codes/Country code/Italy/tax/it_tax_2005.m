function [inctax, local_tax] = it_tax_2005(taxable_inc,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3, reg_rt,tax_al2,tax_al_3)


inctax=round(min(taxable_inc,taxbracket1)*tax_r1+min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3);

%Local Taxation
if inctax>0
    local_tax=(taxable_inc+tax_al2+tax_al_3)*reg_rt;
else
    local_tax=0;
end


