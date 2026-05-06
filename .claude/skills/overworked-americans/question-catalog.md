# Problem 1 Question Catalog — v2 (Q1+Q2+Q4+Q5)

One entry per Problem 1 subquestion. Each entry: shape, mechanisms, canonical references, hand-offs, special instructions. Load this file at Phase 1 (after the verbatim question is read) to find the right route.

---

## Team scope (read first)

The team has decided to deliver **only** the following subquestions in `problem1_v2.tex`:

- **Q1** — Documenting the gap (Alessandro; drafted in `problem1.tex`)
- **Q2** — Prescott model + macro/micro elasticity decomposition (Alessandro; drafted in `problem1.tex`)
- **Q4** — Hours regulation, optimality of a cap (team; drafted in `problem1.tex`)
- **Q5** — Single union as welfare-restorer in a two-sector economy (team; drafted in `problem1.tex`)

**Q3 and Q6 are out of scope** — do not produce a section for them.

**Q7 is DEFERRED.** Earlier drafts of `problem1.tex` included Q7 (Saez–Stantcheva λ-weighted welfare comparison, see lines ~607–730 of the current `problem1.tex`). The team has chosen to simplify to Q1+Q2+Q4+Q5 to maximise depth and clarity per the grading rubric. Q7 stays in `problem1.tex` for now but **does not enter `problem1_v2.tex`**.

---

## Q1 — Documenting the US–Europe hours gap *(Alessandro, drafted)*

- **Shape.** DOCUMENT.
- **Take-home verbatim.** "Document the fact described above about the difference between hours worked in the US vs Europe in recent years, if needed even across different European countries."
- **Storyline (`plan.md`).** "There is some inconsistency in the data" — the gap is real but the cross-sectional tax-vs-hours fit is too noisy for taxes to carry the whole story.
- **Mechanisms.** None — empirical exposition.
- **Canonical references (in `papers/`).**
  - Bick, Brüggemann, Fuchs-Schündeln (2019) *Scand. J. Econ.* 121(4) — `bick_brueggemann_fuchs_2019_SJE.pdf`
  - Boppart, Krusell (2020) *JPE* 128(1) — via `boppart_krusell_2020_NBER22215.pdf`
  - Aguiar, Hurst (2007) *QJE* 122(3) — `aguiar_hurst_2007_QJE_NBER12082.pdf`
  - Burda, Hamermesh, Weil (2013) *J. Pop. Econ.* 26(1) — `burda_hamermesh_weil_2013_NBER13000.pdf`
  - McDaniel (2011) labour-tax wedge series
  - OECD Annual National Accounts (data source)
- **Required outputs.** Identity decomposition `H/N = HE · e`; cluster countries by margin; multi-panel figure.
- **Status.** Drafted in `problem1.tex` §1 (lines 106–179). Three-panel figure `figures/figure_panel.pdf`. Headline empirical statement: 2023 OLS slope = −9.9 hrs/pp, R²=0.16, residual SD ≈ 158 hours.
- **Page budget in v2.** ~3/4 page (tighten the existing version).

---

## Q2 — Prescott model and the elasticity gap *(Alessandro, drafted)*

- **Shape.** MODEL+CONDITIONS.
- **Take-home verbatim.** "Higher taxes have been put forward as an explanation. Summarize the main differences in the income tax between US and Europe (or a few European countries). Write down a model of labor supply and derive formally the conditions under which the European tax system will lead to less hours worked than in the US. [Hint: start with the simplest case of differences only in the average tax rates.]"
- **Storyline (`plan.md`).** "With a model the elasticity should be bigger; there must be other factors." Q2 quantifies what's missing — taxes explain ~46% of the EU/US log-gap; ~54% residual.
- **Hostile-grader bar (`meta/grading_prompt_v2.md`).** Must derive the static FOC `(1−τ)w · u_c = −u_l` and produce a clean condition on preferences (e.g., balanced-growth-path utility, Frisch elasticity) under which higher τ in EU reduces hours. **Bonus: discuss intensive vs extensive margin and why Prescott's calibration needs Frisch ≈ 3.**
- **Mechanisms.** Composite labour wedge `τ`, log-log preferences, Marshallian vs Frisch vs Hicksian elasticity taxonomy.
- **Canonical references.**
  - Prescott (2004) *FRBM Quarterly Review* — `prescott_2004_FRBM.pdf`
  - Chetty, Guren, Manoli, Weber (2011) *AER P&P* — `chetty_guren_manoli_weber_2011_NBER16729.pdf`
  - Hansen (1985) / Rogerson (1988) indivisible labour
  - Rogerson, Wallenius (2009) *JET* — `rogerson_wallenius_2009_NBER13017.pdf` (life-cycle aggregation)
  - Bick, Fuchs-Schündeln (2018) *ReStud* — `bick_fuchs_2018_RES.pdf` (extensive margin & participation)
  - Heathcote, Storesletten, Violante (2017) *QJE* — `heathcote_storesletten_violante_2017_QJE_NBER19899.pdf` (progressivity)
  - Saez (2001) *ReStud* — elasticity-tax bridge
