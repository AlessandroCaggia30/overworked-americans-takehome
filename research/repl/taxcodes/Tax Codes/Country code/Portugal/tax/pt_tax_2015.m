% Tax calculation function for Portugal 2015

function [final_tax] = pt_tax_2015(taxable_income_all,wage_principal,wage_spouse,married,children,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,married_cred,single_cred,child_cred,singlepar_cred,surtax_r,surtax_r2,surtax_thrs,add_surtax_r,add_surtax_cred,mw,hc_ad,hc_ch,ben_lim1,ben_lim2,ben_lim3,ben_lim_sg1,ben_lim_sg2,ben_lim_sg3)
     
%splitting income method, taxable_income_all refers to taxable income of
%the whole household

hd_coef=(1+married)*hc_ad+(children*hc_ch);
taxable_inc=taxable_income_all/hd_coef; 


inc_tax_hd=min(taxable_inc,taxbracket1)*tax_r1 + min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1))*tax_r2  + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3    +min(max(0,taxable_inc-taxbracket3),(taxbracket4-taxbracket3))*tax_r4 +max(0,taxable_inc-taxbracket4)*tax_r5 ;
inc_tax_dev2=min(taxable_income_all/2,taxbracket1)*tax_r1 + min(max(0,taxable_income_all/2-taxbracket1),(taxbracket2-taxbracket1))*tax_r2  + min(max(0,taxable_income_all/2-taxbracket2),(taxbracket3-taxbracket2))*tax_r3    +min(max(0,taxable_income_all/2-taxbracket3),(taxbracket4-taxbracket3))*tax_r4 +max(0,taxable_income_all/2-taxbracket4)*tax_r5;
inc_tax_all=min(taxable_income_all,taxbracket1)*tax_r1 + min(max(0,taxable_income_all-taxbracket1),(taxbracket2-taxbracket1))*tax_r2  + min(max(0,taxable_income_all-taxbracket2),(taxbracket3-taxbracket2))*tax_r3    +min(max(0,taxable_income_all-taxbracket3),(taxbracket4-taxbracket3))*tax_r4 +max(0,taxable_income_all-taxbracket4)*tax_r5;


if married==1
    if (2*inc_tax_dev2)-(hd_coef*inc_tax_hd)<=(ben_lim1*(children==1))+(ben_lim2*(children==2))+(ben_lim3*(children>=3))
        inctax=hd_coef*inc_tax_hd;
    else
        inctax=2*inc_tax_dev2-((ben_lim1*(children==1))+(ben_lim2*(children==2))+(ben_lim3*(children>=3)));
    end
elseif children>0
    if inc_tax_all-(hd_coef*inc_tax_hd)<=(ben_lim_sg1*(children==1))+(ben_lim_sg2*(children==2))+(ben_lim_sg3*(children>=3))
        inctax=hd_coef*inc_tax_hd;
    else
        inctax=inc_tax_all-((ben_lim_sg1*(children==1))+(ben_lim_sg2*(children==2))+(ben_lim_sg3*(children>=3)));
    end
else
    inctax=inc_tax_all;
end


%Tax Credits
%Basic Credit
if married==1
    basic_cr=2*married_cred;
else if married==0 && children >0
    basic_cr=singlepar_cred;
    else
        basic_cr=single_cred;
    end
end


%Child Credit
child_cr=children*child_cred;

%Surtax
if married==1
    if taxable_income_all/2>surtax_thrs
        surtax=(surtax_r*(surtax_thrs-taxbracket4)+surtax_r2*((taxable_income_all/2)-surtax_thrs))*2;
    else
        surtax=surtax_r*max(0,((taxable_income_all/2)-taxbracket4)*2)+max(0,add_surtax_r*max(0,(taxable_income_all/2)-mw)*2-(add_surtax_cred*mw*children));
    end
else
    if taxable_income_all>surtax_thrs
        surtax=(surtax_r*(surtax_thrs-taxbracket4)+surtax_r2*(taxable_income_all-surtax_thrs));
    else
        surtax=surtax_r*max(0,(taxable_income_all-taxbracket4))+max(0,add_surtax_r*max(0,taxable_income_all-mw)-(add_surtax_cred*mw*children));
    end
end


if (wage_principal+wage_spouse-inctax)>dispy
    final_tax=max(0,round(inctax-basic_cr-child_cr))+round(surtax);
else
    final_tax=round(surtax);
end 



		
end