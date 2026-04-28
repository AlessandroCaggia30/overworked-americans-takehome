****************************************************************************************************************
****************************************************************************************************************
****************************************************************************************************************

* Code for "Generalized Social Welfare Weights for Optimal Tax Theory" by Emmanuel Saez & Stefanie Stantcheva **
****************************************************************************************************************
****************************************************************************************************************
****************************************************************************************************************

* This do file exploits the data collected throguh the randomized survey experiment on mTurk, as described in 
* Online Appendix C.

* input: GSWW_data.dta

clear
set more off
cap log close

cd "/Users/stefaniestantcheva/Dropbox/SocialWelfareWeights/Survey/Data/"
* cd ...

log using GSWW_log.log, replace

use GSWW_data.dta, clear

*********Clean up background variables

gen obama12 =  party2012 == 1 if party2012 ~=.
gen male=gender==1 if gender~=.
gen native=usborn==1 if usborn~=.
gen married=marital==2 if marital~=.
gen white=ethnic==1 if ethnic~=.
gen black=ethnic==2 if ethnic~=.
gen hisp=ethnic==3 if ethnic~=.
gen asian=ethnic==4 if ethnic~=.
gen college=educ>5 if educ~=.
gen fulltime=employ==1 if employ~=.
gen parttime=employ==2 if employ~=.
gen unemp=employ==4 if employ~=.
gen student=employ==5 if employ~=.
gen nilf=employ==6 if employ~=.
qui tab income, missing gen(hhh) 
gen poor=income<4 if income~=.
gen liberal=policyview>3 if policyview~=. 
gen vpoor = income==1 if income ~=.
gen conservative = policyview<=2 if policyview~=. 

****Create ethnicity fixed effects
tab ethnic, gen(eee)

****Create 3-category policyview to compare with polling data
gen policyview3=1 if policyview<3
replace policyview3=2 if policyview==3
replace policyview3=3 if policyview>3 & policyview~=.

# delimit cr

* if people are utilitarian, then in questions utilitarian1, utilitarian2, utilitarian3, the answers should be respectively, 2, indifferent and 1.
* I define utilitarian`i'_y to be 1 if people answered the utilitarian way in utilitarian question `i' 
* Define utilitarian_mean = fraction of questions they answered the utilitarian way. 
* Symmetrically, for libertarian questions, libertarian1, libertarian2, libertarian3, the answers should be 1, indifferent and 2. 

gen utilitarian1_y = (utilitarian1 == 2) if utilitarian1 !=. 
gen utilitarian2_y = (utilitarian2 == 3) if utilitarian2 !=. 
gen utilitarian3_y = (utilitarian3 == 1) if utilitarian3 !=. 
gen utilitarian_mean = (utilitarian1_y + utilitarian2_y + utilitarian3_y)/3 
gen utilitarian_all = utilitarian1_y == 1 & utilitarian2_y == 1 & utilitarian3_y == 1 

gen libertarian1_y = (libertarian1 == 1) if libertarian1 !=. 
gen libertarian2_y = (libertarian2 == 3) if libertarian2 !=. 
gen libertarian3_y = (libertarian3 == 2) if libertarian3 !=. 
gen libertarian_mean = (libertarian1_y + libertarian2_y + libertarian3_y)/3 
gen libertarian_all = libertarian1_y == 1 & libertarian2_y == 1 & libertarian3_y == 1 

* Careful for variable consumption: It is coded it as 2, 3 and 4 instead of 1,2,3 in the raw data. I recode it to match the other variables. 

rename consumption consumption_temp
gen consumption = . 
replace consumption = 1 if consumption_temp == 2
replace consumption = 2 if consumption_temp == 3
replace consumption = 3 if consumption_temp == 4

gen consumption_nonvalued = (consumption == 2) if consumption != . 
gen consumption_indifferent = (consumption == 3) if consumption != . 
gen consumption_valued  = (consumption == 1) if consumption != . 

label var utilitarian_mean "Pct of utilitarian answers" 
label var libertarian_mean "Pct of libertarian answers" 

gen hardworking = (fleurbaey == 1) if fleurbaey ! = . 
gen hardwork_indifferent = (fleurbaey == 3) if fleurbaey ! = .
gen lazy = (fleurbaey == 2) if fleurbaey != .

*******************************************************************
*******************************************************************
** Construction of Appendix Table A.2.
*******************************************************************
*******************************************************************

