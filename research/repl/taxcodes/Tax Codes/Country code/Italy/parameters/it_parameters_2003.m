
% Parameter Assignment for year 2003 Italy

function[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5, tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,trans_sch_m_thresh1,trans_sch_m_thresh2,trans_sch_m_thresh3,trans_sch_m_thresh4,trans_sch_m_thresh5,trans_sch_m_thresh6,trans_sch_m_thresh7,trans_sch_m_thresh8,trans_sch_m_thresh9,trans_sch_m_thresh10,trans_sch_m_thresh11,trans_sch_m_thresh12,trans_sch_m_thresh13,trans_sch_m_thresh14,trans_sch_m_thresh15,trans_sch_m_thresh16,trans_sch_m1_c1,trans_sch_m2_c1,trans_sch_m3_c1,trans_sch_m4_c1,trans_sch_m5_c1,trans_sch_m6_c1,trans_sch_m7_c1,trans_sch_m8_c1,trans_sch_m9_c1,trans_sch_m10_c1,trans_sch_m11_c1,trans_sch_m12_c1,trans_sch_m13_c1,trans_sch_m14_c1,trans_sch_m15_c1,trans_sch_m1_c2,trans_sch_m2_c2,trans_sch_m3_c2,trans_sch_m4_c2,trans_sch_m5_c2,trans_sch_m6_c2,trans_sch_m7_c2,trans_sch_m8_c2,trans_sch_m9_c2,trans_sch_m10_c2,trans_sch_m11_c2,trans_sch_m12_c2,trans_sch_m13_c2,trans_sch_m14_c2,trans_sch_m15_c2,trans_sch_s_thresh1,trans_sch_s_thresh2,trans_sch_s_thresh3,trans_sch_s_thresh4,trans_sch_s_thresh5,trans_sch_s_thresh6,trans_sch_s_thresh7,trans_sch_s_thresh8,trans_sch_s_thresh9,trans_sch_s_thresh10,trans_sch_s_thresh11,trans_sch_s_thresh12,trans_sch_s_thresh13,trans_sch_s_thresh14,trans_sch_s_thresh15,trans_sch_s_thresh16,trans_sch_s1_c1,trans_sch_s2_c1,trans_sch_s3_c1,trans_sch_s4_c1,trans_sch_s5_c1,trans_sch_s6_c1,trans_sch_s7_c1,trans_sch_s8_c1,trans_sch_s9_c1,trans_sch_s10_c1,trans_sch_s11_c1,trans_sch_s12_c1,trans_sch_s13_c1,trans_sch_s14_c1,trans_sch_s15_c1,trans_sch_s1_c2,trans_sch_s2_c2,trans_sch_s3_c2,trans_sch_s4_c2,trans_sch_s5_c2,trans_sch_s6_c2,trans_sch_s7_c2,trans_sch_s8_c2,trans_sch_s9_c2,trans_sch_s10_c2,trans_sch_s11_c2,trans_sch_s12_c2,trans_sch_s13_c2,trans_sch_s14_c2,trans_sch_s15_c2,trans_sch_s1_c3,trans_sch_s2_c3,trans_sch_s3_c3,trans_sch_s4_c3,trans_sch_s5_c3,trans_sch_s6_c3,trans_sch_s7_c3,trans_sch_s8_c3,trans_sch_s9_c3,trans_sch_s10_c3,trans_sch_s11_c3,trans_sch_s12_c3,trans_sch_s13_c3,trans_sch_s14_c3,trans_sch_s15_c3,reg_rt,ssc_bracket1,ssc_bracket2,ssc_bracket3,ssc_r1,ssc_r2,ssc_r3,emp_ssc_bracket1,emp_ssc_bracket2,emp_ssc_r1,emp_ssc_r2,b_all,emp_flat,emp_add_thresh1,emp_add_thresh2,emp_add_thresh3,emp_add_thresh4,emp_add_thresh5,emp_add_thresh6,emp_add_1,emp_add_2,emp_add_3,emp_add_4,emp_add_5,emp_add_6,sp_cred_thresh1,sp_cred_thresh2,sp_cred_thresh3,sp_cred_thresh4,sp_cred_thresh5,sp_cred_1,sp_cred_2,sp_cred_3,sp_cred_4,sp_cred_5,sp_crd_lim,child_cred_m_thresh1,child_cred_m_thresh2,child_cred_m_thresh3,child_cred_m_thresh4,child_cred_m_thresh5,child_cred_m_ch1_1,child_cred_m_ch1_2,child_cred_m_ch1_3,child_cred_m_ch1_4,child_cred_m_ch1_5,child_cred_m_ch2_1,child_cred_m_ch2_2,child_cred_m_ch2_3,child_cred_m_ch2_4,child_cred_m_ch2_5,child_cred_m_ch3_1,child_cred_m_ch3_2,child_cred_m_ch3_3,child_cred_m_ch3_4,child_cred_m_ch3_5,child_cred_m_ch4_1,child_cred_m_ch4_2,child_cred_m_ch4_3,child_cred_m_ch4_4,child_cred_m_ch4_5,child_cred_sp_thresh1,child_cred_sp_thresh2,child_cred_sp_thresh3,child_cred_sp_thresh4,child_cred_sp_thresh5,child_cred_sp_thresh6,child_cred_sp_thresh7,child_cred_sp_ch1_1,child_cred_sp_ch1_2,child_cred_sp_ch1_3,child_cred_sp_ch1_4,child_cred_sp_ch1_5,child_cred_sp_ch1_6,child_cred_sp_ch1_7,child_cred_sp_ch2_1,child_cred_sp_ch2_2,child_cred_sp_ch2_3,child_cred_sp_ch2_4,child_cred_sp_ch2_5,child_cred_sp_ch2_6,child_cred_sp_ch2_7,child_cred_sp_ch3_1,child_cred_sp_ch3_2,child_cred_sp_ch3_3,child_cred_sp_ch3_4,child_cred_sp_ch3_5,child_cred_sp_ch3_6,child_cred_sp_ch3_7,child_cred_sp_ch4_1,child_cred_sp_ch4_2,child_cred_sp_ch4_3,child_cred_sp_ch4_4,child_cred_sp_ch4_5,child_cred_sp_ch4_6,child_cred_sp_ch4_7,trans_t2_sch_m_thresh1,trans_t2_sch_m_thresh2,trans_t2_sch_m_thresh3,trans_t2_sch_m_thresh4,trans_t2_sch_m_thresh5,trans_t2_sch_m_thresh6,trans_t2_sch_m_thresh7,trans_t2_sch_m_thresh8,trans_t2_sch_m_thresh9,trans_t2_sch_m_thresh10,trans_t2_sch_m_thresh11,trans_t2_sch_m_thresh12,trans_t2_sch_m_thresh13,trans_t2_sch_m_thresh14,trans_t2_sch_m_thresh15,trans_t2_sch_m_thresh16,trans_t2_sch_m1_c1,trans_t2_sch_m2_c1,trans_t2_sch_m3_c1,trans_t2_sch_m4_c1,trans_t2_sch_m5_c1,trans_t2_sch_m6_c1,trans_t2_sch_m7_c1,trans_t2_sch_m8_c1,trans_t2_sch_m9_c1,trans_t2_sch_m10_c1,trans_t2_sch_m11_c1,trans_t2_sch_m12_c1,trans_t2_sch_m13_c1,trans_t2_sch_m14_c1,trans_t2_sch_m15_c1,trans_t2_sch_m1_c2,trans_t2_sch_m2_c2,trans_t2_sch_m3_c2,trans_t2_sch_m4_c2,trans_t2_sch_m5_c2,trans_t2_sch_m6_c2,trans_t2_sch_m7_c2,trans_t2_sch_m8_c2,trans_t2_sch_m9_c2,trans_t2_sch_m10_c2,trans_t2_sch_m11_c2,trans_t2_sch_m12_c2,trans_t2_sch_m13_c2,trans_t2_sch_m14_c2,trans_t2_sch_m15_c2,trans_t2_sch_s_thresh1,trans_t2_sch_s_thresh2,trans_t2_sch_s_thresh3,trans_t2_sch_s_thresh4,trans_t2_sch_s_thresh5,trans_t2_sch_s_thresh6,trans_t2_sch_s_thresh7,trans_t2_sch_s_thresh8,trans_t2_sch_s_thresh9,trans_t2_sch_s_thresh10,trans_t2_sch_s_thresh11,trans_t2_sch_s_thresh12,trans_t2_sch_s_thresh13,trans_t2_sch_s_thresh14,trans_t2_sch_s_thresh15,trans_t2_sch_s_thresh16,trans_t2_sch_s1_c1,trans_t2_sch_s2_c1,trans_t2_sch_s3_c1,trans_t2_sch_s4_c1,trans_t2_sch_s5_c1,trans_t2_sch_s6_c1,trans_t2_sch_s7_c1,trans_t2_sch_s8_c1,trans_t2_sch_s9_c1,trans_t2_sch_s10_c1,trans_t2_sch_s11_c1,trans_t2_sch_s12_c1,trans_t2_sch_s13_c1,trans_t2_sch_s14_c1,trans_t2_sch_s15_c1,trans_t2_sch_s1_c2,trans_t2_sch_s2_c2,trans_t2_sch_s3_c2,trans_t2_sch_s4_c2,trans_t2_sch_s5_c2,trans_t2_sch_s6_c2,trans_t2_sch_s7_c2,trans_t2_sch_s8_c2,trans_t2_sch_s9_c2,trans_t2_sch_s10_c2,trans_t2_sch_s11_c2,trans_t2_sch_s12_c2,trans_t2_sch_s13_c2,trans_t2_sch_s14_c2,trans_t2_sch_s15_c2,trans_t2_sch_s1_c3,trans_t2_sch_s2_c3,trans_t2_sch_s3_c3,trans_t2_sch_s4_c3,trans_t2_sch_s5_c3,trans_t2_sch_s6_c3,trans_t2_sch_s7_c3,trans_t2_sch_s8_c3,trans_t2_sch_s9_c3,trans_t2_sch_s10_c3,trans_t2_sch_s11_c3,trans_t2_sch_s12_c3,trans_t2_sch_s13_c3,trans_t2_sch_s14_c3,trans_t2_sch_s15_c3,trans_t2_sch_m1_c0,trans_t2_sch_m2_c0,trans_t2_sch_m3_c0,trans_t2_sch_m4_c0,trans_t2_sch_m5_c0,trans_t2_sch_m6_c0,trans_t2_sch_m7_c0,trans_t2_sch_m8_c0,trans_t2_sch_m9_c0,trans_t2_sch_m10_c0,trans_t2_sch_m11_c0,trans_t2_sch_m12_c0,trans_t2_sch_m13_c0,trans_t2_sch_m14_c0,trans_t2_sch_m15_c0,trans_t2_sch_m_thresh17,trans_t2_sch_m_thresh18,trans_t2_sch_m16_c2,trans_t2_sch_m17_c2,trans_t2_sch_m18_c2,trans_t2_sch_m16_c1,tax_inc_pr1,tax_inc_pr2, awp] = it_parameters_2003

