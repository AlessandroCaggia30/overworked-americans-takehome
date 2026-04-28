**************************** TABLES AND FIGURES CONSTRUCTION FOR *******************************
**************************** Optimal Taxation of Top Labor Incomes: **************************** 
**************************** A Tale of Three Elasticities **************************************

**************************** AUTHORS:************************************************************
***********                  Thomas Piketty, Emmanuel Saez and Stefanie Stantcheva          *****
*************************************************************************************************


**************************** DATE: **************************************************************
***********                  November 15th 2012  ************************************************
*************************************************************************************************

**************************** DESCRIPTION ********************************************************
***********                  This do file constructs the graphs from Figures 2, 3 and 4 and performs
***********                  the regressions reported in table 2
***********                  INPUT files: AllCountries_update_pre75.dta contains the data for all countries
***********                               the data is labeled
***********                  OUTPUT files: fig2A.wmf, fig2A.eps
***********                                fig2B.wmf, fig2B.eps
***********                                fig3A.wmf, fig3A.eps
***********                                fig3B.wmf, fig3B.eps
***********                                fig4A.wmf, fig4A.eps
***********                                fig4B.wmf, fig4B.eps
***********                                table2raw.xls, growth_percentiles.xls
*************************************************************************************************

set more off
set matsize 1000
cap log close

cd ...

use AllCountries_update_pre75.dta, clear
global yearstart=1960

keep if year>=$yearstart & year<=2010

**************************************************************************************************
**********                    CONSTRUCTING VARIABLES                              ****************
**************************************************************************************************

* Adding back a few missing obs in adult series
replace adults=adults[_n+1]-(adults[_n+2]-adults[_n+1]) if year==$yearstart & adults==.

* Extrapolating hours using first and last observation
gen hours2=hours
gen hours_present=(hours!=.)
bys country: egen aux=min(year) if hours!=.
bys country: egen minyear=max(aux) 
drop aux
bys country: egen aux=max(year) if hours!=.
bys country: egen maxyear=max(aux) 
drop aux
bys country: gen aux=hours if year==minyear
bys country: egen minhours=max(aux)
bys country: replace hours=minhours if year<minyear
drop aux
bys country: gen aux=hours if year==maxyear
bys country: egen maxhours=max(aux)
bys country: replace hours=maxhours if year>maxyear
drop aux
order country year hours hours2 hours_present minyear maxyear minhours maxhours

cap gen fullpop=1000000*gdp/gdpcap
cap gen ratpop=adults/fullpop
cap gen fullpop=0
cap gen ratpop=0

order country year adults fullpop ratpop

*** Constructing a marginal top tax rate containing only local and national Income taxes
* General rule MTR = 1 - (1- national income tax rate)*(1 - local income tax rate)
* Some countries who have 'other taxes' empty could have the local tax rates recorded in the top income tax rate - see Kleven, Landais and Saez (2011) for details
* Careful: Countries for which local taxes not deductible are:  Japan, Finland and Canada for them, MTR = 1 - (1 - national income tax rate - local income tax rate)
* Careful: Japan had a cap at 80% of income, we assume it is binding for the top earners;
* For France, the category 'other' taxes is deductible CSG, needs to be added; 

replace tax_other = 0 if tax_other == . 

***** SAEZ FIXING ADDITIONAL STUFF
replace tax_other=.154 if country == "Finland" & tax_other==0

gen retention = (1-inctax)
replace retention = (1-inctax)*(1-tax_other) if country == "United States"
replace retention = (1-inctax -tax_other) if country == "Japan" | country == "Finland" 

***** SAEZ FIXING ADDITIONAL STUFF
* include CSG in MTR for France
replace retention = (1-inctax)*(1-tax_other) if country == "France" 

gen mtr2 = 1- retention
replace mtr2 = 0.8 if (country == "Japan" & mtr2 >= 0.8 & year <= 1984)
replace mtr2 = 0.78 if (country == "Japan" & mtr2 >= 0.78 & year > 1984 & year <= 1987)
replace mtr2 = mtr if country == "Canada"

drop retention
drop mtr

rename mtr2 mtr

* drop if mtr == .
* drop if top1 == . 
* drop if gdpcap == .



sort country year


order country year mtr inctax tax_other gdpcap top1

** Calculating the initial and final 5 period averages. 

* For GDP per capita, we use the same period: $yearstart to 2010 included
* For top 1% share, we use the max available period per country

by country: gen year_initial=year[1] 
by country: gen year_final=year[_N]
gen span=year_final-year_initial-5