*******************************************************************
** Utilitarianism vs. Libertarianism
*******************************************************************

# delimit ; 

eststo clear ;

eststo: estpost sum utilitarian1_y utilitarian2_y utilitarian3_y utilitarian_all libertarian1_y libertarian2_y libertarian3_y libertarian_all
consumption_nonvalued consumption_indifferent consumption_valued;

label var consumption_nonvalued "Prefer frugal person"; 
label var consumption_indifferent "Indifferent to consumption preferences"; 
label var hardworking "Prefer hardworking person"; 
label var hardwork_indifferent "Indifferent to hard work"; 
label var utilitarian1_y "Utilitarian Q.1"; 
label var utilitarian2_y "Utilitarian Q.2"; 
label var utilitarian3_y "Utilitarian Q.3";
label var utilitarian_all "All Utilitarian answers";  
label var libertarian1_y "Libertarian Q.1"; 
label var libertarian2_y "Libertarian Q.2"; 
label var libertarian3_y "Libertarian Q.3"; 
label var libertarian_all "All Libertarian answers";  

esttab using summary.tex, replace booktabs fragment cells(mean(fmt(a3)) sd(par)) mlabel("Mean" "Standard Dev")
stats(N, label("Observations")) label nogaps collabels(none) wrap varwidth(24)  ;

tab utilitarian1, gen(utilitarian1_);
summ utilitarian1_* if utilitarian1 !=.; 
drop utilitarian1_1 utilitarian1_2 utilitarian1_3;
tab utilitarian2, gen(utilitarian2_);
summ utilitarian2_* if utilitarian2 !=.; 
drop utilitarian2_1 utilitarian2_2 utilitarian2_3;
tab utilitarian3, gen(utilitarian3_);
summ utilitarian3_* if utilitarian3 !=.; 
drop utilitarian3_1 utilitarian3_2 utilitarian3_3;

tab libertarian1, gen(libertarian1_);
summ libertarian1_* if libertarian1 !=.; 
drop libertarian1_1 libertarian1_2 libertarian1_3;
tab libertarian2, gen(libertarian2_);
summ libertarian2_* if libertarian2 !=.; 
drop libertarian2_1 libertarian2_2 libertarian2_3;
tab libertarian3, gen(libertarian3_);
summ libertarian3_* if libertarian3 !=.; 
drop libertarian3_1 libertarian3_2 libertarian3_3;


*******************************************************************
*******************************************************************
** Construction of Appendix Table A.1.
*******************************************************************
*******************************************************************

*****************************************************************************;
**** Fair Income tax a la Fleurbaey Maniquet Test: Hardworking vs. Lazy
*****************************************************************************; 

eststo clear ;

eststo: estpost sum hardworking hardwork_indifferent lazy;

esttab using fleurbaey.tex, replace booktabs fragment cells(mean(fmt(a3)) sd(par)) mlabel("Mean")
stats(N, label("Observations")) label nogaps collabels(none) wrap varwidth(24)  ;

*****************************************************************************;
**** Test for Free Loaders: do respondents worry about Free-Loaders?
*****************************************************************************;

rename a_rank A_rank; 
rename b_rank B_rank; 
rename c_rank C_rank; 
rename d_rank D_rank; 

rename a_rank2 A_rank2; 
rename b_rank2 B_rank2; 
rename c_rank2 C_rank2; 
rename d_rank2 D_rank2; 

** Recode so lowest rank is 1, not 0; 
foreach var in A B C D {; 
replace `var'_rank = `var'_rank + 1; 
}; 

** let us find the average rank for each individual; 
** Also add fraction who rank those first; 

gen A_rankfirst = (A_rank == 1) if A_rank != . ; 
gen B_rankfirst = (B_rank == 1) if B_rank != . ; 
gen C_rankfirst = (C_rank == 1) if C_rank != . ; 
gen D_rankfirst = (D_rank == 1) if D_rank != . ; 

gen countfirst = 1;
replace countfirst = 4 if (A_rank == 1 & A_rank2 == 4) | (B_rank == 1 & B_rank2 == 4 | C_rank == 1 & C_rank2 == 4 | D_rank == 1 & D_rank2 == 4 ) ; 
replace countfirst = 3 if (A_rank == 1 & A_rank2 == 3) | (B_rank == 1 & B_rank2 == 3 | C_rank == 1 & C_rank2 == 3 | D_rank == 1 & D_rank2 == 3 ) 
& countfirst != 4 ; 
replace countfirst = 2 if (A_rank == 1 & A_rank2 == 2) | (B_rank == 1 & B_rank2 == 2 | C_rank == 1 & C_rank2 == 2 | D_rank == 1 & D_rank2 == 2 ) 
& countfirst != 3 & countfirst != 4;

