# Six-Phase Workflow — Detailed Instructions

This file expands the six phases that `SKILL.md` enforces. Read it once at the start of every invocation. Each phase has (a) a goal, (b) concrete actions, (c) the deliverable that gates the next phase.

The team's deliverables are Q1, Q2, Q7.4, Q7.5, Q7.ext only. Q3 and Q6 are out of scope; Q4 and Q5 are reference material that feeds Q7.4 and Q7.5.

All paths in this skill are flat at the **Dropbox root** (`Take_Home_Micro/`). There is no `Take_Home/` subfolder.

---

## Phase 1 — Parse

**Goal.** Stop, read, and classify the subquestion before doing anything. Most failures on rigorous-theory take-homes come from answering the wrong question.

**Actions.**

1. Open `TakeHome_clean.pdf` and locate the subquestion. Copy its **verbatim** text (do not paraphrase) into a Phase 1 working block.
2. Identify the **shape**:
   - **DOCUMENT** — the question asks you to document a fact, summarise a literature, or describe a policy. Q1 is the canonical example.
   - **MODEL+CONDITIONS** — the question asks you to write a model and derive conditions under which X. Q2 is canonical. Deliverable is an explicit inequality on primitives.
   - **MODEL+WELFARE** — the question asks for welfare effects, a welfare comparison, or a planner-vs-equilibrium check. Q7 and all Q7.x subdivisions are MODEL+WELFARE. Deliverable is a *signed welfare ledger* + an inequality.
3. Identify **mechanisms**: what economic forces are in play? For Q7.4 it's the Q4 hours-cap regulation; for Q7.5 it's Q5 unions / sectoral shifts; for Q7.ext it's whatever channel Eduard has chosen.
4. Identify **hand-offs**: which other subquestions does this draw on? Look in `question-catalog.md` for the dependency graph. All Q7.x subdivisions draw on Q1 and Q2 (already drafted in `main.tex`).
5. Write a one-sentence **deliverable statement**: "By the end of this section the reader will have [X], conditioned on [Y]."

**Deliverable gating Phase 2:** A short working note (kept in memory or scratchpad) with the verbatim question, the shape, the mechanisms, and the deliverable statement.

---

## Phase 2 — Background

**Goal.** Ground every empirical claim and every cited paper in real published work, retrieved via web search. No memorised citations.

**Actions.**

1. From `question-catalog.md`, pull the canonical reference list for the subquestion. For Q7.x: the parent Q4 / Q5 / channel-specific references plus the Q7-wide list (Saez 2001/2012, Jones-Klenow 2016, AGS 2005, HSV 2017, Bénabou 2002).
2. For each paper you intend to cite: web-search the title + authors + year. Confirm the journal, year, and DOI/URL. If the paper does not appear or details disagree with what you "remember", **drop the citation** rather than fabricate.
3. Maintain `research/q<id>/citations.md` with one entry per verified paper:
   ```
   - **Authors (Year).** *Title*. Journal, Volume(Issue), pages. DOI: [10.xxxx/...](url) — *Used in: [section name]*
   ```
4. Skim cited papers for the **specific empirical numbers or theoretical claims** you'll use. Pull at most two or three numbers per paper (avoid citation-stuffing).
5. If a claim is "common knowledge in macro labour" (e.g., "Frisch elasticities are typically estimated at 0.3–0.6"), still ground it in a cited survey (e.g., Chetty-Guren-Manoli-Weber 2011 or Keane 2011).

**Deliverable gating Phase 3:** `citations.md` populated with the verified bibliography. **At least 3 verified citations** for any subquestion that requires a model.

---

## Phase 3 — Model

**Goal.** Write down primitives clearly enough that someone could re-solve the model. Do not get clever yet.

**Actions.**

1. **Read `main.tex` first** for notation and the Q1/Q2 hand-off paragraphs. Reuse `τ`, `τ_p`, `μ_b^j`, `HE`, `e`, `H/N`, `α`, `γ`, `θ`, `ω`, `v_z`, `u` whenever they overlap.
2. List the **agents** (workers, firms, government, unions, households of various structures). For each, declare what they choose and what they take as given.
3. List the **preferences** (utility function form). Justify each functional choice in one line ("CRRA over consumption is standard since X; I avoid GHH because Y"). Match the literature you cited in Phase 2.
4. List the **technology** (production function, sectoral structure, externalities). Same one-line justifications.
5. List the **information / market structure** (perfect competition, monopsony, search frictions, asymmetric info).
6. State the **policy parameter** θ that distinguishes US from EU. For Q7.4 this is the hours cap `h̄`; for Q7.5 it is union coverage `c` (and / or `v_z`); for Q7.ext it depends on Eduard's chosen channel.
7. Build a **notation table** at the top of the section. Where notation must diverge from `main.tex`, say so.
8. State the **welfare criterion** explicitly (utilitarian Σ u_i, Rawlsian min u_i, planner with Pareto weights). For Q7.x this is non-negotiable.

**Deliverable gating Phase 4:** A clean primitives section with notation table, ready to drop in to the `.tex`. No solving yet.

---

## Phase 4 — Derivation Core (Routes by Shape)

**Goal.** Produce the question's main object. Routing is determined by Phase 1's shape classification.

### Route A — DOCUMENT (Q1)

Already drafted by Alessandro. If invoked for Q1, treat as an *edit* request: read `main.tex` first and produce a delta or extension, not a redo.

### Route B — MODEL+CONDITIONS (Q2)

Already drafted by Alessandro. If invoked for Q2, same as Route A — produce an edit / extension, not a redo.

