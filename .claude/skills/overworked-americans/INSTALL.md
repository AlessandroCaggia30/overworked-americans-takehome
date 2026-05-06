# Installing the `overworked-americans` skill

A Claude Code / Cowork skill for rigorously approaching the Problem 1 subquestions of the Advanced Microeconomics 2026 take-home that the team has agreed to deliver: **Q1, Q2, Q7.4, Q7.5, Q7.ext**.

## Team setup (already done by Francesco)

The team's working folder is **`~/Library/CloudStorage/Dropbox/Take_Home_Micro/`**. The skill is installed at `Take_Home_Micro/.claude/skills/overworked-americans/`. Anyone with access to the shared Dropbox folder will have the skill auto-loaded when they open the folder in Claude Code or Cowork.

If you are working in a copy of the folder *outside* Dropbox and the skill is missing, drop the `overworked-americans/` folder (the same one this INSTALL.md ships with) into `<your-working-folder>/.claude/skills/`. If the `.claude/skills/` directory doesn't exist, create it:

```bash
mkdir -p <your-working-folder>/.claude/skills
# then drop overworked-americans/ in there
```

## What you get

A six-phase workflow (Parse → Background → Model → Derivation Core → Verdict → Hand-off) routed by the subquestion's shape. For Q7.x this is MODEL+WELFARE: the skill builds a signed welfare ledger and an explicit inequality on primitives. The output is a tight ≤1.5-page `.tex` drop-in plus a `research/` folder with calibration scripts and verified citations, all at the Dropbox root.

## Team scope

| Subquestion | Owner | Status |
|---|---|---|
| Q1 | Alessandro | Drafted in `main.tex` |
| Q2 | Alessandro | Drafted in `main.tex` |
| Q7.4 (regulation channel) | Francesco + Stefano | To do |
| Q7.5 (unions / sectoral-shifts channel) | Francesco + Stefano | To do |
| Q7.ext (extension) | Eduard | To do |

**Q3, Q4, Q5, Q6 are not deliverables.** Q4 and Q5 mechanisms feed Q7.4 / Q7.5 as references only.

## How to use

In Claude Code or Cowork, with the Dropbox folder open, invoke:

```
/overworked-americans 7.4
/overworked-americans 7.5
/overworked-americans 7.ext
```

Or in natural language:

- "Draft Q7.5 of the take-home"
- "Build the welfare ledger for Q7.4"
- "Approach Q7.ext"

The skill reads `TakeHome_clean.pdf` for the verbatim subquestion text and `main.tex` for notation and hand-off context, then runs the six phases and writes:

- `q7_4.tex` (or `q7_5.tex`, `q7_ext.tex`) — the drop-in section, in the team's reference style.
- `research/q7_4/` (etc.) — calibration scripts, intermediate / working figures, verified citations.
- `figures/` (Dropbox root) — promote a finalised figure here when it's ready to embed in the submitted `main.tex`. The preamble has `\graphicspath{{figures/}}`, so reference figures by bare filename. Use `q<id>_<name>.pdf` to prevent collisions across subquestions.

All paths are flat at the Dropbox root. No `Take_Home/` subfolder.

## Style conventions (reference-style preamble)

The team has standardised on the reference style: 12pt, 1-inch margins, `\titlespacing*{\section}{0pt}{10pt}{10pt}`, footnotesize captions, plain prose. **Do not use** `mdframed` boxes (`tldr`, `verdictgreen`, `verdictorange`, `planbox`) — Alessandro's tex has been restyled to drop them. TL;DRs and verdicts are plain bold-prefixed paragraphs:

```latex
\noindent\textbf{Bottom line.} <2-4 sentence verdict.>
\bigskip
```

## Notation conventions

When writing your subquestion, the skill will reuse Alessandro's notation where it overlaps:

| Symbol | Meaning |
|---|---|
| `τ` | Composite labour wedge |
| `τ_p` | HSV / Bénabou progressivity index |
| `μ_b^j` | Mean fixed cost of working in country `j` |
| `HE`, `e`, `H/N` | Hours per worker, employment rate, hours per adult |
| `α`, `γ` | Inverse Frisch, risk aversion |
| `θ` | Generic policy parameter distinguishing US and EU |
| `ω` | Worker-vs-firm-owner MU ratio (Q7.4) |
| `v_z`, `u` | Log-earnings variance, unemployment friction (Q7.5) |
| `h̄` | Hours cap (Q7.4) |

New notation per subquestion (`c` for union coverage, channel-specific symbols for Q7.ext) is declared in the notation table.

## Guardrails the skill enforces

- No fabricated citations — every paper is web-search verified.
- No hand-waved welfare channels — every channel of the welfare ledger has a sign and a closed-form expression.
- ~1.5 page cap per subquestion so Q1 + Q2 + Q7.4 + Q7.5 + Q7.ext fit the 7–8 page total.
- Phase order is enforced: equilibrium → welfare ledger → calibration → `.tex`. No shortcuts.
- Reference-style preamble only (no `mdframed`).

## Editing the skill

If the skill produces output you don't agree with, the fix lives in `phases.md` (process), `welfare-ledger.md` (welfare-comparison sub-procedure), or `question-catalog.md` (per-question routing and references). Edit those files directly — the changes apply to everyone in the team using the same skill folder, since the folder is in shared Dropbox.
