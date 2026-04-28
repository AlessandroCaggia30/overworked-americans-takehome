
% Parameter Assignment for year 1994 Italy

function[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5, taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,trans_sch_m_thresh1,trans_sch_m_thresh2,trans_sch_m_thresh3,trans_sch_m_thresh4,trans_sch_m_thresh5,trans_sch_m_thresh6,trans_sch_m_thresh7,trans_sch_m_thresh8,trans_sch_m_thresh9,trans_sch_m1_c2,trans_sch_m2_c2,trans_sch_m3_c2,trans_sch_m4_c2,trans_sch_m5_c2,trans_sch_m6_c2,trans_sch_m7_c2,trans_sch_m8_c2,trans_sch_m9_c2,ssc_r1,sp_cred_1, sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred_thresh3,furth_cred1,furth_cred2] = it_parameters_1994

%%%%Tax Schedule Parameters
taxbracket1=7200000;
taxbracket2=14400000;
taxbracket3=30000000;
taxbracket4=60000000;
taxbracket5=150000000;
taxbracket6=300000000;

tax_r1=0.1;
tax_r2=0.22;
tax_r3=0.27;
tax_r4=0.34;
tax_r5=0.41;
tax_r6=0.46;
tax_r7=0.51;

%%%%Cash transfers
 
%married couple
trans_sch_m_thresh1=0;
trans_sch_m_thresh2=16656000;
trans_sch_m_thresh3=20821000;
trans_sch_m_thresh4=24984000;
trans_sch_m_thresh5=29146000;
trans_sch_m_thresh6=33310000;
trans_sch_m_thresh7=37474000;
trans_sch_m_thresh8=41637000;
trans_sch_m_thresh9=45799000;

trans_sch_m1_c2=2760000;
trans_sch_m2_c2=2400000;
trans_sch_m3_c2=2040000;
trans_sch_m4_c2=1680000;
trans_sch_m5_c2=1320000;
trans_sch_m6_c2=960000;
trans_sch_m7_c2=600000;
trans_sch_m8_c2=240000;
trans_sch_m9_c2=0;


%%%%Social Security Parameters

%Employee 
ssc_r1=0.0999;

%%%% Tax Credits

%Further credit
furth_cred_thresh1=0;
furth_cred_thresh2=14500000;
furth_cred_thresh3=14825000;

furth_cred1=997000;
furth_cred2=760000;


%Spouse
sp_cred_1=792000;
sp_crd_lim=5300000;

%child credit
ch1_credit=91000;


end
