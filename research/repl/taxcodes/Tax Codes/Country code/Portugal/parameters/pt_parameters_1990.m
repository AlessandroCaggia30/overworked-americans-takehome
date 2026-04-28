

% Parameter Assignment for year 1990 Portugal.

function[ssc_r,perc,max_all,single_all,married_all,taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,married_cred,single_cred,child_cred,child_ben,taxinc_var,ssc_emp_r] = pt_parameters_1990

%Social Security Parameters
ssc_r=0.11;
ssc_emp_r=0.245;

 %  Allowances
perc=0.65;
max_all=300000;
single_all=52500;
married_all=105000;
 
%  %Tax Schedule Parameters
taxbracket1=540000;
taxbracket2=1020000;
taxbracket3=1500000;
taxbracket4=3600000;

tax_r1=0.16;
tax_r2=0.20;
tax_r3=0.275;
tax_r4=0.35;
tax_r5=0.40;
taxinc_var=0.85;

%Tax Credits
married_cred=17000;
single_cred=23000;
child_cred=12000;


% %Child benefit
child_ben=1550*12;

 
end