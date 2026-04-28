%  Income Tax Calculation in Belgium for year 1999

function[finaltaxpaid,local_tax]=be_tax_1999(wage_principal , wage_spouse ,married,children,ssc_p ,ssc_s ,workall_p , workall_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,surtax_lim1,surtax_lim2,surtax_r1,surtax_r2,surtax_rtph )



%Initial Taxable Income
tax_inc_p=(wage_principal-workall_p-ssc_p);
tax_inc_s=(wage_spouse-workall_s-ssc_s);

%Tax on Principal and Spouse Income
tax_p=round( min(tax_inc_p,taxbracket1)*tax_r1   +min(max(0,tax_inc_p-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_p-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_p-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    +max(0,tax_inc_p-taxbracket6)*tax_r7 );
tax_s=round( min(tax_inc_s,taxbracket1)*tax_r1   +min(max(0,tax_inc_s-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_s-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_s-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    +max(0,tax_inc_s-taxbracket6)*tax_r7 );

%Tax in quote part and joint income
tax_inc_q=min((tax_inc_p+tax_inc_s)*quote_r , quote_max);
tax_q=round( min(tax_inc_q,taxbracket1)*tax_r1   +min(max(0,tax_inc_q-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_q-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_q-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_q-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_q-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    +max(0,tax_inc_q-taxbracket6)*tax_r7 );

tax_inc_j= tax_inc_p+tax_inc_s-tax_inc_q;
tax_j=round( min(tax_inc_j,taxbracket1)*tax_r1   +min(max(0,tax_inc_j-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_j-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_j-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_j-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_j-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    +max(0,tax_inc_j-taxbracket6)*tax_r7 );

%Calculating Final Taxableincome
if (tax_p+tax_s)>(tax_q+tax_j) && married==1
    finaltax_inc=tax_inc_q +tax_inc_j;
    finaltax_beforecr=tax_q+tax_j;% (5 - Tax before credits)
else
    finaltax_inc=tax_inc_p+tax_inc_s;
    finaltax_beforecr=tax_p+tax_s;
end




%Tax Credits------------------------------------------
%Child Credit
if children==1
child_cred=child_cr1;
else if children==2
        child_cred=child_cr2;
    else if children==3
        child_cred=child_cr3;
        else if children==4
        child_cred=child_cr4;
        else if children==5
        child_cred=child_cr5;
            else if children==0
                    child_cred=0;
                end
            end
            end
        end
    end
end
%Single Parent Credit
if married==0 && children >0
    singlep_cred=s_parent_cr;
else
    singlep_cred=0;
end

%Family Credit--Includes credit based on marital status and child credit
if married==0
    family_c=(single_cr+singlep_cred+child_cred);
    family_credit=round( min(family_c,taxbracket1)*tax_r1   +min(max(0,family_c-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,family_c-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,family_c-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,family_c-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,family_c-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    +max(0,family_c-taxbracket6)*tax_r7 );
else
    family_c=(married_cr+child_cred);  
    family_credit=round( min(family_c,taxbracket1)*tax_r1   +min(max(0,family_c-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,family_c-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,family_c-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,family_c-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,family_c-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    +max(0,family_c-taxbracket6)*tax_r7 );
end

%Spouse Credit
married_credit=round( min(married_cr,taxbracket1)*tax_r1   +min(max(0,married_cr-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2  + min(max(0,married_cr-taxbracket2),(taxbracket3-taxbracket2))*tax_r3 );
if married==1
if (tax_p+tax_s)<(tax_q+tax_j) 
    spouse_credit=min(tax_s , married_credit);
else 
    spouse_credit=min(tax_q , married_credit);
end
else
    spouse_credit=0;
end

%Tax  After Credits
cg_tax=max(0,finaltax_beforecr - family_credit - spouse_credit);

%Surtax
if finaltax_inc <= surtax_lim1
    surtax=cg_tax*surtax_r1;
else if finaltax_inc > surtax_lim1 &&finaltax_inc <= surtax_lim2
      surtax=cg_tax*  (  surtax_r1+ surtax_rtph *(finaltax_inc-surtax_lim2)   )  ;
    else if finaltax_inc > surtax_lim2 
            surtax=cg_tax*surtax_r2;
        end
    end
end

finaltaxpaid=round(cg_tax+surtax);

%Local Tax
local_tax=round(local_r *max(0,cg_tax));






end
