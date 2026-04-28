
% Parameter Assignment for year 1984 Italy

function[taxbracket1,taxbracket2,taxbracket3,taxbracket4,taxbracket5, taxbracket6,tax_r1,tax_r2,tax_r3,tax_r4,tax_r5,tax_r6,tax_r7,ssc_r1,sp_cred_1, sp_crd_lim,ch1_credit,furth_cred_thresh1,furth_cred_thresh2,furth_cred1,furth_cred2,tax_r8,tax_r9,taxbracket7,taxbracket8,basic_cred,earner_cred,expense_cred,trans_spouse,trans_child,phaseout_lim,add_trans_child,add_low_lim,add_upper_lim] = it_parameters_1984

%%%%Tax Schedule Parameters
taxbracket1=11000000;
taxbracket2=24000000;
taxbracket3=30000000;
taxbracket4=38000000;
taxbracket5=60000000;
taxbracket6=120000000;
taxbracket7=250000000;
taxbracket8=500000000;

tax_r1=0.17;
tax_r2=0.27;
tax_r3=0.35;
tax_r4=0.37;
tax_r5=0.41;
tax_r6=0.47;
tax_r7=0.56;
tax_r8=0.62;
tax_r9=0.65;

%%%%Cash transfers
trans_spouse=233580;
trans_child=233580;
phaseout_lim=28000000;
add_trans_child=45000;
add_low_lim=9200000;
add_upper_lim=24000000;

%%%%Social Security Parameters

%Employee 
ssc_r1=0.0865;

%%%% Tax Credits

%Basic credit
basic_cred=36000;
earner_cred=277200;
expense_cred=18000;

%Further credit
furth_cred_thresh1=9900000;
furth_cred_thresh2=17690000;

furth_cred1=356400;
furth_cred2=66000;

%Spouse
sp_cred_1=264000; 
sp_crd_lim=2750000;

%child credit
ch1_credit=19800;

end
