

% Parameter Assignment for year 2006 Italy

function[taxbracket1,taxbracket2,taxbracket3,taxbracket4,tax_r1,tax_r2,tax_r3,tax_r4,trans_sch_m_thresh1,trans_sch_m_thresh2,trans_sch_m_thresh3,trans_sch_m_thresh4,trans_sch_m_thresh5,trans_sch_m_thresh6,trans_sch_m_thresh7,trans_sch_m_thresh8,trans_sch_m_thresh9,trans_sch_m_thresh10,trans_sch_m_thresh11,trans_sch_m_thresh12,trans_sch_m_thresh13,trans_sch_m_thresh14,trans_sch_m_thresh15,trans_sch_m_thresh16,trans_sch_m1_c1,trans_sch_m2_c1,trans_sch_m3_c1,trans_sch_m4_c1,trans_sch_m5_c1,trans_sch_m6_c1,trans_sch_m7_c1,trans_sch_m8_c1,trans_sch_m9_c1,trans_sch_m10_c1,trans_sch_m11_c1,trans_sch_m12_c1,trans_sch_m13_c1,trans_sch_m14_c1,trans_sch_m15_c1,trans_sch_m1_c2,trans_sch_m2_c2,trans_sch_m3_c2,trans_sch_m4_c2,trans_sch_m5_c2,trans_sch_m6_c2,trans_sch_m7_c2,trans_sch_m8_c2,trans_sch_m9_c2,trans_sch_m10_c2,trans_sch_m11_c2,trans_sch_m12_c2,trans_sch_m13_c2,trans_sch_m14_c2,trans_sch_m15_c2,trans_sch_s_thresh1,trans_sch_s_thresh2,trans_sch_s_thresh3,trans_sch_s_thresh4,trans_sch_s_thresh5,trans_sch_s_thresh6,trans_sch_s_thresh7,trans_sch_s_thresh8,trans_sch_s_thresh9,trans_sch_s_thresh10,trans_sch_s_thresh11,trans_sch_s_thresh12,trans_sch_s_thresh13,trans_sch_s_thresh14,trans_sch_s_thresh15,trans_sch_s_thresh16,trans_sch_s1_c1,trans_sch_s2_c1,trans_sch_s3_c1,trans_sch_s4_c1,trans_sch_s5_c1,trans_sch_s6_c1,trans_sch_s7_c1,trans_sch_s8_c1,trans_sch_s9_c1,trans_sch_s10_c1,trans_sch_s11_c1,trans_sch_s12_c1,trans_sch_s13_c1,trans_sch_s14_c1,trans_sch_s15_c1,trans_sch_s1_c2,trans_sch_s2_c2,trans_sch_s3_c2,trans_sch_s4_c2,trans_sch_s5_c2,trans_sch_s6_c2,trans_sch_s7_c2,trans_sch_s8_c2,trans_sch_s9_c2,trans_sch_s10_c2,trans_sch_s11_c2,trans_sch_s12_c2,trans_sch_s13_c2,trans_sch_s14_c2,trans_sch_s15_c2,trans_sch_s1_c3,trans_sch_s2_c3,trans_sch_s3_c3,trans_sch_s4_c3,trans_sch_s5_c3,trans_sch_s6_c3,trans_sch_s7_c3,trans_sch_s8_c3,trans_sch_s9_c3,trans_sch_s10_c3,trans_sch_s11_c3,trans_sch_s12_c3,trans_sch_s13_c3,trans_sch_s14_c3,trans_sch_s15_c3,sp_crd_lim,s_all,reg_rt,ssc_bracket1,ssc_bracket2,ssc_bracket3,ssc_r1,ssc_r2,ssc_r3,emp_ssc_bracket1,emp_ssc_bracket2,emp_ssc_r1,emp_ssc_r2,b_all,c_all_s1,c_all_s2,c_all_m] = it_parameters_2006

%%%%Tax Schedule Parameters
taxbracket1=26000;
taxbracket2=33500;
taxbracket3=100000;
taxbracket4=1000000000;

tax_r1=0.23;
tax_r2=0.33;
tax_r3=0.39;
tax_r4=0.43;

%%%%Cash transfers

%married couple
trans_sch_m_thresh1=0;
trans_sch_m_thresh2=12437.25;
trans_sch_m_thresh3=15389.99;
trans_sch_m_thresh4=18342.15;
trans_sch_m_thresh5=21293.16;
trans_sch_m_thresh6=24246.48;
trans_sch_m_thresh7=27198.63;
trans_sch_m_thresh8=30151.94;
trans_sch_m_thresh9=33102.97;
trans_sch_m_thresh10=36055.14;
trans_sch_m_thresh11=39006.72;
trans_sch_m_thresh12=41960.62;
trans_sch_m_thresh13=44912.76;
trans_sch_m_thresh14=47865.52;
trans_sch_m_thresh15=50817.67;
trans_sch_m_thresh16=53771.00;
trans_sch_m_thresh17=56724.32;
trans_sch_m_thresh18=1000000000;