%%%%Tax Schedule Parameters
taxbracket1=15000;
taxbracket2=29000;
taxbracket3=32600;
taxbracket4=70000;
taxbracket5=1000000000;

tax_r1=0.23;
tax_r2=0.29;
tax_r3=0.31;
tax_r4=0.39;
tax_r5=0.45;

%%%%Cash transfers

%married couple
trans_sch_m_thresh1=0;
trans_sch_m_thresh2=11697.13;
trans_sch_m_thresh3=14474.16;
trans_sch_m_thresh4=17250.64;
trans_sch_m_thresh5=20026.05;
trans_sch_m_thresh6=22803.62;
trans_sch_m_thresh7=25580.09;
trans_sch_m_thresh8=28357.66;
trans_sch_m_thresh9=31133.07;
trans_sch_m_thresh10=33909.56;
trans_sch_m_thresh11=36685.50;
trans_sch_m_thresh12=39463.62;
trans_sch_m_thresh13=42240.09;
trans_sch_m_thresh14=45017.13;
trans_sch_m_thresh15=47793.60;
trans_sch_m_thresh16=50571.18;
trans_sch_m_thresh17=53348.76;
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
trans_sch_s_thresh2=13548.11;
trans_sch_s_thresh3=16325.15;
trans_sch_s_thresh4=19100.55;
trans_sch_s_thresh5=21877.58;
trans_sch_s_thresh6=24655.16;
trans_sch_s_thresh7=27431.64;
trans_sch_s_thresh8=30208.11;
trans_sch_s_thresh9=32984.61;
trans_sch_s_thresh10=35760.55;
trans_sch_s_thresh11=38538.66;
trans_sch_s_thresh12=41315.69;
trans_sch_s_thresh13=44091.08;
trans_sch_s_thresh14=46868.66;
trans_sch_s_thresh15=49645.68;
trans_sch_s_thresh16=52423.25;
trans_sch_s_thresh17=55199.74;
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

