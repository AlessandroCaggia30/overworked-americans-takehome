% Tax calculation function for Portugal 1998

function [final_tax] = pt_tax_1998(taxable_income_all,married,children,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,married_cred,single_cred,child_cred)
%splitting income method, taxable_income_all refers to taxable income of
%the whole household

divisor=1+married;
taxable_inc=taxable_income_all/divisor; % taxable income per person
 
inctax=(1+married)*(min(taxable_inc,taxbracket1)*tax_r1 + min(max(0,taxable_inc-taxbracket1),(taxbracket2-taxbracket1))*tax_r2  + min(max(0,taxable_inc-taxbracket2),(taxbracket3-taxbracket2))*tax_r3 + max(0,taxable_inc-taxbracket3)*tax_r4 ) ;

%Tax Credits
%Basic Credit
if married==1
    basic_cr=2*married_cred;
else
    basic_cr=single_cred;
end

%Child Credit
child_cr=children*child_cred;

final_tax=max(0,round(inctax-basic_cr-child_cr) );

		
end