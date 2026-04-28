% Tax calculation function for Portugal 2013

function [final_tax] = pt_tax_2013(taxable_income_all,wage_principal,wage_spouse,married,children,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,married_cred,single_cred,child_cred,singlepar_cred,surtax_r,surtax_r2,surtax_thrs,add_surtax_r,add_surtax_cred,mw)
     
%splitting income method, taxable_income_all refers to taxable income of
%the whole household

divisor=1+married;
taxable_inc=taxable_income_all/divisor; % taxable income per person
 
if taxable_inc>tax_floor
    inctax=(1+married)*(min(taxable_inc,taxbracket1)*tax_r1 + min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1))*tax_r2  + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3    +min(max(0,taxable_inc-taxbracket3),(taxbracket4-taxbracket3))*tax_r4 +max(0,taxable_inc-taxbracket4)*tax_r5 ) ;
else
    inctax=0;
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
if taxable_inc>surtax_thrs
    surtax=(surtax_r*(surtax_thrs-taxbracket4)+surtax_r2*(taxable_inc-surtax_thrs))*divisor;
else
    surtax=surtax_r*max(0,(taxable_inc-taxbracket4)*divisor)+max(0,add_surtax_r*max(0,taxable_inc-mw)*divisor-(add_surtax_cred*mw*children));
end


if (wage_principal+wage_spouse-inctax)>dispy
    final_tax=max(0,round(inctax-basic_cr-child_cr))+round(surtax);
else
    final_tax=round(surtax);
end 



		
end