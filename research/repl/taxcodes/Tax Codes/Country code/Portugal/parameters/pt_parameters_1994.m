

% Parameter Assignment for year 1994 Portugal.

function[ssc_r,perc,max_all,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,married_cred,single_cred,child_cred,child_ben,taxinc_var,ssc_emp_r] = pt_parameters_1994

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.245;

 %  Allowances
perc=0.65;
max_all=416000;
 
%  %Tax Schedule Parameters
taxbracket1=930000;
taxbracket2=2170000;
taxbracket3=5570000;


tax_r1=0.15;
tax_r2=0.25;
tax_r3=0.35;
tax_r4=0.4;

taxinc_var=0.95;

%Tax Credits
married_cred=22800;
single_cred=30100;
child_cred=16500;


% %Child benefit
child_ben=2450*12;

 
end