- **Required outputs.** Closed-form `h*(τ) = (1−τ)/(α + 1−τ)`. Marshallian intensive elasticity `ε^M = α/(α+1−τ)`. Anchor `h^US = 0.33` at `τ^US = 0.35` → `α^macro = 1.32`; `ε^M = 0.67`. Restriction to micro-consistent `ε^M = 0.30` → `α^micro = 0.279`; predicted EU log-gap −13.4% vs data −29.0% → ~46% explained, 54% residual.
- **Status.** Drafted in `problem1.tex` §2 (lines 181–305). Figure `figures/sim_decomposition.pdf`.
- **Page budget in v2.** ~1.5 pages.

---

## Common framework for Q4 and Q5 *(team, drafted)*

- **Primitives** (used in both Q4 and Q5): worker `V_w(h) = (1−τ)wh − ½α h²`, firm `V_f(h) = Ah − ½β h² − wh`, joint surplus `W(h) = V_w + V_f = Ah − τwh − ½(α+β) h²`.
- **Three benchmarks.** Worker-preferred `h* = (1−τ)w/α`. Firm-preferred `h^firm = (A−w)/β`. Social-optimum `h^soc = (A − τw)/(α+β)`.
- **Baseline calibration.** `A=2, w=1, α=β=2, τ=0.4` ⇒ `h* = 0.30, h^soc = 0.40, h^firm = 0.50`. Ordering `h* < h^soc < h^firm` is load-bearing for both Q4 (cap optimality band) and Q5 (union welfare-restoration angle).
- **Status.** Drafted in `problem1.tex` §3 (lines 308–344).

---

## Q4 — Hours regulation: the optimality condition for a cap *(team, drafted)*

- **Shape.** MODEL+WELFARE.
- **Take-home verbatim.** "Another explanation that has been put forward is labor market regulation limiting the number of hours that Europeans can work. The impact of such regulation is obvious, but the welfare effects are more subtle. Can you derive the welfare effects of such labor legislation on workers and firms? How would your answer change if workers are heterogeneous?"
- **Storyline (`plan.md`).** "Quota = maximum number of hours can be good or bad: it may overshoot or undershoot. If workers due to low bargaining power were already working more than their optimum then the quota helps them; if h̄ < h* then both worker and firm are worse off and the quota is wrong." US: not binding; EU: yes.
- **Hostile-grader bar.** "Must produce a worker surplus + firm surplus decomposition and show that with heterogeneity the binding cap creates rationing — distributional consequences must be derived, not asserted."
- **Mechanisms.** Hours cap `h̄`. Firm-power baseline (monopsony / sticky contract): firm picks `h^firm > h^soc`. Cap pulls `h` toward `h^soc` if `h̄ ∈ (2h^soc − h^firm, h^firm)`; harmful below.
- **Canonical references.**
  - Manning (2021) ILR Review — monopsony review (firm-power baseline)
  - Cahuc, Carcillo (2014) — sectoral contract stickiness (alternative justification)
  - Lee, Saez (2012) *JPubE* — quantity instruments / minimum-wage analogue
  - Estevão, Sá (2008) *Economic Policy* — Aubry 35-hour reform empirical anchor
  - Crépon, Kramarz (2002) *JPE* 110(6) — `crepon_kramarz_2002_NBER8987.pdf`
  - Chemin, Wasmer (2009) *JLE* 27(4) — Alsace-Moselle DiD
  - Chetty, Friedman, Olsen, Pistaferri (2011) *QJE* 126(2) — Danish bunching
- **Required outputs.** Welfare optimality band `ΔW(h̄) > 0 ⟺ h̄ ∈ (2h^soc − h^firm, h^firm)`. Peak gain `½(α+β)(h^firm − h^soc)²` at `h̄ = h^soc`. Heterogeneous workers: rationing threshold `α*(h̄) = 2(1−τ)w/(h̄ + h^firm)`. Aggregate sign condition with mean `α̅`.
- **Status.** Drafted in `problem1.tex` §4 (lines 346–458). Figure `figures/sim_cap.pdf`.
- **Footnote omissions to flag.** Extensive-margin substitution (representative-agent); informal sector; contract stickiness modelled implicitly via `h^firm`.
- **Page budget in v2.** ~1.5 pages.

---

## Q5 — Single union: welfare-restoration in a two-sector economy *(team, drafted)*

