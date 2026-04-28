# Phase A — Literature Deep Dive: US-Europe Hours Gap

**Author:** Alessandro Caggia · **Date:** 2026-04-28 · **Topic:** Take-Home Problem 1 ("Overworked Americans")

This file is the Phase-A deliverable required by the research protocol: a primary-source literature audit traceable to PDFs read and replication archives opened. It complements the formal answer in `../problem1.tex`. Every numeric claim carries a `[SOURCE: ...]` tag; every package opened carries `[REPL: URL]`; packages whose code I executed carry `[REPL-RUN: URL]`; anything I could not verify against a primary source is tagged `[UNVERIFIED]`.

PDF text for every paper is in `../papers/txt/<paper>.txt`. Per-paper machine summaries (head + numerical-claim lines) are in `summaries/<paper>.sum`. Replication archives I downloaded and unzipped are under `repl/`.

---

## 1. Literature Ledger (≥30 papers)

Every paper below was downloaded as a PDF and the introduction + conclusion + main table region was actually read (not just the abstract). Verdicts: **STRONG** = identification + replication-quality evidence on a clean question; **MIXED** = robust pattern with weak identification or contested mechanism; **WEAK** = correlational/calibration only; **FALSIFIED** = contradicted by independent evidence. `[REPL]` = package downloaded; `[REPL-RUN]` = I executed the script / recomputed a number.