### Route C — MODEL+WELFARE (Q7.4, Q7.5, Q7.ext) — the main route the team uses

**Load `welfare-ledger.md` now.** It contains the channel taxonomy and the inequality template. Then:

1. Solve the equilibrium under both regimes θ_US and θ_EU.
2. Compute W(θ) and expand `ΔW = W(θ_EU) − W(θ_US)` into a **welfare ledger** — a table where each row is a named channel with (a) a name, (b) a sign, (c) a closed-form expression in the primitives.
3. Aggregate the ledger to produce the **explicit inequality** on primitives under which Europe welfare-dominates.
4. **Heterogeneity check** — even though Q7's literal phrasing doesn't demand it, including a heterogeneous-agent variant matters for Q7.4 specifically (workers differ in `μ_b` or `h*`, the hours cap binds heterogeneously). State which channel(s) acquire ambiguous sign.
5. If algebra is heavy, **delegate to a subagent** with the brief in `SKILL.md`. Subagent writes `derivation_notes.md`; only the final ledger + inequality enter the `.tex`.

**Concrete reuse from `main.tex`:**
- Q7.4 → reuse Proposition (P1): `ΔW^R = (ω−1) N h̄ Δw − ½ N(v'' + N|F''|)(h*−h̄)²`. The Aubry DiD reduced-form anchor (`\hat\beta=−0.042, t=−6.61`) is also already there.
- Q7.5 → reuse Proposition (P2): `ΔW^U = ½ Δv_z − Δu · w h*`, positive iff `Δv_z / Δu > 2 w h*`.
- Q7.ext → reuse the channel proposition that matches Eduard's chosen channel (or build a new one).

**Deliverable gating Phase 5:** A signed welfare ledger + an explicit inequality on primitives.

---

## Phase 5 — Empirical Anchor + Verdict

**Goal.** Plug numbers in. Show the verdict and stress-test it.

**Actions.**

1. **Pick parameter values** for every primitive, citing each. Save the parameter table to the `.tex` and to `research/q<id>/parameters.csv`.
2. **Compute the numerical verdict**: does the inequality hold? By how much? `calibration.py` lives in `research/q<id>/`. Working figures from the calibration run go to `research/q<id>/figures/`; once a figure is finalised and ready to embed in the submitted document, **copy it to the Dropbox-root `figures/` folder** and reference it from the `.tex` by bare filename (`\graphicspath{{figures/}}` is set in the preamble). Use the filename convention `q<id>_<name>.pdf` to prevent collisions across subquestions.
3. **Robustness sweep** ±20% on 2–3 key parameters (e.g., `α`, `ω`, `Δv_z`, `Δu`, the cap intensity `h̄/h*`). Tabulate the verdict across the sweep — report whether the sign of the inequality flips.
4. If a Frisch / Hicksian / Marshallian distinction matters, state it explicitly (Alessandro flagged this in Q2; the same caveat applies to most labour-supply calibrations).
5. **What data would adjudicate** — end Phase 5 with one sentence on the empirical test that would discriminate the model from the most plausible alternative. (For Q7.4: an Aubry-style replication on a different reform; for Q7.5: Bartik shocks × union density panel; for Q7.ext: depends on channel.)

**Deliverable gating Phase 6:** A verdict section with a parameter table, the calibrated number, the robustness range, and a "data that would adjudicate" line.

---

## Phase 6 — Hand-off + Limits

**Goal.** Honest accounting of what the section does and does not do, plus a paragraph linking to neighbouring subquestions.

**Actions.**

1. **Limitations.** Two or three lines on what the model omits and why (first-order vs second-order; complexity; data unavailability). Aim for the same honesty bar as Alessandro's TL;DR caveats.
2. **Hand-off.** One paragraph on (a) which earlier subquestion the model rests on (cite the section number — typically Q1 fact pattern + Q2 `H/N = P(τ) h*(τ)` block), (b) which sibling subquestion the result composes with (Q7.4 ↔ Q7.5 ↔ Q7.ext should explicitly link).
3. **Bottom-line finalisation.** Now that the verdict is known, write the `\noindent\textbf{Bottom line.}` paragraph at the top of the `.tex`. Include: the explicit condition / inequality, the calibrated sign, the central caveat. **Do not** wrap it in `mdframed` — the team has agreed on the reference-style preamble (no coloured boxes).

**Deliverable gating output:** Drop-in `.tex` ready to merge with `main.tex`. Length ≤ ~1.5 pages. Reference-style preamble only.

---

## Order, Loops, and Anti-Patterns

- The phases are **strictly ordered** but you may loop back. If Phase 5 calibration shows the inequality is too sensitive to a parameter the model doesn't pin down, return to Phase 3 and add an assumption that does.
- **Anti-pattern A: jumping to LaTeX before the welfare ledger is signed.** Don't. The `.tex` is a downstream artefact.
- **Anti-pattern B: using Alessandro's old `mdframed` boxes.** The team has standardised on the reference-style preamble — no `tldr`, `verdictgreen`, `verdictorange`, `planbox`. Use `\noindent\textbf{Bottom line.}` etc.
- **Anti-pattern C: writing a standalone Q3/Q4/Q5/Q6 section.** Out of scope. Use Q4/Q5 only as references inside Q7.4 / Q7.5.
- **Anti-pattern D: citation stuffing.** A subquestion needs ~5–10 verified citations. More is filler.
- **Anti-pattern E: bundling subquestions.** Run the skill once per subquestion.
- **Anti-pattern F: creating a `Take_Home/` subfolder.** All paths are flat at the Dropbox root.
