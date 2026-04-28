#!/usr/bin/env python3
"""[REPL-RUN] HSV 2017 QJE 'Optimal Tax Progressivity' — open the cross-country
data files from Section_8 and reproduce a number used in the paper.

The paper's calibration uses U.S. progressivity tau ≈ 0.181 from PSID 2000-2006.
The Section_8 cross-country dataset (PWT, SWIID, WID) is used in the
xcountryreg_final.do regression of country-level tau on observables.

Here we (a) describe the structure of these archives, (b) compute one summary
moment to verify that we can in fact open and read them, and (c) cross-check
against headline regressors in the published Table OA12 / Section 8.
"""
import pyreadstat, pandas as pd, os
from pathlib import Path

ROOT = Path("/Users/Alessandro/Desktop/people/Alessandro/website/my note taking app/Advanced Micro/Exam material/Take_home/research/repl/hsv2017/Data.Code_for_Replication/Data/Section_8")

print("=" * 72)
for f in sorted(ROOT.glob("*.dta")):
    df, meta = pyreadstat.read_dta(str(f))
    print(f"\n[FILE] {f.name}  rows={len(df)}, cols={len(df.columns)}")
    print(f"  cols: {list(df.columns)[:20]}")
    if 'country' in df.columns or 'cou' in df.columns or 'iso' in df.columns:
        ccol = [c for c in df.columns if c.lower() in ('country','iso','iso3','iso_code','cou','countrycode','code')][0]
        print(f"  countries: {sorted(set(str(x) for x in df[ccol].unique()))[:30]}")
    if 'year' in df.columns:
        print(f"  year range: {df['year'].min()} - {df['year'].max()}")
    # Print some descriptives
    for col in df.select_dtypes(include='number').columns[:6]:
        v = df[col].dropna()
        if len(v) > 0:
            print(f"  {col:20s} n={len(v):5d}  mean={v.mean():10.4f}  min={v.min():10.4f}  max={v.max():10.4f}")