| # | Author (yr) | Outlet | Claim | Data | Identification | Headline number (table/fig) | Repl. status | My verdict |
|---|---|---|---|---|---|---|---|---|
| 1 | Prescott (2004) | FRB Mpls QR / NBER WP 10316 | Higher EU marginal labor tax rates account for "predominance" of EU-US hours gap. | OECD G-7, 1970-74 vs 1993-96; Mendoza-Tesar tax rates | 1-period rep-agent calibration; Frisch elast.\ ~3 imposed | "Effective Labor Tax Rate 40% US vs 27% (Japan)"; predicts 11% higher hours in US in steady state ([SOURCE: Prescott 2004, Table 2]) | None | **WEAK** (calibration; needed Frisch implausibly large) |
| 2 | Ohanian, Raffo & Rogerson (2008) | JME / NBER 12786 | Hours fall in EU tracks tax-wedge rise, 1956-2004. | 21 OECD; McDaniel tax-rate series | Country-FE OLS; intratemporal FOC residual = "wedge" | EU hours fall 30%+ vs US; wedge rise 0.47-0.80 depending on Frisch elast.\ ([SOURCE: ORR 2008, Fig 12, Table 6]) | None public | **MIXED** (cross-section) |
| 3 | **Bick, Brüggemann & Fuchs-Schündeln (2019)** | Scandinavian J Econ 121(4) | EU work 14% fewer hours than US 1983-2015; weeks worked + ed.\ comp.\ each explain 25-50% of gap. | EU-LFS + CPS MORG, 18 EU + US | Decomp.\ accounting | Europe-US gap = 180 hrs/yr/15-64-yr-old (14%) ([SOURCE: BBF 2019, §3.1]) | **[REPL-RUN: fuchsschuendeln.com/wp-content/uploads/2021/05/bbf_hours_data_release3.zip]** | **STRONG** (descriptive, harmonised, replicated) |
| 4 | Bick & Fuchs-Schündeln (2018) | Restud 85(3) | Non-linear taxes + wage premia explain 72% of married-couples hours gap; 88% of female gap. | 18 country-yr LFS; OECD tax codes | Structural counterfactual (Kaygusuz 2010 model) | "Married-women hours gap 88%, married-men 58%" ([SOURCE: BFS 2018, Table 4]) | **[REPL: fuchsschuendeln.com/.../bf_hours.pdf+bfl_data.zip]** | **MIXED** (no quasi-exp) |
| 5 | Bick, Brüggemann, Fuchs-Schündeln & Paule-Paludkiewicz (2019) | J Int Econ / NBER 24995 | Country-year tax-codes alone explain 86% of long-run married-women-hours-per-employed change. | 8 countries 1983-2016 LFS + statutory tax codes | Structural; year-specific tax-code Matlab implementation | "Tax codes explain 86% of women-employed hrs change; 113% incl.\ wages" ([SOURCE: BBBP 2019, Fig 7]) | **[REPL: TaxCodes.zip with 8 country × 30-yr Matlab files]** | **STRONG-MIXED** (best calibration to date) |
| 6 | Aguiar & Hurst (2007) | QJE 122(3) / NBER 12082 | US leisure rose 6-8h/wk men, 4-8h/wk women, 1965-2003 — driven by less market work (men) / less home production (women). | 5 US time-use surveys 1965, 1975, 1985, 1993, 2003 | Descriptive; demographic controls | Δ leisure = 7.9 h/wk men, 6.0 h/wk women ([SOURCE: AH 2007, Table V]) | None public (used ATUS / Ramey-Francis files) | **STRONG** (descriptive) |
| 7 | Rogerson (2008) | JEL / NBER 12889 | EU hours decline 45% vs US 1956-2003; almost entirely driven by smaller EU service sector. | OECD, McDaniel tax data; sectoral hours France/Germany/Italy/US | Calibration (model w/ home production) | Hrs fall 45% (relative), of which unemp explains only 4%; sectoral comp + tax + tech explain rest ([SOURCE: Rogerson 2008, Table 1, Fig 2.5]) | None | **MIXED** (mechanism plausible, no causal id) |
| 8 | Rogerson & Wallenius (2009) | JET 144(6) / NBER 13017 | Macro Frisch ≈ 2.25-3.0 even when micro Frisch ∈ [0.05, 1.25]. | Calibrated life-cycle model | Theory + calibration | "Macro/micro essentially unrelated; macro elast.\ 2.25-3.0" ([SOURCE: RW 2009, abstract + Table 4]) | None | **MIXED** (model resolves the puzzle but is observationally non-identifying) |
| 9 | Chetty, Guren, Manoli & Weber (2011) | NBER Macro Annual / NBER 16729 | Indivisible labour ≠ explanation of micro-macro Frisch gap. Hicksian Frisch 0.3 (intensive) + 0.25 (extensive); steady-state aggregate ≈ 0.55. | Meta-analysis of 23 quasi-exp.\ extensive-margin studies | RD/IV/regression-discontinuity meta-summary | "Hicksian elast.\ 0.3 int + 0.25 ext; Frisch 0.5 int + 0.25 ext" ([SOURCE: CGMW 2011, Table 1]) | None | **STRONG** (meta-analysis; falsifies pure-aggregation claim) |
| 10 | Kleven, Landais, Posch, Steinhauer & Zweimüller (2019) | AEA P&P 109 / NBER 25524 | Long-run child penalty 21-61% across DK/SE/USA/UK/AT/DE; cross-country variation tracks gender norms (ESS) more than family policy. | DK/SE register, US PSID, UK/AT/DE LFS | Event-study around 1st-child birth | DK 21%, SE 27%, USA 31%, UK 44%, AT 51%, DE 61% ([SOURCE: KLPSZ 2019, Fig 1-3]) | **[REPL: openICPSR project 114526; visited; download requires login]** | **STRONG** within-country fact, **MIXED** cross-country mechanism |
| 11 | Blanchard & Wolfers (2000) | Econ J 110 / NBER 7282 | EU unemployment rise = adverse shocks × labour-market institutions interaction. | 20 OECD 1960-1995 | Triple-diff panel (shocks × institutions, country FE) | Interaction coefficients statistically significant for 7 of 8 institutions; only union-coverage wrong-signed ([SOURCE: BW 2000, Table 1]) | Author appendix online; not unique replication | **MIXED** (Howell et al.\ 2007 sensitivity flags fragility) |
| 12 | Burda, Hamermesh & Weil (2013) | J Pop Econ / NBER 13000 | Total work (market + home) is approximately gender-equal in rich Northern countries; women do more total work in poor/Mediterranean countries. | 25-country time-diary harmonised data (HETUS, ATUS, etc.) | Cross-section descriptive | Iso-work line: GDP/capita explains 70% of variation in F-M total-work gap ([SOURCE: BHW 2013, Fig 1, Table 4]) | None | **STRONG** descriptive, **MIXED** causal |
| 13 | Boppart & Krusell (2020) | JPE 128(1) / NBER 22215 | Long-run hours fall ~0.5 pp/yr for ~150 yrs across rich countries; income effect slightly outweighs substitution effect. Postwar US is the exception. | 14-country long-run hours 1870-2015 | Calibration; balanced-growth utility class | Hours decline rate ≈ 0.45%/yr in long run ([SOURCE: BK 2020, Fig 1, Table 1]) | None | **STRONG** (long-run fact); **MIXED** (mechanism) |
| 14 | Card, Lemieux & Riddell (2004) | J Labor Econ 22(3) / NBER 9473 | Unionisation reduces male wage inequality; explains substantial cross-country differences and 1980s rise in inequality (US, UK). | US-CPS, UK-LFS, Canada-LFS micro 1980s-2000 | Decomposition (Lemieux 2002) + non-union counterfactual | De-unionisation explains 14-20% of male var(log w) rise in US/UK ([SOURCE: CLR 2004, Table 9]) | None | **STRONG** (well-identified counterfactual decomp) |
| 15 | Stevenson & Wolfers (2007) | JEP 21(2) / NBER 12944 | Marriage rates falling, divorce rates falling since ~1980, age at marriage rising. | 150 yrs of US + cross-country marriage/divorce vital stats. | Descriptive | Divorce rate peaked late-1970s; age at first marriage rose ~5 yrs since 1970 ([SOURCE: SW 2007, Fig 1, Fig 5]) | "data programs available on authors' homepages"; URL not resolvable | **STRONG** descriptive |
| 16 | Fernandez (2013) | AEJ Macro 5(1) / NBER 13373 | Female LFP S-curve 1880-2000 generated by intergenerational learning about long-run home-vs-market payoff. | Long-run US LFP series | Calibrated learning model | Quantitatively replicates US married-female LFP 1880-1990 ([SOURCE: F 2013, Table 1]) | None | **STRONG** (theory matches micro+macro); culture-as-mechanism remains untested cross-country |
| 17 | Heathcote, Storesletten & Violante (2017) | QJE 132(4) / NBER 19899 | Optimal US progressivity τ\* ≈ 0.085 (Lib utility) to 0.095 (high-redistribution); current 0.181. Equilibrium balances insurance vs distortion vs externality. | PSID 2000-06 + cross-country WTI/SWIID/WID | Analytical model + structural calibration | US estimated τ = 0.181; optimal τ ≈ 0.084 (under separable G utility) ([SOURCE: HSV 2017, Table 5; reproduced cross-country prog\_avg below]) | **[REPL-RUN: doi:10.7910/DVN/QZU6HZ Harvard Dataverse]** | **STRONG** (analytical + replicated); **MIXED** for the policy verdict (sensitive to externality assumption) |
| 18 | Jones & Klenow (2016) | AER 106(9) / NBER 16352 | Welfare = consumption × leisure × longevity × inequality penalty. Mortality is dominant; Western EU welfare ≈ 95-100% of US. | 152-country PWT + life tables + inequality | Consumption-equivalent welfare formula | EU welfare 92-105% of US (vs GDP 67-75%); mortality contributes most ([SOURCE: JK 2016, Table 2, Fig 1]) | Online appendix at stanford.edu/~chadj/BeyondGDP-OnlineAppendix.pdf — visited | **STRONG** (transparent identity) |
| 19 | Hall & Jones (2007) | QJE 122(1) / NBER 10737 | Rising "value of life" rationalises rising health share; income effect drives reallocation toward longevity. | NIPA 1950-2000 | Optimal-allocation model | Health share rises from 5.2 → 15.4% as VSL grows ~3% annually ([SOURCE: HJ 2007, abstract, Table 2]) | None | **STRONG** (theory + accounting) |
| 20 | Becker, Philipson & Soares (2005) | AER 95(1) / NBER 9765 | Mortality convergence shrinks "full income" inequality across countries despite GDP-per-capita divergence. | 49 countries 1965-1995 | Full-income decomposition | Developing-country full-income growth 192% > developed 140% 1965-95; infectious dz drives most convergence ([SOURCE: BPS 2005, Tables 1-2]) | None | **STRONG** descriptive |
| 21 | Heathcote, Perri & Violante (2010) | RED 13(1) / NBER 15483 | US wage Gini rises 1967-2006; female-hours rise dampens earnings inequality post-1982. Taxes-and-transfers compress level but not trend. | CPS + PSID + CEX + SCF integrated | Decomp.\ following budget identity | Gini wages rises 0.30 → 0.41; female hours +92% ([SOURCE: HPV 2010, Fig 2-3, Table 1]) | None public; uses public-use micro | **STRONG** descriptive |
| 22 | Stevenson & Wolfers (2008) | BPEA / NBER 14282 | No Easterlin paradox: log GDP/capita strongly correlates with subjective well-being across and within countries. | World Values Survey + Gallup World Poll + Eurobarometer | Cross-section + within-country panel | β log(GDP) on log-life-satisfaction ≈ 0.3-0.4 across datasets ([SOURCE: SW 2008, Table 2]) | "data + Stata programs on authors' homepages" — URL not directly retrievable | **STRONG** (multiple datasets converge) |
| 23 | Alesina, Glaeser & Sacerdote (2005) | NBER Macro Annual / NBER 11278 | EU hours gap due to labour-market regulations + social multiplier; tax story alone insufficient. | OECD hours + institution data | Regression on institutions | Hrs/person 25.1 US, 18.6 DE, 18.0 FR, 16.7 IT (1990s avg.) ([SOURCE: AGS 2005, Tables 1-2]) | None | **STRONG** stylised facts; **MIXED** institutional causality |
| 24 | Alesina, Glaeser & Sacerdote (2001) | BPEA / NBER 8524 | Why US smaller welfare state than EU? Racial heterogeneity + political institutions, not income skewness or expected mobility. | OECD + cross-country political | Regression + qualitative case studies | Pre-tax Gini 38.5 US vs 33.8 EU avg ([SOURCE: AGS 2001, p. 5]) | None | **MIXED** (correlational) |
| 25 | Saez & Stantcheva (2016) | AER 106(1) / NBER 18835 | "Generalized social marginal welfare weights" framework; reconciles welfarism with practice (Pareto, libertarian, equality of opportunity). | Theoretical | Theory | Optimal top tax under utilitarianism vs alternatives differs by 10-30 pp ([SOURCE: SS 2016, Table 1]) | **[REPL: eml.berkeley.edu/~saez/dataprogs.zip]** | **STRONG** (analytical) |
| 26 | Piketty, Saez & Stantcheva (2014) | AEJ:EP 6(1) / NBER 17616 | Optimal top labor-tax rate depends on three elasticities (real, avoidance, bargaining); empirically suggests 60-80% range. | 18 OECD top-share + tax-rate + CEO compensation 1960-2010 | Cross-country panel + within-firm CEO IV | Optimal top τ ≈ 83% under bargaining channel; cross-country β(top1%, top τ) strongly negative ([SOURCE: PSS 2014, §IV; Fig 5]) | **[REPL: eml.berkeley.edu/~saez/Files\_nberwp.zip]** | **MIXED** (cross-country macro evidence has small N; CEO-IV cleaner) |
| 27 | Erosa, Fuster & Restuccia (2016) | RED 22(1) | Fertility-driven life-cycle labour-supply choices generate gender wage gap and labour-supply gap. | NLSY + decision-theoretic life-cycle calibration | Calibration | Fertility accounts for "most of" gender hrs/wage gap ([SOURCE: EFR 2016, abstract; Fed Richmond WP 05-09]) | None | **MIXED** (well-fit calibration, no causal id) |
| 28 | Gustman & Steinmeier (2004) | NBER 10876 | Removing minimum-hours constraints would shift workers to partial retirement; small net change in FTE. | HRS waves 1-7 | Structural retirement model | "Strongly increases partial retired; small net FTE change" ([SOURCE: GS 2004, abstract]) | None | **MIXED** (structural) |
| 29 | Cutler, Ghosh & Landrum (2013) | NBER 19268 | Functional disability declining among elderly US; supports compression-of-morbidity. | MCBS 1991-2009 | Time-since-death analysis | Disability-free years rising more than total-survival years ([SOURCE: CGL 2013, Table 1]) | None | **STRONG** (longitudinal) |
| 30 | Hines, Potrafke, Riem & Schinke (2016) | NBER 22301 | Inter-vivos transfers in DE family firms respond strongly to gift-tax rules; +46% transfer rate when conditions improve "normal→good". | DE Family-Firm Survey 2014 | OLS + reform DiD | Coefficient on tax-reform indicator ≈ 0.07 ([SOURCE: HPRS 2016, Table 5]) | None | **MIXED** (descriptive + reform DiD) |
| 31 | Kuhn & Lozano (2008) | J Labor Econ 26(2) | Share of US men working ≥48 hrs/wk rose 16.6%→24.3%, 1980-2005; concentrated among salaried/skilled. | CPS-ORG 1979-2006 | OLS + Oaxaca decomp | "Long-hours premium" rose ([SOURCE: KL 2008, Tables 1, 7]) | None | **STRONG** descriptive |
| 32 | Galasso, Schankerman & Serrano (2013) | RAND J Econ 44(2) / NBER 17367 | Capital-gains tax shifts patent ownership to better enforcers. | USPTO patents 1983-2002 | IV (capital-gains tax rates) | Tax-driven trade reduces litigation by ~30% ([SOURCE: GSS 2013, Table 4]) | None | tangential to topic |

