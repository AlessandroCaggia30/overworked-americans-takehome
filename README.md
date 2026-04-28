# Overworked Americans — Take-home (Advanced Microeconomics, Pavoni 2026)

Problem 1 of the take-home exam: *why do Americans work more than Europeans?*

This repo bundles the answer (`problem1.tex` / `.pdf`), the **40 cited papers** as open-access PDFs (NBER WPs / Federal Reserve archives / author pages), the **primary data** used in Q1's decomposition, and reproducible **figure / table generation scripts**.

---

## Layout

```
.
├── problem1.tex                   # main answer (Q1–Q7)
├── problem1.pdf                   # compiled PDF
├── figure_panel.pdf               # six-panel figure used in Q1
├── take_home.tex / TakeHome(1).pdf  # Pavoni's original prompt
├── papers/                        # 40 cited papers + index
│   ├── 00-INDEX.md                # bibliography by question, with replication-package status
│   └── download.sh                # re-runnable bulk fetcher (NBER / FRB / author pages)
└── research/                      # primary data + replication artefacts
    ├── oecd_emp_long.csv.gz       # OECD employment 15–64 quarterly (333k obs) — gzipped
    ├── oecd_hours.csv             # OECD annual hours/worker
    ├── tw.csv                     # OECD tax wedge
    ├── bbf/data_pub.dta           # BBF (2019) Data Release 3 (n=707) — replication ★
    ├── bbf_data.zip               # BBF replication archive (full bundle)
    ├── kleven_2019.pdf            # NBER WP 25524 (verified text-extracted)
    ├── repl/                      # ad-hoc replication scratch
    └── summaries/                 # generated tables/numbers
```

The `research/oecd_emp_long.csv` is gzipped to fit GitHub's 100 MB file limit. Decompress with:

```bash
gunzip -k research/oecd_emp_long.csv.gz
```

---

## Reproducing the answer

```bash
# 1. Compile the LaTeX
pdflatex problem1.tex

# 2. Bulk-download the bibliography
bash papers/download.sh

# 3. Decompress the OECD panel
gunzip -k research/oecd_emp_long.csv.gz
```

The figure panel (`figure_panel.pdf`) is included pre-rendered. Source data live in `research/`; the OECD pulls were made via the OECD SDMX REST API (datasets `DSD_HW`, `DSD_LFS_EMP_WAP_Q`, `DSD_TAX_WAGES_COMP`) and the BBF (2019) Data Release 3.

---

## Notes for collaborators

- Citations in the LaTeX use **inline** primary-source tags `[SOURCE: ...]` for traceability. Every numerical claim in Q1 traces to either the OECD SDMX series or the BBF replication file.
- Replication-package symbol **★** in `papers/00-INDEX.md` marks packages we actually opened and from which we reproduced ≥1 number.
- Q7 integrates seven welfare channels (Prescott / HSV / Jones-Klenow / AGS / Q4 redistribution / Q5 unions / SWB) with a closed-form decomposition and a $\pm$50% joint-perturbation robustness grid.
- The 40 PDFs in `papers/` are open-access (NBER WPs, FRB archives, author pages); a few paywalled originals (Hansen 1985, Rogerson 1988, Bénabou 2002, Manning 2003) are listed in `papers/00-INDEX.md` under "Not downloaded" with the journal references.

---

## Authorship

Alessandro Caggia — Bocconi, Advanced Microeconomics, 2026.

Pavoni's original prompt (`take_home.tex`, `TakeHome(1).pdf`) is included for reference; copyright Nicola Pavoni.