trans_sch_m1_c1=130.66;
trans_sch_m2_c1=114.65;
trans_sch_m3_c1=92.45;
trans_sch_m4_c1=65.59;
trans_sch_m5_c1=43.90;
trans_sch_m6_c1=25.82;
trans_sch_m7_c1=15.49;
trans_sch_m8_c1=15.49;
trans_sch_m9_c1=12.91;
trans_sch_m10_c1=12.91;
trans_sch_m11_c1=12.91;
trans_sch_m12_c1=0;
trans_sch_m13_c1=0;
trans_sch_m14_c1=0;
trans_sch_m15_c1=0;
trans_sch_m16_c1=0;
trans_sch_m17_c1=0;
trans_sch_m18_c1=0;

trans_sch_m1_c2=250.48;
trans_sch_m2_c2=220.53;
trans_sch_m3_c2=190.57;
trans_sch_m4_c2=158.04;
trans_sch_m5_c2=111.55;
trans_sch_m6_c2=81.60;
trans_sch_m7_c2=57.33;
trans_sch_m8_c2=38.73;
trans_sch_m9_c2=25.82;
trans_sch_m10_c2=25.82;
trans_sch_m11_c2=23.24;
trans_sch_m12_c2=23.24;
trans_sch_m13_c2=23.24;
trans_sch_m14_c2=0;
trans_sch_m15_c2=0;
trans_sch_m16_c2=0;
trans_sch_m17_c2=0;
trans_sch_m18_c2=0;

%single parent
trans_sch_s_thresh1=0;
trans_sch_s_thresh2=14405.35;
trans_sch_s_thresh3=17358.11;
trans_sch_s_thresh4=20309.10;
trans_sch_s_thresh5=23261.85;
trans_sch_s_thresh6=26215.18;
trans_sch_s_thresh7=29167.34;
trans_sch_s_thresh8=32119.48;
trans_sch_s_thresh9=35071.66;
trans_sch_s_thresh10=38023.24;
trans_sch_s_thresh11=40977.14;
trans_sch_s_thresh12=43929.87;
trans_sch_s_thresh13=46880.88;
trans_sch_s_thresh14=49834.21;
trans_sch_s_thresh15=52786.94;
trans_sch_s_thresh16=55740.25;
trans_sch_s_thresh17=58692.41;
trans_sch_s_thresh18=1000000000;

trans_sch_s1_c1=99.68;
trans_sch_s2_c1=79.53;
trans_sch_s3_c1=54.23;
trans_sch_s4_c1=23.24;
trans_sch_s5_c1=20.66;
trans_sch_s6_c1=20.66;
trans_sch_s7_c1=0;
trans_sch_s8_c1=0;
trans_sch_s9_c1=0;
trans_sch_s10_c1=0;
trans_sch_s11_c1=0;
trans_sch_s12_c1=0;
trans_sch_s13_c1=0;
trans_sch_s14_c1=0;
trans_sch_s15_c1=0;
trans_sch_s16_c1=0;
trans_sch_s17_c1=0;
trans_sch_s18_c1=0;

trans_sch_s1_c2=184.89;
trans_sch_s2_c2=164.75;
trans_sch_s3_c2=136.34;
trans_sch_s4_c2=102.26;
trans_sch_s5_c2=73.85;
trans_sch_s6_c2=48.55;
trans_sch_s7_c2=34.09;
trans_sch_s8_c2=34.09;
trans_sch_s9_c2=28.41;
trans_sch_s10_c2=28.41;
trans_sch_s11_c2=28.41;
trans_sch_s12_c2=0;
trans_sch_s13_c2=0;
trans_sch_s14_c2=0;
trans_sch_s15_c2=0;
trans_sch_s16_c2=0;
trans_sch_s17_c2=0;
trans_sch_s18_c2=0;

trans_sch_s1_c3=412.13;
trans_sch_s2_c3=372.37;
trans_sch_s3_c3=332.60;
trans_sch_s4_c3=289.73;
trans_sch_s5_c3=230.34;
trans_sch_s6_c3=190.57;
trans_sch_s7_c3=159.07;
trans_sch_s8_c3=136.34;
trans_sch_s9_c3=119.30;
trans_sch_s10_c3=119.30;
trans_sch_s11_c3=102.26;
trans_sch_s12_c3=102.26;
trans_sch_s13_c3=102.26;
trans_sch_s14_c3=0;
trans_sch_s15_c3=0;
trans_sch_s16_c3=0;
trans_sch_s17_c3=0;
trans_sch_s18_c3=0;

%%%%Regional tax
reg_rt=0.011;

%%%%Social Security Parameters

%Employee 
ssc_bracket1=39297;
ssc_bracket2=85478;
ssc_bracket3=1000000000;

ssc_r1=0.0919;
ssc_r2=0.1019;
ssc_r3=0;

%Employer
emp_ssc_bracket1=85478;
emp_ssc_bracket2=1000000000;

emp_ssc_r1=0.3208;
emp_ssc_r2=0;

%%%%  Allowances
b_all=7500;
sp_crd_lim=2840.51;
s_all=3200;
c_all_s1=3200; %first child allowance for single
c_all_s2=2900;  %for second, third... child
c_all_m=2900; %for first, second, third child for married


end