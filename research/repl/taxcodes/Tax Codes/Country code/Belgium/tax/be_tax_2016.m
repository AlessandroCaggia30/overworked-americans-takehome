%  Income Tax Calculation in Belgium for year 2016

function[finaltaxpaid,local_tax,region_tax,family_credit,spouse_credit]=be_tax_2016(wage_principal ,wage_spouse,married,children,ssc_p ,ssc_s ,red_p,red_s,workall_p , workall_s,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,quote_r,quote_max,child_cr1,child_cr2,child_cr3,child_cr4,child_cr5,s_parent_cr,single_cr,married_cr,supp_cr,supp_cr_thrsh,local_r,basicr_b,basicr_1,basicr_2,basicr_3,basicr_4, lic_r, lic_max,add_local_r,reg_r, red_r,ex_lim1,ex_lim2,ex_lim3,ex_lim4,ex_r1,ex_r2,ex_r3,ex_r4,ex_r5)



%Initial Taxable Income
tax_inc_p=(wage_principal-workall_p-ssc_p);
tax_inc_s=(wage_spouse-workall_s-ssc_s);

%%%%%Basic Credit%%%%%After 2012%%%%%%%%%%%%%%

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


%Include low income credit
basic_cred_p=basic_cred_p+min(lic_r*red_p,lic_max);
basic_cred_s=basic_cred_s+min(lic_r*red_s,lic_max);


    
%Tax on Principal and Spouse Income
tax_p=round( min(tax_inc_p,taxbracket1)*tax_r1   +min(max(0,tax_inc_p-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_p-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_p-taxbracket3),(taxbracket4-taxbracket3))*tax_r4       +max(0,tax_inc_p-taxbracket4)*tax_r5 );
tax_s=round( min(tax_inc_s,taxbracket1)*tax_r1   +min(max(0,tax_inc_s-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_s-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_s-taxbracket3),(taxbracket4-taxbracket3))*tax_r4       +max(0,tax_inc_s-taxbracket4)*tax_r5 );

%Tax in quote part and joint income
tax_inc_q=min((tax_inc_p+tax_inc_s)*quote_r , quote_max); % corresponds to spouse income after transfer
tax_q=round( min(tax_inc_q,taxbracket1)*tax_r1   +min(max(0,tax_inc_q-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_q-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_q-taxbracket3),(taxbracket4-taxbracket3))*tax_r4        +max(0,tax_inc_q-taxbracket4)*tax_r5 );

tax_inc_j= tax_inc_p+tax_inc_s-tax_inc_q; % corresponds to principal income after transfer
tax_j=round( min(tax_inc_j,taxbracket1)*tax_r1   +min(max(0,tax_inc_j-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,tax_inc_j-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,tax_inc_j-taxbracket3),(taxbracket4-taxbracket3))*tax_r4        +max(0,tax_inc_j-taxbracket4)*tax_r5 );

%Calculating Final Taxableincome
if (tax_p+tax_s)>(tax_q+tax_j) && married==1
    %finaltax_inc=tax_inc_q +tax_inc_j;
    finaltax_beforecr=tax_q+tax_j;% (5 - Tax before credits)
else
    %finaltax_inc=tax_inc_p+tax_inc_s;
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
%
if married==0 
    family_c=(single_cr+singlep_cred+child_cred);
    else
    family_c=(married_cr+child_cred);    
end

%supp_cr
if (tax_p+tax_s)>(tax_q+tax_j) && married==1
    if tax_inc_j<=supp_cr_thrsh && tax_inc_j>0
       family_c=family_c+supp_cr;
    else if tax_inc_j>supp_cr_thrsh
        family_c=family_c+max(0,supp_cr+supp_cr_thrsh-tax_inc_j);
        end
    end
else
     if tax_inc_p<=supp_cr_thrsh && tax_inc_p>0
        family_c=family_c+supp_cr;
     else if tax_inc_p>supp_cr_thrsh
        family_c=family_c+max(0,supp_cr+supp_cr_thrsh-tax_inc_p);
         end
     end
end


%Spouse Credit
if married==0 
    spouse_c=(single_cr);
    else
    spouse_c=(married_cr);    
end

%supp_cr
if (tax_p+tax_s)>(tax_q+tax_j) && married==1
     if tax_inc_q<=supp_cr_thrsh && tax_inc_q>0
        spouse_c=spouse_c+supp_cr;
        else if tax_inc_q>supp_cr_thrsh
        spouse_c=spouse_c+max(0,supp_cr+supp_cr_thrsh-tax_inc_q);
            end
     end
else
     if tax_inc_s<=supp_cr_thrsh && tax_inc_s>0
        spouse_c=spouse_c+supp_cr;
        else if tax_inc_s>supp_cr_thrsh
        spouse_c=spouse_c+max(0,supp_cr+supp_cr_thrsh-tax_inc_s);
            end
    end
end



%Transferable amount
trans=0;
if married==1
     if (tax_p+tax_s)<(tax_q+tax_j)
        if (family_c<tax_inc_p) && (spouse_c>tax_inc_s)
            trans=min(spouse_c-tax_inc_s,tax_inc_p-family_c);
        else if (family_c>tax_inc_p) && (spouse_c<tax_inc_s)
            trans=-1*(min(tax_inc_s-spouse_c,family_c-tax_inc_p));
            end
        end
     end
     if (tax_p+tax_s)>=(tax_q+tax_j)
        if (family_c<tax_inc_j) && (spouse_c>tax_inc_q)
            trans=min(spouse_c-tax_inc_q,tax_inc_j-family_c);
        else if (family_c>tax_inc_j) && (spouse_c<tax_inc_q)
            trans=-1*(min(tax_inc_q-spouse_c,family_c-tax_inc_j)); 

            end
        end
     end
end

family_c=family_c+trans;
spouse_c=spouse_c-trans;


family_credit=round( min(family_c,ex_lim1)*ex_r1   +min(max(0,family_c-ex_lim1),(ex_lim2-ex_lim1)) *ex_r2      + min(max(0,family_c-ex_lim2),(ex_lim3-ex_lim2))*ex_r3         + min(max(0,family_c-ex_lim3),(ex_lim4-ex_lim3))*ex_r4       +max(0,family_c-ex_lim4)*ex_r5 );
spouse_credit=round( min(spouse_c,ex_lim1)*ex_r1   +min(max(0,spouse_c-ex_lim1),(ex_lim2-ex_lim1)) *ex_r2  + min(max(0,spouse_c-ex_lim2),(ex_lim3-ex_lim2))*ex_r3     + min(max(0,spouse_c-ex_lim3),(ex_lim4-ex_lim3))*ex_r4       +max(0,spouse_c-ex_lim4)*ex_r5);

if (tax_p+tax_s)>(tax_q+tax_j) && married==1
        spouse_credit=min(tax_q , spouse_credit);
    else 
        spouse_credit=min(tax_s , spouse_credit);
end


%Tax  After Credit
finaltaxpaid=round((1-red_r)*max(0,finaltax_beforecr - family_credit- spouse_credit )-basic_cred_p -basic_cred_s);

%finaltaxpaid_init=max(0,(finaltax_beforecr - family_credit - spouse_credit));

%Regional Tax
region_tax=round((max(0,(finaltax_beforecr - family_credit - spouse_credit)))*(1-red_r)*reg_r);
%region_tax=round(region_tax_init*reg_r);

%Local Tax
local_tax_init=round((local_r+add_local_r)*((max(0,(finaltax_beforecr - family_credit - spouse_credit)))*(1-red_r)+region_tax));
local_tax=local_tax_init+region_tax;

end