foreach var in A B C D {; 
gen `var'_rankfirst_w = 1/countfirst; 
gen `var'_rankfirst_weighted = `var'_rankfirst*`var'_rankfirst_w; 
}; 

** Redo analysis for being ranked last; 
* Difference here is that the max is not necessarily 4, it could be lower if people ranked several options the same; 
egen rankmax = rowmax(A_rank B_rank C_rank D_rank); 
gen A_ranklast = (A_rank == rankmax) if A_rank != . ; 
gen B_ranklast = (B_rank == rankmax) if B_rank != . ; 
gen C_ranklast = (C_rank == rankmax) if C_rank != . ; 
gen D_ranklast = (D_rank == rankmax) if D_rank != . ; 

gen countlast = 1;
replace countlast = 4 if (A_rank == rankmax & A_rank2 == 4) | (B_rank == rankmax & B_rank2 == 4 | C_rank == rankmax & C_rank2 == 4 | D_rank == rankmax & D_rank2 == 4 ) ; 
replace countlast = 3 if (A_rank == rankmax & A_rank2 == 3) | (B_rank == rankmax & B_rank2 == 3 | C_rank == rankmax & C_rank2 == 3 | D_rank == rankmax & D_rank2 == 3 ) 
& countlast != 4 ; 
replace countlast = 2 if (A_rank == rankmax & A_rank2 == 2) | (B_rank == rankmax & B_rank2 == 2 | C_rank == rankmax & C_rank2 == 2 | D_rank == rankmax & D_rank2 == 2 ) 
& countlast != 3 & countlast != 4;

foreach var in A B C D {; 
gen `var'_ranklast_w = 1/countlast; 
gen `var'_ranklast_weighted = `var'_ranklast*`var'_ranklast_w; 
}; 

eststo clear ;

eststo: estpost sum A_rank B_rank C_rank D_rank;

label var A_rank "DI";
label var B_rank "UI + looking for job" ;
label var C_rank "UI + not looking for job" ;
label var D_rank "Welfare + satisfied" ;
label var A_rankfirst "DI";
label var B_rankfirst "UI + looking for job" ;
label var C_rankfirst "UI + not looking for job" ;
label var D_rankfirst "Welfare + satisfied" ;

label var A_rankfirst_weighted "DI";
label var B_rankfirst_weighted "UI + looking for job" ;
label var C_rankfirst_weighted "UI + not looking for job" ;
label var D_rankfirst_weighted "Welfare + satisfied" ;

label var A_ranklast_weighted "DI";
label var B_ranklast_weighted "UI + looking for job" ;
label var C_ranklast_weighted "UI + not looking for job" ;
label var D_ranklast_weighted "Welfare + satisfied" ;

esttab using Freeloaders1.tex, replace booktabs fragment cells(mean(fmt(a3)) sd(par)) mlabel("Average rank assigned")
stats(N, label("Observations")) label nogaps collabels(none) wrap varwidth(24)  ;

eststo clear ;

eststo: estpost sum A_rankfirst_weighted B_rankfirst_weighted C_rankfirst_weighted D_rankfirst_weighted;

eststo: estpost sum A_ranklast_weighted B_ranklast_weighted C_ranklast_weighted D_ranklast_weighted;

esttab using Freeloaders2.tex, replace booktabs fragment cells(mean(fmt(a3)) sd(par)) mlabel("Pct who rank 1st" "Pct who rank last")
stats(N, label("Observations")) label nogaps collabels(none) wrap varwidth(24)  ;

eststo clear ;

eststo: estpost sum A_ranklast_weighted B_ranklast_weighted C_ranklast_weighted D_ranklast_weighted;

esttab using Freeloaders3.tex, replace booktabs fragment cells(mean(fmt(a3)) sd(par)) mlabel("Pct who assigned individual to last rank")
stats(N, label("Observations")) label nogaps collabels(none) wrap varwidth(24)  ;


*******************************************************************
*******************************************************************
** Construction of Appendix Table A.3.: Revealed Social Preferences
*******************************************************************
*******************************************************************

