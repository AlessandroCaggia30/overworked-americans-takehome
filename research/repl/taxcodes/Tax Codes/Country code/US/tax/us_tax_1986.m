function [federal_tax,localtax,statetax] = us_tax_1986(taxable_inc,wage_principal,wage_spouse,married,children,taxbracket_s1,taxbracket_s2,taxbracket_s3,taxbracket_s4,taxbracket_s5,taxbracket_s6,taxbracket_s7,taxbracket_s8,taxbracket_s9,taxbracket_s10,taxbracket_s11,taxbracket_s12,taxbracket_s13,taxbracket_s14,taxbracket_s15,taxbracket_hh1,taxbracket_hh2,taxbracket_hh3,taxbracket_hh4,taxbracket_hh5,taxbracket_hh6,taxbracket_hh7,taxbracket_hh8,taxbracket_hh9,taxbracket_hh10,taxbracket_hh11,taxbracket_hh12,taxbracket_hh13,taxbracket_hh14,taxbracket_m1,taxbracket_m2,taxbracket_m3,taxbracket_m4,taxbracket_m5,taxbracket_m6,taxbracket_m7,taxbracket_m8,taxbracket_m9,taxbracket_m10,taxbracket_m11,taxbracket_m12,taxbracket_m13,taxbracket_m14,tax_r1_s,tax_r2_s,tax_r3_s,tax_r4_s,tax_r5_s,tax_r6_s,tax_r7_s,tax_r8_s,tax_r9_s,tax_r10_s,tax_r11_s,tax_r12_s,tax_r13_s,tax_r14_s,tax_r15_s,tax_r16_s,tax_r1_hh,tax_r2_hh,tax_r3_hh,tax_r4_hh,tax_r5_hh,tax_r6_hh,tax_r7_hh,tax_r8_hh,tax_r9_hh,tax_r10_hh,tax_r11_hh,tax_r12_hh,tax_r13_hh,tax_r14_hh,tax_r15_hh,tax_r1_m,tax_r2_m,tax_r3_m,tax_r4_m,tax_r5_m,tax_r6_m,tax_r7_m,tax_r8_m,tax_r9_m,tax_r10_m,tax_r11_m,tax_r12_m,tax_r13_m,tax_r14_m,tax_r15_m,r0,r1,r2,inclim0,inclim1,inclim2,threshold_s0,threshold_s1,threshold_s2,threshold_m0,threshold_m1,threshold_m2,phaseout0,phaseout1,phaseout2,Detroit_ex,Detroit_rate,Mich_ex,Mich_ex_child,Mich_rate,Mich_cr_r1,Mich_cr_r2,Mich_cr_r3,Mich_cr_lim1,Mich_cr_lim2,Mich_cr_max)


%Inctax depending on the family situation
if married==0 && children==0
    inctax=round(min(taxable_inc,taxbracket_s1)*tax_r1_s   +min(max(0,taxable_inc-taxbracket_s1),(taxbracket_s2-taxbracket_s1)) *tax_r2_s      + min(max(0,taxable_inc-taxbracket_s2),(taxbracket_s3-taxbracket_s2))*tax_r3_s        + min(max(0,taxable_inc-taxbracket_s3),(taxbracket_s4-taxbracket_s3))*tax_r4_s   +min(max(0,taxable_inc-taxbracket_s4),(taxbracket_s5-taxbracket_s4))*tax_r5_s   +min(max(0,taxable_inc-taxbracket_s5),(taxbracket_s6-taxbracket_s5)) *tax_r6_s+min(max(0,taxable_inc-taxbracket_s6),(taxbracket_s7-taxbracket_s6)) *tax_r7_s+min(max(0,taxable_inc-taxbracket_s7),(taxbracket_s8-taxbracket_s7)) *tax_r8_s+min(max(0,taxable_inc-taxbracket_s8),(taxbracket_s9-taxbracket_s8)) *tax_r9_s+min(max(0,taxable_inc-taxbracket_s9),(taxbracket_s10-taxbracket_s9)) *tax_r10_s+min(max(0,taxable_inc-taxbracket_s10),(taxbracket_s11-taxbracket_s10)) *tax_r11_s+min(max(0,taxable_inc-taxbracket_s11),(taxbracket_s12-taxbracket_s11)) *tax_r12_s+min(max(0,taxable_inc-taxbracket_s12),(taxbracket_s13-taxbracket_s12)) *tax_r13_s+min(max(0,taxable_inc-taxbracket_s13),(taxbracket_s14-taxbracket_s13)) *tax_r14_s+min(max(0,taxable_inc-taxbracket_s14),(taxbracket_s15-taxbracket_s14)) *tax_r15_s+ max(0,taxable_inc-taxbracket_s15)*tax_r16_s );
