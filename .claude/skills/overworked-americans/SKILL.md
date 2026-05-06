---
name: overworked-americans
description: Use when someone asks to draft, edit, or simplify the team's Problem 1 take-home ("Overworked Americans"). Current focus is Q1, Q2, Q4, Q5 — Q7 is deferred (an earlier draft included it but the team has since simplified to Q1+Q2+Q4+Q5). Triggers include "draft Q4", "simplify Q5", "tighten Q1", "rewrite the union section", "produce v2 of problem1", "what does the grading rubric say about Q4".
disable-model-invocation: true
argument-hint: [subquestion-id, e.g. 1, 2, 4, 5]
---

## What This Skill Does

Forces a clear, hostile-grader-proof workflow on the team's Problem 1 ("Overworked Americans") subquestions and produces a tight `.tex` that compiles into the team's `problem1.tex` (or `problem1_v2.tex`). The skill enforces (a) explicit derivation of every comparative static and welfare condition, (b) worker-surplus + firm-surplus + joint-surplus decomposition for Q4 and Q5, and (c) honest acknowledgment of every omitted feature in a footnote at the point of omission.

The skill is shared across the team (Alessandro, Stefano, Eduard, Francesco) and lives at `.claude/skills/overworked-americans/` so all four authors can invoke it.

## Team scope (current — Q1+Q2+Q4+Q5)

| Subquestion | Owner | Status |
|---|---|---|
| Q1 (document the gap) | Alessandro | Drafted in `problem1.tex` |
| Q2 (Prescott + elasticity decomposition) | Alessandro | Drafted in `problem1.tex` |
| Q4 (hours regulation, optimality of cap) | Alessandro / team | Drafted in `problem1.tex` |
| Q5 (single union as welfare-restorer in two-sector economy) | Alessandro / team | Drafted in `problem1.tex` |

**Q7 is deferred.** An earlier draft included a Saez–Stantcheva λ-weighted welfare comparison; the team has since chosen to simplify to Q1+Q2+Q4+Q5 to maximise depth and clarity per the grading rubric. Q7 stays in `problem1.tex` for the moment but is not part of `problem1_v2.tex`. Q3 and Q6 remain out of scope.

If the user asks about a different Problem (Problem 2 firm-size, Problem 3 education, etc.) or about Q3/Q6/Q7 in v2, do **not** use this skill.

## When to Use

- "Draft Q4 of Problem 1"
- "Simplify the Q5 union section"
- "Tighten Q1 to under one page"
- "Write up the regulation channel — be very critical"
- "Produce a v2 of problem1.tex with only Q1+Q2+Q4+Q5"
- "Explain what the grading rubric expects for Q4"

## Inputs

The skill expects to find, **at the root of the repo**:

1. **`meta/TakeHome_clean.pdf`** (and / or `meta/take_home.pdf`) — the take-home PDF with the verbatim Q1–Q7 statements.
2. **`meta/grading_prompt_v2.md`** — the Pavoni-style hostile-grader rubric. **Read this before writing.** Particularly the Problem 1 specific bullets for Q2, Q4, Q5.
3. **`problem1.tex`** — the team's main combined document. Read it once at Phase 3 to align notation and reuse the existing common framework (quadratic-disutility worker, linear-quadratic firm, joint surplus).
4. **`plan.md`** — the team's storyline / strategy. The unifying narrative: Q1 fact → Q2 model says taxes are not enough → Q4 / Q5 propose institutional channels.
5. **`papers/`** — local PDFs of cited primary literature. Use these to spot-check claims about cited mechanisms / identification / headline results.
6. **`research/`** — replication scripts (`build_figure_panel.py` for Q1; `sim_models_v2.py` for Q2 / Q5; `sim_mechanisms.py` for Q4) and the produced figures in `figures/`.
7. **The subquestion id** — passed as `$ARGUMENTS`. One of: `1`, `2`, `4`, `5`. If not provided, ask the user once before starting.

## Outputs

- **`problem1_v2.tex`** — a simplified, hostile-grader-proof Problem 1 covering Q1+Q2+Q4+Q5 only. **Never** delete `problem1.tex`; v2 sits alongside.
- **In-place edits to `problem1.tex`** — for incremental work on a single subsection.
- **`research/q<id>/`** (if calibration / new figures are needed) — Python scripts, figures, verified citations.

All paths are flat at the repo root. No `Take_Home/` subfolder.

## The Six-Phase Workflow

Every invocation follows the same six phases. Detailed instructions live in `phases.md`; load that file before Phase 1.