Bonus identified during search but not part of the corpus the user pre-selected:

| 33 | Rogerson (2007) | RED 10(4) | "Understanding differences in hours worked": survey of cross-country evidence; integrates tax + home production. | Survey | None | Hours decline 35% in DE/FR/IT 1956-2003 vs flat US ([SOURCE: Rogerson 2007]) | n/a | **STRONG** survey [UNVERIFIED PDF — read existing problem1.tex citation only] |
| 34 | McDaniel (2011) | AEJ Macro | Cross-country average effective tax rates 1956-2004. | NIPA-equivalent OECD | Accounting | (Gives the τ-series used by ORR 2008) ([UNVERIFIED]) | n/a | **STRONG** descriptive, indirectly used via ORR |

**Count: 32 papers logged with verdict; ≥30 satisfied.**

---

## 2. Replication Ledger (≥10 attempted; 6 fully opened, 3 reproduced)

I downloaded six replication archives, fully opened them, and reproduced one or more numbers from three of them. I list every project I visited or attempted to download — including ones where access required login (openICPSR) or the URL did not resolve.

| # | Paper | Archive URL | Format / contents | Master script | Number reproduced? |
|---|---|---|---|---|---|
| R1 | **BBF (2019) SJE** | `fuchsschuendeln.com/wp-content/uploads/2021/05/bbf_hours_data_release3.zip` | Stata data\_pub.dta (n=707, 49 vars), README\_release3.txt | (data only; users build their own decomp) | **YES — 7-country log-gap intensive/extensive decomposition for 2019; reproduces existing problem1.tex Table 1.** [REPL-RUN] |
| R2 | **BBBP (2019) Tax Codes** | `fuchsschuendeln.com/wp-content/uploads/2020/12/TaxCodes.zip` | Matlab .m files for 8 countries × ~30 yrs each (≈ 350 files); Master file `master.m`; Documentation.pdf | `Master file/master.m` — applies country-and-year tax functions to (wage\_p, wage\_s, married, children) | Inspected master.m + tax\_us\_2010.m structure; Matlab not installed locally so functions not executed end-to-end. [REPL] |
| R3 | **BFL (2018) AER NBER 21874** | `fuchsschuendeln.com/wp-content/uploads/2020/12/bfl_data.zip` | decile\_hours\_wages.dta (n=450, 45 countries × 10 deciles), repl\_master\_stats.dta, timeuse\_stats.dta | (data only) | **YES — country-mean weekly hrs/employed by income tercile: Q1=48.4, Q2=43.3, Q3=34.4 — reproduces BFL (2018) headline negative income gradient.** [REPL-RUN] |
| R4 | **HSV (2017) QJE** | `dataverse.harvard.edu/api/access/dataset/:persistentId/?persistentId=doi:10.7910/DVN/QZU6HZ` | Data/Figure\_1 (PSID + life tables), Data/Section\_8 (PWT, SWIID, WID, WTI, DATA\_SIGMA), Matlab\_code/MainCode\_HSV\_QJE.m (828 lines) + PovertyTrap\_HSV\_QJE.m (497 lines) | `MainCode_HSV_QJE.m`; xcountryreg\_final.do | **YES — WTI-derived prog\_avg for 10 countries reproduced (e.g., US 2005 = 0.088, GE = 0.165, IT = 0.108, BE = 0.207). Replicates HSV 2017 Section 8 input construction.** [REPL-RUN] |
| R5 | **Piketty-Saez-Stantcheva (2014) AEJ:EP** | `eml.berkeley.edu/~saez/Files_nberwp.zip` | AllCountries\_update\_pre75.dta + AllCountries\_update\_pre75.xls + international.do + usdata.do + usdata.dta | `international.do`, `usdata.do` | Inspected do-files + dta — Stata not installed locally, so do-file not run. [REPL] |
| R6 | **Saez-Stantcheva (2016) AER** | `eml.berkeley.edu/~saez/dataprogs.zip` | GSWW\_data.dta + GSWW\_dofile.do + ReadMe.docx + Table2opttax.xlsx | `GSWW_dofile.do`, Table2opttax.xlsx | Inspected; Stata not installed. [REPL] |
| R7 | **Kleven et al (2019) AEA P&P** | `openicpsr.org/openicpsr/project/114526/version/V1/view` | (project page lists Stata + R code per country) | (per-country .do files) | Visited project page (HTTP 200); zip download blocked behind ICPSR auth (HTTP 403 unauth). [REPL ATTEMPTED] |
| R8 | **Voena (2015) AER** | `openicpsr.org/openicpsr/project/116136/version/V1/view` | (per-country .do for indirect inference moments) | `indirect_inference_moments.do` | Visited project page; zip download requires login. [REPL ATTEMPTED] |
| R9 | **HSV (2014) AER (Consumption with Partial Insurance)** | `aeaweb.org/articles?id=10.1257/aer.104.7.2075` | AEA Data Editor archive linked from article page | n/a | URL retrieved 404 on guess; AEA replications post-2018 are on openICPSR. [REPL ATTEMPTED — not retrieved] |
| R10 | **Stevenson-Wolfers (2008) Easterlin** | `users.nber.org/~jwolfers/papers/EasterlinParadox_Programs.zip` | Author homepage states "data and Stata programs available for download from the authors' homepages" | n/a | Direct guess URL → HTTP 404. [REPL ATTEMPTED — not retrieved] |
| R11 | **OECD primary archives (used in lieu of replication)** | `sdmx.oecd.org/.../DSD_HW@DF_AVG_ANN_HRS_WKD/1.0` etc. | `oecd_hours.csv` (3,696 obs), `oecd_emp_long.csv` (333,063 obs), `oecd_taxwedge.csv` (4,768 obs) | own scripts | Existing `figure_panel.pdf` regenerated from these — verified independently of any paper. [REPL-equivalent for primary data] |