tax_inc_pr1=21408.09;
awp=22114;

% %t-2
tax_inc_pr2=20798.48;

%married couple
trans_t2_sch_m_thresh1=0;
trans_t2_sch_m_thresh2=10850.16;
trans_t2_sch_m_thresh3=11422.99;
trans_t2_sch_m_thresh4=13562.10;
trans_t2_sch_m_thresh5=14134.93;
trans_t2_sch_m_thresh6=16274.04;
trans_t2_sch_m_thresh7=16846.34;
trans_t2_sch_m_thresh8=18984.93;
trans_t2_sch_m_thresh9=19556.70;
trans_t2_sch_m_thresh10=22269.17;
trans_t2_sch_m_thresh11=24980.57;
trans_t2_sch_m_thresh12=27693.04;
trans_t2_sch_m_thresh13=30403.40;
trans_t2_sch_m_thresh14=33114.81;
trans_t2_sch_m_thresh15=35825.69;
trans_t2_sch_m_thresh16=38538.70;
trans_t2_sch_m_thresh17=41250.10;
trans_t2_sch_m_thresh18=43962.05;

trans_t2_sch_m1_c0=46.48;
trans_t2_sch_m2_c0=36.15;
trans_t2_sch_m3_c0=36.15;
trans_t2_sch_m4_c0=25.82;
trans_t2_sch_m5_c0=25.82;
trans_t2_sch_m6_c0=10.33;
trans_t2_sch_m7_c0=10.33;
trans_t2_sch_m8_c0=0;
trans_t2_sch_m9_c0=0;
trans_t2_sch_m10_c0=0;
trans_t2_sch_m11_c0=0;
trans_t2_sch_m12_c0=0;
trans_t2_sch_m13_c0=0;
trans_t2_sch_m14_c0=0;
trans_t2_sch_m15_c0=0;
trans_t2_sch_m16_c0=0;
trans_t2_sch_m17_c0=0;
trans_t2_sch_m18_c0=0;

