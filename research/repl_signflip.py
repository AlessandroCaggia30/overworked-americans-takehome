#!/usr/bin/env python3
"""[REPL-RUN] Sign-flip test (Section 1.5 of problem1.tex).

Computes the extensive-share = ln(e_US/e_X) / ln(H_US/H_X) for every BBF
country in 2019, classifies into Northern (NW) vs Mediterranean+Eastern
(ME), and runs:

  (i)  bimodality check: gap [-10%, +10%] excludes all observations;
  (ii) Welch two-sample t-test on means;
  (iii) regression ext_share = alpha + beta * 1{ME} on the BBF panel.

Reproduces problem1.tex F-grade publishable observation.
"""
import math, statistics as s
import pyreadstat, pandas as pd
from pathlib import Path

DTA = Path(__file__).parent / "repl/bbf_data/data_pub.dta"
df, _ = pyreadstat.read_dta(str(DTA))
sub = df[df["year"] == 2019][["country", "H", "HE", "e"]].copy()
us = sub[sub["country"] == "us"].iloc[0]

sub["ln_H_gap"]  = (us["H"]  / sub["H"]).apply(math.log)
sub["ln_e_gap"]  = (us["e"]  / sub["e"]).apply(math.log)
sub["ext_share"] = 100.0 * sub["ln_e_gap"] / sub["ln_H_gap"]

# Drop US (zero gap) and CH/CZ (gaps ~0, shares ill-defined)
keep = sub[~sub["country"].isin(["us", "ch", "cz"])].copy()

NW = {"at", "de", "dk", "nl", "no", "se", "uk"}
ME = {"be", "es", "fr", "gr", "hu", "ie", "it", "pl", "pt"}
keep["regime"] = keep["country"].apply(
    lambda c: "NW" if c in NW else ("ME" if c in ME else "?"))

print(keep[["country", "ext_share", "regime"]].to_string(index=False,
      float_format=lambda x: f"{x:7.1f}"))

nw_vals = keep[keep["regime"] == "NW"]["ext_share"].tolist()
me_vals = keep[keep["regime"] == "ME"]["ext_share"].tolist()
print(f"\n[NW]   n={len(nw_vals)}  mean={s.mean(nw_vals):6.1f}  median={s.median(nw_vals):6.1f}  range=[{min(nw_vals):.0f},{max(nw_vals):.0f}]")
print(f"[ME]   n={len(me_vals)}  mean={s.mean(me_vals):6.1f}  median={s.median(me_vals):6.1f}  range=[{min(me_vals):.0f},{max(me_vals):.0f}]")

# Bimodality
gap_band = sum(1 for v in nw_vals + me_vals if -10.0 <= v <= 10.0)
print(f"\nBimodality: countries with extensive share in [-10%, +10%]: {gap_band}")

# Welch t-test
m1, sd1, n1 = s.mean(nw_vals), s.stdev(nw_vals), len(nw_vals)
m2, sd2, n2 = s.mean(me_vals), s.stdev(me_vals), len(me_vals)
se_diff = math.sqrt(sd1**2/n1 + sd2**2/n2)
t = (m2 - m1) / se_diff
print(f"Welch t = {t:.2f}  (gap = {m2 - m1:.1f} pp,  s.e. = {se_diff:.1f})")

# Simple OLS: ext_share = a + b * 1{ME}
keep["d_ME"] = (keep["regime"] == "ME").astype(int)
n   = len(keep)
xb  = keep["d_ME"].mean()
yb  = keep["ext_share"].mean()
sxx = ((keep["d_ME"] - xb) ** 2).sum()
sxy = ((keep["d_ME"] - xb) * (keep["ext_share"] - yb)).sum()
b   = sxy / sxx
a   = yb - b * xb
yhat = a + b * keep["d_ME"]
ss_res = ((keep["ext_share"] - yhat) ** 2).sum()
ss_tot = ((keep["ext_share"] - yb) ** 2).sum()
r2  = 1 - ss_res / ss_tot
sig2 = ss_res / (n - 2)
se_b = math.sqrt(sig2 / sxx)
print(f"\nOLS: ext_share = {a:.1f} + {b:.1f} * 1(Mediterranean+East)")
print(f"     s.e.(beta) = {se_b:.1f},  t(beta) = {b/se_b:.2f},  R^2 = {r2:.3f},  n = {n}")