- **Shape.** MODEL+CONDITIONS + DATA-HYPOTHESIS.
- **Take-home verbatim.** "Yet a third explanation is the presence of unions in the economy and in particular how unions respond to sectoral shifts in the economy. Show the impact of sectoral shifts (i.e. one part of the economy gets more productive and the other less so) on hours worked in a competitive economy. Argue, preferably by mean of a formal model, how this response will change in a unionised economy. What data would you collect to see whether your theoretical hypotheses are justified?"
- **Storyline (`plan.md`).** Single union (no inter-union competition); all workers inside. Union maximises worker surplus → goal-aligned with workers. Under the firm-power baseline (`h^firm > h*`), as union bargaining power `η` rises, hours fall from `h^firm` toward `h*` — **the union endogenously restores the worker-preferred level**. In US, `η` small → effect absent; in EU, `η` large → effect present. Captures part of the residual from Q2.
- **Hostile-grader bar.** "Competitive benchmark with two sectors and labor mobility, then a unionized version (right-to-manage / efficient-bargain / median-union-member). Data: sectoral employment shares, union density, hours by sector."
- **Mechanisms.** Two-sector productivity shock (`A_g > A_b`). Competitive: hours follow `h_j^d(w) = (A_j − w)/β` per sector with free mobility. Unionised: single union covers both sectors; right-to-manage (RTM) Nash bargain over wage; firm picks hours on labour demand. Comparative statics in `η`.
- **Canonical references.**
  - Nickell (1982) — RTM origin
  - Layard, Nickell, Jackman (1991) — *Unemployment* textbook (RTM canonical)
  - Calmfors, Driffill (1988) — bargaining structure / hump shape
  - Caballero, Hammour (1996) *QJE* — sectoral reallocation
  - McDonald, Solow (1981) *AER* — efficient bargaining vs RTM
  - Blanchard, Wolfers (2000) *EJ* — `blanchard_wolfers_2000_NBER7282.pdf`
  - Card, Lemieux, Riddell (2004) — `card_lemieux_riddell_2004_NBER9473.pdf`
  - Bewley (1999), Holden (1994) — downward wage rigidity (used for asymmetric pass-through)
  - ICTWSS database; OECD STAN; EU KLEMS — union coverage and sectoral hours
- **Required outputs.** Per-sector RTM Nash FOC reduces to a quadratic in `x_j ≡ A_j − w_j`: `a x_j² − b_j(2−η) x_j + c(1−η) = 0` with `a = 2(1−τ)/β + α/β²`, `b_j = (1−τ)A_j/β`, `c = 2 V_w^0`. As `η ↑`, `w_j ↑`, `h_j ↓`. Asymmetric pass-through under downward wage rigidity in the bad sector. **Welfare-restorer angle:** show that under `h^firm > h*`, increasing `η` reduces `h` toward `h*` — the union and worker objectives align.
- **Status.** Drafted in `problem1.tex` §5 (lines 461–605). Figures `figures/sim_shocks.pdf`, `figures/sim_union_rtm.pdf`.
- **Footnote omissions to flag.** Inter-union competition (single-union assumption); sectoral composition / public-sector share (large public sector → sticky contracts not modelled); informal labour market.
- **Page budget in v2.** ~1.5 pages.

---

## Q7 — Welfare comparison of systems *(DEFERRED — not in v2)*

- **Status.** Drafted in `problem1.tex` §7 (lines 607–730) using Saez–Stantcheva (2016) λ-weighted welfare. **Not in `problem1_v2.tex`.** Keep the existing draft in `problem1.tex` for the moment but do not invoke or extend Q7 when working on v2.
- If the user explicitly asks for Q7, redirect to the existing draft and confirm scope before doing more work.

---

## Notation (cross-question)

`problem1.tex` is the single source of truth for notation. Reuse:

| Symbol | Meaning |
|---|---|
| `τ` | Composite labour wedge |
| `α` | Worker disutility curvature (quadratic preferences) |
| `β` | Firm production curvature (linear-quadratic firm) |
| `A` | Firm productivity |
| `w` | Wage |
| `h*` | Worker-preferred hours |
| `h^firm` | Firm-preferred hours |
| `h^soc` | Joint-surplus-maximising hours |
| `h̄` | Hours cap |
| `η` | Union bargaining power (RTM) |
| `V_w, V_f, W` | Worker surplus, firm surplus, joint surplus |

---

## Hand-off graph (v2 deliverables only)

```
Q1 (fact) ──► Q2 (Prescott + elasticity gap) ──► Q4 (regulation as constraint)
                                              └► Q5 (union as welfare-restorer)
```

Q4 and Q5 are independent at the model level (they propose different institutional channels) but both rely on the common framework's `h* < h^soc < h^firm` ordering established in §3 of `problem1.tex`. Q7 is deferred (not in v2).
