# Problem 1 Question Catalog

One entry per Problem 1 subquestion. Each entry: shape, mechanisms, canonical references, hand-offs, special instructions. Load this file at Phase 1 (after the verbatim question is read) to find the right route.

---

## Team scope (read first)

The team has decided to deliver **only** the following subquestions:

- **Q1** — Alessandro (drafted in `main.tex`)
- **Q2** — Alessandro (drafted in `main.tex`)
- **Q7.4** — Francesco + Stefano (welfare comparison via the Q4 regulation channel)
- **Q7.5** — Francesco + Stefano (welfare comparison via the Q5 unions / sectoral-shifts channel)
- **Q7.ext** — Eduard (additional channel beyond Q4/Q5)

**Q3 and Q6 are out of scope** — do not produce a section for them.

**Q4 and Q5 are reference material only** — their *mechanisms* feed into Q7.4 and Q7.5 respectively, but no standalone Q4 / Q5 section is to be written. The Q4 and Q5 entries below describe the *mechanisms*, not deliverables.

---

## Q1 — Documenting the US–Europe hours gap *(Alessandro)*

- **Shape.** DOCUMENT.
- **Verbatim.** "Document the fact described above about the difference between hours worked in the US vs Europe in recent years, if needed even across different European countries."
- **Mechanisms.** None — pure empirical exposition.
- **Canonical references.**
  - Bick, Brüggemann, Fuchs-Schündeln (2019) — *Scand. J. Econ.* 121(4) — "Hours worked in Europe and the US: New data, new answers"
  - Boppart-Krusell (2020) — *JPE* 128(1) — "Labor supply in the past, present, and future"
  - Aguiar, Hurst (2007) — *QJE* 122(3) — "Measuring trends in leisure"
  - Burda, Hamermesh, Weil (2013) — *J. Pop. Econ.* 26(1) — "Total work and gender"
  - OECD Annual National Accounts (data source for hours per worker time series)
  - McDaniel (2011) — labour-tax wedge series
- **Required outputs.** Identity decomposition `H/N = HE · e`; cluster countries by margin; multi-panel figure.
- **Hand-off.** Q2, Q7.4, Q7.5, Q7.ext all rely on Q1's regime split.
- **Status.** Drafted in `main.tex`. Do not redo unless the user explicitly asks for an edit or extension.
- **Page budget.** ~1 page.

---

## Q2 — Tax explanation: write a labour-supply model *(Alessandro)*

- **Shape.** MODEL+CONDITIONS (with a small institutional summary upfront).
- **Verbatim.** "Higher taxes have been put forward as an explanation. Summarize the main differences in income tax between US and Europe. Write a model of labour supply and derive formally the conditions under which the European tax system leads to less hours worked than in the US."
- **Mechanisms.** Composite labour wedge `τ`, progressivity `τ_p` (HSV), unit of taxation (joint vs individual), participation cost `μ_b^j`.
- **Canonical references.**
  - Prescott (2004) — *FRBM Quarterly Review* — "Why do Americans work so much more than Europeans?"
  - Alesina, Glaeser, Sacerdote (2005) — *Brookings Papers* 2005:2 — "Work and leisure in the U.S. and Europe"
  - Heathcote, Storesletten, Violante (2017) — *QJE* 132(4) — "Optimal tax progressivity"
  - Ohanian, Raffo, Rogerson (2008) — *JME* 55(8) — "Long-term changes in labor supply and taxes"
  - Bénabou (2002) — *Econometrica* 70(2) — log-progressivity index
  - LaLumia (2008), Selin (2014), Bastani (2013), Kalíšková (2014) — joint vs individual filing reforms
  - Chetty, Guren, Manoli, Weber (2011) — *AER P&P* — Frisch elasticity meta-analysis
  - Keane (2011) — *JEL* 49(4) — "Labor supply and taxes: A survey"
- **Required outputs.** Three-tier model build: pure intensive Prescott; pure extensive Saez; synthesis (Cogan-Heckman-style with fixed cost). Comparative statics on `τ` and `τ_p`. Marshallian/Hicksian/Frisch caveat explicit.
- **Hand-off.** Provides notation (`τ`, `μ_b^j`, `HE`, `e`, `H/N`) for all of Q7.x. The Q7.x welfare ledger is built on Q2's `H/N = P(τ) · h*(τ)` decomposition.
- **Status.** Drafted in `main.tex`. Do not redo unless the user explicitly asks for an edit or extension.
- **Page budget.** ~1.5 pages.

---

## Q4 — Labour-market regulation *(reference for Q7.4 only — not a deliverable)*

