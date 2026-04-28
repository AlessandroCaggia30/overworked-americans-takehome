

% Parameter Assignment for year 2000.

function[basic_all,married_all,socseclimit1,socseclimit2,socsec_r1,socsec_r2,taxbracket1,taxbracket2,tax_r1,tax_r2,tax_r3,child_ben1,child_ben2,singlebenefit,ssc_r2,st] = uk_parameters_2000
% Standard  Allowances

basic_all=4385;
married_all=0;

%Social Security Parameters

socseclimit1=76;
socseclimit2=535;
socsec_r1=0;
socsec_r2=0.1;


%Employer Social Security Parameters

ssc_r2=0.122;
st=4368;
 
% %Tax Schedule Parameters
taxbracket1=1520;
taxbracket2=28400;
tax_r1=0.10;
tax_r2=0.22;
tax_r3=0.40;

 child_ben1=15;   
 child_ben2=10;
 singlebenefit=2.55;
 
end