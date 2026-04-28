clear
clear matrix
set more off

*Please put the path where the new data set is stored in the next line 
cd "put path here"

*Please put the name of the new data set in the next line
import delimited "put name here.txt", clear 

rename v1 id
rename v2 year
rename v3 country
rename v4 married
rename v5 children
rename v6 wage_principal
rename v7 wage_spouse
rename v8 income_tax
rename v9 income_tax_p
rename v10 income_tax_s
rename v11 localtax
rename v12 statetax
rename v13 socsec
rename v14 socsec_p
rename v15 socsec_s
rename v16 benefit
rename v17 netincome
rename v18 netinc_wobenefit
rename v19 socsec_empr

ds, has(type string)
local stringvars "`r(varlist)'"


foreach var in `stringvars' {
	replace `var'="." if `var'=="NaN"
	destring `var', replace
}	

replace benefit=. if country==1

label define countryl 1"US" 2"Germany" 3"UK" 4"Italy" 5"France" 6"Netherlands" 7"Belgium" 8"Portugal"
label values country countryl

*Please insert the name that you want to use to save the new data set in .dta format here
save "choose name.dta", replace
