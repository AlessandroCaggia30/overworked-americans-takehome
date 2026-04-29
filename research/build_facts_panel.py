"""
Build figure_facts.pdf for §1.4 -- four supporting facts F1-F4.

  F1: Hours per worker, 1970 (bar, US line marked)
  F2: 2019 hours per person 15-64 by gender (M/W bars by country)
  F3: Long-run child penalty by country, KLPSZ 2019
  F4: Weekly hours per employed across GDP-tercile, BFL 2018
"""
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec

REGIONS = {
    'Anglo':         {'color': '#D62728', 'iso': {'US', 'UK', 'IE', 'CA', 'AU', 'USA'}},
    'Nordic':        {'color': '#1F77B4', 'iso': {'SE', 'DK', 'NO', 'FI'}},
    'Central Europe':{'color': '#2CA02C', 'iso': {'DE', 'FR', 'NL', 'AT', 'BE', 'CH', 'DEU', 'FRA', 'NLD', 'AUT'}},
    'South Europe':  {'color': '#FF7F0E', 'iso': {'IT', 'ES', 'GR', 'PT', 'ITA', 'ESP'}},
    'East Europe':   {'color': '#9467BD', 'iso': {'PL', 'HU', 'CZ'}},
}

def color_of(c):
    for info in REGIONS.values():
        if c in info['iso']:
            return info['color']
    return '#888888'

fig = plt.figure(figsize=(13, 9))
gs = GridSpec(2, 2, figure=fig, hspace=0.5, wspace=0.3)

# ---------------------------------------------------------------------
# F1: Hours per worker, 1970
# ---------------------------------------------------------------------
ax1 = fig.add_subplot(gs[0, 0])
hrs_1970 = {
    'USA': 1949, 'DEU': 1960, 'FRA': 1993, 'ITA': 2042, 'ESP': 2046,
    'NLD': 1809, 'SWE': 1562, 'GBR': 1775,
}
sorted_hrs = sorted(hrs_1970.items(), key=lambda x: -x[1])
labels = [c for c, _ in sorted_hrs]
values = [v for _, v in sorted_hrs]
colors = [color_of(c) for c in labels]
ax1.bar(range(len(labels)), values, color=colors, edgecolor='black', linewidth=0.4)
ax1.set_xticks(range(len(labels)))
ax1.set_xticklabels(labels, fontsize=8)
ax1.axhline(y=hrs_1970['USA'], color='red', linestyle=':', linewidth=0.8, alpha=0.7)
ax1.text(len(labels) - 0.5, hrs_1970['USA'] + 25, 'US 1949', fontsize=7, ha='right',
         color='red', alpha=0.85)
ax1.set_ylabel('Hours per worker, 1970', fontsize=9)
ax1.set_title('F1. Pre-1970 ranking: US ranked 5th of 8',
              fontsize=10, fontweight='bold')
ax1.set_ylim(1400, 2200)
ax1.tick_params(axis='y', labelsize=8)
ax1.grid(axis='y', alpha=0.25, linewidth=0.4)

# ---------------------------------------------------------------------
# F2: 2019 hours per person 15-64 by gender
# ---------------------------------------------------------------------
ax2 = fig.add_subplot(gs[0, 1])
gender_data = {
    'US': (1517, 1164),
    'SE': (1329, 1100),
    'DE': (1330, 923),
    'IT': (1209, 716),
}
countries = list(gender_data.keys())
men_vals = [gender_data[c][0] for c in countries]
women_vals = [gender_data[c][1] for c in countries]
import numpy as np
x = np.arange(len(countries))
width = 0.36
ax2.bar(x - width/2, men_vals, width, color='#4C72B0', edgecolor='black', linewidth=0.3, label='Men')
ax2.bar(x + width/2, women_vals, width, color='#DD8452', edgecolor='black', linewidth=0.3, label='Women')
ax2.set_xticks(x)
ax2.set_xticklabels(countries, fontsize=9)
ax2.set_ylabel('Hours per person 15--64, 2019', fontsize=9)
ax2.set_title('F2. Female cross-country dispersion $\\approx\\!3\\times$ male',
              fontsize=10, fontweight='bold')
ax2.legend(fontsize=8, frameon=False, loc='lower left')
ax2.tick_params(axis='y', labelsize=8)
ax2.grid(axis='y', alpha=0.25, linewidth=0.4)
# annotate dispersion
men_range = max(men_vals) - min(men_vals)
women_range = max(women_vals) - min(women_vals)
ax2.text(0.95, 0.95, f'Men: range = {men_range} hrs\nWomen: range = {women_range} hrs',
         transform=ax2.transAxes, fontsize=7, va='top', ha='right',
         bbox=dict(boxstyle='round', facecolor='white', edgecolor='gray', alpha=0.85))

# ---------------------------------------------------------------------
# F3: Long-run child penalty (KLPSZ 2019)
# ---------------------------------------------------------------------
ax3 = fig.add_subplot(gs[1, 0])
penalty = {'DK': 21, 'SE': 27, 'USA': 31, 'UK': 44, 'AT': 51, 'DE': 61}
sorted_pen = sorted(penalty.items(), key=lambda x: x[1])
labels3 = [c for c, _ in sorted_pen]
values3 = [v for _, v in sorted_pen]
colors3 = [color_of(c) for c in labels3]
ax3.bar(range(len(labels3)), values3, color=colors3, edgecolor='black', linewidth=0.4)
for i, v in enumerate(values3):
    ax3.text(i, v + 1, f'{v}\\%', fontsize=8, ha='center')
ax3.set_xticks(range(len(labels3)))
ax3.set_xticklabels(labels3, fontsize=9)
ax3.set_ylabel('Long-run child penalty, \\% earnings loss', fontsize=9)
ax3.set_title('F3. Child penalty 5--10 yrs after first birth (KLPSZ 2019)',
              fontsize=10, fontweight='bold')
ax3.set_ylim(0, 70)
ax3.tick_params(axis='y', labelsize=8)
ax3.grid(axis='y', alpha=0.25, linewidth=0.4)

# ---------------------------------------------------------------------
# F4: Global gradient (BFL 2018)
# ---------------------------------------------------------------------
ax4 = fig.add_subplot(gs[1, 1])
deciles = ['Bottom\\n(low-income)', 'Middle', 'Top\\n(high-income)']
weekly_hrs = [48.4, 43.3, 34.4]
n_countries = [10, 9, 26]
bars = ax4.bar(range(3), weekly_hrs, color=['#9C504C', '#C7866A', '#5B7C99'],
               edgecolor='black', linewidth=0.4)
for i, (h, n) in enumerate(zip(weekly_hrs, n_countries)):
    ax4.text(i, h + 0.5, f'{h:.1f} hrs/wk\\n(n={n})', fontsize=8, ha='center')
ax4.set_xticks(range(3))
ax4.set_xticklabels(deciles, fontsize=9)
ax4.set_ylabel('Weekly hours per employed worker', fontsize=9)
ax4.set_title('F4. Global GDP-tercile gradient (BFL 2018, $n\\!=\\!45$)',
              fontsize=10, fontweight='bold')
ax4.set_ylim(25, 55)
ax4.tick_params(axis='y', labelsize=8)
ax4.grid(axis='y', alpha=0.25, linewidth=0.4)
# Trendline
ax4.plot(range(3), weekly_hrs, color='black', linestyle='--', linewidth=0.8, alpha=0.5, marker='o', markersize=4)

plt.savefig('../figure_facts.pdf', bbox_inches='tight', dpi=200)
plt.savefig('../figure_facts.png', bbox_inches='tight', dpi=150)
print("Facts panel saved.")
