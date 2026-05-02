# Q7.4 Citations — Welfare comparison via the regulation channel

All entries below were verified by web search (titles, journal, volume, issue, pages). Two corrections to the original list:

1. **Estevão–Sá (2008) is in *Economic Policy*, not *JEEA*.** The published version is *Economic Policy* 23(55), 418–463. There is no Estevão–Sá 2008 paper in *JEEA* 6(5). I retain it as the Aubry empirical anchor, with the corrected venue.
2. **Alesina–Glaeser–Sacerdote (2005/2006) is in *NBER Macroeconomics Annual* 2005 (vol. 20, MIT Press, 2006), not *Brookings Papers* 2005:2.** I cite the published venue. (Alessandro's `main.tex` repeats the "Brookings Papers" mis-attribution; the team should fix this when consolidating.)

---

## Regulation channel (P1)

- **Hunt, J. (1999).** *Has Work-Sharing Worked in Germany?* Quarterly Journal of Economics 114(1), 117–148. https://doi.org/10.1162/003355399555963 — *Used in: P1 empirical motivation; standard hours reductions in West German industries 1984–94, "full wage compensation" finding that pins Δw/w as a non-zero anchor for (R).*

- **Crépon, B., & Kramarz, F. (2002).** *Employed 40 Hours or Not Employed 39: Lessons from the 1982 Mandatory Reduction of the Workweek.* Journal of Political Economy 110(6), 1355–1389. https://doi.org/10.1086/342807 — *Used in: P1 firm-side adjustment; canonical micro-evidence that the 1982 French 40→39h reform raised separation hazards for bound workers, calibrating the v''+|F''| curvature term in the (D) channel.*

- **Estevão, M., & Sá, F. (2008).** *The 35-Hour Workweek in France: Straightjacket or Welfare Improvement?* Economic Policy 23(55), 418–463. https://doi.org/10.1111/j.1468-0327.2008.00204.x — *Used in: P1 Aubry DiD anchor; ≈4% wage compensation, 10–13% hours cut, near-zero employment effect — pins (Δw, h̄/h*) for the (R) and (D) channels. Reuses Alessandro's `repl_aubry_did.py` β̂ = −0.042, t = −6.61.*

- **Chemin, M., & Wasmer, E. (2009).** *Using Alsace-Moselle Local Laws to Build a Difference-in-Differences Estimation Strategy of the Employment Effects of the 35-Hour Workweek Regulation in France.* Journal of Labor Economics 27(4), 487–524. https://doi.org/10.1086/603649 — *Used in: P1 cross-validation of Aubry; quasi-experimental DiD using two extra Alsace-Moselle public holidays as a partial-cap shifter — confirms small employment effect.*

- **Chetty, R., Friedman, J. N., Olsen, T., & Pistaferri, L. (2011).** *Adjustment Costs, Firm Responses, and Micro vs. Macro Labor Supply Elasticities: Evidence from Danish Tax Records.* Quarterly Journal of Economics 126(2), 749–804. https://doi.org/10.1093/qje/qjr013 — *Used in: P1 micro-foundation for hours constraints; bunching at notches identifies (i) the Frisch elasticity entering v'' and (ii) the size of firm-level hours rigidities that justify treating h̄ as a binding cap rather than a soft incentive.*

- **Trejo, S. J. (1991).** *The Effects of Overtime Pay Regulation on Worker Compensation.* American Economic Review 81(4), 719–740. https://www.jstor.org/stable/2006645 — *Used in: P1 wage-pass-through; FLSA overtime premium evidence that statutory hours regulation triggers partial (not complete) wage compensation, anchoring the sign and magnitude of Δw in (R).*

- **Lazear, E. P. (1990).** *Job Security Provisions and Employment.* Quarterly Journal of Economics 105(3), 699–726. https://doi.org/10.2307/2937895 — *Used in: P1 firm-side cost interpretation and channel (F) (firm-side reallocation); severance/notice provisions raise effective per-worker cost, providing the conceptual ancestor of the |F''|·N curvature term and of any insider–outsider composition effect under heterogeneity.*

## Welfare framework

- **Jones, C. I., & Klenow, P. J. (2016).** *Beyond GDP? Welfare across Countries and Time.* American Economic Review 106(9), 2426–2457. https://doi.org/10.1257/aer.20110236 — *Used in: welfare-criterion benchmark; consumption-equivalent λ units used by `main.tex` Q7 §3.5 — Q7.4's ledger is reported in the same units so that channel (R) and (D) can be aggregated additively with Q7.5's (I)+(U) and Q7.ext.*

- **Saez, E. (2001).** *Using Elasticities to Derive Optimal Income Tax Rates.* Review of Economic Studies 68(1), 205–229. https://doi.org/10.1111/1467-937X.00166 — *Used in: welfare-functional template; the elasticity-based decomposition of welfare in primitives is the methodological precedent for our channel-by-channel ledger of ΔW^{EU−US}.*

- **Heathcote, J., Storesletten, K., & Violante, G. L. (2017).** *Optimal Tax Progressivity: An Analytical Framework.* Quarterly Journal of Economics 132(4), 1693–1754. https://doi.org/10.1093/qje/qjx018 — *Used in: HSV insurance-compression channel (I); flagged as inactive in the baseline Q7.4 stylised model (no earnings risk by construction) but re-activated in §E heterogeneity case where productivity z_i is log-normal with variance v_z.*

- **Alesina, A., Glaeser, E., & Sacerdote, B. (2005/2006).** *Work and Leisure in the United States and Europe: Why So Different?* In M. Gertler & K. Rogoff (Eds.), *NBER Macroeconomics Annual 2005*, vol. 20, pp. 1–64. MIT Press. https://doi.org/10.1086/ma.20.3585411 — *Used in: leisure-coordination channel (L); their "social multiplier" / leisure-complementarity argument provides the φ·(Δleisure)²/2 closed form. Note: not in Brookings Papers 2005:2 — the published venue is NBER Macro Annual 2005.*

## Empirical anchor

- **Estevão–Sá (2008).** Aubry 35-hour reform — see "Regulation channel" above. Primary DiD anchor.

- **Chemin–Wasmer (2009).** Alsace-Moselle DiD on the same Aubry reform — see "Regulation channel" above. Cross-validation.

- **Boeri, T., & Garibaldi, P. (2007).** *Two Tier Reforms of Employment Protection: A Honeymoon Effect?* Economic Journal 117(521), F357–F385. https://doi.org/10.1111/j.1468-0297.2007.02060.x — *Supplementary; cited only if the (F) firm-side composition channel is activated under Lazear-style EPL framing in the heterogeneity case. Boeri–Garibaldi's reduced-form misallocation estimates suggest the parametric coefficient ≈ −0.05 used in Alessandro's (P4); we inherit the same pin if (F) is non-zero.*

---

## Papers not dropped

All 10 numbered references in the brief returned a clean match. Two had publication-venue corrections (Estevão–Sá: *Economic Policy* not *JEEA*; AGS: *NBER Macro Annual* not *Brookings*); the substantive identification of the paper is unambiguous in both cases, so neither is dropped.