/*
For the tests, survey takers have to choose between two families, with a specific combination of income and tax rate. The pair of families they have to
chose from is drawn randomly from a set of 35 combinations of income and tax rate that are defined as follow:
1 : taxrate = 0.05 and income = 10000
2 : taxrate = 0.1 and income = 10000
3 : taxrate = 0.2 and income = 10000
4 : taxrate = 0.3 and income = 10000
5 : taxrate = 0.5 and income = 10000
6 : taxrate = 0.05 and income = 25000
7 : taxrate = 0.1 and income = 25000
8 : taxrate = 0.2 and income = 25000
9 : taxrate = 0.3 and income = 25000
10 : taxrate = 0.5 and income = 25000
11 : taxrate = 0.05 and income = 50000
12 : taxrate = 0.1 and income = 50000
13 : taxrate = 0.2 and income = 50000
14 : taxrate = 0.3 and income = 50000
15 : taxrate = 0.5 and income = 50000
16 : taxrate = 0.05 and income = 100000
17 : taxrate = 0.1 and income = 100000
18 : taxrate = 0.2 and income = 100000
19 : taxrate = 0.3 and income = 100000
20 : taxrate = 0.5 and income = 100000
21 : taxrate = 0.05 and income = 200000
22 : taxrate = 0.1 and income = 200000
23 : taxrate = 0.2 and income = 200000
24 : taxrate = 0.3 and income = 200000
25 : taxrate = 0.5 and income = 200000
26 : taxrate = 0.05 and income = 500000
27 : taxrate = 0.1 and income = 500000
28 : taxrate = 0.2 and income = 500000
29 : taxrate = 0.3 and income = 500000
30 : taxrate = 0.5 and income = 500000
31 : taxrate = 0.05 and income = 1000000
32 : taxrate = 0.1 and income = 1000000
33 : taxrate = 0.2 and income = 1000000
34 : taxrate = 0.3 and income = 1000000
35 : taxrate = 0.5 and income = 1000000

The families are then displayed in the following formatting : Family A|B  earns $X per year, pays $Y in taxes and hence nets out $Z.
For instance, if the pair 1|30 is chosen (display), then the survey taker will be asked (test) which Family is most deserving a 1000$ tax break between:
1/ Family A  earns $10,000 per year, pays $500 in taxes and hence nets out $9,500.
2/ Family B  earns $50,000 per year, pays $25,000 in taxes and hence nets out $25,000.
*/

*** Exploiting the rank order randomization; 
foreach var in display1 display2 display3 display4 display5 {; 
gen third_`var' = substr(`var',3,1); 
gen second_`var' = substr(`var',2,1); 
gen `var'1 = ""; 
gen `var'2 = ""; 
replace `var'1 = substr(`var',1,2) if third_`var' == "|"; 
replace `var'2 = substr(`var',4,2) if third_`var' == "|"; 
replace `var'1 = substr(`var',1,1) if second_`var' == "|"; 
replace `var'2 = substr(`var',3,2) if second_`var' == "|"; 
}; 

foreach var in display1 display2 display3 display4 display5 {; 
replace `var'1 = trim(`var'1); 
replace `var'2 = trim(`var'2); 
}; 

foreach var in display1 display2 display3 display4 display5 {; 
destring `var'1, replace; 
destring `var'2, replace; 
}; 


*** Transform those codes into actual income and tax rates for each choice; 

foreach j in 11 12 21 22 31 32 41 42 51 52 {; 
gen rate`j' = . ; 
replace rate`j' = 0.05 if (display`j' == 1 | display`j' == 6 | display`j' == 11 | display`j' == 16 | display`j' == 21 | display`j' == 26 | display`j' == 31); 
replace rate`j' = 0.1 if (display`j' == 2 | display`j' == 7 | display`j' == 12 | display`j' == 17 | display`j' == 22 | display`j' == 27 | display`j' == 32); 
replace rate`j' = 0.2 if (display`j' == 3 | display`j' == 8 | display`j' == 13 | display`j' == 18 | display`j' == 23 | display`j' == 28 | display`j' == 33); 
replace rate`j' = 0.3 if (display`j' == 4 | display`j' == 9 | display`j' == 14 | display`j' == 19 | display`j' == 24 | display`j' == 29 | display`j' == 34); 
replace rate`j' = 0.5 if (display`j' == 5 | display`j' == 10 | display`j' == 15 | display`j' == 20 | display`j' == 25 | display`j' == 30 | display`j' == 35); 
}; 

