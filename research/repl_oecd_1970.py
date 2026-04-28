#!/usr/bin/env python3
"""[REPL-RUN] Verify F1 in problem1.tex: hrs/worker, 1970, 8 OECD countries.

Reads oecd_hours.csv (DSD_HW@DF_AVG_ANN_HRS_WKD/1.0, retrieved 2026-04 via
SDMX REST), filters MEASURE=HW (hours worked) and WORKER_STATUS=_T (Total
workers, not Employees-only), and reports the 1970 hours/worker for the 7
countries cited in F1. Confirms values to integer.
"""
import pandas as pd
from pathlib import Path

CSV = Path(__file__).parent / "oecd_hours.csv"
df = pd.read_csv(CSV)

sub = df[(df["TIME_PERIOD"] == 1970)
         & (df["MEASURE"] == "HW")
         & (df["WORKER_STATUS"] == "_T")][["REF_AREA", "OBS_VALUE"]]

claimed = {"USA": 1949, "DEU": 1960, "FRA": 1993, "ITA": 2042,
           "ESP": 2046, "NLD": 1809, "SWE": 1562, "GBR": 1775}

print("Country  OECD value   Tex claim   Match")
print("-------  ----------   ---------   -----")
for c, v in claimed.items():
    rows = sub[sub["REF_AREA"] == c]
    if len(rows) == 0:
        print(f"{c}     ---           {v}        MISSING")
        continue
    actual = round(rows["OBS_VALUE"].iloc[0])
    ok = "OK" if abs(actual - v) <= 1 else "MISMATCH"
    print(f"{c}     {actual:>5}        {v:>5}        {ok}")
