#!/usr/bin/env python3
"""[REPL-RUN] HSV 2017 QJE: reproduce the WTI-derived country-level
progressivity 'prog_avg' used in the cross-country regression
(Section 8, xcountryreg_final.do).

prog_k = 1 - (1 - mr_ky/100) / (1 - ar_ky/100), for k = 1..4 (multiples of avg inc).
prog_avg = mean(prog_1, prog_2, prog_3, prog_4).

We compute prog_avg for the U.S. and major European countries in selected years
and compare to the paper's headline calibration (US tau ≈ 0.181 from PSID;
cross-country values typically in 0.1–0.4 range across OECD).
"""
import pyreadstat, pandas as pd
from pathlib import Path

ROOT = Path("/Users/Alessandro/Desktop/people/Alessandro/website/my note taking app/Advanced Micro/Exam material/Take_home/research/repl/hsv2017/Data.Code_for_Replication/Data/Section_8")

wti, _ = pyreadstat.read_dta(str(ROOT / "WTI.dta"))
print(f"[INFO] WTI rows={len(wti)}")
for k in (1,2,3,4):
    suffix = "_y" if k==1 else f"_{k}y"
    wti[f"prog_{k}"] = 1 - (1 - wti[f"mr{suffix}"]/100.0) / (1 - wti[f"ar{suffix}"]/100.0)
wti["prog_avg"] = wti[["prog_1","prog_2","prog_3","prog_4"]].mean(axis=1)

# Inspect for selected countries / years
COUNTRIES = ["United States","Germany","France","Italy","United Kingdom","Sweden","Netherlands","Spain","Greece","Belgium"]
years = [1990, 1995, 2000, 2005]

sub = wti[wti["country"].isin(COUNTRIES) & wti["year"].isin(years)]
sub = sub.pivot_table(index="country", columns="year", values="prog_avg")
print("\n=== WTI-derived prog_avg (HSV's tau proxy) by country × year ===")
print(sub.round(3).to_string())

# US at 2005
us2005 = wti[(wti["country"]=="United States of America") & (wti["year"]==2005)]
if len(us2005):
    row = us2005.iloc[0]
    print(f"\n[US 2005] prog_1={row['prog_1']:.3f} prog_2={row['prog_2']:.3f} prog_3={row['prog_3']:.3f} prog_4={row['prog_4']:.3f} prog_avg={row['prog_avg']:.3f}")
    print(f"          (paper PSID-based US tau ≈ 0.181 for 2000-2006)")
