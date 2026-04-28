%  Income Tax Calculation in Belgium for year 2002

function[finaltaxpaid,local_tax]=be_tax_2002(wage_principal , wage_spouse ,married,children,ssc_p ,ssc_s ,workall_p , workall_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,local_r,surtax_lim1,surtax_lim2,surtax_r1,surtax_r2,surtax_rtph,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4 )


%Initial Taxable Income
tax_inc_p=(wage_principal-workall_p-ssc_p);
tax_inc_s=(wage_spouse-workall_s-ssc_s);

%%%%%Basic Credit%%%%%After 2002%%%%%%%%%%%%%%

if tax_inc_p<=basicr_1
    basic_cred_p=0;
else if tax_inc_p>basicr_1 && tax_inc_p<=basicr_2
      basic_cred_p=basicr_b*((tax_inc_p-basicr_1)/(basicr_2-basicr_1)) ;
    else if tax_inc_p>basicr_2 && tax_inc_p<=basicr_3
            basic_cred_p=basicr_b;
        else if tax_inc_p>basicr_3 && tax_inc_p<=basicr_4
                basic_cred_p=basicr_b*((basicr_4-tax_inc_p)/(basicr_4-basicr_3));
                else if tax_inc_p>basicr_4
                       basic_cred_p=0;
                    end
            end
        end
    end
end

if tax_inc_s<=basicr_1
    basic_cred_s=0;
else if tax_inc_s>basicr_1 && tax_inc_s<=basicr_2
      basic_cred_s=basicr_b*((tax_inc_s-basicr_1)/(basicr_2-basicr_1)) ;
    else if tax_inc_s>basicr_2 && tax_inc_s<=basicr_3
            basic_cred_s=basicr_b;
        else if tax_inc_s>basicr_3 && tax_inc_s<=basicr_4
                basic_cred_s=basicr_b*((basicr_4-tax_inc_s)/(basicr_4-basicr_3));
                else if tax_inc_s>basicr_4
                       basic_cred_s=0;
                    end
            end
        end
    end
end

    
%Tax on Principal and Spouse Income
tax_p=round( min(tax_inc_p,taxbracket1)*tax_r1   +min(max(0,tax_inc_p-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_p-taxbracket4),(taxbracket5-taxbracket4))*tax_r5     +max(0,tax_inc_p-taxbracket5)*tax_r6 );
tax_s=round( min(tax_inc_s,taxbracket1)*tax_r1   +min(max(0,tax_inc_s-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_s-taxbracket4),(taxbracket5-taxbracket4))*tax_r5     +max(0,tax_inc_s-taxbracket5)*tax_r6 );

%Tax in quote part and joint income
tax_inc_q=min((tax_inc_p+tax_inc_s)*quote_r , quote_max);
tax_q=round( min(tax_inc_q,taxbracket1)*tax_r1   +min(max(0,tax_inc_q-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_q-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_q-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_q-taxbracket4),(taxbracket5-taxbracket4))*tax_r5      +max(0,tax_inc_q-taxbracket5)*tax_r6 );

tax_inc_j= tax_inc_p+tax_inc_s-tax_inc_q;
tax_j=round( min(tax_inc_j,taxbracket1)*tax_r1   +min(max(0,tax_inc_j-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_j-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_j-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,tax_inc_j-taxbracket4),(taxbracket5-taxbracket4))*tax_r5      +max(0,tax_inc_j-taxbracket5)*tax_r6 );

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
        else if children>4
        child_cred=child_cr4+(children-4)*child_cr5;
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
    family_credit=round( min(family_c,taxbracket1)*tax_r1   +min(max(0,family_c-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,family_c-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,family_c-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,family_c-taxbracket4),(taxbracket5-taxbracket4))*tax_r5    +max(0,family_c-taxbracket5)*tax_r6 );
else
    family_c=(married_cr+child_cred);  
    family_credit=round( min(family_c,taxbracket1)*tax_r1   +min(max(0,family_c-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,family_c-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,family_c-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,family_c-taxbracket4),(taxbracket5-taxbracket4))*tax_r5    +max(0,family_c-taxbracket5)*tax_r6 );
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
cg_tax=max(0,finaltax_beforecr - family_credit - spouse_credit)-basic_cred_p -basic_cred_s;

%Surtax
if finaltax_inc <= surtax_lim1
    surtax=cg_tax*surtax_r1;
else if finaltax_inc > surtax_lim1 &&finaltax_inc <= surtax_lim2
      surtax=cg_tax*  (  surtax_r1+ surtax_rtph *(finaltax_inc-surtax_lim1)   )  ;
    else if finaltax_inc > surtax_lim2 
            surtax=cg_tax*surtax_r2;
        end
    end
end

finaltaxpaid=round(cg_tax+surtax);

%Local Tax
local_tax=round(local_r *max(0,cg_tax));



end