foreach j in 11 12 21 22 31 32 41 42 51 52 {; 
gen inc`j' = . ; 
replace inc`j' = 10000 if (display`j' == 1 | display`j' == 2 | display`j' == 3 | display`j' == 4 | display`j' == 5); 
replace inc`j' = 25000 if (display`j' == 6 | display`j' == 7 | display`j' == 8 | display`j' == 9 | display`j' == 10); 
replace inc`j' = 50000 if (display`j' == 11 | display`j' == 12 | display`j' == 13 | display`j' == 14 | display`j' == 15); 
replace inc`j' = 100000 if (display`j' == 16 | display`j' == 17 | display`j' == 18 | display`j' == 19 | display`j' == 20); 
replace inc`j' = 200000 if (display`j' == 21 | display`j' == 22 | display`j' == 23 | display`j' == 24 | display`j' == 25); 
replace inc`j' = 500000 if (display`j' == 26 | display`j' == 27 | display`j' == 28 | display`j' == 29 | display`j' == 30); 
replace inc`j' = 1000000 if (display`j' == 31 | display`j' == 32 | display`j' == 33 | display`j' == 34 | display`j' == 35);
}; 

foreach j in 1 2 3 4 5 {; 
gen choice_rate`j' = . ; 
replace choice_rate`j' = 0.05 if (test`j' == 1 | test`j' == 6 | test`j' == 11 | test`j' == 16 | test`j' == 21 | test`j' == 26 | test`j' == 31); 
replace choice_rate`j' = 0.1 if (test`j' == 2 | test`j' == 7 | test`j' == 12 | test`j' == 17 | test`j' == 22 | test`j' == 27 | test`j' == 32); 
replace choice_rate`j' = 0.2 if (test`j' == 3 | test`j' == 8 | test`j' == 13 | test`j' == 18 | test`j' == 23 | test`j' == 28 | test`j' == 33); 
replace choice_rate`j' = 0.3 if (test`j' == 4 | test`j' == 9 | test`j' == 14 | test`j' == 19 | test`j' == 24 | test`j' == 29 | test`j' == 34); 
replace choice_rate`j' = 0.5 if (test`j' == 5 | test`j' == 10 | test`j' == 15 | test`j' == 20 | test`j' == 25 | test`j' == 30 | test`j' == 35); 
}; 

foreach j in 1 2 3 4 5 {;
gen choice_inc`j' = . ;  
replace choice_inc`j' = 10000 if (test`j' == 1 | test`j' == 2 | test`j' == 3 | test`j' == 4 | test`j' == 5); 
replace choice_inc`j' = 25000 if (test`j' == 6 | test`j' == 7 | test`j' == 8 | test`j' == 9 | test`j' == 10); 
replace choice_inc`j' = 50000 if (test`j' == 11 | test`j' == 12 | test`j' == 13 | test`j' == 14 | test`j' == 15); 
replace choice_inc`j' = 100000 if (test`j' == 16 | test`j' == 17 | test`j' == 18 | test`j' == 19 | test`j' == 20); 
replace choice_inc`j' = 200000 if (test`j' == 21 | test`j' == 22 | test`j' == 23 | test`j' == 24 | test`j' == 25); 
replace choice_inc`j' = 500000 if (test`j' == 26 | test`j' == 27 | test`j' == 28 | test`j' == 29 | test`j' == 30); 
replace choice_inc`j' = 1000000 if (test`j' == 31 | test`j' == 32 | test`j' == 33 | test`j' == 34 | test`j' == 35);
}; 

foreach j in 11 12 21 22 31 32 41 42 51 52 {; 
gen tax`j' = rate`j' * inc`j'; 
}; 

foreach j in 1 2 3 4 5 {; 
gen choice_tax`j' = choice_rate`j'*choice_inc`j'; 
}; 

foreach j in 1 2 3 4 5 {; 
gen choice_rate`j'1 = choice_rate`j'; 
gen choice_rate`j'2 = choice_rate`j'; 
gen choice_inc`j'1 = choice_inc`j'; 
gen choice_inc`j'2 = choice_inc`j'; 
gen choice_tax`j'1 = choice_tax`j'; 
gen choice_tax`j'2 = choice_tax`j'; 
}; 

keep responseid rate* inc* tax* test* choice*; 

