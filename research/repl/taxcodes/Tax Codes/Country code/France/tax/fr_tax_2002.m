function [f_inctax] = fr_tax_2002(gross_taxable_income,wage,wage_principal,wage_spouse,married,children,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,csgded_r,decote,ppe_lim1,ppe_lim2,ppe_lim3,ppe_lim4,ppe_lim5,ppe_r1,ppe_r2,ppe_r3,ppe_extraperson,ppe_ch1)

%Family Quotient (takes into account the +3 children)
share=1+married*1 + min(children ,2)*0.5 + max((children-2),0) *1;
taxable_inc=gross_taxable_income/share;
inctax=round(min(taxable_inc,taxbracket1)*tax_r1   +min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,taxable_inc-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,taxable_inc-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,taxable_inc-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +max(0,taxable_inc-taxbracket6)*tax_r7 );

if taxable_inc<0
    inctax=0;
end

sch_tax=share*inctax;

adj_tax=min(2*sch_tax-decote,sch_tax);

if adj_tax>=tax_min
    inc_tax=adj_tax;
else
    inc_tax=0;
end


cs_noded=max(0,noded_r*wage);
csg_ded=csgded_r*wage;

%Tax Credit calculation
%PPE credit

% ppe_lim1=3186;
% ppe_lim2=10623;
% ppe_lim3=14872;
% ppe_lim4=21246;
% ppe_lim5=22654;
% 
% ppe_r1=0.044;
% ppe_r2=0.11;
% ppe_r3=0.055;
% 
% ppe_extraperson=78;
% ppe_ch1=31;

if married==0
    if wage>ppe_lim1 && wage<=ppe_lim2
        ppe_cr=wage*ppe_r1;
    elseif wage>ppe_lim2 && wage <= ppe_lim3
        ppe_cr=(ppe_lim3-wage)*ppe_r2;
    else
        ppe_cr=0;
    end 
    if children>0
        ppe_cr=ppe_cr+ppe_extraperson+(children-1)*ppe_ch1;
    end
end



%Need to make a change on naming . wage is not total wage anymore.

wage=wage_principal;

if married==1 
    if wage_spouse>0 && wage>0
        if wage>ppe_lim1 && wage<=ppe_lim2
            ppe_cr=wage*ppe_r1 ;
        elseif wage>ppe_lim2 && wage <= ppe_lim3
            ppe_cr=(ppe_lim3-wage)*ppe_r2;
        else
            ppe_cr=0;
        end
        if wage_spouse>ppe_lim1 && wage_spouse<=ppe_lim2
            ppe_crs=wage_spouse*ppe_r1 ;
        elseif wage_spouse>ppe_lim2 && wage_spouse <= ppe_lim3
            ppe_crs=(ppe_lim3-wage_spouse)*ppe_r2;
        else
            ppe_crs=0;
        end
        if children>0
            ppe_cr=ppe_cr+children*ppe_ch1;
        end
        ppe_cr=ppe_cr+ppe_crs;
    
     elseif wage_spouse==0 || wage==0
        total_wage=wage_spouse+wage;
        if total_wage>ppe_lim1 && total_wage<=ppe_lim2
            ppe_cr=total_wage*ppe_r1 +ppe_extraperson +children*31;
        elseif total_wage>ppe_lim2 && total_wage <= ppe_lim3
            ppe_cr=(ppe_lim3-total_wage)*ppe_r2 +ppe_extraperson +children*31;
        elseif total_wage>ppe_lim3 && total_wage <= ppe_lim4
            ppe_cr=ppe_extraperson +min(children,1)*ppe_ch1;
        elseif total_wage>ppe_lim4 && total_wage <= ppe_lim5
            ppe_cr=(ppe_lim5-total_wage)*ppe_r3 +ppe_extraperson+ min(children,1)*ppe_ch1;    
        else
            ppe_cr=0;
        end       
    end
end
       
    
f_inctax=round(inc_tax+cs_noded+csg_ded-ppe_cr);


end