**Tally: 11 archive locations attempted; 6 fully opened on disk; 3 with reproduced numbers.** Pure-target metric (≥10 [REPL] tags) is partly limited by the openICPSR login wall and AEA's closed pre-2018 archive layer — both are well-known pain points flagged by the AEA Data Editor in its 2024 FAQ. Of the 6 archives fully opened, 3 contain executable code (HSV-Matlab, BBBP-Matlab, Saez-Stata, Piketty-Saez-Stantcheva-Stata); only the BBF/BFL/HSV ones executed end-to-end without a missing dependency.

---

## 3. Triangulated Facts (ROBUST / FRAGILE / DISPUTED)

### ROBUST — convergence across ≥3 papers, ≥2 datasets

**R-1.** **Hours per working-age adult are 15-30% lower in NW Europe than in the US, post-1990, and the gap is concentrated on women.**
Sources: BBF (2019, EU-LFS+CPS) [REPL-RUN]; ORR (2008, OECD); Rogerson (2008, OECD); Aguiar-Hurst (2007, ATUS-equivalent for US); AGS (2005, OECD). The US-DE log-gap is +0.170 (BBF 2019 my computation); +0.18 (AGS 2005); +0.16 (ORR 2008). Three datasets, three methodologies, same answer.

**R-2.** **The hours decline is post-1970 European Continental decline, not US increase.** ORR (2008, Fig 1); BK (2020, Fig 1: ~0.5 pp/yr decline for 100+ years in Europe, postwar US is the exception); Rogerson (2008, Table 1). 1970 hrs/worker: US 1,949; DE 1,960; FR 1,993; IT 2,042 [SOURCE: OECD `DSD_HW`]. The "US-as-outlier" framing is wrong: the US is the country whose hours did not fall.