foreach j in 1 2 3 4 5 {; 
drop choice_rate`j'; 
drop choice_tax`j'; 
drop choice_inc`j'; 
}; 

sort responseid; 

reshape long inc tax choice_inc choice_tax, i(responseid) j(ranking);

gen selected = 0 ; 
replace selected = 1 if choice_inc == inc & choice_tax == tax;  

* Redefine covariates as deviations; 
gen pair = .; 
replace pair = 1 if ranking == 11 | ranking == 12; 
replace pair = 2 if ranking == 21 | ranking == 22; 
replace pair = 3 if ranking == 31 | ranking == 32; 
replace pair = 4 if ranking == 41 | ranking == 42; 
replace pair = 5 if ranking == 51 | ranking == 52; 

sort responseid pair; 
by responseid pair: egen inc_pair = total(inc); 
by responseid pair: egen tax_pair = total(tax); 
replace inc_pair  = inc_pair - inc; 
replace tax_pair  = tax_pair - tax; 

gen dinc = inc - inc_pair; 
gen dtax = tax - tax_pair; 
gen dnetinc = dinc - dtax; 

gen netinc = inc-tax; 
gen lnetinc = log(netinc); 
gen ltax = log(tax); 
gen lnetinc2 = lnetinc^2; 
gen ltax2 = ltax^2; 

foreach var in netinc tax dinc dtax dnetinc {; 
replace `var' = `var'/10000; 
 }; 


egen id = group(responseid); 
xtset id ranking; 

capture program drop myboot;
program myboot, rclass;
reg selected dtax dnetinc;
scalar define alpha1 = -_b[dtax]/_b[dnetinc] ;
return scalar alpha = alpha1;
end;

eststo clear ;
foreach var of varlist selected { ;
eststo: reg `var' dtax dnetinc;
local alpha= -_b[dtax]/_b[dnetinc] ;
estadd scalar alpha =  `alpha' ;
local mtr = 1/(1+`alpha'); 
estadd scalar mtr = `mtr'; 
estadd local droppedgroup "none" ; 

bootstrap alpha =r(alpha) , reps(40): myboot;
estat bootstrap, all;

keep if inc != 1000000 & inc_pair != 1000000; 
eststo: reg `var' dtax dnetinc ;
local alpha= -_b[dtax]/_b[dnetinc] ;
estadd scalar alpha =  `alpha' ;
local mtr = 1/(1+`alpha'); 
estadd scalar mtr = `mtr'; 
estadd local droppedgroup "above 1 mil" ; 

bootstrap alpha =r(alpha) , reps(40): myboot;
estat bootstrap, all;

keep if inc != 500000 & inc_pair != 500000 ; 
eststo: reg `var' dtax dnetinc ;
local alpha= -_b[dtax]/_b[dnetinc] ;
estadd scalar alpha =  `alpha' ;local mtr = 1/(1+`alpha'); 
estadd scalar mtr = `mtr'; 
estadd local droppedgroup "more than 500K"; 

bootstrap alpha =r(alpha) , reps(40): myboot;
estat bootstrap, all;

keep if inc != 10000 & inc_pair != 10000; 
eststo: reg `var' dtax dnetinc ;
local alpha= -_b[dtax]/_b[dnetinc] ;
estadd scalar alpha =  `alpha' ;
local mtr = 1/(1+`alpha'); 
estadd scalar mtr = `mtr'; 
estadd local droppedgroup "above 1 mil, below 10K";  

bootstrap alpha =r(alpha) , reps(40): myboot;
estat bootstrap, all;

} ;

label variable dtax "Delta(Tax)";
label variable dnetinc "Delta(Net Income)";
  
esttab using weights_effects_delta.tex, replace fragment booktabs keep(dtax dnetinc) label 
star(* .1 ** .05 *** .01) brackets se nomtitles stats(droppedgroup alpha mtr N, label("Excluded" "Implied Alpha" "Implied Optimal MTR" "Obs."))
mgroups("Probability of being more deserving", pattern(1 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ;

esttab using weights_effects_delta.csv, replace booktabs keep(dtax dnetinc) label 
star(* .1 ** .05 *** .01) brackets se nomtitles stats(droppedgroup alpha mtr N, label("Excluded" "Implied Alpha" "Implied Optimal MTR" "Obs."))
mgroups("Probability of being more deserving", pattern(1 0) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ;

cap log close;
