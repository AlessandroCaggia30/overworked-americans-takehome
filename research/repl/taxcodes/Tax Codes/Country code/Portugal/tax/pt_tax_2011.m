% Tax calculation function for Portugal 2011

function [final_tax] = pt_tax_2011(taxable_income_all,wage_principal,wage_spouse,married,children,tax_floor,dispy,taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,taxbracket6,taxbracket7,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,tax_r8,married_cred,single_cred,child_cred,singlepar_cred,surtax_r,surtax_cred,mw)
%splitting income method, taxable_income_all refers to taxable income of
%the whole household

divisor=1+married;
taxable_inc=taxable_income_all/divisor; % taxable income per person
 
if taxable_inc>tax_floor
    inctax=(1+married)*(min(taxable_inc,taxbracket1)*tax_r1 + min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1))*tax_r2  + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3    +min(max(0,taxable_inc-taxbracket3),(taxbracket4-taxbracket3))*tax_r4 +min(max(0,taxable_inc-taxbracket4),(taxbracket5-taxbracket4))*tax_r5  +min(max(0,taxable_inc-taxbracket5),(taxbracket6-taxbracket5))*tax_r6    +min(max(0,taxable_inc-taxbracket6),(taxbracket7-taxbracket6))*tax_r7+max(0,taxable_inc-taxbracket7)*tax_r8 ) ;
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
surtax=surtax_r*(taxable_income_all-mw);
surtax_cr=surtax_cred*(mw/14)*children;

if (wage_principal+wage_spouse-inctax)>dispy
    final_tax=max(0,round(inctax-basic_cr-child_cr))+max(0,round(surtax-surtax_cr));
else
    final_tax=max(0,round(surtax-surtax_cr));
end 



		
end