- **Shape.** REFERENCE (the mechanism is invoked inside Q7.4).
- **Verbatim.** "Another explanation that has been put forward is labour market regulation limiting the number of hours that Europeans can work."
- **Mechanisms.** Hours cap `h̄`. Welfare loss from binding cap (workers with desired `h*>h̄` are constrained); insurance/coordination gain (those near the cap weren't optimally choosing if there's a missing market); firm-side effect (monopsony or fixed costs of employment, firms adjust on the extensive margin).
- **Canonical references.** (use these inside Q7.4)
  - Hunt (1999) — *QJE* 114(1) — "Has work-sharing worked in Germany?"
  - Crépon, Kramarz (2002) — *JPE* 110(6) — French 39-hour reform.
  - Estevão, Sá (2008) — *JEEA* 6(5) — French 35-hour Aubry reform.
  - Chemin, Wasmer (2009) — *J. Lab. Econ.* 27(4) — Aubry DiD using Alsace-Moselle.
  - Chetty, Friedman, Olsen, Pistaferri (2011) — *QJE* 126(2) — Danish bunching at hours notches.
  - Trejo (1991) — *AER* — overtime regulation as a cap.
  - Alessandro's `main.tex` Proposition (P1) and Aubry DiD reduced-form anchor (already implements much of this).
- **Status.** **Not a deliverable.** Use the references above inside Q7.4 to set up the regulation channel.

---

## Q5 — Unions and sectoral shifts *(reference for Q7.5 only — not a deliverable)*

- **Shape.** REFERENCE (the mechanism is invoked inside Q7.5).
- **Verbatim.** "A third explanation is the presence of unions and how unions respond to sectoral shifts."
- **Mechanisms.** Two-sector setup. Productivity shock `Δz_A − Δz_B`. Competitive: workers reallocate, hours respond via wage. Unionised: unions resist downward wage adjustment in declining sector → unemployment / hours compression. Inter-sectoral mobility friction. Insurance gain (wage-variance compression) vs allocative loss (unemployment).
- **Canonical references.** (use these inside Q7.5)
  - Caballero, Hammour (1996) — *AER* — sectoral reallocation in unionised labour markets.
  - Ljungqvist, Sargent (1998) — *JPE* 106(3) — European unemployment dilemma.
  - Calmfors, Driffill (1988) — *Economic Policy* — bargaining structure and macroeconomic performance.
  - Blanchard, Wolfers (2000) — *Economic Journal* 110(462) — institutions and shocks interaction.
  - Alesina, Glaeser, Sacerdote (2005) — *Brookings Papers* — union channel.
  - Boeri, Garibaldi (2007) — *Economic Journal* 117(521) — two-tier reforms / EPL link.
  - Card (1992) — *AER* — minimum wages and union markups.
  - OECD Employment Outlook (chapter on unions, recurrent).
  - Alessandro's `main.tex` Proposition (P2): `ΔW^U = ½ Δv_z − Δu · w h*`, positive iff `Δv_z / Δu > 2 w h*`.
- **Status.** **Not a deliverable.** Use the references above inside Q7.5 to set up the unions channel.

---

## Q7 — Stylised welfare comparison of two systems *(team subdivision)*

- **Shape.** MODEL+WELFARE.
- **Verbatim.** "Now consider broadly a subset of your choice of the aspects considered above. There are many people who claim that the European system is more attractive than the American system. Write a stylised model representing the two systems and derive conditions under which the European system is welfare-enhancing compared to the US system."

The team has split Q7 into three subdivisions, each tackling a different channel of the welfare comparison.

### Q7.4 — Welfare comparison via Q4 regulation channel *(Francesco + Stefano)*

- **Channel.** Hours cap `h̄`. EU regime: `h̄^EU < h*`; US regime: `h̄^US = ∞` (or non-binding).
- **Welfare ledger primary terms.** Worker rent (wage compensation), firm profit loss, deadweight loss from the binding cap, distributional weight `(ω − 1)` between workers and firm-owners, leisure complementarity (AGS).
- **Empirical anchor.** Aubry 35-hour reform (Estevão–Sá 2008; Chemin–Wasmer 2009); Alessandro has already run the DiD on OECD aggregate hours/worker — `\hat\beta = -0.042, t = -6.61` — reuse that.
- **Hand-off.** Coordinate notation with Q7.5 and Q7.ext. Reuse Alessandro's Proposition (P1) `ΔW^R = (ω−1) N h̄ Δw − ½ N(v'' + N|F''|)(h*−h̄)²` as the core ledger row.
- **Page budget.** ~1.5 pages (this is one of the three core subquestions in the 7–8 page total).

