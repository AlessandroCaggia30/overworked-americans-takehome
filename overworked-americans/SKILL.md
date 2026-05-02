---
name: overworked-americans
description: Use when someone asks to draft, approach, or write up any Problem 1 subquestion of the Advanced Microeconomics 2026 take-home (the "Overworked Americans" problem). Team scope is Q1, Q2, Q7.4, Q7.5, Q7.ext. Triggers include "draft Q7.5 of the take-home", "build the welfare ledger for Q7.4", "approach Q7.ext", "edit Alessandro's Q1/Q2 part", "write up the regulation channel for Q7.4", "extend the unions argument for Q7.5".
disable-model-invocation: true
argument-hint: [subquestion-id, e.g. 1, 2, 7.4, 7.5, 7.ext]
---

## What This Skill Does

Forces a rigorous, six-phase workflow on the Problem 1 subquestions the team has agreed to deliver — Q1, Q2, Q7.4, Q7.5, Q7.ext — and produces a tight, citation-grounded `.tex` drop-in that fits the combined 7–8 page budget. The skill is shared across the team (Alessandro, Stefano, Eduard, Francesco) and lives in the team's Dropbox folder so all four authors can invoke it and produce style-consistent sections.

## Team scope

| Subquestion | Owner | Status |
|---|---|---|
| Q1 (document the gap) | Alessandro | Drafted in `main.tex` |
| Q2 (tax model + conditions) | Alessandro | Drafted in `main.tex` |
| Q7.4 (welfare comparison via Q4 regulation channel) | Francesco + Stefano | To do |
| Q7.5 (welfare comparison via Q5 unions / sectoral-shifts channel) | Francesco + Stefano | To do |
| Q7.ext (additional channel beyond Q4/Q5) | Eduard | To do |

**Out of scope:** Q3, Q4, Q5, Q6 are **not** standalone deliverables. Q4 and Q5 mechanisms are still relevant — they feed into Q7.4 and Q7.5 respectively — and are described in `question-catalog.md` as **reference material** to be invoked inside the corresponding Q7.x welfare ledger. Do not write a standalone Q3/Q4/Q5/Q6 section.

If the user asks about a different Problem (Problem 2 firm-size, Problem 3 education, etc.) or about Q3/Q6, do **not** use this skill.

## When to Use

- "Draft Q7.5 of the take-home"
- "Build the welfare ledger for Q7.4 (regulation)"
- "Approach Q7.ext"
- "Edit / extend Alessandro's Q1 or Q2 section"
- "Write up the unions channel for Q7.5"

## Inputs

The skill expects to find, **at the root of the team's Dropbox folder**:

1. **`TakeHome_clean.pdf`** — the take-home PDF. Read the relevant page(s) for the verbatim subquestion text before Phase 1; do not paraphrase.
2. **`main.tex`** — the team's combined working `.tex` (currently containing Q1, Q2, Q7 by Alessandro; will grow as Q7.4 / Q7.5 / Q7.ext are added). Read it once at Phase 3 for notation alignment.
3. **The subquestion id** — passed as `$ARGUMENTS`. One of: `1`, `2`, `7`, `7.4`, `7.5`, `7.ext`. If not provided, ask the user once before starting.

## Outputs

Each invocation produces, **at the root of the team's Dropbox folder**:

- **`q<id>.tex`** — a self-contained `.tex` section (e.g. `q7_4.tex`, `q7_5.tex`, `q7_ext.tex`). Length cap: ~1.5 pages of the final 7–8 page document. Uses the **reference-style preamble** (12pt, 1in margins, plain prose; see "Output style" below) to match the team's `main.tex`.
- **`research/q<id>/`** — research artefacts (create the `research/` directory if absent):
  - `citations.md` — every cited paper with title, authors, year, journal, DOI/URL. Verified via web search; no fabricated citations.
  - `calibration.py` (when applicable) — Python script producing the numerical verdict and robustness sweep.
  - `figures/` (intermediate / working) — diagnostics, calibration sweeps, anything you don't yet trust to embed in the final `.tex`.
  - `derivation_notes.md` — long-form derivations a subagent produces; only the final results enter the `.tex`.