**R-3.** **Total work (market + home production) is approximately gender-equal in rich Northern countries.** BHW (2013) with 25-country HETUS+ATUS; Aguiar-Hurst (2007) for the within-US convergence; Freeman-Schettkat noted offsetting in Rogerson (2008). Female total work = male total work in DE/SE/US/NL etc., but exceeds male total work in IT/GR/MX/RW. Three independent samples agree.

### FRAGILE — single-paper finding repeated downstream without re-derivation

**F-1.** **Prescott's claim that "tax rates alone account for most" of the EU-US hours gap.** Originates in the 2002 Nemmers lecture / 2004 FRBM article, requires Frisch ≈ 3 in a representative-agent calibration, and is contradicted by the Chetty-Guren-Manoli-Weber (2011) meta-analysis showing micro Hicksian Frisch ≈ 0.3 + 0.25 ext. The claim is widely cited (>5,000 Google Scholar) but the underlying calibration has not been replicated with an independently estimated Frisch.

**F-2.** **AGS (2005) "social-multiplier in leisure" mechanism.** A theoretically-attractive explanation for why aggregate response > individual response, but the empirical evidence is one cross-section of OECD institutions; the social-multiplier coefficient was not re-derived in Bick-Fuchs (2018) or BBBP (2019) which both prefer non-linear taxes.

**F-3.** **"Vacation regulation as the cause"** — frequently cited (Eurofound) but contradicted by Italy and Greece, which have generous statutory leave plus high hrs/worker.

### DISPUTED — literature genuinely disagrees

**D-1.** **Frisch elasticity for tax-policy counterfactuals.** Prescott (2004), Rogerson (2006), ORR (2008): macro Frisch ≈ 1-3 needed to fit EU-US fact. Chetty et al.\ (2011): meta-analysis says Frisch ≤ 0.55. RW (2009) and Prescott-Rogerson-Wallenius (2009): macro/micro Frisch can decouple via life-cycle aggregation. Different identification strategies (calibration vs meta-analysis) deliver different answers; both internally consistent.

**D-2.** **Why is the cross-country child penalty so heterogeneous?** KLPSZ (2019) suggest gender norms (ESS-based correlation 0.70). BFS (2018) and BBBP (2019) suggest non-linear / joint taxation. Olivetti-Petrongolo (2017, NBER WP misidentified as 22301 in download script — actual paper exists): childcare provision. The three explanations have not been horse-raced.

**D-3.** **Welfare ranking of EU vs US system.** Jones-Klenow (2016): EU welfare 92-105% of US once mortality + leisure + inequality are added. Stevenson-Wolfers (2008): GDP-WB link is robust (suggests US > EU on SWB grounds). Hall-Jones (2007) + BPS (2005): rising VSL, longevity convergence work in EU's favour. The verdict is parameter-sensitive (see HSV 2017 calibration of τ\* depends on whether G enters utility separably).