* Flag the first and final years with top 1 % share data for each country
* Construct two different changes in top MTR: mtr_initial_1 and mtr_final_1 are for the years for which we have top1% data
* mtr_initial and mtr_final are for the years $yearstart to 2010 and to be used in the growth regressions
* to get growth of 99% and 1%'s incomes, we also need an initial measure of GDP per capita and final measure based on years for which 1% data available
* those are called gdpcap_initial_1 and gdpcap_final_1

gen flag_top1 = .
replace flag_top1 = 0 if top1 == .
replace flag_top1 = 1 if top1 != .

sort flag_top1 country year

by flag_top1 country: gen top1_initial = (top1[1] + top1[2] + top1[3] +top1[4] +top1[5] )/5
by flag_top1 country: gen mtr_initial_1 = (mtr[1] + mtr[2] + mtr[3] + mtr[4] + mtr[5] )/5

by flag_top1 country: gen top1_final = (top1[_N-4] + top1[_N-3] + top1[_N-2] +top1[_N-1] +top1[_N] )/5
by flag_top1 country: gen mtr_final_1 = (mtr[_N-4] + mtr[_N-3] + mtr[_N-2] + mtr[_N-1] + mtr[_N] )/5

by flag_top1 country: gen gdpcap_initial_1 = (gdpcap[1] + gdpcap[2] + gdpcap[3] + gdpcap[4] + gdpcap[5] )/5
by flag_top1 country: gen gdpcap_final_1 = (gdpcap[_N-4] + gdpcap[_N-3] + gdpcap[_N-2] + gdpcap[_N-1] + gdpcap[_N] )/5

by flag_top1 country: gen year_initial_1=year[1] 
by flag_top1 country: gen year_final_1=year[_N]

replace year_initial_1 = . if flag_top1 == 0
replace year_final_1 = . if flag_top1 == 0

sort country year
by country: gen gdpcap_initial = (gdpcap[1] + gdpcap[2] + gdpcap[3] + gdpcap[4] + gdpcap[5] )/5
by country: gen gdpcap_final = (gdpcap[_N-4] + gdpcap[_N-3] + gdpcap[_N-2] + gdpcap[_N-1] + gdpcap[_N] )/5
by country: gen mtr_initial = (mtr[1] + mtr[2] + mtr[3] + mtr[4] + mtr[5] )/5
by country: gen mtr_final = (mtr[_N-4] + mtr[_N-3] + mtr[_N-2] + mtr[_N-1] + mtr[_N] )/5

sort country year

gen lntop1=log(top1)
gen lntop1_initial=log(top1_initial)
gen lntop1_final=log(top1_final)
gen dlntop1=log(top1_final)-log(top1_initial)
gen lnmtr=log(1-mtr)

* change in MTR for the years for which we have top1% data:
gen lnmtr_initial_1=log(1-mtr_initial_1)
gen lnmtr_final_1=log(1-mtr_final_1)
gen dlnmtr_1 =log(1-mtr_final_1)-log(1-mtr_initial_1)

gen lnmtr_initial=log(1-mtr_initial)
gen lnmtr_final=log(1-mtr_final)
gen dlnmtr=log(1-mtr_final)-log(1-mtr_initial)
gen dlngdpcap=log(gdpcap_final)-log(gdpcap_initial)

gen gdpgrowth=100*((gdpcap_final/gdpcap_initial)^(1/span)-1)

gen gdpgrowthbottom=100*((gdpcap_final_1*(1-top1_final)/(gdpcap_initial_1*(1-top1_initial)))^(1/span)-1)

gen lngdpcap=log(gdpcap)
gen lngdpcapbottom99=log(gdpcap*(1-top1)/.99)

replace mtr_initial_1=100*mtr_initial_1
replace mtr_initial=100*mtr_initial
replace top1_initial=100*top1_initial
replace mtr_final=100*mtr_final
replace mtr_final_1=100*mtr_final_1
replace top1_final=100*top1_final

gen dtop1=top1_final-top1_initial
gen dmtr_1=mtr_final_1-mtr_initial_1
gen dmtr=mtr_final-mtr_initial



* Generate growth variables for Figure 5B
gen lngdphour=log(gdphour)
cap drop lngdpcap_*
sort country year
by country: gen aux = log(gdpcap) if year==$yearstart
by country: egen lngdpcap_yearstart =mean(aux)
drop aux
by country: gen aux = log(gdphour) if year==$yearstart
by country: egen lngdphour_yearstart =mean(aux)
drop aux
egen lngdpcap_yearstart_avg = mean(lngdpcap_yearstart)
gen lngdpcap_yearstart_year = (lngdpcap_yearstart-lngdpcap_yearstart_avg) * (year-$yearstart)

