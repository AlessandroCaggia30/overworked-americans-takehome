#!/usr/bin/env python3
"""[REPL-RUN] Reproduce a BBF (2019) headline number from the published replication
data set bbf_hours_data_release3.zip / data_pub.dta. We compute:

  (1) The H/N = (E/N) * HE = e * h * w decomposition for 2015 (paper's last yr)
      and 2019 (last data year) for several countries.
  (2) The Europe vs US gap and the share contributed by intensive vs extensive.

Reference: Bick, Bruggemann, Fuchs-Schundeln (2019) "Hours Worked in Europe and
the US: New Data, New Answers", Scandinavian J Econ 121(4): 1381-1416.
"""
import pyreadstat, pandas as pd, sys, math

DTA = "/Users/Alessandro/Desktop/people/Alessandro/website/my note taking app/Advanced Micro/Exam material/Take_home/research/repl/bbf_data/data_pub.dta"
df, meta = pyreadstat.read_dta(DTA)
print(f"[INFO] {DTA}")
print(f"[INFO] N obs = {len(df)}, columns = {len(df.columns)}")

# Show the column names that we need: H, HE, h, w, e, country, year
print(f"[INFO] columns sample: {list(df.columns[:30])}")

# Find country and year columns
ccol = [c for c in df.columns if c.lower() in ('country','iso','iso3','cnt')]
ycol = [c for c in df.columns if c.lower() in ('year','yr','t')]
print("country col candidates:", ccol)
print("year    col candidates:", ycol)

# Show countries & years
if ccol:
    print(df[ccol[0]].unique()[:30])
if ycol:
    print("year range:", df[ycol[0]].min(), "to", df[ycol[0]].max())

# Subset to 2019 (last full year) for 8 countries
KEEP_VARS = ['country','year','H','HE','h','w','e']
keep = [v for v in KEEP_VARS if v in df.columns]
print("Keeping:", keep)

if 'year' in df.columns and 'country' in df.columns:
    sub = df[(df['year']==2019)][keep].copy()
    print("\n[2019 cross-section]")
    print(sub.to_string(index=False))
    # log-gap decomposition vs US
    if {'H','HE','e'}.issubset(sub.columns):
        us = sub[sub['country']=='us']
        if len(us)==1:
            us_H, us_HE, us_e = us['H'].iloc[0], us['HE'].iloc[0], us['e'].iloc[0]
            print(f"\n[US 2019] H={us_H:.1f}  HE={us_HE:.1f}  e={us_e:.4f}")
            sub['lnH_gap'] = (us_H/sub['H']).apply(math.log)
            sub['lnHE_gap'] = (us_HE/sub['HE']).apply(math.log)
            sub['lne_gap'] = (us_e/sub['e']).apply(math.log)
            sub['intensive_share_%'] = sub['lnHE_gap']/sub['lnH_gap']*100
            sub['extensive_share_%'] = sub['lne_gap']/sub['lnH_gap']*100
            print("\n[Decomposition: log-gap vs US, 2019]")
            cols = ['country','H','HE','e','lnH_gap','intensive_share_%','extensive_share_%']
            print(sub[cols].to_string(index=False, float_format=lambda x: f"{x:7.3f}"))
