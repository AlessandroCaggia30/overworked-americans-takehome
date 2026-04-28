% Income Tax Calculation in Belgium for year 1985

function[finaltaxpaid,local_tax]=be_tax_1985(wage_principal , wage_spouse ,married,children,ssc_p ,ssc_s ,workall_p , workall_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,taxbracket8,taxbracket9,taxbracket10,taxbracket11,taxbracket12,taxbracket13,taxbracket14,taxbracket15,taxbracket16,taxbracket17,taxbracket18,taxbracket19,taxbracket20,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,tax_r9,tax_r10,tax_r11,tax_r12,tax_r13,tax_r14,tax_r15,tax_r16,tax_r17,tax_r18,tax_r19,tax_r20,tax_r21,quote_r,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,local_r)


%Initial Taxable Income
tax_inc_p=(wage_principal-workall_p-ssc_p);
tax_inc_s=(wage_spouse-workall_s-ssc_s);

%Tax on Principal and Spouse Income
tax_p=( min(tax_inc_p,taxbracket1)*tax_r1   +min(max(0,tax_inc_p-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_p-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_p-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +min(max(0,tax_inc_p-taxbracket6),(taxbracket7-taxbracket6))*tax_r7 +min(max(0,tax_inc_p-taxbracket7),(taxbracket8-taxbracket7))*tax_r8 +min(max(0,tax_inc_p-taxbracket8),(taxbracket9-taxbracket8))*tax_r9  +min(max(0,tax_inc_p-taxbracket9),(taxbracket10-taxbracket9))*tax_r10  +min(max(0,tax_inc_p-taxbracket10),(taxbracket11-taxbracket10))*tax_r11   +min(max(0,tax_inc_p-taxbracket11),(taxbracket12-taxbracket11))*tax_r12    + min(max(0,tax_inc_p-taxbracket12),(taxbracket13-taxbracket12))*tax_r13         + min(max(0,tax_inc_p-taxbracket13),(taxbracket14-taxbracket13))*tax_r14   +min(max(0,tax_inc_p-taxbracket14),(taxbracket15-taxbracket14))*tax_r15  +min(max(0,tax_inc_p-taxbracket15),(taxbracket16-taxbracket15))*tax_r16   +min(max(0,tax_inc_p-taxbracket16),(taxbracket17-taxbracket16))*tax_r17 +min(max(0,tax_inc_p-taxbracket17),(taxbracket18-taxbracket17))*tax_r18 +min(max(0,tax_inc_p-taxbracket18),(taxbracket19-taxbracket18))*tax_r19  +min(max(0,tax_inc_p-taxbracket19),(taxbracket20-taxbracket19))*tax_r20 +max(0,tax_inc_p-taxbracket20)*tax_r21 );                                             
tax_s=( min(tax_inc_s,taxbracket1)*tax_r1   +min(max(0,tax_inc_s-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_s-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_s-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +min(max(0,tax_inc_s-taxbracket6),(taxbracket7-taxbracket6))*tax_r7 +min(max(0,tax_inc_s-taxbracket7),(taxbracket8-taxbracket7))*tax_r8 +min(max(0,tax_inc_s-taxbracket8),(taxbracket9-taxbracket8))*tax_r9  + min(max(0,tax_inc_s-taxbracket9),(taxbracket10-taxbracket9))*tax_r10  +min(max(0,tax_inc_s-taxbracket10),(taxbracket11-taxbracket10))*tax_r11   +min(max(0,tax_inc_s-taxbracket11),(taxbracket12-taxbracket11))*tax_r12    + min(max(0,tax_inc_s-taxbracket12),(taxbracket13-taxbracket12))*tax_r13         + min(max(0,tax_inc_s-taxbracket13),(taxbracket14-taxbracket13))*tax_r14   +min(max(0,tax_inc_s-taxbracket14),(taxbracket15-taxbracket14))*tax_r15  +min(max(0,tax_inc_s-taxbracket15),(taxbracket16-taxbracket15))*tax_r16   +min(max(0,tax_inc_s-taxbracket16),(taxbracket17-taxbracket16))*tax_r17 +min(max(0,tax_inc_s-taxbracket17),(taxbracket18-taxbracket17))*tax_r18 +min(max(0,tax_inc_s-taxbracket18),(taxbracket19-taxbracket18))*tax_r19  +min(max(0,tax_inc_s-taxbracket19),(taxbracket20-taxbracket19))*tax_r20 +max(0,tax_inc_s-taxbracket20)*tax_r21 );

%Tax in quote part and joint income

tax_inc_q=(tax_inc_p+tax_inc_s)*quote_r ;
tax_q=( min(tax_inc_q,taxbracket1)*tax_r1   +min(max(0,tax_inc_q-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_q-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_q-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_q-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_q-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +min(max(0,tax_inc_q-taxbracket6),(taxbracket7-taxbracket6))*tax_r7 +min(max(0,tax_inc_q-taxbracket7),(taxbracket8-taxbracket7))*tax_r8 +min(max(0,tax_inc_q-taxbracket8),(taxbracket9-taxbracket8))*tax_r9  +min(max(0,tax_inc_q-taxbracket9),(taxbracket10-taxbracket9))*tax_r10  +min(max(0,tax_inc_q-taxbracket10),(taxbracket11-taxbracket10))*tax_r11   +min(max(0,tax_inc_q-taxbracket11),(taxbracket12-taxbracket11))*tax_r12    + min(max(0,tax_inc_q-taxbracket12),(taxbracket13-taxbracket12))*tax_r13         + min(max(0,tax_inc_q-taxbracket13),(taxbracket14-taxbracket13))*tax_r14   +min(max(0,tax_inc_q-taxbracket14),(taxbracket15-taxbracket14))*tax_r15  +min(max(0,tax_inc_q-taxbracket15),(taxbracket16-taxbracket15))*tax_r16   +min(max(0,tax_inc_q-taxbracket16),(taxbracket17-taxbracket16))*tax_r17 +min(max(0,tax_inc_q-taxbracket17),(taxbracket18-taxbracket17))*tax_r18 +min(max(0,tax_inc_q-taxbracket18),(taxbracket19-taxbracket18))*tax_r19  +min(max(0,tax_inc_q-taxbracket19),(taxbracket20-taxbracket19))*tax_r20 +max(0,tax_inc_q-taxbracket20)*tax_r21 );                                             
tax_inc_j=(tax_inc_p+tax_inc_s)*(1-quote_r) ;
tax_j=( min(tax_inc_j,taxbracket1)*tax_r1   +min(max(0,tax_inc_j-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_j-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_j-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_j-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,tax_inc_j-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +min(max(0,tax_inc_j-taxbracket6),(taxbracket7-taxbracket6))*tax_r7 +min(max(0,tax_inc_j-taxbracket7),(taxbracket8-taxbracket7))*tax_r8 +min(max(0,tax_inc_j-taxbracket8),(taxbracket9-taxbracket8))*tax_r9  +min(max(0,tax_inc_j-taxbracket9),(taxbracket10-taxbracket9))*tax_r10  +min(max(0,tax_inc_j-taxbracket10),(taxbracket11-taxbracket10))*tax_r11   +min(max(0,tax_inc_j-taxbracket11),(taxbracket12-taxbracket11))*tax_r12    + min(max(0,tax_inc_j-taxbracket12),(taxbracket13-taxbracket12))*tax_r13         + min(max(0,tax_inc_j-taxbracket13),(taxbracket14-taxbracket13))*tax_r14   +min(max(0,tax_inc_j-taxbracket14),(taxbracket15-taxbracket14))*tax_r15  +min(max(0,tax_inc_j-taxbracket15),(taxbracket16-taxbracket15))*tax_r16   +min(max(0,tax_inc_j-taxbracket16),(taxbracket17-taxbracket16))*tax_r17 +min(max(0,tax_inc_j-taxbracket17),(taxbracket18-taxbracket17))*tax_r18 +min(max(0,tax_inc_j-taxbracket18),(taxbracket19-taxbracket18))*tax_r19  +min(max(0,tax_inc_j-taxbracket19),(taxbracket20-taxbracket19))*tax_r20 +max(0,tax_inc_j-taxbracket20)*tax_r21 );                                             

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



%Tax  After Credits
finaltaxpaid=round(max(0,finaltax_beforecr -child_cred));


%Local Tax
local_tax=round(local_r *finaltax_beforecr);






end
