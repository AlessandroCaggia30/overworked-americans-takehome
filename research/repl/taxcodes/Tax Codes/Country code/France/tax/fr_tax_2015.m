function [f_inctax,cs_noded_principal,cs_noded_spouse] = fr_tax_2015(gross_taxable_income,csg_all_principal,csg_all_spouse,wage_principal,wage_spouse,married,children,ssc_ceil,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_min,noded_r,decote_sing,decote_mar,decote_pente,limit_demipart,limit_sp_demipart1,csg_crds_abat,cehr_rate1,cehr_rate2,cehr_ceil1,cehr_ceil2)

%Family Quotient (takes into account the +3 children)
share=1+married*1 + min(children ,2)*0.5 + max((children-2),0) *1;

if married==0 && children>0
    share=share+0.5;
end

taxable_inc=gross_taxable_income/share;
inctax=round(min(taxable_inc,taxbracket1)*tax_r1   +min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,taxable_inc-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,taxable_inc-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,taxable_inc-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +max(0,taxable_inc-taxbracket6)*tax_r7 );



sch_tax1=share*inctax;

if married==1
   sch_tax2=2*round(min(gross_taxable_income/2,taxbracket1)*tax_r1   +min(max(0,gross_taxable_income/2-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,gross_taxable_income/2-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,gross_taxable_income/2-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,gross_taxable_income/2-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,gross_taxable_income/2-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +max(0,gross_taxable_income/2-taxbracket6)*tax_r7 )-limit_demipart*(share-2);
else
    sch_tax2=round(min((gross_taxable_income),taxbracket1)*tax_r1   +min(max(0,(gross_taxable_income)-taxbracket1),(taxbracket2-taxbracket1)) *tax_r2      + min(max(0,(gross_taxable_income)-taxbracket2),(taxbracket3-taxbracket2))*tax_r3         + min(max(0,(gross_taxable_income)-taxbracket3),(taxbracket4-taxbracket3))*tax_r4   +min(max(0,(gross_taxable_income)-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,(gross_taxable_income)-taxbracket5),(taxbracket6-taxbracket5))*tax_r6   +max(0,(gross_taxable_income)-taxbracket6)*tax_r7);
    if children>0
    sch_tax2=sch_tax2-(limit_sp_demipart1+limit_demipart*(share-2)); 
    end 
end
     
sch_tax=max(sch_tax1, sch_tax2)+cehr_rate1*min((cehr_ceil2-cehr_ceil1)*(1+married),max(gross_taxable_income-cehr_ceil1*(1+married),0))+cehr_rate2*max(gross_taxable_income-cehr_ceil2*(1+married),0);

if taxable_inc<0
    sch_tax=0;
end

%decote adjustment
if married==1
    adj_tax=max(0,min((1+decote_pente)*sch_tax-decote_pente*decote_mar,sch_tax));
else
    adj_tax=max(0,min((1+decote_pente)*sch_tax-decote_pente*decote_sing,sch_tax));
end

if adj_tax>=tax_min
    inc_tax=adj_tax;
else
    inc_tax=0;
end


cs_noded_principal=noded_r*((1-csg_crds_abat)*min(wage_principal, 4*ssc_ceil)+max(0,wage_principal-4*ssc_ceil));
cs_noded_spouse=noded_r*((1-csg_crds_abat)*min(wage_spouse, 4*ssc_ceil)+max(0,wage_spouse-4*ssc_ceil));
     
    
f_inctax=round(inc_tax+cs_noded_principal+cs_noded_spouse+csg_all_principal+csg_all_spouse); %-credit


end