### Q7.5 — Welfare comparison via Q5 unions / sectoral-shifts channel *(Francesco + Stefano)*

- **Channel.** Union coverage `c` and bargaining-structure type (centralised vs decentralised); sectoral shock variance `v_z`.
- **Welfare ledger primary terms.** Insurance gain (wage-variance compression) `½ Δv_z`, allocative loss `−Δu · w h*`, monopsony correction (if relevant), aggregate hours response.
- **Empirical anchor.** Calmfors–Driffill (1988); Blanchard–Wolfers (2000) shock-times-institution interaction; OECD ULMS data on union density × productivity shocks. Bartik-style sectoral shock construction is an option.
- **Hand-off.** Coordinate notation with Q7.4 and Q7.ext. Reuse Alessandro's Proposition (P2) as the core ledger row: `ΔW^U = ½ Δv_z − Δu · w h*` is positive iff `Δv_z / Δu > 2 w h*`.
- **Page budget.** ~1.5 pages.

### Q7.ext — Additional channel *(Eduard)*

- **Channel.** Eduard's choice — coordinate before duplicating Q7.4 / Q7.5 channels. Possibilities suggested by the team:
  - Formal vs informal sector channel (Albrecht–Navarro–Vroman 2009; Schneider 2010; La Porta–Shleifer 2014). Alessandro's (P3) is a starting point.
  - Employment protection legislation (Lazear 1990; Boeri–Garibaldi 2007). Alessandro's (P4) is a starting point.
  - Cultural complementarity in leisure (AGS social-multiplier).
  - Or a richer integrated model that closes a GE feedback Alessandro's ledger ignores.
- **Welfare ledger.** Structure depends on channel choice — load `welfare-ledger.md` and pick the rows that survive in the chosen channel.
- **Hand-off.** Q7.ext should explicitly state how it composes with Q7.4 + Q7.5 in the final `.tex`. Coordinate with Eduard before writing.
- **Page budget.** ~1.5 pages.

### Q7-wide common references (for all three Q7.x subdivisions)

- Saez (2001) — *ReStud* 68(1) — optimal income taxation.
- Saez, Slemrod, Giertz (2012) — *JEL* — elasticity of taxable income.
- Jones, Klenow (2016) — *AER* 106(9) — "Beyond GDP? Welfare across countries and time" (the consumption-equivalent welfare benchmark `λ`).
- Alesina, Glaeser, Sacerdote (2005) — *Brookings Papers* 2005:2 — the canonical alternative-to-Prescott hypothesis.
- Heathcote, Storesletten, Violante (2017) — *QJE* — for the insurance term in the welfare ledger.
- Bénabou (2002) — *Econometrica* — progressive tax schedule + welfare functional.

---

## Notation (cross-question)

`main.tex` is the single source of truth for notation. **Reuse this notation** wherever the subquestion overlaps:

| Symbol | Meaning |
|---|---|
| `τ` | Composite labour wedge `1 − (1−τ_l)/(1+τ_c)` |
| `τ_p^j` | HSV / Bénabou progressivity index for country `j` |
| `μ_b^j` | Mean fixed cost of working in country `j` |
| `σ_b` | Dispersion of fixed costs across workers |
| `HE` | Hours per worker (intensive margin) |
| `e` (or `P`) | Employment rate / participation (extensive margin) |
| `H/N` | Hours per adult `= HE · e` |
| `α` | Inverse Frisch elasticity (or `1/ε^F`) |
| `γ` | Coefficient of relative risk aversion |
| `θ` | Generic policy parameter distinguishing US and EU regimes |
| `ω` | Worker-vs-firm-owner marginal-utility ratio (Q7.4 inherits from P1) |
| `v_z` | Cross-section log-earnings variance (Q7.5 inherits from P2) |
| `u` | Unemployment friction rate |
| `h̄` | Hours cap (Q7.4) |
| `c` | Union coverage rate (Q7.5) |

When introducing **new** notation specific to a subquestion, declare it in the notation table and explain why it cannot be reduced to existing symbols.

---

## Hand-off graph (deliverables only)

```
Q1  ──────►  Q2  ──────────────────────►  Q7.4
                                  └────►  Q7.5
                                  └────►  Q7.ext

   Q4 (reference) ────►  Q7.4
   Q5 (reference) ────►  Q7.5
```

When working on a Q7.x node, read `main.tex` for the hand-off paragraphs at the end of Q1 and Q2 sections; reuse notation and the regime split.
