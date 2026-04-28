function [finaltax,tax_cr,tax_cr_s] = ne_tax_2014(children,married,taxable_income,taxable_income_s,wage_principal,wage_spouse,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,comb_credit_fr,singlepar_cr,addsinglepcr_r,gen_cred1,gen_cred1_thr,gen_cred2_thr,gen_cred_r,red_gen_cred,emp_cred,work_cred1,work_cred2,emp_cr_thr,work_max,rate_cr,work_cred3,emp_cr_thr3,incdep_combcred1,incdep_combcred_max,incdep_combcred_per,addsinglepcr_max,work_red_max,oldpen_r,widpen_r,ex_med_r)


inctax=round(min(taxable_income,taxbracket1)*tax_r1+min(max(0,taxable_income-taxbracket1),(taxbracket2-taxbracket1))*tax_r2+ min(max(0,taxable_income-taxbracket2),(taxbracket3-taxbracket2))*tax_r3+ max(0,taxable_income-taxbracket3)*tax_r4) ;
inctax_s=round(min(taxable_income_s,taxbracket1)*tax_r1+min(max(0,taxable_income_s-taxbracket1),(taxbracket2-taxbracket1))*tax_r2+ min(max(0,taxable_income_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3+ max(0,taxable_income_s-taxbracket3)*tax_r4) ;
 
if taxable_income<0
    inctax=0;
end
 
if taxable_income_s<0
    inctax_s=0;
end
 
% general tax credit
if taxable_income<gen_cred1_thr
    gen_credit=gen_cred1;
else
    gen_credit=gen_cred1-min(gen_cred_r*(gen_cred2_thr-gen_cred1_thr),gen_cred_r*(taxable_income-gen_cred1_thr));
end
 
if married==1
    if taxable_income_s>0 
        if taxable_income_s<gen_cred1_thr
            gen_credit_s=gen_cred1;
        else
            gen_credit_s=gen_cred1-min(gen_cred_r*(gen_cred2_thr-gen_cred1_thr),gen_cred_r*(taxable_income_s-gen_cred1_thr));
        end
    else
        gen_credit_s=red_gen_cred;
    end       
else
    gen_credit_s=0;
end

%work credit
work_credit=min( (min(emp_cred,(work_cred1*taxable_income)) + work_cred2*max(0,(taxable_income-emp_cr_thr))),work_max);
work_credit_s=min( (min(emp_cred,(work_cred1*taxable_income_s)) + work_cred2*max(0,(taxable_income_s-emp_cr_thr))),work_max);

%work credit reduction
if taxable_income>emp_cr_thr3 
    work_credit=max(0,work_credit-(min(work_red_max,work_cred3*(taxable_income-emp_cr_thr3))));
end

if taxable_income_s>emp_cr_thr3 
    work_credit_s=max(0,work_credit_s-(min(work_red_max,work_cred3*(taxable_income_s-emp_cr_thr3))));
end

%income dependent combination credit
if (taxable_income>comb_credit_fr && (children)>0) && (wage_principal<wage_spouse || married==0)
    inc_comb_cr=min(incdep_combcred_max,(incdep_combcred1+incdep_combcred_per*(max(0,taxable_income-comb_credit_fr)))); 
else
    inc_comb_cr=0;    
end


if (taxable_income_s>comb_credit_fr && (children)>0) && (wage_principal<wage_spouse || married==0)
    inc_comb_cr_s=min(incdep_combcred_max,(incdep_combcred1+incdep_combcred_per*(max(0,taxable_income_s-comb_credit_fr)))); 
else
    inc_comb_cr_s=0;    
end

%Single Parent Credit                                                                                                                    
if married==0 && (children)>0
    singparent_cr=min(addsinglepcr_max+singlepar_cr,(singlepar_cr + wage_principal*addsinglepcr_r));
else
    singparent_cr=0;
end

   
tax_cr=gen_credit + work_credit +inc_comb_cr+ singparent_cr;
tax_cr_s=gen_credit_s + work_credit_s + inc_comb_cr_s;

if tax_cr>taxbracket1*(oldpen_r+ widpen_r+ex_med_r+tax_r1)
  tax_cr_inc_p=(tax_r2/(oldpen_r+ widpen_r+ex_med_r+tax_r2))*(tax_cr-((oldpen_r+ widpen_r+ex_med_r+tax_r1)*taxbracket1))+rate_cr*(taxbracket1*(oldpen_r+ widpen_r+ex_med_r+tax_r1));
else 
  tax_cr_inc_p=rate_cr*tax_cr;
end
    
if tax_cr_s>taxbracket1*(oldpen_r+ widpen_r+ex_med_r+tax_r1)
  tax_cr_inc_s=(tax_r2/(oldpen_r+ widpen_r+ex_med_r+tax_r2))*(tax_cr_s-((oldpen_r+ widpen_r+ex_med_r+tax_r1)*taxbracket1))+rate_cr*(taxbracket1*(oldpen_r+ widpen_r+ex_med_r+tax_r1));
else 
  tax_cr_inc_s=rate_cr*tax_cr_s;
end

tax_cr_inc=tax_cr_inc_p+ tax_cr_inc_s;
 
finaltax=round(max(0,inctax+inctax_s-tax_cr_inc));

end