**Final figures live at the Dropbox root in `figures/`** (the team's `main.tex` has `\graphicspath{{figures/}}` so they can be referenced by bare filename: `\includegraphics{q7_4_aubry.pdf}`). Promote a figure from `research/q<id>/figures/` to `figures/` once it is ready to embed in the submitted document. Filename convention: `q<id>_<descriptive_name>.pdf` (e.g. `q7_4_aubry_did.pdf`) to prevent collisions.

**Avoid redundancy.** Do not create a second `research/` tree under any subfolder; everything lives at the Dropbox root. Do not create a `Take_Home/` subfolder — the new layout is flat.

## The Six-Phase Workflow

Every invocation follows the same six phases. The middle phase (Phase 4 — Derivation Core) **routes** based on the subquestion's shape. Detailed instructions per phase live in `phases.md`; load that file before Phase 1.

1. **Parse.** Read the verbatim subquestion. Classify its shape: DOCUMENT / MODEL+CONDITIONS / MODEL+WELFARE / MODEL+DATA-HYPOTHESIS. Identify hand-offs to other subquestions. State the deliverable in one sentence.
2. **Background.** Web-search and ground every empirical claim and citation in real published work. Pull the canonical references for the subquestion (`question-catalog.md` lists them per question). No fabrication.
3. **Model.** Primitives (agents, preferences, technology, information). Each assumption with one line of "what it buys, what it costs". One notation table aligned with `main.tex`.
4. **Derivation Core.** Routes by shape:
   - DOCUMENT (Q1) → identity decomposition + cross-country facts.
   - MODEL+CONDITIONS (Q2) → FOCs, equilibrium, signed comparative statics, an explicit condition.
   - MODEL+WELFARE (Q7, Q7.4, Q7.5, Q7.ext) → equilibrium, then **welfare ledger** (load `welfare-ledger.md`): named, signed, closed-form channels of `W(θ_EU) − W(θ_US)`, leading to an explicit inequality on primitives.
5. **Empirical Anchor + Verdict.** Calibrate with cited parameters; numerical verdict; robustness ±20% on 2–3 key parameters using the Python sandbox. State what data would adjudicate.
6. **Hand-off + Limits.** Honest limitations. One paragraph linking to neighbouring subquestions (Q7.4 → Q4 regulation literature + Alessandro's `τ`, `μ_b^j`; Q7.5 → Q5 unions literature; Q7.ext → coordinate with Eduard's chosen channel).

Phase order is enforced. Do not produce calibration output before the welfare ledger is signed; do not write the `.tex` before Phase 6 is in place.

For full per-phase instructions, see `phases.md`. For the welfare-ledger sub-procedure, see `welfare-ledger.md`. For per-question routing (shape, mechanisms, canonical references, hand-offs), see `question-catalog.md`.

## Tools Allowed and How to Use Them

- **WebSearch / WebFetch** — for citations and empirical facts. **Mandatory before using any citation.** Record verified citations in `research/q<id>/citations.md`.
- **Bash (Python sandbox)** — for calibration, robustness sweeps, and figures. Use `pip install --break-system-packages` if needed. Save scripts to `research/q<id>/calibration.py`.
- **Subagent delegation (`Plan` or `general-purpose`)** — for heavy algebraic derivations. Pattern: send a self-contained brief stating primitives, agent problems, the object to derive, the constraint that all comparative statics must be signed. Receive only the final closed-form result + signed terms; full derivation goes in `derivation_notes.md`. Example brief:

  > "Derive the equilibrium and welfare ledger for the following two-regime model. Primitives: [...]. The two regimes differ only in θ ∈ {θ_US, θ_EU}. Welfare criterion: utilitarian. Decompose W(θ_EU) − W(θ_US) into named, signed, closed-form channels. Each channel must have an explicit sign expression in the primitives. Return: (1) equilibrium conditions, (2) the ledger as a table, (3) the inequality on primitives under which W(θ_EU) > W(θ_US). Do not return the full derivation in the response — write it to `derivation_notes.md`."

## Output style (reference-style preamble — must match `main.tex`)

The team has agreed on a single LaTeX style for all sections. **Every `.tex` drop-in must be compatible with this preamble** so all sections compile under one main file:

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

**Do NOT use** `mdframed`, `enumitem`, `tikz`, `multirow`, or `xcolor`-based coloured boxes (`tldr`, `verdictgreen`, `verdictorange`, `planbox`). Style summaries and verdicts as plain bold-prefixed paragraphs:

```latex
\noindent\textbf{Bottom line.} <2-4 sentence verdict, including the explicit
condition or inequality, the calibrated sign, and the key caveat.>
\bigskip
```

## Guardrails

- **No fabricated citations.** Every paper cited must be web-search verified and recorded in `research/q<id>/citations.md` with a DOI or publisher URL.
- **No hand-waved welfare channels.** For MODEL+WELFARE questions, every channel of the welfare ledger must have (a) a name, (b) an explicit sign, (c) a closed-form expression in the primitives. See `welfare-ledger.md`.
- **Length cap.** ~1.5 pages of the final 7–8 page document (single-spaced, 12pt). Tighten prose, not rigor.
- **Phase order is enforced.** Equilibrium → ledger → calibration → `.tex`. No shortcuts.
- **Notation alignment.** Read `main.tex` at Phase 3 and reuse variable names where they overlap (composite wedge `τ`, mean fixed cost `μ_b^j`, hours per worker `HE`, employment rate `e`, hours per adult `H/N`, B'enabou progressivity `τ_p`). Declare new notation explicitly.
- **Style alignment.** Reference-style preamble only — no `mdframed` / `enumitem` / `tikz`. See "Output style" above.
- **One subquestion per invocation.** Run the skill once per subquestion to keep quality high.
- **Q3 / Q4 / Q5 / Q6 are not deliverables.** Do not produce a standalone Q3/Q4/Q5/Q6 section. Q4 / Q5 mechanisms feed into Q7.4 / Q7.5 — invoke them as references inside the corresponding Q7.x ledger.
- **Auto-invocation disabled** (`disable-model-invocation: true` in frontmatter) — the skill writes files, so it must be explicitly invoked.

## Output Template (.tex Drop-in)

```latex
% =========================================================================
\section{Q<id> -- <one-line title>}
% =========================================================================

\begingroup\small\itshape\noindent\textbf{Question <id>.} <verbatim question text>\endgroup

\noindent\textbf{Bottom line.} <2-4 sentence verdict, including the explicit
condition or inequality, the calibrated sign, and the key caveat.>
\bigskip

\subsection{Setup and primitives}
% Notation table + assumptions, one line of justification per assumption.

\subsection{Equilibrium}
% Closed-form FOCs, equilibrium conditions, signed comparative statics.

\subsection{<Phase 4 route-specific section title>}
% MODEL+WELFARE: "Welfare ledger" with a table of named, signed channels.
% MODEL+CONDITIONS: "Conditions for [outcome]" with the explicit inequality.
% DOCUMENT: "Decomposition and cross-country facts".

\subsection{Calibration and robustness}
% Numerical verdict + ±20% sweep on key parameters. Cite every number.

\subsection{Limitations and hand-off}
% Honest limits. Links to neighbouring subquestions.
```

## Notes

- **Read `phases.md` at the start of every invocation.** It expands each phase with concrete checklists.
- **For MODEL+WELFARE questions, also load `welfare-ledger.md` at Phase 4.** It gives the channel taxonomy and the inequality template.
- **Q1 and Q2 are already drafted by Alessandro** in `main.tex`. Do not redo unless the user explicitly asks for an edit or extension.
- **Update `research/q<id>/citations.md` as you go**; do not batch citations at the end.
- **If the user is uncertain which subquestion to tackle**, do not pick for them — ask once via AskUserQuestion before Phase 1.
- **All paths are flat at the Dropbox root.** No `Take_Home/` subfolder.
