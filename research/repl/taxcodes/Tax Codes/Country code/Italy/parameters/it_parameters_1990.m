
% Parameter Assignment for year 1990 Italy

function[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5, taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,trans_sch_m_thresh1,trans_sch_m_thresh2,trans_sch_m_thresh3,trans_sch_m_thresh4,trans_sch_m_thresh5,trans_sch_m_thresh6,trans_sch_m_thresh7,trans_sch_m_thresh8,trans_sch_m_thresh9,trans_sch_m1_c2,trans_sch_m2_c2,trans_sch_m3_c2,trans_sch_m4_c2,trans_sch_m5_c2,trans_sch_m6_c2,trans_sch_m7_c2,trans_sch_m8_c2,trans_sch_m9_c2,ssc_r1,sp_cred_1, sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred1,furth_cred2] = it_parameters_1990

%%%%Tax Schedule Parameters
taxbracket1=6400000;
taxbracket2=12700000;
taxbracket3=31800000;
taxbracket4=63700000;
taxbracket5=159000000;
taxbracket6=318300000;

tax_r1=0.1;
tax_r2=0.22;
tax_r3=0.26;
tax_r4=0.33;
tax_r5=0.40;
tax_r6=0.45;
tax_r7=0.50;

%%%%Cash transfers
 
%married couple
trans_sch_m_thresh1=0;
trans_sch_m_thresh2=13432000;
trans_sch_m_thresh3=16790000;
trans_sch_m_thresh4=20184000;
trans_sch_m_thresh5=23506000;
trans_sch_m_thresh6=25864000;
trans_sch_m_thresh7=30222000;
trans_sch_m_thresh8=33579000;
trans_sch_m_thresh9=36937000;

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
ssc_r1=0.0854;

%%%% Tax Credits

%Further credit
furth_cred_thresh1=0;
furth_cred_thresh2=11700000;

furth_cred1=611136;
furth_cred2=190980;

%Spouse
sp_cred_1=636000;
sp_crd_lim=4200000;

%child credit
ch1_credit=50928;

end
