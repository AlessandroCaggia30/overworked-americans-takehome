% Tax calculation function for Portugal 2016

function [final_tax] = pt_tax_2016(taxable_income_joint,taxable_income_p,taxable_income_s,wage_principal,wage_spouse,married,children,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,child_cred,surtax_r,surtax_r2,surtax_thrs,add_surtax_cred,mw, add_surtax_r1,add_surtax_r2,add_surtax_r3,add_surtax_r4,add_surtax_r5,add_surtax_bracket1,add_surtax_bracket2,add_surtax_bracket3,add_surtax_bracket4)

taxable_inc=taxable_income_joint/(1+married); 

%individual calculation
inc_tax_p=min(taxable_income_p,taxbracket1)*tax_r1 + min(max(0,taxable_income_p-taxbracket1),(taxbracket2-taxbracket1))*tax_r2  + min(max(0,taxable_income_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3    +min(max(0,taxable_income_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4 +max(0,taxable_income_p-taxbracket4)*tax_r5;
inc_tax_s=min(taxable_income_s,taxbracket1)*tax_r1 + min(max(0,taxable_income_s-taxbracket1),(taxbracket2-taxbracket1))*tax_r2  + min(max(0,taxable_income_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3    +min(max(0,taxable_income_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4 +max(0,taxable_income_s-taxbracket4)*tax_r5;

%joint calculation (no information on amount/existence of tax_floor available in taxing wages
%report, so I dropped this restriction)

inc_tax_joint=(min(taxable_inc,taxbracket1)*tax_r1 + min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1))*tax_r2  + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3    +min(max(0,taxable_inc-taxbracket3),(taxbracket4-taxbracket3))*tax_r4 +max(0,taxable_inc-taxbracket4)*tax_r5)*(1+married) ;


% %Tax Credits

% %Child Credit
%joint calculation 
child_cr=children*child_cred;

%individual calculation 
if married==1 && wage_spouse>0
    child_cr_p=children*child_cred/2;
else
    child_cr_p=children*child_cred;
end

if married==1 && wage_spouse>0
    child_cr_s=children*child_cred/2;
else
    child_cr_s=0;
end

% %Surtax
%joint calculation 
if taxable_inc>surtax_thrs
    surtax=(surtax_r*(surtax_thrs-taxbracket4)+surtax_r2*(taxable_inc-surtax_thrs))*(1+married);
else
    surtax=surtax_r*max(0,(taxable_inc-taxbracket4)*(1+married))+max(0,(min(taxable_inc,add_surtax_bracket1)*add_surtax_r1+ min(max(0,taxable_inc-add_surtax_bracket1),(add_surtax_bracket2-add_surtax_bracket1))*add_surtax_r2  + min(max(0,taxable_inc-add_surtax_bracket2),(add_surtax_bracket3-add_surtax_bracket2))*add_surtax_r3    +min(max(0,taxable_inc-add_surtax_bracket3),(add_surtax_bracket4-add_surtax_bracket3))*add_surtax_r4 +max(0,taxable_inc-add_surtax_bracket4)*add_surtax_r5)*(1+married)-(add_surtax_cred*mw*children));
end

%individual calculation 
if taxable_income_p>surtax_thrs
    surtax_p=(surtax_r*(surtax_thrs-taxbracket4)+surtax_r2*(taxable_income_p-surtax_thrs));
else
    surtax_p=surtax_r*max(0,(taxable_income_p-taxbracket4))+max(0,(min(taxable_income_p,add_surtax_bracket1)*add_surtax_r1+ min(max(0,taxable_income_p-add_surtax_bracket1),(add_surtax_bracket2-add_surtax_bracket1))*add_surtax_r2  + min(max(0,taxable_income_p-add_surtax_bracket2),(add_surtax_bracket3-add_surtax_bracket2))*add_surtax_r3    +min(max(0,taxable_income_p-add_surtax_bracket3),(add_surtax_bracket4-add_surtax_bracket3))*add_surtax_r4 +max(0,taxable_income_p-add_surtax_bracket4)*add_surtax_r5)-(add_surtax_cred*mw*children)/(1+(married*(wage_spouse>0))));
end

if taxable_income_s>surtax_thrs
    surtax_s=(surtax_r*(surtax_thrs-taxbracket4)+surtax_r2*(taxable_income_s-surtax_thrs));
else
    surtax_s=surtax_r*max(0,(taxable_income_s-taxbracket4))+max(0,(min(taxable_income_s,add_surtax_bracket1)*add_surtax_r1+ min(max(0,taxable_income_s-add_surtax_bracket1),(add_surtax_bracket2-add_surtax_bracket1))*add_surtax_r2  + min(max(0,taxable_income_s-add_surtax_bracket2),(add_surtax_bracket3-add_surtax_bracket2))*add_surtax_r3    +min(max(0,taxable_income_s-add_surtax_bracket3),(add_surtax_bracket4-add_surtax_bracket3))*add_surtax_r4 +max(0,taxable_income_s-add_surtax_bracket4)*add_surtax_r5)-(add_surtax_cred*mw*children)/(1+(married*(wage_spouse>0))));
end

%joint calculation 
if (wage_principal+wage_spouse-inc_tax_joint)>dispy*(1+(married*(wage_spouse>0)))
    final_tax_joint=max(0,round(inc_tax_joint-child_cr))+round(surtax);
else
    final_tax_joint=round(surtax);
end 

%individual calculation 
if (wage_principal-inc_tax_p)>dispy
    final_tax_p=max(0,round(inc_tax_p-child_cr_p))+round(surtax_p);
else
    final_tax_p=round(surtax_p);
end 

if (wage_spouse-inc_tax_s)>dispy
    final_tax_s=max(0,round(inc_tax_s-child_cr_s))+round(surtax_s);
else
    final_tax_s=round(surtax_s);
end 

%choose most favourable system
final_tax=min(final_tax_joint, final_tax_p+final_tax_s);

end