trans_t2_sch_m1_c1=130.66;
trans_t2_sch_m2_c1=130.66;
trans_t2_sch_m3_c1=114.65;
trans_t2_sch_m4_c1=114.65;
trans_t2_sch_m5_c1=92.45;
trans_t2_sch_m6_c1=92.45;
trans_t2_sch_m7_c1=65.59;
trans_t2_sch_m8_c1=65.59;
trans_t2_sch_m9_c1=43.90;
trans_t2_sch_m10_c1=25.82;
trans_t2_sch_m11_c1=15.49;
trans_t2_sch_m12_c1=15.49;
trans_t2_sch_m13_c1=12.91;
trans_t2_sch_m14_c1=12.91;
trans_t2_sch_m15_c1=12.91;
trans_t2_sch_m16_c1=0;
trans_t2_sch_m17_c1=0;
trans_t2_sch_m18_c1=0;

trans_t2_sch_m1_c2=250.48;
trans_t2_sch_m2_c2=250.48;
trans_t2_sch_m3_c2=220.53;
trans_t2_sch_m4_c2=220.53;
trans_t2_sch_m5_c2=190.57;
trans_t2_sch_m6_c2=190.57;
trans_t2_sch_m7_c2=158.04;
trans_t2_sch_m8_c2=158.04;
trans_t2_sch_m9_c2=111.55;
trans_t2_sch_m10_c2=81.60;
trans_t2_sch_m11_c2=57.33;
trans_t2_sch_m12_c2=38.73;
trans_t2_sch_m13_c2=25.82;
trans_t2_sch_m14_c2=25.82;
trans_t2_sch_m15_c2=23.24;
trans_t2_sch_m16_c2=23.24;
trans_t2_sch_m17_c2=23.24;
trans_t2_sch_m18_c2=0;

