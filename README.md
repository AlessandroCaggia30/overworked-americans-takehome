# Overworked Americans — PhD Advanced Microeconomics Take-home

**Problem 1, Pavoni 2026, Bocconi.** *Why do Americans work more than Europeans?*

This repository bundles a complete answer to Q1, Q2 and Q7 of Pavoni's take-home, plus all the primary data, all 40 cited papers as open-access PDFs, and every replication script. **Anyone with this link can clone and re-run the analysis end to end.**

---

## What's in here

| File | What it is |
|------|-----------|
| **`problem1.pdf`** | Final 12-page answer (the main deliverable — Q1, Q2, Q7, references, appendix proofs) |
| **`problem1.tex`** | LaTeX source |
| **`figure_panel.pdf`** | Five-panel figure used in Q1 (regional colour-coded; rebuild script in `research/build_figure_panel.py`) |
| **`take_home.tex`** | Pavoni's original prompt (for reference) |
| **`papers/`** | All 40 cited papers as open-access PDFs + bibliography index + bulk-download script |
| **`research/`** | Primary data, replication scripts, intermediate output files |

## How to reproduce the entire answer from scratch

```bash
# 1. Clone
git clone https://github.com/AlessandroCaggia30/overworked-americans-takehome.git
cd overworked-americans-takehome

# 2. Decompress the OECD employment panel (gzipped to fit GitHub's 100 MB limit)
gunzip -k research/oecd_emp_long.csv.gz

# 3. Compile the LaTeX (requires pdflatex with mdframed, multirow)
pdflatex problem1.tex

# 4. (Optional) Re-download all 40 papers from open-access sources
bash papers/download.sh

# 5. (Optional) Re-run all numerical results
cd research
python3 repl_oecd_1970.py            # 1970 hours/worker by country
python3 repl_bbf_decomp.py           # BBF 2019 intensive/extensive decomposition
python3 repl_signflip.py             # Two-regime classifier
python3 repl_hsv2017_progressivity.py # HSV 2017 progressivity index
python3 repl_bfl_2018.py             # BFL 2018 cross-country hours
python3 repl_q7_ledger.py            # Q7 ten-channel welfare ledger
python3 repl_aubry_did.py            # Aubry 35-hour DiD reduced-form
python3 build_figure_panel.py        # Regenerate figure_panel.pdf
```

Every numerical claim in `problem1.pdf` traces to one of these scripts; outputs are saved as `*.out` files alongside the scripts.

---

## The argument in one paragraph

Hours per working-age adult are 15–30% lower in Northern Europe than in the US, but **not** in Mediterranean and Eastern Europe. Northern Europe gets there via fewer hours per worker (intensive margin); Italy/Spain/Greece/Poland/Hungary work nearly as many hours per worker as the US but employ a much smaller fraction of the population (extensive margin). The same tax wedge of ~55% produces a 17% intensive collapse in Germany but a 28% extensive collapse in Italy — **no uniform-response mechanism can do this**. What works is **taxes interacting with country-specific institutions** (joint vs. individual filing, informal sector, childcare, employment protection). Q2 builds the closed-form synthesis model that captures this interaction; Q7 quantifies the welfare consequences in a ten-channel ledger validated against Jones–Klenow (2016).

---

## Headline numbers (all reproducible)

| Result | Value | Script |
|--------|------:|--------|
| BBF 2019 intensive share, Germany | +142% | `repl_bbf_decomp.py` |
| BBF 2019 extensive share, Italy | +59% | `repl_bbf_decomp.py` |
| Tax-wedge spread, 4 highest-τ countries | 6 pp / 367 hours | `oecd_taxwedge.csv` |
| Aubry 35-hour DiD coefficient | $\hat\beta = -0.042$ ($t = -6.6$) | `repl_aubry_did.py` |
| NW Europe welfare ratio vs US | 1.025 | `repl_q7_ledger.py` |
| Mediterranean+East welfare ratio vs US | 0.778 | `repl_q7_ledger.py` |
| Sobol index of mortality channel | 0.91 (91% of variance) | `repl_q7_ledger.py` |

---

## Data sources

| Source | What | How retrieved |
|--------|------|---------------|
| OECD SDMX REST API | hours/worker, employment 15–64, tax wedges 1950–2024 | `DSD_HW`, `DSD_LFS_EMP_WAP_Q`, `DSD_TAX_WAGES_COMP` (2026-04) |
| BBF Data Release 3 (May 2021) | hours/worker decomposition, 18 EU + US, n=707 | `research/bbf/data_pub.dta` |
| BFL 2018 | cross-country hours/employed, n=45 | `research/repl/bfl_data/` |
| HSV 2017 Dataverse | progressivity index $\tau^{WTI}$ | `research/repl/hsv2017/` |
| KLPSZ 2019 | child penalty event-studies | `research/kleven_2019.pdf` |
| PWT 10.0 | per-capita real consumption ratios | direct download |
| ILO / Schneider 2010 | informal sector shares | bibliography |

---

## Bibliography

40 cited papers as open-access PDFs in `papers/`. See `papers/00-INDEX.md` for the bibliography organised by question, with $\bigstar$ marking replication packages I actually opened. A few paywalled classics (Hansen 1985, Rogerson 1988, Bénabou 2002, Manning 2003) are referenced by journal citation in `00-INDEX.md` under "Not downloaded".

---

## Authorship and licence

Alessandro Caggia — Bocconi University, Advanced Microeconomics (Pavoni), May 2026.

Pavoni's original prompt (`take_home.tex`) is included for reference; copyright Nicola Pavoni.

The bundled paper PDFs are open-access from NBER, the Federal Reserve, or the authors' own websites; the papers are owned by their respective publishers.

The author's own work in this repository (LaTeX, scripts, README) is released under MIT.