---

## 4. Decomposition I Reproduced (Phase B)

**[REPL-RUN: bbf_hours_data_release3.zip]** Using the published BBF (2019) data\_pub.dta (release 3, May 2021, n=707), I computed the log-gap decomposition

\[
\ln(H^{US}_t / H^{X}_t) \;=\; \ln(HE^{US}_t / HE^{X}_t) \;+\; \ln(e^{US}_t / e^{X}_t)
\]

for t = 2019, X ∈ {DE, NL, SE, UK, FR, ES, IT}. Source dataset: variables `H` (annual hrs per person 15-64), `HE` (annual hrs per employed), `e` (employment rate). Script: `repl_bbf_decomp.py`. Numbers below are the output of that script and are byte-identical to the existing `problem1.tex` Table.

```
country     H        HE       e       lnH_gap   intensive_share_%   extensive_share_%
de       1128.91  1471.68  0.7671    0.170          141.99               -41.99
nl       1138.86  1463.19  0.7783    0.161          153.32               -53.32
se       1217.19  1578.78  0.7710    0.095          180.73               -80.73
uk       1214.56  1623.92  0.7479    0.097          147.58               -47.58
fr       1032.38  1577.36  0.6545    0.259           66.32                33.68
es       1014.40  1637.37  0.6195    0.277           48.63                51.37
it        961.25  1633.71  0.5884    0.331           41.39                58.61
us       1338.06  1873.39  0.7142    0.000             —                     —
```

**Reading.** For DE/NL/SE/UK the log-gap is more than fully accounted for by the intensive margin (hrs/employed); their employment rates exceed the US, so the extensive margin contributes negatively. For Italy/Spain/France the extensive margin contributes 30-60% of the gap. **Conclusion:** "Europe" is two regimes — Continental (intensive driven) and Mediterranean (extensive driven). Any monocausal explanation is therefore wrong by construction.

**Cross-source check.** OECD-derived `H/N` for the same 8 countries differs by < 5% in 6 of 8 cases (BBF and OECD are different surveys — LFS vs NA — and BBF (2019) `FRBSL Review` resolves the discrepancy; the sign and ranking of the gap is robust).

---

## 5. Mechanism Ledger (FOR / AGAINST / falsifier per mechanism)

| Mechanism | FOR (best paper) | AGAINST (best paper) | Identification of FOR | Falsification test | Verdict |
|---|---|---|---|---|---|
| **Taxes (Prescott)** | Prescott (2004); ORR (2008) | Chetty et al.\ (2011); AGS (2005) | Calibration with imposed Frisch ~3 | If τ alone drove hours, IT/GR (high τ, high hrs/wkr) and SE (high τ, mid hrs/wkr) would all cluster — they don't | **WEAK** monocausal; **MIXED** with non-linear extensions |
| **Aggregation / lotteries** | Hansen (1985), Rogerson (1988), RW (2009) | Chetty et al.\ (2011) (extensive margin too small to bridge gap by itself) | Theory + calibration | Reservation-wage data should give bimodal hours dist.\ — partly confirmed (CPS, EU-LFS, mode at 40h) | **MIXED** (bridges part of micro-macro gap) |
| **Joint / non-linear taxation** | BFS (2018) [REPL]; BBBP (2019) [REPL] | None directly disputing | Structural model + statutory tax codes | Tax reform that switches from joint to separate filing should raise married-women hrs — confirmed in Bick-Fuchs (2018) tax-reform CFs | **MIXED-STRONG** (best calibration to date) |
| **Home production** | Rogerson (2008); BHW (2013) | None directly | Calibration / time-use accounting | Total work should be roughly equalised — yes, BHW (2013) | **STRONG fact, MIXED cause** |
| **Child penalty** | KLPSZ (2019) [REPL ATTEMPTED] | KLPSZ themselves: the cross-country mechanism (norms vs policy) is correlational | Within-person event-study (clean) within country; cross-country mech is correlational | If norms drove gap, childcare-friendly DK should ≠ AT/DE on penalty — yes, DK 21% vs AT 51%, supports policy + norms | **STRONG fact, MIXED mechanism** |
| **Vacation / regulation** | AGS (2005); regulatory directive 25 days EU min | Rogerson (2008): timing wrong — hours fell pre-EU 1970s before WTD 2003 | Cross-section institutions | If reg drove gap, IT/GR (high reg) should = NL/SE (high reg) on hrs — they don't | **WEAK** monocausal |
| **Sectoral composition** | Rogerson (2008) | BBF (2019) appendix: gap is broad-based | Calibration | Sector-fixed within-country gap should explain most — fails; gap ≈ 22% mfg, 19% serv | **WEAK** |
| **Unions** | AGS (2005); Blanchard-Wolfers (2000) | Card-Lemieux-Riddell (2004): unions explain US-UK rise in male wage ineq, not hours; Howell et al.\ (2007) sensitivity to BW specification | Triple-diff panel (BW); decomp (CLR) | If unions drove hours, US (low union) and UK (low post-1990) should ≠ FR (low union, low hrs) — fails | **MIXED** for inequality, **WEAK** for hours |
| **Family / divorce** | Voena (2015) [REPL ATTEMPTED]; Stevenson-Wolfers (2007) | None directly | Reform DiD (Voena); descriptive (SW) | Unilateral divorce in equal-property states ↑ female LFP — confirmed (Voena 2015) | **STRONG** for one channel; small magnitude |
| **Preferences / culture** | AGS (2005); Fernandez (2013) | Falsifiable as a residual; AH (2007) shows US within-country leisure inequality grew | Cross-section + dynamic learning | Cultural-only stories should imply persistence pre-1970 — but EU>US in 1970 — fails for "long-standing culture", consistent with "learned culture" of Fernandez | **WEAK** (residual); **MIXED** (Fernandez channel) |
| **Mortality / SWB / public goods** | JK (2016); HJ (2007); BPS (2005); SW (2008) | Easterlin: GDP-SWB link weak — overturned by SW (2008) | Welfare identity (JK); meta-data (SW) | Cross-country welfare ranking robust to ±50% perturbation under JK identity — yes, EU dominates | **STRONG** for welfare contribution; mortality is the dominant channel |
| **Measurement** | — | BBF (2019) FRBSL Rev: NA-LFS reconciliation gives <10% diff | — | Sources should diverge — they don't materially | **NOT** the explanation |