egen lngdphour_yearstart_avg = mean(lngdphour_yearstart)
gen lngdphour_yearstart_year = (lngdphour_yearstart-lngdphour_yearstart_avg) * (year-$yearstart)

xi: reg lngdpcap lnmtr i.country year lngdpcap_yearstart_year, robust
gen lngdpcap_adj = lngdpcap - lngdpcap_yearstart_year*_b[lngdpcap_yearstart_year]
gen gdpcap_adj = exp(lngdpcap_adj)
sort country year
by country: gen gdpcap_adj_initial = (gdpcap_adj[1] + gdpcap_adj[2] + gdpcap_adj[3] + gdpcap_adj[4] + gdpcap_adj[5] )/5
by country: gen gdpcap_adj_final = (gdpcap_adj[_N-4] + gdpcap_adj[_N-3] + gdpcap_adj[_N-2] + gdpcap_adj[_N-1] + gdpcap_adj[_N] )/5
gen gdpgrowth_adj=100*((gdpcap_adj_final/gdpcap_adj_initial)^(1/span)-1)
gen dlngdpcap_adj=log(gdpcap_adj_final/gdpcap_adj_initial)

*********************************************************************************************************************************
*********************** CONSTRUCTING GRAPHS *************************************************************************************
*********************************************************************************************************************************
                              
replace country = "US" if country == "United States"
replace country = "UK" if country == "United Kingdom"
replace country = "NZ" if country == "New Zealand"

****************** FIGURE 2 ******************************************************************************************************




gen pos=3


replace pos = 12 if country == "Australia" 
replace pos = 2 if country == "Sweden" 
replace pos = 6 if country == "NZ"  | country=="Ireland"


reg lntop1_initial lnmtr_initial_1 if year==year_initial_1
twoway (scatter top1_initial mtr_initial_1, msize(medium) mcolor(blue) mlabel(country) mlabsize(small) mlabcolor(black) mlabv(pos)) ///
, xtitle(Top Marginal Tax Rate (%)) xscale(range(40 90)) xlabel(40(10)90) ///
ytitle(Top 1% Income Share (%)) yscale(range(4 18)) ylabel(4(2)18) ///
title("A. Top 1% Share and Top Marginal Tax Rate in 1960-4",color(black) position(12) size(large) justification(center) ring(20)) ///
ttext(  15 75 "Elasticity= .07 (.15)", box size(large) just(left) fcolor(white) margin(medsmall)) graphregion(fcolor(white))


cap graph export fig2A.wmf, replace
graph export fig2A.eps, replace




drop pos
gen pos = 3
replace pos = 6 if country == "Switzerland" | country=="Japan"
replace pos = 12 if country == "Portugal" | country=="Spain" 
replace pos = 12 if country == "Italy" 

reg lntop1_final lnmtr_final_1 if year==year_final_1
twoway (scatter top1_final mtr_final_1, msize(medium) mcolor(red) mlabel(country) mlabsize(small) mlabcolor(black) mlabv(pos)) ///
, xtitle(Top Marginal Tax Rate (%)) xscale(range(40 90)) xlabel(40(10)90) ///
ytitle(Top 1% Income Share (%)) yscale(range(4 18)) ylabel(4(2)18) ///
title("B. Top 1% Share and Top Marginal Tax Rate in 2005-9",color(black) position(12) size(large) justification(center) ring(20)) ///
ttext(  15 75 "Elasticity= 1.90 (.43)", box size(large) just(left) fcolor(white) margin(medsmall)) graphregion(fcolor(white))


cap graph export fig2B.wmf, replace
graph export fig2B.eps, replace




****************** FIGURE 3 ******************************************************************************************************

drop pos
gen pos = 3
replace pos = 11 if country == "Sweden" | country == "Ireland"
replace pos = 1 if country == "Switzerland"
replace pos = 6 if country == "NZ"


reg dlntop1 dlnmtr_1 if year==year_final_1
twoway (scatter dtop1 dmtr_1, msize(medium) mcolor(red) mlabel(country) mlabsize(small) mlabcolor(black) mlabv(pos)) ///
, xline(0) yline(0) xtitle(Change in Top Marginal Tax Rate (points)) xscale(range(-40 10)) xlabel(-40(10)10) ///
ytitle(Change in Top 1% Income Share (points)) yscale(range(0 10)) ylabel(0(2)10) ///
ttext(  9 -15 "Elasticity= .47 (.11)", box size(large) just(left) fcolor(white) margin(medsmall)) graphregion(fcolor(white))

