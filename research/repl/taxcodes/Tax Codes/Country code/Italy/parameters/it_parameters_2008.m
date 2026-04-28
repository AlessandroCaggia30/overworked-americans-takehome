

% Parameter Assignment for year 2008 Italy

function[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,trans_sch_m_thresh1,trans_sch_m_thresh2,trans_sch_m_thresh3,trans_sch_m_thresh4,trans_sch_m_thresh5,trans_sch_m_thresh6,trans_sch_m_thresh7,trans_sch_m_thresh8,trans_sch_m_thresh9,trans_sch_m_thresh10,trans_sch_m_thresh11,sp_crd_lim,reg_rt,ssc_bracket1,ssc_bracket2,ssc_bracket3,ssc_r1,ssc_r2,ssc_r3,emp_ssc_bracket1,emp_ssc_bracket2,emp_ssc_r1,emp_ssc_r2,emp_cr_bracket1,emp_cr_bracket2,emp_cr_bracket3,emp_cr_bracket4,emp_cr_bracket5,emp_cr_bracket6,emp_cr_bracket7,emp_cr_bracket8,emp_cr_bracket9,emp_cr_bracket10,emp_cr1,emp_cr2,emp_cr3,emp_cr4,emp_cr5,emp_cr6,emp_cr7,emp_cr8,emp_cr9,emp_cr10,spouse_cr_bracket1,spouse_cr_bracket2,spouse_cr_bracket3,spouse_cr_bracket4,spouse_cr_bracket5,spouse_cr_bracket6,spouse_cr_bracket7,spouse_cr_bracket8,spouse_cr_bracket9,spouse_cr_bracket10,spouse_cr1,spouse_cr2,spouse_cr3,spouse_cr4,spouse_cr5,spouse_cr6,spouse_cr7,spouse_cr8,spouse_cr9,spouse_cr10,trans_sch_m_noch_thresh1,trans_sch_m_noch_thresh2,trans_sch_m_noch_thresh3,trans_sch_m_noch_thresh4,trans_sch_m_noch_thresh5,trans_sch_m1_noch,trans_sch_m2_noch,trans_sch_m3_noch,trans_sch_m4_noch,trans_sch_m5_noch,trans_sch_m_c1,trans_sch_m2_3_c1_red,trans_sch_m4_8_c1_red,trans_sch_m9_11_c1_red,trans_sch_m_c2,trans_sch_m2_4_c2_red,trans_sch_m5_8_c2_red,trans_sch_m9_11_c2_red] = it_parameters_2008

%%%%Tax Schedule Parameters
taxbracket1=15000.00;
taxbracket2=28000.00;
taxbracket3=55000.00;
taxbracket4=75000.00;
taxbracket5=1000000000;

tax_r1=0.23;
tax_r2=0.27;
tax_r3=0.38;
tax_r4=0.41;
tax_r5=0.43;


%%%%Tax credits

%Employment
emp_cr_bracket1=0;
emp_cr_bracket2=8000;
emp_cr_bracket3=15000;
emp_cr_bracket4=23000;
emp_cr_bracket5=24000;
emp_cr_bracket6=25000;
emp_cr_bracket7=26000;
emp_cr_bracket8=27700;
emp_cr_bracket9=28000;
emp_cr_bracket10=55000;

emp_cr1=1840;
emp_cr2=1338;
emp_cr3=1338;
emp_cr4=1348;
emp_cr5=1358;
emp_cr6=1368;
emp_cr7=1378;
emp_cr8=1363;
emp_cr9=1338;
emp_cr10=0;

%Spouse
spouse_cr_bracket1=0;
spouse_cr_bracket2=15000;
spouse_cr_bracket3=29000;
spouse_cr_bracket4=29200;
spouse_cr_bracket5=34700;
spouse_cr_bracket6=35000;
spouse_cr_bracket7=35100;
spouse_cr_bracket8=35200;
spouse_cr_bracket9=40000;
spouse_cr_bracket10=80000;

spouse_cr1=800;
spouse_cr2=690;
spouse_cr3=700;
spouse_cr4=710;
spouse_cr5=720;
spouse_cr6=710;
spouse_cr7=700;
spouse_cr8=690;
spouse_cr9=690;
spouse_cr10=0;

sp_crd_lim=2840.51;

%Child credit
child_cr=800;
add_child=200;

%%%%Regional tax
reg_rt=0.019;

%%%%Social Security Parameters

%Employee 
ssc_bracket1=40765;
ssc_bracket2=88669;
ssc_bracket3=1000000000;

ssc_r1=0.0949;
ssc_r2=0.1049;
ssc_r3=0;

%Employer
emp_ssc_bracket1=88669;
emp_ssc_bracket2=1000000000;

emp_ssc_r1=0.3208;
emp_ssc_r2=0;

%%%%  Allowances
%%%%Cash transfers (approximation)

%married couple without children
trans_sch_m_noch_thresh1=0;
trans_sch_m_noch_thresh2=12014.38;
trans_sch_m_noch_thresh3=15017.33;
trans_sch_m_noch_thresh4=18020.26;
trans_sch_m_noch_thresh5=21022.03;

trans_sch_m1_noch=46.48*12;
trans_sch_m2_noch=36.15*12;
trans_sch_m3_noch=25.82*12;
trans_sch_m4_noch=10.33*12;
trans_sch_m5_noch=0;

%married couple and single parents
trans_sch_m_thresh1=0;
trans_sch_m_thresh2=12712.5;
trans_sch_m_thresh3=21662.1;
trans_sch_m_thresh4=24408;
trans_sch_m_thresh5=29493;
trans_sch_m_thresh6=35289.9;
trans_sch_m_thresh7=36612;
trans_sch_m_thresh8=39663;
trans_sch_m_thresh9=40680;
trans_sch_m_thresh10=45765;
trans_sch_m_thresh11=1000000000;

trans_sch_m_c1=137.5*12;
trans_sch_m2_3_c1_red=0.093;
trans_sch_m4_8_c1_red=0.005;
trans_sch_m9_11_c1_red=0.023;

trans_sch_m_c2=258.33*12;
trans_sch_m2_4_c2_red=0.13;
trans_sch_m5_8_c2_red=0.009;
trans_sch_m9_11_c2_red=0.031;

end