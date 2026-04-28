function [inctax, local_tax] = it_tax_2014(taxable_inc_p,taxable_inc_s,married,children,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,reg_rt,sp_crd_lim,emp_cr_bracket1,emp_cr_bracket2,emp_cr_bracket3,emp_cr_bracket4,emp_cr_bracket5,emp_cr_bracket6,emp_cr_bracket7,emp_cr_bracket8,emp_cr_bracket9,emp_cr_bracket10,emp_cr1,emp_cr2,emp_cr3,emp_cr4,emp_cr5,emp_cr6,emp_cr7,emp_cr8,emp_cr9,emp_cr10,spouse_cr_bracket1,spouse_cr_bracket2,spouse_cr_bracket3,spouse_cr_bracket4,spouse_cr_bracket5,spouse_cr_bracket6,spouse_cr_bracket7,spouse_cr_bracket8,spouse_cr_bracket9,spouse_cr_bracket10,spouse_cr1,spouse_cr2,spouse_cr3,spouse_cr4,spouse_cr5,spouse_cr6,spouse_cr7,spouse_cr8,spouse_cr9,spouse_cr10,sol_tax_p,sol_tax_s,thre_min,thre_max,f_bonus,child_cr)

     
%%%%Taxes
inctax_p_gr=min(taxable_inc_p,taxbracket1)*tax_r1+min(max(0,taxable_inc_p-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_inc_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3  + min(max(0,taxable_inc_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4 + min(max(0,taxable_inc_p-taxbracket4),(taxbracket5-taxbracket4))*tax_r5;
inctax_s_gr=min(taxable_inc_s,taxbracket1)*tax_r1+min(max(0,taxable_inc_s-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2 + min(max(0,taxable_inc_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3  + min(max(0,taxable_inc_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4 + min(max(0,taxable_inc_s-taxbracket4),(taxbracket5-taxbracket4))*tax_r5;


%%%Tax Credits
%Employment credit
emp_cr_max_p=(taxable_inc_p<emp_cr_bracket2)*emp_cr1+(taxable_inc_p>=emp_cr_bracket2 && taxable_inc_p<emp_cr_bracket3)*emp_cr2+(taxable_inc_p>=emp_cr_bracket3&& taxable_inc_p<emp_cr_bracket4)*emp_cr3+(taxable_inc_p>=emp_cr_bracket4&& taxable_inc_p<emp_cr_bracket5)*emp_cr4+(taxable_inc_p>=emp_cr_bracket5&& taxable_inc_p<emp_cr_bracket6)*emp_cr5+(taxable_inc_p>=emp_cr_bracket6&& taxable_inc_p<emp_cr_bracket7)*emp_cr6+(taxable_inc_p>=emp_cr_bracket7&& taxable_inc_p<emp_cr_bracket8)*emp_cr7+(taxable_inc_p>=emp_cr_bracket8&& taxable_inc_p<emp_cr_bracket9)*emp_cr8+(taxable_inc_p>=emp_cr_bracket9&& taxable_inc_p<emp_cr_bracket10)*emp_cr9+(taxable_inc_p>=emp_cr_bracket10)*emp_cr10;

if taxable_inc_s>0
    emp_cr_max_s=(taxable_inc_s<emp_cr_bracket2)*emp_cr1+(taxable_inc_s>=emp_cr_bracket2&& taxable_inc_s<emp_cr_bracket3)*emp_cr2+(taxable_inc_s>=emp_cr_bracket3&& taxable_inc_s<emp_cr_bracket4)*emp_cr3+(taxable_inc_s>=emp_cr_bracket4&& taxable_inc_s<emp_cr_bracket5)*emp_cr4+(taxable_inc_s>=emp_cr_bracket5&& taxable_inc_s<emp_cr_bracket6)*emp_cr5+(taxable_inc_s>=emp_cr_bracket6&& taxable_inc_s<emp_cr_bracket7)*emp_cr6+(taxable_inc_s>=emp_cr_bracket7&& taxable_inc_s<emp_cr_bracket8)*emp_cr7+(taxable_inc_s>=emp_cr_bracket8&& taxable_inc_s<emp_cr_bracket9)*emp_cr8+(taxable_inc_s>=emp_cr_bracket9&& taxable_inc_s<emp_cr_bracket10)*emp_cr9+(taxable_inc_s>=emp_cr_bracket10)*emp_cr10;
else
    emp_cr_max_s=0;
end

if taxable_inc_p<=8000 || taxable_inc_p>55000
    emp_cr_p=min(inctax_p_gr, emp_cr_max_p);
elseif taxable_inc_p>8000 && taxable_inc_p<=28000
    emp_cr_p=min(inctax_p_gr,emp_cr_max_p+902*(28000-taxable_inc_p)/20000);
elseif taxable_inc_p>28000 && taxable_inc_p<=55000
    emp_cr_p=min(inctax_p_gr,emp_cr_max_p*(55000-taxable_inc_p)/27000);
end

if taxable_inc_p<thre_min
    emp_cr_p=emp_cr_p+0;
elseif taxable_inc_p>=thre_min && taxable_inc_p<=thre_max
    emp_cr_p=emp_cr_p+f_bonus;
elseif taxable_inc_p>=thre_max && taxable_inc_p<=26000
    emp_cr_p=emp_cr_p+f_bonus*(1-(taxable_inc_p-24000)/2000);
end

if taxable_inc_s<=8000 || taxable_inc_s>55000
    emp_cr_s=min(inctax_s_gr, emp_cr_max_s);
elseif taxable_inc_s>8000 && taxable_inc_s<=28000
    emp_cr_s=min(inctax_s_gr,emp_cr_max_s+902*(28000-taxable_inc_s)/20000);
elseif taxable_inc_s>28000 && taxable_inc_s<=55000
    emp_cr_s=min(inctax_s_gr,emp_cr_max_s*(55000-taxable_inc_s)/27000);
end

if taxable_inc_s<thre_min
    emp_cr_s=emp_cr_s+0;
elseif taxable_inc_s>=thre_min && taxable_inc_s<=thre_max
    emp_cr_s=emp_cr_s+f_bonus;
elseif taxable_inc_s>=thre_max && taxable_inc_s<=26000
    emp_cr_s=emp_cr_s+f_bonus*(1-(taxable_inc_s-24000)/2000);
end

%Spouse credit
if married==1
    if taxable_inc_s>sp_crd_lim
        spouse_cr=0;
    else
        if taxable_inc_p>80000
            spouse_cr=0;
        elseif taxable_inc_p<15000
            spouse_cr=800-110*taxable_inc_p/15000;
        elseif taxable_inc_p>40000 && taxable_inc_p<=80000
            spouse_cr=690*(80000-taxable_inc_p)/40000;
        else
            spouse_cr=(taxable_inc_p<spouse_cr_bracket2)*spouse_cr1+(taxable_inc_p>=spouse_cr_bracket2&& taxable_inc_p<spouse_cr_bracket3)*spouse_cr2+(taxable_inc_p>=spouse_cr_bracket3&& taxable_inc_p<spouse_cr_bracket4)*spouse_cr3+(taxable_inc_p>=spouse_cr_bracket4&& taxable_inc_p<spouse_cr_bracket5)*spouse_cr4+(taxable_inc_p>=spouse_cr_bracket5&& taxable_inc_p<spouse_cr_bracket6)*spouse_cr5+(taxable_inc_p>=spouse_cr_bracket6&& taxable_inc_p<spouse_cr_bracket7)*spouse_cr6+(taxable_inc_p>=spouse_cr_bracket7&& taxable_inc_p<spouse_cr_bracket8)*spouse_cr7+(taxable_inc_p>=spouse_cr_bracket8&& taxable_inc_p<spouse_cr_bracket9)*spouse_cr8+(taxable_inc_p>=spouse_cr_bracket9&& taxable_inc_p<spouse_cr_bracket10)*spouse_cr9+(taxable_inc_p>=spouse_cr_bracket10)*spouse_cr10;
        end
    end
else    
    spouse_cr=0;
end

%Child credit
if children==0
    child_crfull_s=0;
else
    child_crfull_s=(spouse_cr==0)*married*(child_cr*(95000-taxable_inc_s)/95000+(children-1)*child_cr*(110000-taxable_inc_s)/110000);
end

if child_crfull_s>0
   if (inctax_s_gr-emp_cr_s)/child_crfull_s<0.5
       child_crpct_s=0;
   else
       child_crpct_s=0.5;
   end
else
    child_crpct_s=0;
end

child_cr_s=child_crfull_s*child_crpct_s;

if children==0
    child_cr_p=0;
else
    if married>0
        child_cr_p=(child_cr*(95000-taxable_inc_p)/95000+(children-1)*child_cr*(110000-taxable_inc_p)/110000)*(1-child_crpct_s);
    else
        child_cr_p=max(child_cr*(95000-taxable_inc_p)/95000,(taxable_inc_p>80000)*0+(taxable_inc_p<15000)*(800-110*taxable_inc_p/15000)+(taxable_inc_p<=80000 &&taxable_inc_p>40000)*(690* (80000-taxable_inc_p)/40000)+(taxable_inc_p<=40000 &&taxable_inc_p>15000)*((taxable_inc_p<spouse_cr_bracket2)*spouse_cr1+(taxable_inc_p>=spouse_cr_bracket2&& taxable_inc_p<spouse_cr_bracket3)*spouse_cr2+(taxable_inc_p>=spouse_cr_bracket3&& taxable_inc_p<spouse_cr_bracket4)*spouse_cr3+(taxable_inc_p>=spouse_cr_bracket4&& taxable_inc_p<spouse_cr_bracket5)*spouse_cr4+(taxable_inc_p>=spouse_cr_bracket5&& taxable_inc_p<spouse_cr_bracket6)*spouse_cr5+(taxable_inc_p>=spouse_cr_bracket6&& taxable_inc_p<spouse_cr_bracket7)*spouse_cr6+(taxable_inc_p>=spouse_cr_bracket7&& taxable_inc_p<spouse_cr_bracket8)*spouse_cr7+(taxable_inc_p>=spouse_cr_bracket8&& taxable_inc_p<spouse_cr_bracket9)*spouse_cr8+(taxable_inc_p>=spouse_cr_bracket9&& taxable_inc_p<spouse_cr_bracket10)*spouse_cr9+(taxable_inc_p>=spouse_cr_bracket10)*spouse_cr10))+((children-1)*child_cr*(110000-taxable_inc_p)/110000);
    end
end

%Total tax credit
tax_cr_p= emp_cr_p+spouse_cr+child_cr_p;
tax_cr_s= emp_cr_s+child_cr_s;

%Income taxes net of tax credits
inctax_p=inctax_p_gr-tax_cr_p+sol_tax_p;
inctax_s=inctax_s_gr-tax_cr_s+sol_tax_s;

inctax=round(inctax_p+inctax_s);

%Local Tax
if inctax_p>0
    local_tax_p=(taxable_inc_p)*reg_rt;
else
    local_tax_p=0;
end


if inctax_s>0
    local_tax_s=(taxable_inc_s)*reg_rt;
else
    local_tax_s=0;
end

local_tax=round(local_tax_p+local_tax_s);