else if married==0 && children>0
    inctax=round(min(taxable_inc,taxbracket_hh1)*tax_r1_hh   +min(max(0,taxable_inc-taxbracket_hh1),(taxbracket_hh2-taxbracket_hh1)) *tax_r2_hh      + min(max(0,taxable_inc-taxbracket_hh2),(taxbracket_hh3-taxbracket_hh2))*tax_r3_hh        + min(max(0,taxable_inc-taxbracket_hh3),(taxbracket_hh4-taxbracket_hh3))*tax_r4_hh   +min(max(0,taxable_inc-taxbracket_hh4),(taxbracket_hh5-taxbracket_hh4))*tax_r5_hh   +min(max(0,taxable_inc-taxbracket_hh5),(taxbracket_hh6-taxbracket_hh5)) *tax_r6_hh+min(max(0,taxable_inc-taxbracket_hh6),(taxbracket_hh7-taxbracket_hh6)) *tax_r7_hh+min(max(0,taxable_inc-taxbracket_hh7),(taxbracket_hh8-taxbracket_hh7)) *tax_r8_hh+min(max(0,taxable_inc-taxbracket_hh8),(taxbracket_hh9-taxbracket_hh8)) *tax_r9_hh+min(max(0,taxable_inc-taxbracket_hh9),(taxbracket_hh10-taxbracket_hh9)) *tax_r10_hh+min(max(0,taxable_inc-taxbracket_hh10),(taxbracket_hh11-taxbracket_hh10)) *tax_r11_hh+min(max(0,taxable_inc-taxbracket_hh11),(taxbracket_hh12-taxbracket_hh11)) *tax_r12_hh+min(max(0,taxable_inc-taxbracket_hh12),(taxbracket_hh13-taxbracket_hh12)) *tax_r13_hh+min(max(0,taxable_inc-taxbracket_hh13),(taxbracket_hh14-taxbracket_hh13)) *tax_r14_hh+max(0,taxable_inc-taxbracket_hh14)*tax_r15_hh );
    else if married==1
     inctax=round(min(taxable_inc,taxbracket_m1)*tax_r1_m   +min(max(0,taxable_inc-taxbracket_m1),(taxbracket_m2-taxbracket_m1)) *tax_r2_m      + min(max(0,taxable_inc-taxbracket_m2),(taxbracket_m3-taxbracket_m2))*tax_r3_m        + min(max(0,taxable_inc-taxbracket_m3),(taxbracket_m4-taxbracket_m3))*tax_r4_m   +min(max(0,taxable_inc-taxbracket_m4),(taxbracket_m5-taxbracket_m4))*tax_r5_m   +min(max(0,taxable_inc-taxbracket_m5),(taxbracket_m6-taxbracket_m5)) *tax_r6_m+min(max(0,taxable_inc-taxbracket_m6),(taxbracket_m7-taxbracket_m6)) *tax_r7_m+min(max(0,taxable_inc-taxbracket_m7),(taxbracket_m8-taxbracket_m7)) *tax_r8_m+min(max(0,taxable_inc-taxbracket_m8),(taxbracket_m9-taxbracket_m8)) *tax_r9_m+min(max(0,taxable_inc-taxbracket_m9),(taxbracket_m10-taxbracket_m9)) *tax_r10_m+min(max(0,taxable_inc-taxbracket_m10),(taxbracket_m11-taxbracket_m10)) *tax_r11_m+min(max(0,taxable_inc-taxbracket_m11),(taxbracket_m12-taxbracket_m11)) *tax_r12_m+min(max(0,taxable_inc-taxbracket_m12),(taxbracket_m13-taxbracket_m12)) *tax_r13_m+min(max(0,taxable_inc-taxbracket_m13),(taxbracket_m14-taxbracket_m13)) *tax_r14_m+max(0,taxable_inc-taxbracket_m14)*tax_r15_m );
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
        eic_cr=0;
    else if children==1
            eic_cr=max(0,r1*min(wage,inclim1)-phaseout1*max(0,wage-threshold_s1));
        elseif children>1
            eic_cr=round(max(0,r2*min(wage,inclim2)-phaseout2*max(0,wage-threshold_s2)));
        end
    end
end   
    
if married==1
    if children==0
        eic_cr=0;
    else if children==1
          eic_cr=max(0,r1*min(wage,inclim1)-phaseout1*max(0,wage-threshold_m1));  
        elseif children>1
           eic_cr=max(0,r2*min(wage,inclim2)-phaseout2*max(0,wage-threshold_m2)); 
        end
     end
end

%Have a look whether to put or not
% extra_cred=wage*r0;



federal_tax=round(inctax-eic_cr);

Detroit_tax=Detroit_rate*max(0,wage-Detroit_ex*(1+married+children));

if Detroit_tax<=Mich_cr_lim1
    mic_cred=Mich_cr_r1*Detroit_tax;
elseif Detroit_tax>Mich_cr_lim1 && Detroit_tax<=Mich_cr_lim2
    mic_cred=(Mich_cr_lim1*Mich_cr_r1) +Mich_cr_r2*(Detroit_tax-Mich_cr_lim1);
    elseif Detroit_tax >Mich_cr_lim2
       mic_cred=(Mich_cr_lim1*Mich_cr_r1 + Mich_cr_r2*(Mich_cr_lim2-Mich_cr_lim1)) + Mich_cr_r3*min(Detroit_tax-Mich_cr_lim2);
end

Michigan_tax=Mich_rate*max(0,wage- Mich_ex*(1+married+children) - Mich_ex_child*children)- min(mic_cred,Mich_cr_max);    

localtax=round(Detroit_tax+Michigan_tax);


Michigan_tax_only=Mich_rate*max(0,wage- Mich_ex*(1+married+children) - Mich_ex_child*children);    

statetax=round(Michigan_tax_only);
		
end




