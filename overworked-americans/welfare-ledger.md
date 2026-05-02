# Welfare Ledger — Sub-Procedure for MODEL+WELFARE Questions

Load this file at Phase 4 whenever the subquestion is MODEL+WELFARE (Q4, Q7, all of Q7.x). Its job is to enforce a single discipline: every channel of `ΔW = W(θ_EU) − W(θ_US)` has a **name**, an **explicit sign**, and a **closed-form expression in the primitives**. Verbal-only welfare statements ("regulation reduces welfare because it distorts hours") are not acceptable.

---

## Step 1 — Pick the welfare criterion

Pick **one** of the following and declare it explicitly in the `.tex`:

- **Utilitarian** — `W = Σ_i u_i` (or `W = ∫ u_i di` for a continuum). Default for Q4 and most of Q7.x.
- **Rawlsian** — `W = min_i u_i`. Use only if the question specifically invokes the worst-off (it doesn't, in Problem 1, but worth knowing).
- **Planner with Pareto weights** — `W = Σ_i ω_i u_i`. Use when there's a clear redistributive motive (e.g., insurance against unemployment risk).
- **Average utility** — same as utilitarian up to a constant; do not pretend it's different.

**Pitfall.** Do not pick "willingness to pay" or "consumer surplus" for a model with non-quasilinear utility. They are not equivalent to a utilitarian comparison.

---

## Step 2 — Decompose ΔW into named channels

Below is a **menu** of channels relevant to Problem 1. The relevant subset depends on the subquestion. Pick the channels that survive in your model; ignore the rest. Each channel must have a sign and a closed-form term.

### Common channels (Problem 1)

| Channel | Sign convention | What drives it | Typical closed form |
|---|---|---|---|
| **Efficiency of labour supply** (`ΔW_eff`) | Negative if EU has higher distortion | Tax wedge / hours cap distorts the FOC `u_l/u_c = (1−τ)w` | `−½ · ε^c · (Δτ)² · h*²w · L` (Harberger-style) |
| **Insurance against earnings risk** (`ΔW_ins`) | Positive if EU offers more insurance and risk aversion is high | Progressive tax + UI smooth consumption across states | `½ · γ · σ_y² · (τ_p^EU − τ_p^US)` (HSV-style) |
| **Redistribution** (`ΔW_red`) | Positive if planner has Pareto weights favouring low income | Tax-transfer redistributes from high-θ to low-θ types | `Σ_i ω_i · Δc_i` over the income distribution |
| **Externality correction** (`ΔW_ext`) | Positive if EU corrects an externality (pollution from work, status, conformity) | Pigouvian motive | `μ · ΔL · (marginal externality)` |
| **Leisure complementarity / coordination** (`ΔW_coord`) | Positive if leisure has complementarities not internalised by individual choice | Alesina-Glaeser-Sacerdote: leisure is more valuable when others are also off work | `+ φ · (Δ leisure)² / 2` |
| **Participation cost / fixed cost margin** (`ΔW_part`) | Sign depends on `μ_b^j` | Fixed cost of working (childcare, commuting, joint-filing penalty); EU policies that reduce `μ_b^j` raise welfare | `[μ_b^US − μ_b^EU] · Δ employment rate` |
| **Insurance against unemployment** (`ΔW_unemp`) | Positive if EU UI is more generous and search frictions exist | UI smooths consumption during job loss | `γ · u-rate · (b_EU − b_US) · y` |
| **Union rent extraction / monopsony correction** (`ΔW_union`) | Sign ambiguous in general | Unions counter monopsony (positive) or extract rents above competitive (negative) | Sign depends on monopsony power vs union markup |
| **Fiscal externality / public goods** (`ΔW_pg`) | Positive if higher tax buys valuable public good and there's no Lindahl pricing | Standard public-finance term | `Δ(τ · base) − Δ MCF · G` |
| **Marriage stability / household risk** (`ΔW_mar`) | Q6-specific | Divorce probability shifts career investment | Becker-style human-capital term |

Add a row only if it has a non-zero closed-form expression. Strike rows where the model gives `0` exactly.

### Sign discipline

For each channel, **derive the sign from the primitives**, do not assert it. Example:

> `ΔW_eff < 0`, because at the margin `u_l/u_c = (1−τ)w` and an increase in τ moves `h*` away from the undistorted optimum; the second-order Taylor expansion gives `−½ · ε^c · (Δτ)² · h*²w` which is strictly negative for any `ε^c > 0`.

If a channel's sign genuinely depends on a primitive (e.g., `ΔW_union` depends on whether monopsony power exceeds the union markup), say so explicitly and add the case split.

---

## Step 3 — Assemble the inequality

Sum the signed channels:

`ΔW = ΔW_eff + ΔW_ins + ΔW_red + ΔW_ext + ΔW_coord + ΔW_part + ΔW_unemp + ΔW_union + ΔW_pg + ΔW_mar`

Group positives and negatives, then state the inequality:

> **Europe welfare-dominates iff `ΔW > 0`, equivalently iff `(positive channels) > (negative channels)`. Substituting the closed-form terms:**
>
> `½ γ σ_y² (τ_p^EU − τ_p^US) + φ (Δ leisure)² / 2 + ... > ½ ε^c (Δτ)² h*² w + ...`

This is the question's deliverable. Keep it on a single display line in the `.tex`. Then unpack which primitives drive the sign and which are pinned down empirically.

---

## Step 4 — Heterogeneity & robustness

The take-home explicitly asks how the answer changes with heterogeneity (Q4: "How would your answer change if workers are heterogeneous?").

For each channel, ask:

1. Does the sign survive in a heterogeneous-agent variant?
2. If not, which sub-population reverses it?
3. Does aggregating across the heterogeneity preserve or reverse the channel?

Most welfare-ledger sign reversals come from `ΔW_red` and `ΔW_part`: heterogeneity in `μ_b^j` can flip `ΔW_part` from positive to negative depending on which margin (intensive vs extensive) dominates.

Document the heterogeneity case explicitly. The verdict for the homogeneous case + the verdict for the heterogeneous case both go in the `.tex`.

---

## Step 5 — Output template

The Phase 4 section in the `.tex` for a MODEL+WELFARE question should look like:

```latex
\subsection{Welfare ledger}

Welfare is utilitarian: $W=\int u_i\,di$. Decompose $\Delta W \equiv W(\theta_{EU})-W(\theta_{US})$:

\begin{center}\footnotesize
\begin{tabular}{lcc}
\toprule
Channel & Sign & Closed-form term \\
\midrule
Efficiency loss ($\Delta W_{\text{eff}}$)        & $-$ & $-\tfrac12\,\varepsilon^c (\Delta\tau)^2 h^{*2} w$ \\
Insurance ($\Delta W_{\text{ins}}$)              & $+$ & $\tfrac12\,\gamma\,\sigma_y^2(\tau_p^{EU}-\tau_p^{US})$ \\
Leisure coordination ($\Delta W_{\text{coord}}$) & $+$ & $\tfrac{\varphi}{2}(\Delta\ell)^2$ \\
Participation cost ($\Delta W_{\text{part}}$)    & $\pm$ & $(\mu_b^{US}-\mu_b^{EU}) \Delta e$ \\
\bottomrule
\end{tabular}
\end{center}

\paragraph{Inequality.} Europe welfare-dominates iff
\[
\underbrace{\tfrac12\,\gamma\,\sigma_y^2(\tau_p^{EU}-\tau_p^{US}) + \tfrac{\varphi}{2}(\Delta\ell)^2 + (\mu_b^{US}-\mu_b^{EU})\,\Delta e}_{\text{positive}}
\;>\;
\underbrace{\tfrac12\,\varepsilon^c(\Delta\tau)^2 h^{*2} w}_{\text{negative}}.
\]

\paragraph{Heterogeneous workers.} The participation channel acquires ambiguous sign because $\mu_b$ is dispersed: a tail of workers with $\mu_b^{EU}>\mu_b^{US}$ reverses $\Delta W_{\text{part}}$ on that segment. The aggregate sign is preserved iff the median worker's $\mu_b$ is reduced more than the dispersion grows, which calibrates positively in \S 5.
```

---

## Step 6 — Preamble compatibility (reference-style preamble — no `mdframed`)

The team has standardised on a single LaTeX preamble for all sections (the reference style). **Do not use `mdframed`, `enumitem`, `tikz`, or coloured boxes** (`tldr`, `verdictgreen`, `verdictorange`, `planbox`) — they are no longer in the team preamble. Style verdicts and TL;DRs as plain bold-prefixed paragraphs:

```latex
\noindent\textbf{Bottom line.} <2-4 sentence verdict.>
\bigskip
```

The required preamble for any standalone compile is:

```latex
\documentclass[a4paper,12pt]{article}
\usepackage{graphicx}
\graphicspath{{figures/}}
\usepackage{wrapfig}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{booktabs}
\usepackage{hyperref}
\usepackage{geometry}
\usepackage{caption}
\usepackage{siunitx}
\usepackage{titlesec}
\usepackage{float}
\geometry{top=1in, right=1in, left=1in, bottom=1in}
\captionsetup[table]{labelfont=footnotesize}
\captionsetup[figure]{labelfont=footnotesize}
\titlespacing*{\section}{0pt}{10pt}{10pt}
\captionsetup{aboveskip=3pt, belowskip=-6pt}
```

This matches `main.tex` after the reference-style restyle, so all team subquestions compile cleanly under one main file.

---

## Anti-patterns

- **Channel without sign.** "There is also a fiscal effect that depends on the budget constraint." Either sign it or drop it.
- **Sign without closed form.** "Insurance is positive." Insurance term: derive it.
- **Triple-counting.** Don't list `ΔW_eff` and `ΔW_pg` and `ΔW_red` if your model is one-good and one-period — they collapse. The ledger should have as many rows as your model has independent welfare effects.
- **Leaving heterogeneity to a footnote.** Q4 explicitly asks for it. Make it a paragraph.
- **Putting the calibrated number in the inequality.** The inequality is symbolic. Numbers go in Phase 5 (Calibration).
