% Income Tax Calculation in Belgium for year 1988

function[finaltaxpaid,local_tax]=be_tax_1988(wage_principal , wage_spouse ,married,children,ssc_p ,ssc_s ,workall_p , workall_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,max_rate,quote_r,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r)


%Initial Taxable Income
tax_inc_p=(wage_principal-workall_p-ssc_p);
tax_inc_s=(wage_spouse-workall_s-ssc_s);

%Tax on Principal and Spouse Income
tax_p=min(tax_inc_p*max_rate ,( min(tax_inc_p,taxbracket1)*tax_r1   +min(max(0,tax_inc_p-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_p-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_p-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +min(max(0,tax_inc_p-taxbracket6),(taxbracket7-taxbracket6))*tax_r7 +min(max(0,tax_inc_p-taxbracket7),(taxbracket8-taxbracket7))*tax_r8 +min(max(0,tax_inc_p-taxbracket8),(taxbracket9-taxbracket8))*tax_r9  +min(max(0,tax_inc_p-taxbracket9),(taxbracket10-taxbracket9))*tax_r10  +min(max(0,tax_inc_p-taxbracket10),(taxbracket11-taxbracket10))*tax_r11   +min(max(0,tax_inc_p-taxbracket11),(taxbracket12-taxbracket11))*tax_r12 +max(0,tax_inc_p-taxbracket12)*tax_r13 ));
tax_s=min(tax_inc_s*max_rate ,( min(tax_inc_s,taxbracket1)*tax_r1   +min(max(0,tax_inc_s-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_s-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_s-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +min(max(0,tax_inc_s-taxbracket6),(taxbracket7-taxbracket6))*tax_r7 +min(max(0,tax_inc_s-taxbracket7),(taxbracket8-taxbracket7))*tax_r8 +min(max(0,tax_inc_s-taxbracket8),(taxbracket9-taxbracket8))*tax_r9  + min(max(0,tax_inc_s-taxbracket9),(taxbracket10-taxbracket9))*tax_r10  +min(max(0,tax_inc_s-taxbracket10),(taxbracket11-taxbracket10))*tax_r11   +min(max(0,tax_inc_s-taxbracket11),(taxbracket12-taxbracket11))*tax_r12 +max(0,tax_inc_s-taxbracket12)*tax_r13 ));


%Tax in quote part and joint income

tax_inc_q=(tax_inc_p+tax_inc_s)*quote_r ;
tax_q=round( min(tax_inc_q,taxbracket1)*tax_r1   +min(max(0,tax_inc_q-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_q-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_q-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_q-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_q-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    +min(max(0,tax_inc_q-taxbracket6),(taxbracket7-taxbracket6))*tax_r7 +min(max(0,tax_inc_q-taxbracket7),(taxbracket8-taxbracket7))*tax_r8 +min(max(0,tax_inc_q-taxbracket8),(taxbracket9-taxbracket8))*tax_r9 +min(max(0,tax_inc_q-taxbracket9),(taxbracket10-taxbracket9))*tax_r10  +min(max(0,tax_inc_q-taxbracket10),(taxbracket11-taxbracket10))*tax_r11   +min(max(0,tax_inc_q-taxbracket11),(taxbracket12-taxbracket11))*tax_r12 +max(0,tax_inc_q-taxbracket12)*tax_r13 );
tax_inc_j=(tax_inc_p+tax_inc_s)*(1-quote_r) ;
tax_j=round( min(tax_inc_j,taxbracket1)*tax_r1   +min(max(0,tax_inc_j-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_j-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_j-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_j-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_j-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    ++min(max(0,tax_inc_j-taxbracket6),(taxbracket7-taxbracket6))*tax_r7 +min(max(0,tax_inc_j-taxbracket7),(taxbracket8-taxbracket7))*tax_r8 +min(max(0,tax_inc_j-taxbracket8),(taxbracket9-taxbracket8))*tax_r9 +min(max(0,tax_inc_j-taxbracket9),(taxbracket10-taxbracket9))*tax_r10  +min(max(0,tax_inc_j-taxbracket10),(taxbracket11-taxbracket10))*tax_r11   +min(max(0,tax_inc_j-taxbracket11),(taxbracket12-taxbracket11))*tax_r12 +max(0,tax_inc_j-taxbracket12)*tax_r13 );
 
%Calculating Final Taxableincome
if (tax_p+tax_s)>(tax_q+tax_j) && married==1
 finaltax_beforecr=(tax_q+tax_j);% (5 - Tax before credits)
else
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
        else if children>4
        child_cred=child_cr4+ max(children-4,0)*(child_cr5-child_cr4);
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


family_credit= child_cred+singlep_cred;



%Tax  After Credits
finaltaxpaid=round(max(0,finaltax_beforecr-family_credit) );


%Local Tax
local_tax=round(local_r *finaltax_beforecr);






end
