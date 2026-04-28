
% Parameter Assignment for year 1986 Italy

function[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5, taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,trans_sch_m_thresh1,trans_sch_m_thresh2,trans_sch_m_thresh3,trans_sch_m_thresh4,trans_sch_m1_c2,trans_sch_m2_c2,trans_sch_m3_c2,ssc_r1,sp_cred_1, sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred1,furth_cred2,tax_r8,tax_r9,taxbracket7,taxbracket8] = it_parameters_1986

%%%%Tax Schedule Parameters
taxbracket1=6000000;
taxbracket2=11000000;
taxbracket3=28000000;
taxbracket4=50000000;
taxbracket5=100000000;
taxbracket6=150000000;
taxbracket7=300000000;
taxbracket8=600000000;

tax_r1=0.12;
tax_r2=0.22;
tax_r3=0.27;
tax_r4=0.34;
tax_r5=0.41;
tax_r6=0.48;
tax_r7=0.53;
tax_r8=0.58;
tax_r9=0.62;

%%%%Cash transfers
 
%married couple -values from 1997, as no information available for 1986
trans_sch_m_thresh1=0;
trans_sch_m_thresh2=12000000;
trans_sch_m_thresh3=18000000;
trans_sch_m_thresh4=33000000;

trans_sch_m1_c2=2760000;
trans_sch_m2_c2=680000;
trans_sch_m3_c2=0;


%%%%Social Security Parameters

%Employee 
ssc_r1=0.0885;

%%%% Tax Credits

%Further credit
furth_cred_thresh1=0;
furth_cred_thresh2=11000000;

furth_cred1=492000;
furth_cred2=156000;

%Spouse
sp_cred_1=360000; %according to tax/benefit position tables 
sp_crd_lim=3000000;

%child credit
ch1_credit=48000;

end