%single parent
trans_t2_sch_s_thresh1=0;
trans_t2_sch_s_thresh2=13230.59;
trans_t2_sch_s_thresh3=15942.54;
trans_t2_sch_s_thresh4=18652.89;
trans_t2_sch_s_thresh5=21364.83;
trans_t2_sch_s_thresh6=24077.31;
trans_t2_sch_s_thresh7=26788.72;
trans_t2_sch_s_thresh8=29500.12;
trans_t2_sch_s_thresh9=32211.54;
trans_t2_sch_s_thresh10=34922.42;
trans_t2_sch_s_thresh11=37635.42;
trans_t2_sch_s_thresh12=40347.36;
trans_t2_sch_s_thresh13=44091.08;
trans_t2_sch_s_thresh14=43057.71;
trans_t2_sch_s_thresh15=45770.19;
trans_t2_sch_s_thresh16=1000000000;


trans_t2_sch_s1_c1=99.68;
trans_t2_sch_s2_c1=79.53;
trans_t2_sch_s3_c1=54.23;
trans_t2_sch_s4_c1=23.24;
trans_t2_sch_s5_c1=20.66;
trans_t2_sch_s6_c1=20.66;
trans_t2_sch_s7_c1=0;
trans_t2_sch_s8_c1=0;
trans_t2_sch_s9_c1=0;
trans_t2_sch_s10_c1=0;
trans_t2_sch_s11_c1=0;
trans_t2_sch_s12_c1=0;
trans_t2_sch_s13_c1=0;
trans_t2_sch_s14_c1=0;
trans_t2_sch_s15_c1=0;
trans_t2_sch_s16_c1=0;


trans_t2_sch_s1_c2=184.89;
trans_t2_sch_s2_c2=164.75;
trans_t2_sch_s3_c2=136.34;
trans_t2_sch_s4_c2=102.26;
trans_t2_sch_s5_c2=73.85;
trans_t2_sch_s6_c2=48.55;
trans_t2_sch_s7_c2=34.09;
trans_t2_sch_s8_c2=34.09;
trans_t2_sch_s9_c2=28.41;
trans_t2_sch_s10_c2=28.41;
trans_t2_sch_s11_c2=28.41;
trans_t2_sch_s12_c2=0;
trans_t2_sch_s13_c2=0;
trans_t2_sch_s14_c2=0;
trans_t2_sch_s15_c2=0;
trans_t2_sch_s16_c2=0;


trans_t2_sch_s1_c3=412.13;
trans_t2_sch_s2_c3=372.37;
trans_t2_sch_s3_c3=332.60;
trans_t2_sch_s4_c3=289.73;
trans_t2_sch_s5_c3=230.34;
trans_t2_sch_s6_c3=190.57;
trans_t2_sch_s7_c3=159.07;
trans_t2_sch_s8_c3=136.34;
trans_t2_sch_s9_c3=119.30;
trans_t2_sch_s10_c3=119.30;
trans_t2_sch_s11_c3=102.26;
trans_t2_sch_s12_c3=102.26;
trans_t2_sch_s13_c3=102.26;
trans_t2_sch_s14_c3=0;
trans_t2_sch_s15_c3=0;
trans_t2_sch_s16_c3=0;

%%%%Regional tax
reg_rt=0.009;

%%%%Social Security Parameters

%Employee 
ssc_bracket1=36959.00;
ssc_bracket2=80391.00;
ssc_bracket3=1000000000;