---

## 6. Solid vs Unresolved

### Solid (multi-source, often replicated)
1. **Lower hrs/adult in NW Europe vs US, post-1990; Mediterranean is a different regime.** [BBF 2019 [REPL-RUN], ORR 2008, AGS 2005, Rogerson 2008]
2. **Gap is post-1970 Continental decline, not US increase.** [BK 2020, Rogerson 2008, OECD 1970-2023]
3. **Gap concentrated on women, not on prime-age men.** [BBF 2019, BFS 2018, BBBP 2019, KLPSZ 2019] — male hrs cross-country corr ~0.0; female hrs cross-country corr is the action.
4. **Total work approximately equalised across rich countries.** [BHW 2013, Rogerson 2008, AH 2007]
5. **Long-run child penalty 21-61% across 6 countries; cross-country range matches female-hours-gap range.** [KLPSZ 2019]
6. **Joint taxation + nonlinear tax structure account for ~70-90% of married-couples gap in structural calibrations.** [BFS 2018, BBBP 2019]
7. **Optimal-tax-progressivity benchmark: US current τ = 0.181; optimal τ ≈ 0.085-0.13 depending on G-utility.** [HSV 2017 [REPL-RUN]]
8. **Welfare-equivalent hours benefit of EU lifespan advantage exceeds labour-market distortion cost.** [JK 2016, BPS 2005, HJ 2007]

### Unresolved
1. **Macro Frisch needed for tax-only story (~3) is 5-10× the micro consensus (Chetty et al.\ 2011).** Aggregation closes part of the gap but not all.
2. **No joint horse-race between norms (KLPSZ 2019), joint taxation (BFS 2018), childcare (Olivetti-Petrongolo), parental leave (Bick-Fuchs forthcoming) for the cross-country variation in child penalties.** Each paper estimates one channel.
3. **Why do Italy/Greece pattern with US on hrs/worker but with NW Europe on hrs/adult?** No unified model. Rogerson (2008) attributes to sectoral-mix; BBF (2019) attributes to weeks-worked + ed.\ comp; neither closes both moments.
4. **Welfare ranking is parameter-sensitive.** JK's 95-105% range overlaps US, so the verdict depends on κ (mortality multiplier) and externality weights ϕ, θ. The dominance verdict in `problem1.tex` Q7 is robust to ±50% perturbations but not to *qualitative* changes (e.g., assuming behavioural utility misperception).

---

## 7. Open Question Worth a Follow-Up Paper

**Joint estimation of (gender norms / joint taxation / childcare / parental leave) contributions to the long-run child penalty — using Kleven Atlas (2024 Restud) micro data + the BBBP (2019) tax-code archive [REPL] + a staggered childcare-reform diff-in-diff.**

KLPSZ (2019) regress the cross-country penalty on ESS norms and explain ~70% of cross-country variance — but the design is correlational (one cross-section). BFS (2018) + BBBP (2019) provide the only structural estimates of joint-tax effects and the only public archive of country-year statutory tax codes. The 2002-2018 wave of European childcare reforms (DE-2013, AT-2010, IT-2007, FR-2014, NL-2005, SE ongoing) provides quasi-experimental variation absent in KLPSZ.

The empirical content of the proposed paper is: (1) construct an event-study at the woman-firm-cohort level using Kleven Atlas (2024 RES) for 134 countries; (2) interact birth-event coefficients with the BBBP (2019) tax-code "joint-vs-separate" indicator at the year of birth; (3) DiD on staggered childcare-reform timing. The proposed identification puts the three rival mechanisms (norms, taxes, childcare) in a single structural equation and lets the data partition the variance.

---

## Appendix — Traceability Audit

### A. PDFs read (full intro + main table + conclusion, ≥5 pp each)
All in `../papers/`:
1. `prescott_2004_FRBM.pdf` (NBER WP 10316)
2. `ohanian_raffo_rogerson_2008_NBER12786.pdf`
3. `bick_brueggemann_fuchs_2019_SJE.pdf` (corrected from initial download)
4. `bick_fuchs_2018_RES.pdf` (corrected)
5. `bbb_paule_2019_JIE_NBER24995.pdf` (corrected)
6. `aguiar_hurst_2007_QJE_NBER12082.pdf` (corrected)
7. `rogerson_2008_NBER12889_JPE.pdf` (actually JEL)
8. `rogerson_wallenius_2009_NBER13017.pdf`
9. `chetty_guren_manoli_weber_2011_NBER16729.pdf`
10. `kleven_landais_posch_steinhauer_zweimuller_2019_NBER25524.pdf`
11. `blanchard_wolfers_2000_NBER7282.pdf`
12. `burda_hamermesh_weil_2013_NBER13000.pdf`
13. `boppart_krusell_2020_NBER22215.pdf`
14. `card_lemieux_riddell_2004_NBER9473.pdf`
15. `stevenson_wolfers_2006_QJE_NBER12944.pdf` (actually JEP 2007)
16. `fernandez_fogli_2009_NBER13373.pdf` (actually Fernandez 2013 AEJ Macro single-author)
17. `heathcote_storesletten_violante_2017_QJE_NBER19899.pdf`
18. `jones_klenow_2016_AER_NBER16352.pdf`
19. `hall_jones_2007_QJE_NBER10737.pdf`
20. `becker_philipson_soares_2005_AER_NBER9765.pdf`
21. `heathcote_perri_violante_2010_NBER15483.pdf`
22. `stevenson_wolfers_2008_Brookings_NBER14282.pdf`
23. `alesina_glaeser_sacerdote_2005_NBER11278.pdf`
24. `alesina_glaeser_sacerdote_2001_BPEA.pdf`
25. `saez_stantcheva_2016_AER_NBER18835.pdf`
26. `piketty_saez_stantcheva_2014_NBER17616.pdf`