* title("A. Changes Top 1% Share and Top Marginal Tax Rate",color(black) position(12) size(large) justification(center) ring(20)) ///

cap graph export fig3.wmf, replace
graph export fig3.eps, replace

drop pos
gen pos = 3
replace pos = 9 if country == "Portugal"
replace pos = 12 if country == "US"
replace pos = 6 if country == "Japan"
replace pos = 6 if country == "France"
replace pos = 12 if country == "Germany"
replace pos = 12 if country == "Italy"

****************** FIGURE 4 ******************************************************************************************************


reg dlngdpcap dlnmtr if year==$yearstart
twoway (scatter gdpgrowth dmtr, msize(medium) mcolor(red) mlabel(country) mlabsize(small) mlabcolor(black) mlabv(pos)) ///
,xtitle(Change in Top Marginal Tax Rate (points)) xscale(range(-40 10)) xlabel(-40(10)10) ///
ytitle(GDP per capita real annual growth (%)) yscale(range(1 4)) ylabel(1(1)4) ///
title("A. Growth and Change in Top Marginal Tax Rate",color(black) position(12) size(large) justification(center) ring(20)) ///
graphregion(fcolor(white))


cap graph export fig4A.wmf, replace
graph export fig4A.eps, replace


* New Figure 4B

cap drop pos
gen pos = 3

replace pos = 12 if country == "Netherlands"
replace pos = 12 if country == "Germany"
replace pos = 12 if country == "Norway"
replace pos = 6 if country == "Spain"
replace pos = 6 if country == "France"
replace pos = 3 if country == "Denmark"
replace pos = 9 if country == "Portugal"

reg dlngdpcap_adj dlnmtr if year==$yearstart
twoway (scatter gdpgrowth_adj dmtr, msize(medium) mcolor(red) mlabel(country) mlabsize(small) mlabcolor(black) mlabv(pos)) ///
,xtitle(Change in Top Marginal Tax Rate (points)) xscale(range(-40 10)) xlabel(-40(10)10) ///
ytitle(GDP per capita real annual growth (%)) yscale(range(1 4)) ylabel(1(1)4) ///
title("B. Growth (adjusted for initial 1960 GDP)",color(black) position(12) size(large) justification(center) ring(20)) ///
graphregion(fcolor(white))


cap graph export fig4B.wmf, replace
graph export fig4B.eps, replace


*/

*********************************************************************************************************************************************
****************** REGRESSIONS TABLE 2 ******************************************************************************************************
*********************************************************************************************************************************************

log using regressions.log, replace

* three time spans 1960-2010, 1960-1980, 1981-2010

matrix input resmat=(1960 2010 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  \ 1960 1980 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  \ 1981 2010 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)

* 2010,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\1960,1980,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0\1981,2010,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

foreach ii of numlist 1 2 3 {
global start=resmat[`ii',1]
global endt=resmat[`ii',2]
display $start
display $endt

* controlling for initial GDP;
cap drop lngdpcap_*
sort country year
by country: gen aux = log(gdpcap) if year==$start
by country: egen lngdpcap_yearstart =mean(aux)
drop aux
egen lngdpcap_yearstart_avg = mean(lngdpcap_yearstart)
gen lngdpcap_yearstart_year = (lngdpcap_yearstart-lngdpcap_yearstart_avg) * (year-$start)

#delimit;
*****************************************;
* PANEL A: effect of mtr on top share  ;         
*****************************************;
local jj=1;
reg lntop1 lnmtr if year>=$start & year<=$endt, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];
reg lntop1 lnmtr year  if year>=$start & year<=$endt, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];
xi: reg lntop1 lnmtr i.country  if year>=$start & year<=$endt, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];matrix resmat[`ii',`jj'+2]=e(N);
local jj=`jj'+3;
*****************************************;
* PANEL B: Effects of mtr on growth ;          
*****************************************;
reg lngdpcap lnmtr year if year>=$start & year<=$endt, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];
xi: reg lngdpcap lnmtr i.country year if year>=$start & year<=$endt, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];
reg lngdpcap lnmtr year lngdpcap_yearstart if year>=$start & year<=$endt, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];
reg lngdpcap lnmtr year lngdpcap_yearstart lngdpcap_yearstart_year if year>=$start & year<=$endt, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr]; 
xi: reg lngdpcap lnmtr i.country year lngdpcap_yearstart_year if year>=$start & year<=$endt, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];matrix resmat[`ii',`jj'+2]=e(N);

#delimit cr
}

matrix resmatb=resmat'
svmat resmatb
outsheet resmatb* if _n<=30 using table2raw.xls, replace

drop resmatb*