1. **Parse.** Read the verbatim subquestion (from `meta/TakeHome_clean.pdf`), the corresponding rubric bullet (from `meta/grading_prompt_v2.md`), and the team's storyline note (from `plan.md`). State the deliverable in one sentence.
2. **Background.** Pull cited evidence from `papers/` (use the local PDFs and `research/summaries/` first; web-search only if missing). Spot-check that what the team has cited matches what the paper actually says.
3. **Model.** Reuse `problem1.tex`'s common framework: `V_w(h) = (1−τ)wh − ½α h²`, `V_f(h) = Ah − ½β h² − wh`, `W(h) = V_w + V_f`. Add a one-line "what it buys, what it costs" justification per assumption.
4. **Derivation core.** Routes by shape:
   - Q1 (DOCUMENT) → identity decomposition + cross-country facts.
   - Q2 (MODEL+CONDITIONS) → FOCs, equilibrium, signed comparative statics, the explicit condition.
   - Q4 (MODEL+WELFARE) → equilibrium under firm-power baseline + binding cap; **worker-surplus + firm-surplus + joint-surplus decomposition**; optimality condition for the cap; heterogeneity case (who is rationed, distributional consequences derived not asserted).
   - Q5 (MODEL+CONDITIONS + DATA-HYPOTHESIS) → competitive two-sector benchmark; single-union RTM bargain; show the union as **welfare-restorer** when `h^firm > h*` (the team's storyline angle); data hypothesis (sectoral employment shares, union density by sector, hours by sector).
5. **Empirical anchor.** Calibrate at the team's baseline (`A=2, w=1, α=β=2, τ=0.4`); produce figures via the existing scripts; cross-check with empirical anchors (Aubry 35-hour reform for Q4; ICTWSS / OECD STAN for Q5).
6. **Hand-off + limits.** Honest footnotes for what's omitted: extensive margin, home production, contract stickiness, sectoral composition (public-sector size).

Phase order is enforced. Do not write the `.tex` before Phase 6 limitations are mapped.

For full per-phase instructions, see `phases.md`. For the welfare-ledger sub-procedure, see `welfare-ledger.md`. For per-question routing, see `question-catalog.md`.

## Tools Allowed and How to Use Them

- **Read on `papers/` and `research/summaries/`** — first stop for citation grounding. Saves web-search round-trips.
- **WebSearch / WebFetch** — only if a citation can't be confirmed locally. Record verified citations in the `.tex` references list with full venue + DOI.
- **Bash (Python sandbox)** — for re-running `sim_mechanisms.py`, `sim_models_v2.py`, `build_figure_panel.py`. Save new scripts to `research/q<id>/calibration.py`.
- **Subagent delegation (`Plan` or `general-purpose`)** — for heavy algebraic derivations (e.g., the RTM bargain quadratic). Pattern: send a self-contained brief stating primitives, agent problems, the object to derive, the constraint that all comparative statics must be signed.

## Output style

The team has standardised on the existing `problem1.tex` preamble (9pt extarticle, 0.7in margins, `mdframed` `planbox` for the storyline). Reuse it without modification so all sections compile under one `problem1.tex` (or `problem1_v2.tex`).

Use `\boxed{...}` for the headline equations (h*(τ), the cap optimality band, the union FOC). Use a `planbox` for the storyline at the top.

## Guardrails

- **Hostile-grader bar.** Read `meta/grading_prompt_v2.md` Problem-1 section before drafting any subquestion. Specifically:
  - Q2 must derive the static FOC `(1−τ)w · u_c = −u_l` and produce a clean condition on preferences. Bonus: discuss intensive vs extensive margin and Frisch ≈ 3.
  - Q4 must produce a worker-surplus + firm-surplus decomposition and show that **with heterogeneity the binding cap creates rationing — distributional consequences must be derived, not asserted**.
  - Q5 must include a competitive benchmark with two sectors and labor mobility, then a unionised version (right-to-manage / efficient-bargain / median-union-member). Data: sectoral employment shares, union density, hours by sector.
- **No fabricated citations.** Every paper cited must be either (a) confirmed via a `papers/<file>.pdf` local copy, or (b) web-search verified with a DOI / publisher URL.
- **No assertion-only welfare claims.** Every welfare term has a name, a sign, and a closed-form expression in the primitives.
- **Length cap.** The full Problem 1 v2 fits 7–8 pages (single-spaced, 9–10pt). The grading rubric explicitly says **don't deduct for being over or under** the page budget — judge content density. Still: tighten prose, not rigor.
- **Acknowledge omissions where they bite.** Footnote at the point of omission: extensive margin (Q2/Q4), home production (Q1/Q2), contract stickiness (Q4 implicit), sectoral composition / public-sector size (Q5).
- **One subquestion per invocation.** Don't bundle Q4 and Q5 into a single skill call.
- **Q7 is deferred.** If the user asks for Q7, redirect: "Q7 was in an earlier draft of `problem1.tex`. The current focus is Q1+Q2+Q4+Q5. Want me to look at the existing Q7 in `problem1.tex` instead?"
- **Auto-invocation disabled** — the skill writes files, so it must be explicitly invoked.

## Output Template

```latex
% =========================================================================
\section{Q<id> -- <one-line title>}
% =========================================================================

\begingroup\small\itshape\noindent\textbf{Question <id>.} <verbatim question text>\endgroup

\subsection{Modelling choice}
% One-line "what it buys, what it costs" per assumption. Reference the rubric's bar.

\subsection{Setup and primitives}
% Reuse problem1.tex common framework. Only redefine if Q-specific.

\subsection{Derivation}
% FOCs, signed comparative statics, the explicit condition or welfare decomposition.

\subsection{Heterogeneity / sectoral case}
% Q4: who is rationed (α* threshold). Q5: two-sector RTM.

\subsection{Empirical anchor and limits}
% Calibration + figure. Footnote omissions where they bite.
```

## Notes

- **Read `phases.md` at the start of every invocation.** It expands each phase with concrete checklists.
- **For Q4, also load `welfare-ledger.md` at Phase 4** — the channel-by-channel sign discipline applies to the surplus decomposition.
- **`problem1.tex` already has Q1, Q2, Q4, Q5, Q7 drafted.** If invoked for any of Q1–Q5, treat as an *edit* request: read the existing section first and produce a delta or simplification, not a redo. Q7 stays in `problem1.tex` but does not enter `problem1_v2.tex`.
- **Update the references list as you go.** Don't batch.
- **If the user is uncertain which subquestion to tackle**, ask once via AskUserQuestion before Phase 1.
