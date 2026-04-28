**************************** TABLES AND FIGURES CONSTRUCTION FOR *******************************
**************************** Optimal Taxation of Top Labor Incomes: **************************** 
**************************** A Tale of Three Elasticities **************************************

**************************** AUTHORS:************************************************************
***********                  Thomas Piketty, Emmanuel Saez and Stefanie Stantcheva          *****
*************************************************************************************************


**************************** DATE: **************************************************************
***********                  November 15th 2012  *****************************************************
*************************************************************************************************

**************************** DESCRIPTION ********************************************************
***********                  This do file constructs the graphs from Figures 1 and performs
***********                  the regressions reported in table 1
***********                  INPUT files: usdata.dta contains the data for the US
***********                               the data is labeled
***********                  OUTPUT files: fig1A.wmf, fig1A.eps
***********                                fig1B.wmf, fig1B.wmf
*************************************************************************************************

* BASIC EARLY STATS FROM CDW FILES

clear
clear matrix
set mem 100m
set matsize 5000

cd ...

use usdata.dta, clear
rename top1per1 top1perc_nok
gen lnsh=log(top1perc)
gen lnsh_nok=log(top1perc_nok)
gen lnntr=log(1-topmtr)
gen t2=(year-1900)^2

* gen size=adults20/taxunits
* replace adults20=taxunits



gen gdpadult=(cpi*gdp/adults20)

gen incadult=(cpi*totinc_k/adults20)
gen incadulttop1=(top1perc/.01)*(cpi*totinc_k/adults20)
gen incadultbot99=((1-top1perc)/.99)*(cpi*totinc_k/adults20)

gen incadult_nok=(cpi*totinc_n/adults20)
gen incadulttop1_nok=(top1perc_nok/.01)*(cpi*totinc_n/adults20)
gen incadultbot99_nok=((1-top1perc_nok)/.99)*(cpi*totinc_n/adults20)

gen lnadult=log(incadult)
gen lnadulttop1=log(incadulttop1)
gen lnadultbot99=log(incadultbot99)
gen lngdpadult=log(gdpadult)
gen lnadult_nok=log(incadult_nok)
gen lnadulttop1_nok=log(incadulttop1_nok)
gen lnadultbot99_nok=log(incadultbot99_nok)

replace top1perc=100*top1perc
replace top1perc_nok=100*top1perc_nok
replace topmtr=100*topmtr
replace topmtr_k=100*topmtr_k

#delimit;
twoway connected top1perc year if year<=2008, clwidth(medthick) clcolor(black) mcolor(black) msymbol(d)  yaxis(1) ||
connected top1perc_nok year if year<=2008, clwidth(medthick) clcolor(black) mfcolor(white)  mcolor(black) msymbol(d) yaxis(1) ||
line topmtr year if year<=2008, c(l) yaxis(2) clcolor(red) clpattern(dash)  lwidth(medthick) ||
line topmtr_k year if year<=2008, c(l) yaxis(2) clcolor(red) clpattern(dot)  lwidth(medthick) 
ytitle("Top 1% Income Shares (%)",axis(1))  ytitle("Marginal Tax Rates (%)",axis(2)) 
 yscale(axis(1) range(0 25)) ylabel(0(5)25,axis(1)) yscale(range(0 100) axis(2))  ylabel(0(10)100,axis(2))
  xlabel(1913(10)2008)  xtitle("Year") xscale(range(1913 2008))  
  xline(1913 1923 1933 1943 1953 1963 1973 1983 1993 2003, lcolor(gs12))
  title("A. Top 1% Income Shares and Top MTR") graphregion(fcolor(white))
  legend(label(1 "Top 1% Share") label(2 "Top 1% (excl. KG)") label(3 "Top MTR") label(4 "MTR K gains")  cols(2) order(1 3 2 4) ring(0) pos(5) size(small));
graph export fig1A.wmf, replace;
graph export fig1A.eps, replace;

sum top1perc top1perc_nok topmtr if year>=1975 & year<=1979;
sum top1perc top1perc_nok topmtr if year>=2004 & year<=2008;

* Table 1B regressions;
tsset year;
newey  lnsh_nok lnntr if year<=2008, lag(8);
newey lnsh lnntr if year<=2008, lag(8);
newey  lnsh_nok lnntr year if year<=2008, lag(8);
newey lnsh lnntr year if year<=2008, lag(8);

gen incadult_n=100*incadult/incadult[1];
gen incadulttop1_n=100*incadulttop1/incadulttop1[1];
gen incadultbot99_n=100*incadultbot99/incadultbot99[1];

#delimit;
twoway connected incadulttop1_n year if year<=2008, clwidth(medthick) clcolor(black) mcolor(black) msymbol(d)  yaxis(1) ||
connected incadultbot99_n year if year<=2008, clwidth(medthick) clcolor(black) mfcolor(white)  mcolor(black) msymbol(d) yaxis(1) ||
line topmtr year if year<=2008, c(l) yaxis(2) clcolor(red) clpattern(dash)  lwidth(medthick) 
ytitle("Real Income per adult (1913=100)",axis(1))  ytitle("Marginal Tax Rate (%)",axis(2)) 
  yscale(range(0 500) axis(1))  ylabel(0(100)500,axis(1))
  yscale(range(0 100) axis(2))  ylabel(0(10)100,axis(2))
  xlabel(1913(10)2008)  xtitle("Year") xscale(range(1913 2008))  
  xline(1913 1923 1933 1943 1953 1963 1973 1983 1993 2003, lcolor(gs12))
  title("B. Top 1% and Bottom 99% Income Growth") graphregion(fcolor(white))
  legend(label(1 "Top 1%") label(2 "Bottom 99%") label(3 "Top MTR") cols(2) order(1 3 2) ring(0) pos(5) size(small));
graph export fig1B.wmf, replace;
graph export fig1B.eps, replace;

* Table 1C regressions;

newey  lnadulttop1 lnntr year if year<=2008, lag(8);
newey  lnadultbot99 lnntr year if year<=2008, lag(8);
newey  lnadult lnntr year if year<=2008, lag(8);


newey  lnadulttop1_nok lnntr year if year<=2008, lag(8);
newey  lnadultbot99_nok lnntr year if year<=2008, lag(8);
newey  lnadult_nok lnntr year if year<=2008, lag(8);

* additional regressions;
newey  lngdpadult lnntr year if year<=2008, lag(8);

newey  lnadultbot99 lnadulttop1 year (lnntr year) if year<=2008, lag(8);
newey  lnadultbot99_nok lnadulttop1_nok year (lnntr year) if year<=2008, lag(8);