ssc_r1=0.0919;
ssc_r2=0.1019;
ssc_r3=0;

%Employer
emp_ssc_bracket1=20658.28;
emp_ssc_bracket2=1000000000;

emp_ssc_r1=0.3308;
emp_ssc_r2=0;

%%%%  Allowances
b_all=7500;

%%%% Tax Credits

%Employment
emp_flat=0;
emp_add_thresh1=27000.01;
emp_add_thresh2=29500.01;
emp_add_thresh3=36500.01;
emp_add_thresh4=41500.01;
emp_add_thresh5=46700.01;
emp_add_thresh6=52000.01;

emp_add_1=130;
emp_add_2=235;
emp_add_3=180;
emp_add_4=130;
emp_add_5=25;
emp_add_6=0;

%Spouse
sp_cred_thresh1=0;
sp_cred_thresh2=15494.01;
sp_cred_thresh3=30987.01;
sp_cred_thresh4=51646.01;
sp_cred_thresh5=1000000000;

sp_cred_1=546.18;
sp_cred_2=496.60;
sp_cred_3=459.42;
sp_cred_4=422.23;
sp_cred_5=0;

sp_crd_lim=2840.51;


%Child credit
%Married
child_cred_m_thresh1=0;
child_cred_m_thresh2=36151.98;
child_cred_m_thresh3=41316.55;
child_cred_m_thresh4=46481.12;
child_cred_m_thresh5=51645.7;

child_cred_m_ch1_1=516.46;
child_cred_m_ch1_2=303.68;
child_cred_m_ch1_3=303.68;
child_cred_m_ch1_4=303.68;
child_cred_m_ch1_5=285.08;

child_cred_m_ch2_1=1032.92;
child_cred_m_ch2_2=1032.92;
child_cred_m_ch2_3=640.41;
child_cred_m_ch2_4=640.41;
child_cred_m_ch2_5=570.16;

child_cred_m_ch3_1=1549.38;
child_cred_m_ch3_2=1549.38;
child_cred_m_ch3_3=1549.38;
child_cred_m_ch3_4=977.14;
child_cred_m_ch3_5=855.24;

child_cred_m_ch4_1=2065.84;
child_cred_m_ch4_2=2065.84;
child_cred_m_ch4_3=2065.84;
child_cred_m_ch4_4=2065.84;
child_cred_m_ch4_5=2065.84;

%Single
child_cred_sp_thresh1=0;
child_cred_sp_thresh2=15494.01;
child_cred_sp_thresh3=30987.01;
child_cred_sp_thresh4=36151.98;
child_cred_sp_thresh5=41316.55;
child_cred_sp_thresh6=46481.12;
child_cred_sp_thresh7=51645.7;

child_cred_sp_ch1_1=546.18;
child_cred_sp_ch1_2=516.46;
child_cred_sp_ch1_3=516.46;
child_cred_sp_ch1_4=459.42;
child_cred_sp_ch1_5=459.42;
child_cred_sp_ch1_6=459.42;
child_cred_sp_ch1_7=422.23;

child_cred_sp_ch2_1=1062.64;
child_cred_sp_ch2_2=1032.92;
child_cred_sp_ch2_3=1032.92;
child_cred_sp_ch2_4=1032.92;
child_cred_sp_ch2_5=796.15;
child_cred_sp_ch2_6=796.15;
child_cred_sp_ch2_7=707.31;

child_cred_sp_ch3_1=1579.1;
child_cred_sp_ch3_2=1549.38;
child_cred_sp_ch3_3=1549.38;
child_cred_sp_ch3_4=1549.38;
child_cred_sp_ch3_5=1549.38;
child_cred_sp_ch3_6=1132.88;
child_cred_sp_ch3_7=992.39;

child_cred_sp_ch4_1=2095.56;
child_cred_sp_ch4_2=2065.84;
child_cred_sp_ch4_3=2065.84;
child_cred_sp_ch4_4=2065.84;
child_cred_sp_ch4_5=2065.84;
child_cred_sp_ch4_6=2065.84;
child_cred_sp_ch4_7=2065.84;

end


