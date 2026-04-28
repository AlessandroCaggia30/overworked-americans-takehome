#!/usr/bin/env python3
"""[REPL-RUN] Bick-Fuchs-Schundeln-Lagakos (BFL) 2018 AER 'How Do Hours Worked
Vary with Income? Cross-Country Evidence and Implications', NBER 21874.

The replication data set decile_hours_wages.dta has hours_paid_empl and wages
by decile for 45 countries. The BFL headline claim is that average hours
worked per employed person DECLINE with country development (income).

We compute country-mean hours_paid_empl across the 10 deciles, then sort by
GDP-decile (q_e9ry) and verify the negative gradient.
"""
import pyreadstat, pandas as pd
df, _ = pyreadstat.read_dta(
    "/Users/Alessandro/Desktop/people/Alessandro/website/my note taking app/Advanced Micro/Exam material/Take_home/research/repl/bfl_data/decile_hours_wages.dta")

# Average hours_paid_empl across 10 deciles per country
mean_hrs = df.groupby(["country","year","q_e9ry"])["hours_paid_empl"].mean().reset_index()
mean_hrs.rename(columns={"hours_paid_empl":"avg_h_per_emp_weekly"}, inplace=True)
mean_hrs["avg_h_per_emp_annual"] = mean_hrs["avg_h_per_emp_weekly"]*52
print("=== Country-level avg hours per employed (52*weekly) by income tercile ===")
print(mean_hrs.sort_values("q_e9ry").to_string(index=False, float_format=lambda x: f"{x:8.2f}"))

# Average over q_e9ry buckets (1=low income, 3=high income)
agg = mean_hrs.groupby("q_e9ry").agg(
    n_countries=("country","nunique"),
    weekly_h_per_emp=("avg_h_per_emp_weekly","mean"),
    annual_h_per_emp=("avg_h_per_emp_annual","mean"),
)
print("\n=== Mean by income tercile ===")
print(agg.to_string(float_format=lambda x: f"{x:7.2f}"))

# Specific cross-country check: US vs DEU vs IRL
print("\n=== Selected countries: avg hours_paid_empl across 10 deciles (weekly) ===")
for c in ["USA","DEU","FRA","ITA","IRL","SWE","UGA","KEN","BWA"]:
    sub = df[df["country"]==c]
    if len(sub)>0:
        print(f"  {c}: weekly={sub['hours_paid_empl'].mean():.2f}  annual={sub['hours_paid_empl'].mean()*52:.0f}  n_obs={len(sub)}")
