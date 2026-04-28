

% Parameter Assignment for year 1989 Portugal.

function[ssc_r,perc,max_all,single_all,married_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,married_cred,single_cred,child_cred,child_ben,taxinc_var,ssc_emp_r] = pt_parameters_1989

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.245;

 %  Allowances
perc=0.65;
max_all=250000;
single_all=45000;
married_all=90000;
 
%  %Tax Schedule Parameters
taxbracket1=450000;
taxbracket2=850000;
taxbracket3=1250000;
taxbracket4=3000000;

tax_r1=0.16;
tax_r2=0.20;
tax_r3=0.275;
tax_r4=0.35;
tax_r5=0.40;
taxinc_var=0.85;

%Tax Credits
married_cred=15000;
single_cred=20000;
child_cred=10000;


% %Child benefit
child_ben=1375*12;

 
end