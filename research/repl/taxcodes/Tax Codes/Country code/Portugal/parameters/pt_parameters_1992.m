

% Parameter Assignment for year 1992 Portugal.

function[ssc_r,perc,max_all,single_all,married_all,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,married_cred,single_cred,child_cred,child_ben,taxinc_var,ssc_emp_r] = pt_parameters_1992

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.245;

 %  Allowances
perc=0.65;
max_all=378000;
single_all=65000;
married_all=130000;
 
%  %Tax Schedule Parameters
taxbracket1=810000;
taxbracket2=1890000;
taxbracket3=4860000;


tax_r1=0.15;
tax_r2=0.25;
tax_r3=0.35;
tax_r4=0.4;

taxinc_var=0.90;

%Tax Credits
married_cred=20000;
single_cred=27500;
child_cred=15100;


% %Child benefit
child_ben=2200*12;

 
end