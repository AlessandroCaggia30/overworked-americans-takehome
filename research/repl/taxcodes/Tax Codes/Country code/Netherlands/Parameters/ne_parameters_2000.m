

% Parameter Assignment 

function[work_rate,work_min,work_max,comp_rate,comp_max,unemp_r,ssc_ceil,unemp_fran,med_limit,med_empr,health_ceil,health_r,health_fixed,oldpen_r,widpen_r,ex_med_r,single_par_all,single_par_rate,basic_all,transfer_all,taxbracket1,taxbracket2,taxbracket3,tax_r1,tax_r2,tax_r3,tax_r4,unemp_empr_r1,unemp_empr_r2,unemp_empr_fran1,inv_empr_r] = ne_parameters_2000

%Employees Social Security Parameters
work_rate=0.12;
work_min=263;
work_max=3538;
comp_rate=0.0215;
comp_max=85150;

unemp_r=0.0625;    %unemployment contribution rate for gross earnings between 15921-46205
ssc_ceil=83259;   %Social Security Ceiling
unemp_fran=28971;   %Unemployment contribution lower bound for wage


med_limit=64600;
med_empr=0.0635;
health_ceil=56115;   %Medical insurance net wage ceiling

health_r=0.0175;      %Med insurance rate 
health_fixed= 414;   %basic insurance

 oldpen_r=0.179;   %Old age pension rate for 1st &2nd tax bracket
 widpen_r=0.0125;   %Widows and Orphans pension rate for 1st &2nd tax bracket
 ex_med_r=0.1025;  %Exceptional medical expenses and disability rate for 1st &2nd tax bracket

single_par_all=6818;
single_par_rate=0.12;

basic_all=8949;
transfer_all=8523;
 
%Employers Social Security Parameters 
unemp_empr_r1=0.0375;
unemp_empr_r2=0.0105;
unemp_empr_fran1=28971;
inv_empr_r=0.077;

%Tax Schedule Parameters
taxbracket1=15255;
taxbracket2=48994;
taxbracket3=107756;
tax_r1=0.045;
tax_r2=0.0855;
tax_r3=0.50;
tax_r4=0.60;
   


 
%  %Child Benefit Parameters 
% cb_6=190.19*4;       %children under 6 
% cb_6_9=230.95*4;     %children 6-9
% 
% % CB parameters for children between 9-12
% cb_12_1=218.13*4;     %1 child
% cb_12_2=246.40*4;     %2 children
% cb_12_3=255.82*4;     %3 children
% cb_12_4=279.52*4;     %4 children
% 
% % CB parameters for children between 12-18
% cb_18_1=271.7*4;     %1 child
% cb_18_2=305.54*4;    %2 children
% cb_18_3=316.82*4;    %3 children
% cb_18_4=341.61*4;    %4 children
% 
% 
% % gen cb_6 	= 190.19*4 in 1/4		
% % 
% % 	gen cb_6_12	= 230.95*4 in 1/4		/* children under 6-12 */
% % 	*gen cb_12_18	= 271.7*4 in 1/4		/* children under 12-18 */
% % 
% % 	*gen cb_12 	= 218.13*4 			        /* 1 child    9 to under 12*/
% % 	*replace cb_12 	= 246.40*4 in 2 		/* 2 children 9 to under 12*/
% % 	*replace cb_12 	= 255.82*4 in 3 		/* 3 children 9 to under 12*/
% % 	*replace cb_12 	= 279.52*4 in 4 		/* 4 children 9 to under 12*/
% % 
% % 	gen cb_18 	= 271.7*4 			        /* 1 child    12 to under 18*/
% % 	replace cb_18 	= 305.54*4 in 2 		/* 2 children 12 to under 18*/
% % 	replace cb_18 	= 316.82*4 in 3 		/* 3 children 12 to under 18*/
% % 	replace cb_18 	= 341.61*4 in 4 		/* 4 children 12 to under 18*/
% % 




end