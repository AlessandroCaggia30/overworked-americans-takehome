function [federal_tax,localtax,statetax] = us_tax_2011(taxable_inc,wage_principal,wage_spouse,married,children,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,chcrd_max,chcrd_rdn,chcrd_thrsh_oth,chcrd_thrsh_m,chcrd_ref_perct,chcrd_ref_thresh,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max,r3,inclim3,threshold_s3,threshold_m3,phaseout3,unemp_max,unemp_dedn_rate,Mich_eic_r)

%Inctax depending on the family situation
if married==0 && children==0
    inctax=round(min(taxable_inc,taxbracket_s1)*tax_r1   +min(max(0,taxable_inc-taxbracket_s1),(taxbracket_s2-taxbracket_s1)) *tax_r2      + min(max(0,taxable_inc-taxbracket_s2),(taxbracket_s3-taxbracket_s2))*tax_r3         + min(max(0,taxable_inc-taxbracket_s3),(taxbracket_s4-taxbracket_s3))*tax_r4   +min(max(0,taxable_inc-taxbracket_s4),(taxbracket_s5-taxbracket_s4))*tax_r5   +max(0,taxable_inc-taxbracket_s5)*tax_r6 );
else if married==0 && children>0
       inctax=round(min(taxable_inc,taxbracket_hh1)*tax_r1   +min(max(0,taxable_inc-taxbracket_hh1),(taxbracket_hh2-taxbracket_hh1)) *tax_r2      + min(max(0,taxable_inc-taxbracket_hh2),(taxbracket_hh3-taxbracket_hh2))*tax_r3         + min(max(0,taxable_inc-taxbracket_hh3),(taxbracket_hh4-taxbracket_hh3))*tax_r4   +min(max(0,taxable_inc-taxbracket_hh4),(taxbracket_hh5-taxbracket_hh4))*tax_r5   +max(0,taxable_inc-taxbracket_hh5)*tax_r6 ); 
    else if married==1
         inctax=round(min(taxable_inc,taxbracket_m1)*tax_r1   +min(max(0,taxable_inc-taxbracket_m1),(taxbracket_m2-taxbracket_m1)) *tax_r2      + min(max(0,taxable_inc-taxbracket_m2),(taxbracket_m3-taxbracket_m2))*tax_r3         + min(max(0,taxable_inc-taxbracket_m3),(taxbracket_m4-taxbracket_m3))*tax_r4   +min(max(0,taxable_inc-taxbracket_m4),(taxbracket_m5-taxbracket_m4))*tax_r5   +max(0,taxable_inc-taxbracket_m5)*tax_r6 ); 
        end
    end
end
 
if taxable_inc<0
    inctax=0;
end

%Tax Credits
wage=wage_principal+wage_spouse;

%Earned Income Credit
if married==0
    if children==0
        eic_cr=round(max(0,r0*min(wage,inclim0)-phaseout0*max(0,wage-threshold_s0)));
    else if children==1
            eic_cr=max(0,r1*min(wage,inclim1)-phaseout1*max(0,wage-threshold_s1));
        else if children==2
                eic_cr=round(max(0,r2*min(wage,inclim2)-phaseout2*max(0,wage-threshold_s2)));
            elseif children>2
                    eic_cr=round(max(0,r3*min(wage,inclim3)-phaseout3*max(0,wage-threshold_s3)));
            end
        end
    end
end   
    
if married==1
    if children==0
        eic_cr=max(0,r0*min(wage,inclim0)-phaseout0*max(0,wage-threshold_m0));
    else if children==1
          eic_cr=max(0,r1*min(wage,inclim1)-phaseout1*max(0,wage-threshold_m1));  
         else if children==2
                eic_cr=round(max(0,r2*min(wage,inclim2)-phaseout2*max(0,wage-threshold_m2)));
            elseif children>2
                    eic_cr=round(max(0,r3*min(wage,inclim3)-phaseout3*max(0,wage-threshold_m3)));
             end
        end
     end
end


%Unemployment
unemp=unemp_dedn_rate*min(wage, unemp_max);

%Child Credit
if married==0
child_cred=children*max(0,chcrd_max-(chcrd_rdn/1000)*max(0,wage-chcrd_thrsh_oth));
else if married==1
      child_cred=children*max(0,chcrd_max-(chcrd_rdn/1000)*max(0,wage-chcrd_thrsh_m));
    end
end

% if child_cred>0
%     child_cred=min(child_cred,inctax);
% end

if child_cred<chcrd_max && child_cred>0
    child_ref= min((chcrd_max-child_cred ),max(chcrd_ref_perct*(wage-chcrd_ref_thresh),0));
else
    child_ref=0;
end


federal_tax=round(inctax-eic_cr-unemp-child_cred-child_ref);


Detroit_tax=Detroit_rate*max(0,wage-Detroit_ex*(1+married+children));

if Detroit_tax<Mich_cr_lim1
    mic_cred=Mich_cr_r1*Detroit_tax;
elseif Detroit_tax>Mich_cr_lim1 && Detroit_tax<Mich_cr_lim2
    mic_cred=(Mich_cr_lim1*Mich_cr_r1) +Mich_cr_r2*(Detroit_tax-Mich_cr_lim1);
    elseif Detroit_tax >Mich_cr_lim2
       mic_cred=(Mich_cr_lim1*Mich_cr_r1 + Mich_cr_r2*(Mich_cr_lim2-Mich_cr_lim1)) + Mich_cr_r3*min(Detroit_tax-Mich_cr_lim2);
end

Michigan_tax=Mich_rate*max(0,wage- Mich_ex*(1+married+children) - Mich_ex_child*children)- min(mic_cred,Mich_cr_max)-Mich_eic_r*eic_cr;    


localtax=round(Detroit_tax+Michigan_tax);

Michigan_tax_only=Mich_rate*max(0,wage- Mich_ex*(1+married+children) - Mich_ex_child*children)-Mich_eic_r*eic_cr ;    

statetax=round(Michigan_tax_only);

end