*********************************************************************************************************************************************
****************** Bootstrapping for robustness check for TABLE 2 
*********************************************************************************************************************************************

# delimit ; 

set seed 12342; 

mat resmat = J(500,20,0); 

sort country year; 
gen rank_base = _n; 

gen year2 = .; 
forv i = 1/47 {; 
replace year2 = 1959 + `i' in `i'; 
}; 

sort rank_base; 
gen country2 = .; 
* Note: allocation of countries to numbers is in excel file; 
forv i = 1/18 {; 
replace country2 = `i' in `i'; 
}; 

gen draws = 0 ; 
sort rank_base; 
forv i = 1/13 {; 
replace draws = 5 + `i' in `i'; 
}; 

* mkmat year2, nomissing; 
* mat B = matuniform(1,47); 
* mat C = A\B; 

forv ii = 1/500 { ; 
gen select = 0; 

	forv jj = 1/50 {; 
sort rank_base; 
gen rank = _n; 
gen random_num = uniform() if rank <= 47; 
replace random_num = 10 if rank >= 48; 
sort random_num;
drop random_num;  
drop rank; 
global year_first = year2[1]; 
global year_last = year2[2]; 
		if $year_last - $year_first >= 17 {; 
		continue, break; 
		};
      }; 

* Draw random number of countries; 
sort rank_base; 
gen rank = _n; 
gen random_num = uniform() if rank <= 13; 
replace random_num = 10 if rank >= 14; 
sort random_num;
drop random_num;  
drop rank; 
gen numberc = draws[1]; 

* Draw the countries; 
sort rank_base; 
gen rank = _n; 
gen random_num = uniform() if rank <= 18;
replace random_num = 10 if rank >= 19;  
sort random_num;
drop rank; 
gen rank = _n; 
drop random_num;  
gen country2_select = . ; 
gen countrydiff = rank - numberc; 
replace country2_select = country2 if countrydiff <= 0;
drop countrydiff rank numberc;
  
sort country year; 
gen select_year = 0; 
replace select_year = 1 if year <= $year_last & year >= $year_first;

gen select_country = 0; 
sort country2_select; 
forv xx = 1/18 {; 
gen countrytemp = country2_select[`xx']; 
gen countrydiff = countrynum - countrytemp; 
replace select_country = 1 if countrydiff <= 0.1 & countrydiff >= -0.1; 
drop countrytemp countrydiff; 
}; 

replace select = 1 if select_year == 1 & select_country == 1; 
drop select_year select_country country2_select; 

sort country year ; 
drop lngdpcap_*; 
by country: gen aux = log(gdpcap) if year==$year_first ; 
by country: egen lngdpcap_yearstart =mean(aux) ; 
drop aux; 
egen lngdpcap_yearstart_avg = mean(lngdpcap_yearstart); 
gen lngdpcap_yearstart_year = (lngdpcap_yearstart-lngdpcap_yearstart_avg) * (year-$year_first) ;

local jj=0;
cap noisily reg lntop1 lnmtr if select == 1, robust;
local jj=`jj'+1;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];
cap noisily reg lntop1 lnmtr year if select == 1, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];
cap noisily xi: reg lntop1 lnmtr i.country  if select == 1, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];matrix resmat[`ii',`jj'+2]=e(N);
local jj=`jj'+3;

*****************************************;
* PANEL B: Effects of mtr on growth ;          
*****************************************;
reg lngdpcap lnmtr year if select == 1, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];
xi: reg lngdpcap lnmtr i.country year if select == 1, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];
reg lngdpcap lnmtr year lngdpcap_yearstart if select == 1, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];
reg lngdpcap lnmtr year lngdpcap_yearstart lngdpcap_yearstart_year if select == 1, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr]; 
xi: reg lngdpcap lnmtr i.country year lngdpcap_yearstart_year if select == 1, robust;
local jj=`jj'+2;matrix resmat[`ii',`jj']=_b[lnmtr];matrix resmat[`ii',`jj'+1]=-_se[lnmtr];matrix resmat[`ii',`jj'+2]=e(N);

drop select; 
}; 

# delimit cr

matrix resmatb=resmat
svmat resmatb
outsheet resmatb* using temp.xls, replace

keep resmatb*

# delimit; 

mat summat = J(20,3,0); 

forv ii = 1/20 {; 
summ resmatb`ii', detail; 
matrix summat[`ii',1]=r(p50);matrix summat[`ii',2]=r(p5);matrix summat[`ii',3]=r(p95);
}; 

matrix summatb=summat; 
svmat summatb; 
outsheet summatb* using growth_percentiles.xls, replace; 