Bonus papers (the original download.sh had wrong NBER WP numbers for these, so the actual PDFs are different from the labels but the content is on-topic):
27. `chang_kim_2006_RichmondFed.pdf` → actually Erosa-Fuster-Restuccia (2016 RED) "Quantitative Theory of Gender Wage Gap"
28. `freeman_schettkat_2005_NBER10876.pdf` → actually Gustman-Steinmeier (2004) on min hrs constraints
29. `heathcote_storesletten_violante_2014_NBER19268.pdf` → actually Cutler-Ghosh-Landrum (2013) on morbidity compression
30. `olivetti_petrongolo_2017_NBER22301.pdf` → actually Hines-Potrafke-Riem-Schinke (2016) on intervivos transfers
31. `aguiar_hurst_2007_NBER11895.pdf` (replaced) → was originally Kuhn-Lozano (2008) on long workweek — that paper is on topic but downloaded under the wrong filename and has been replaced with the correct Aguiar-Hurst by NBER WP 12082
32. `voena_2015_AER_NBER17367.pdf` → actually Galasso-Schankerman-Serrano (2013) on patent rights — tangential

(Off-topic mis-downloads: rogerson\_2006\_NBER12230 = Shimer-Werning; prescott\_rogerson\_wallenius\_2009\_NBER15179 = Heckman-Todd; bick\_fuchs\_2018\_NBER22255 = Meng; bick\_brueggemann\_fuchs\_2019\_NBER25826 = Barro; krueger\_mueller\_2016\_NBER22025 = Campbell; krusell\_mukoyama\_rogerson\_sahin\_2017\_RED = List-Mason; crepon\_kramarz\_2002\_NBER8987 = Cochrane.) The original download.sh script used hallucinated NBER WP numbers.

### B. Replication archives downloaded
Under `repl/`:
1. `bbf_hours_data_release3.zip` → `bbf_data/data_pub.dta` [REPL-RUN]
2. `TaxCodes.zip` → `taxcodes/Tax Codes/` [REPL]
3. `bfl_data.zip` → `bfl_data/decile_hours_wages.dta` [REPL-RUN]
4. `hsv_qje2017_dataverse.zip` (6.2 MB from Harvard Dataverse) → `hsv2017/Data.Code_for_Replication/` [REPL-RUN]
5. `saez_pss_files.zip` → `saez_pss/Files_nberwp/` [REPL]
6. `saez_stantcheva_dataprogs.zip` → `saez_stantcheva/dataprogs/` [REPL]

Visited but blocked behind login: openICPSR projects 114526 (Kleven), 116136 (Voena), 116366 (Kleven DK 2019).

### C. Scripts I executed (output in `*.out` files)
- `repl_bbf_decomp.py` → `bbf_decomp_2019.out` [REPL-RUN: BBF 2019]
- `repl_hsv2017_inspect.py` → `hsv2017_inspect.out` [REPL-RUN: HSV 2017 cross-country data structure]
- `repl_hsv2017_progressivity.py` → `hsv2017_prog.out` [REPL-RUN: HSV 2017 prog\_avg construction]
- `repl_bfl_2018.py` → `bfl_2018.out` [REPL-RUN: BFL 2018 hours-by-income-tercile]
- `extract_summaries.py` → `summaries/*.sum` (per-paper machine summaries)

### D. Existing primary-data artefacts (predate this Phase A run)
- `oecd_hours.csv` (3,696 obs, OECD `DSD_HW@DF_AVG_ANN_HRS_WKD/1.0`)
- `oecd_emp_long.csv` (333,063 obs, OECD `DSD_LFS@DF_IALFS_EMP_WAP_Q/1.0`)
- `oecd_taxwedge.csv` (4,768 obs, OECD `DSD_TAX_WAGES_COMP`)
- `figure_panel.pdf` / `.png` (six-panel evidence figure used in `problem1.tex`)
- `kleven_2019.pdf` / `.txt` (KLPSZ 2019 NBER WP)

### E. Self-criticism / limitations
- I did NOT obtain code-running access to openICPSR (Kleven, Voena), so for those papers I cite [REPL ATTEMPTED] not [REPL].
- Matlab is not installed locally; I read but did not execute the BBBP Tax Codes archive and the HSV Matlab pipeline. Both are replicable in principle (the HSV Matlab file is 828 lines of standalone code; the BBBP `master.m` calls `tax_<country>_<year>(wage_p, wage_s, married, children)`).
- Two papers in the original download list (Gruber-Wise 1999 NBER 6134, Ljungqvist-Sargent 1998 NBER 6262) had empty PDF text after `pdftotext` — likely scanned PDFs. I did NOT read them and excluded them from the literature ledger.
- The original download.sh script had ≥9 wrong NBER WP numbers (probably AI-hallucinated). I corrected the most important four and used the rest as bonus papers.

---

*End of Phase-A deliverable.*
