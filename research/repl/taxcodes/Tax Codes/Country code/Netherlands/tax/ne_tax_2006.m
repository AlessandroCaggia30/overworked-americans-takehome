function [finaltax,tax_cr_total] = ne_tax_2006(children,married,taxable_income,taxable_income_s,wage_principal,wage_spouse,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,comb_credit,singlepar_cr,addsinglepcr_r,gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,ch_cr_thr,adch_thr,ch_cr,decrease_r,rate_cr,adcomb_cred)


inctax=round(min(taxable_income,taxbracket1)*tax_r1+min(max(0,taxable_income-taxbracket1),(taxbracket2-taxbracket1))*tax_r2+ min(max(0,taxable_income-taxbracket2),(taxbracket3-taxbracket2))*tax_r3+ max(0,taxable_income-taxbracket3)*tax_r4) ;
inctax_s=round(min(taxable_income_s,taxbracket1)*tax_r1+min(max(0,taxable_income_s-taxbracket1),(taxbracket2-taxbracket1))*tax_r2+ min(max(0,taxable_income_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3+ max(0,taxable_income_s-taxbracket3)*tax_r4) ;
 
if taxable_income<0
    inctax=0;
end
 
if taxable_income_s<0
    inctax_s=0;
end
 
if wage_principal>0
gen_credit=gen_cred;
else
    gen_credit=0;
end
 
if married==1
gen_credit_s=gen_cred;
else
    gen_credit_s=0;
end
 
work_credit=min( (min(emp_cred,(work_cred1*wage_principal)) + work_cred2*max(0,(wage_principal-emp_cr_thr))),work_max);
work_credit_s=min( (min(emp_cred,(work_cred1*wage_spouse)) + work_cred2*max(0,(wage_spouse-emp_cr_thr))),work_max);
 
 
 if children>0 && (married==0) && (wage_principal<=ch_cr_thr)
      child_credit=ch_cr;
    else
      child_credit=0;
 end
 
if children>0 && (married==1)
    if(wage_principal+wage_spouse) <=ch_cr_thr
    child_credit=ch_cr;
elseif (wage_principal+wage_spouse)>ch_cr_thr && (wage_principal+wage_spouse) <=adch_thr
    child_credit=child_credit - decrease_r*(wage_principal+wage_spouse-ch_cr_thr);
    else
        child_credit=0;
    end
end

 
if wage_principal>comb_credit_fr && (children)>0  
    if wage_principal<wage_spouse || married==0
        comb_cr=comb_credit+adcomb_cred; 
    else
        comb_cr=comb_credit;
    end
else
    comb_cr=0;    
end


if wage_spouse>comb_credit_fr && (children)>0  
    if wage_spouse<wage_principal
        comb_cr_s=comb_credit+adcomb_cred; 
    else
        comb_cr_s=comb_credit;
    end
else
    comb_cr_s=0;    
end
 

%Single Parent Credit                                                                                                                    
if married==0 && (children)>0
    singparent_cr=singlepar_cr + min(wage_principal*addsinglepcr_r,singlepar_cr);
else
    singparent_cr=0;
end
   
tax_cr=gen_credit + work_credit+ child_credit +comb_cr+ singparent_cr;
tax_cr_s=gen_credit_s + work_credit_s + comb_cr_s;
tax_cr_total=tax_cr+tax_cr_s;
 
tax_cr_inc=rate_cr*(tax_cr + tax_cr_s);
 
%finaltax=round(inctax+inctax_s-tax_cr_inc);
% Tax credit is non-refundable:
finaltax=round(max(0,inctax+inctax_s-tax_cr_inc));

end