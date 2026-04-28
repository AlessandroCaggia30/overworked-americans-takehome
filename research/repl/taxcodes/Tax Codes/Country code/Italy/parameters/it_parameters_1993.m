
% Parameter Assignment for year 1993 Italy

function[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5, taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,trans_sch_m_thresh1,trans_sch_m_thresh2,trans_sch_m_thresh3,trans_sch_m_thresh4,trans_sch_m_thresh5,trans_sch_m_thresh6,trans_sch_m_thresh7,trans_sch_m_thresh8,trans_sch_m_thresh9,trans_sch_m1_c2,trans_sch_m2_c2,trans_sch_m3_c2,trans_sch_m4_c2,trans_sch_m5_c2,trans_sch_m6_c2,trans_sch_m7_c2,trans_sch_m8_c2,trans_sch_m9_c2,ssc_r1,sp_cred_1, sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred_thresh3,furth_cred_thresh4,furth_cred1,furth_cred2,furth_cred3] = it_parameters_1993

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
trans_sch_m_thresh2=15985000;
trans_sch_m_thresh3=19981000;
trans_sch_m_thresh4=23977000;
trans_sch_m_thresh5=27971000;
trans_sch_m_thresh6=31967000;
trans_sch_m_thresh7=35963000;
trans_sch_m_thresh8=39958000;
trans_sch_m_thresh9=43953000;

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
ssc_r1=0.1;

%%%% Tax Credits

%Further credit
furth_cred_thresh1=0;
furth_cred_thresh2=13900000;
furth_cred_thresh3=25257000;
furth_cred_thresh4=60120000;

furth_cred1=994000;
furth_cred2=797000;
furth_cred3=727000;

%Spouse
sp_cred_1=757000;
sp_crd_lim=5100000;

%child credit
ch1_credit=87500;


end
