"""
Build figure_panel.pdf for problem1.tex.

Four panels:
  (a) Hours per worker, time series 1970-2024 (line, regional colors)
  (b) Intensive vs extensive log-gap to US, 2019 (stacked bar, ORDERED BY INTENSIVE,
      blue = intensive, red = extensive, no per-country regional colors)
  (c) Two-regime split, 2023 (scatter: hrs/worker vs employment rate, with trendline)
  (d) Disconfirmation: 4 highest-tax countries span 367 hours within 6pp of tax wedge
"""
import csv
import math
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.gridspec import GridSpec

# =====================================================================
# Regional color palette (used in (a) and (c) only)
# =====================================================================
REGIONS = {
    'Anglo':         {'color': '#D62728', 'countries': {'US', 'UK', 'IE', 'CA', 'AU'}},
    'Nordic':        {'color': '#1F77B4', 'countries': {'SE', 'DK', 'NO', 'FI'}},
    'Central Europe':{'color': '#2CA02C', 'countries': {'DE', 'FR', 'NL', 'AT', 'BE', 'CH'}},
    'South Europe':  {'color': '#FF7F0E', 'countries': {'IT', 'ES', 'GR', 'PT'}},
    'East Europe':   {'color': '#9467BD', 'countries': {'PL', 'HU', 'CZ'}},
}

OECD3 = {
    'USA': 'US', 'GBR': 'UK', 'IRL': 'IE', 'CAN': 'CA', 'AUS': 'AU',
    'SWE': 'SE', 'DNK': 'DK', 'NOR': 'NO', 'FIN': 'FI',
    'DEU': 'DE', 'FRA': 'FR', 'NLD': 'NL', 'AUT': 'AT', 'BEL': 'BE', 'CHE': 'CH',
    'ITA': 'IT', 'ESP': 'ES', 'GRC': 'GR', 'PRT': 'PT',
    'POL': 'PL', 'HUN': 'HU', 'CZE': 'CZ',
}

def color_of(iso2):
    for info in REGIONS.values():
        if iso2 in info['countries']:
            return info['color']
    return '#888888'

# =====================================================================
# Load OECD hours time series
# =====================================================================
def load_oecd_hours_series():
    """Returns {iso2: {year: hours}}"""
    out = {iso2: {} for iso2 in OECD3.values()}
    with open('oecd_hours.csv') as f:
        rdr = csv.DictReader(f)
        for r in rdr:
            try:
                year = int(r['TIME_PERIOD'])
                iso3 = r['REF_AREA']
                if iso3 not in OECD3:
                    continue
                if r.get('WORKER_STATUS') not in ('_T', ''):
                    continue
                if r.get('SEX') not in ('_Z', '_T', ''):
                    continue
                out[OECD3[iso3]][year] = float(r['OBS_VALUE'])
            except (ValueError, KeyError):
                continue
    return out

# =====================================================================
# Hard-coded values for (b), (c), (d) (cross-checked with replication scripts)
# =====================================================================
HRS_WKR_2023 = {
    'US': 1805, 'GR': 1893, 'PL': 1807, 'IT': 1701, 'ES': 1638,
    'UK': 1496, 'FR': 1489, 'NL': 1449, 'SE': 1431, 'DE': 1335,
}
EMP_2023 = {
    'US': 71.94, 'GR': 62.27, 'PL': 72.51, 'IT': 61.99, 'ES': 65.68,
    'UK': 74.90, 'FR': 68.46, 'NL': 82.46, 'SE': 77.31, 'DE': 77.10,
}
TAX_WEDGE_2023 = {
    'US': 29.9, 'UK': 30.7, 'IE': 26.7,
    'SE': 41.7, 'DK': 35.4, 'NO': 35.6, 'FI': 39.6,
    'DE': 47.9, 'FR': 46.8, 'NL': 35.4, 'AT': 47.2, 'BE': 52.7,
    'IT': 45.1, 'ES': 39.5, 'GR': 36.7, 'PT': 38.0,
    'PL': 33.6, 'HU': 41.2, 'CZ': 39.4,
}
BBF_2019_DECOMP = {
    'DE': {'intensive_log': 0.241, 'extensive_log': -0.071, 'total_log': 0.170},
    'NL': {'intensive_log': 0.247, 'extensive_log': -0.086, 'total_log': 0.161},
    'SE': {'intensive_log': 0.171, 'extensive_log': -0.076, 'total_log': 0.095},
    'UK': {'intensive_log': 0.143, 'extensive_log': -0.046, 'total_log': 0.097},
    'FR': {'intensive_log': 0.172, 'extensive_log': 0.087, 'total_log': 0.259},
    'ES': {'intensive_log': 0.135, 'extensive_log': 0.142, 'total_log': 0.277},
    'IT': {'intensive_log': 0.137, 'extensive_log': 0.194, 'total_log': 0.331},
    'GR': {'intensive_log': 0.022, 'extensive_log': 0.235, 'total_log': 0.257},
    'PL': {'intensive_log': -0.001, 'extensive_log': 0.075, 'total_log': 0.074},
    'HU': {'intensive_log': 0.018, 'extensive_log': 0.019, 'total_log': 0.037},
}

# =====================================================================
# Build figure
# =====================================================================
fig = plt.figure(figsize=(13, 9))
gs = GridSpec(2, 6, figure=fig, hspace=0.45, wspace=0.7)

# ---------------------------------------------------------------------
# (a) Hours per worker time series, 1970-2024
# ---------------------------------------------------------------------
ax_a = fig.add_subplot(gs[0, 0:3])
hours_ts = load_oecd_hours_series()
focus_countries = ['US', 'DE', 'FR', 'IT', 'ES', 'NL', 'SE', 'UK']
for iso2 in focus_countries:
    series = hours_ts.get(iso2, {})
    yrs = sorted(y for y in series if 1970 <= y <= 2024)
    if not yrs:
        continue
    vals = [series[y] for y in yrs]
    ax_a.plot(yrs, vals, color=color_of(iso2), linewidth=1.4, alpha=0.85)
    # label at the right edge
    ax_a.annotate(iso2, (yrs[-1], vals[-1]), fontsize=7, color=color_of(iso2),
                  ha='left', va='center', xytext=(3, 0), textcoords='offset points')
ax_a.set_xlabel('Year', fontsize=9)
ax_a.set_ylabel('Hours per worker', fontsize=9)
ax_a.set_title('(a) Hours per worker, 1970--2024 (OECD)',
               fontsize=10, fontweight='bold')
ax_a.tick_params(labelsize=8)
ax_a.grid(alpha=0.25, linewidth=0.4)
ax_a.set_xlim(1970, 2030)

# ---------------------------------------------------------------------
# (b) Intensive vs extensive log-gap, ORDERED BY INTENSIVE; only 2 colors
# ---------------------------------------------------------------------
ax_b = fig.add_subplot(gs[0, 3:6])
sorted_b = sorted(BBF_2019_DECOMP.items(), key=lambda x: -x[1]['intensive_log'])
labels_b = [c for c, _ in sorted_b]
intensive_b = [d['intensive_log'] for _, d in sorted_b]
extensive_b = [d['extensive_log'] for _, d in sorted_b]

x = list(range(len(labels_b)))
width = 0.42
INT_COLOR = '#1F77B4'  # blue
EXT_COLOR = '#D62728'  # red
ax_b.bar([xi - width/2 for xi in x], intensive_b, width=width,
         color=INT_COLOR, edgecolor='black', linewidth=0.3, label='Intensive')
ax_b.bar([xi + width/2 for xi in x], extensive_b, width=width,
         color=EXT_COLOR, edgecolor='black', linewidth=0.3, label='Extensive')
ax_b.axhline(y=0, color='black', linewidth=0.6)
ax_b.set_xticks(x)
ax_b.set_xticklabels(labels_b, fontsize=8)
ax_b.set_ylabel(r'$\log$-gap to US, 2019', fontsize=9)
ax_b.set_title('(b) Intensive vs extensive log-gap, ordered by intensive',
               fontsize=10, fontweight='bold')
ax_b.legend(fontsize=8, loc='upper right', frameon=False)
ax_b.tick_params(axis='y', labelsize=8)
ax_b.grid(axis='y', alpha=0.25, linewidth=0.4)

# ---------------------------------------------------------------------
# (c) Two-regime split: hrs/wkr vs emp rate, 2023 (with trendline)
# ---------------------------------------------------------------------
ax_c = fig.add_subplot(gs[1, 0:3])
xs_c = [EMP_2023[c] for c in HRS_WKR_2023]
ys_c = [HRS_WKR_2023[c] for c in HRS_WKR_2023]
for c in HRS_WKR_2023:
    ax_c.scatter(EMP_2023[c], HRS_WKR_2023[c],
                 color=color_of(c), s=110, edgecolor='black', linewidth=0.6, zorder=3)
    ax_c.annotate(c, (EMP_2023[c], HRS_WKR_2023[c]),
                  fontsize=8, ha='left', va='bottom', xytext=(4, 4),
                  textcoords='offset points')
# OLS trendline
n = len(xs_c)
xbar = sum(xs_c) / n
ybar = sum(ys_c) / n
ssx = sum((x - xbar) ** 2 for x in xs_c)
ssxy = sum((x - xbar) * (y - ybar) for x, y in zip(xs_c, ys_c))
slope = ssxy / ssx
intercept = ybar - slope * xbar
ssy = sum((y - ybar) ** 2 for y in ys_c)
r = ssxy / math.sqrt(ssx * ssy)
xr = [min(xs_c) - 1, max(xs_c) + 1]
ax_c.plot(xr, [slope * x + intercept for x in xr],
          color='black', linestyle='--', linewidth=0.9, alpha=0.6, zorder=2)
ax_c.text(0.05, 0.05, f'slope $={slope:+.1f}$\n$r={r:.2f}$',
          transform=ax_c.transAxes, fontsize=8, ha='left', va='bottom',
          bbox=dict(boxstyle='round', facecolor='white', edgecolor='black', alpha=0.8))
# Quadrant labels
ax_c.text(60.5, 1900, 'High hrs/worker,\nlow employment\n(Mediterranean+East)',
          fontsize=8, ha='center', va='center', style='italic',
          bbox=dict(boxstyle='round', facecolor='#FFE5CC', edgecolor='#FF7F0E', alpha=0.8))
ax_c.text(80.5, 1380, 'Low hrs/worker,\nhigh employment\n(Northern)',
          fontsize=8, ha='center', va='center', style='italic',
          bbox=dict(boxstyle='round', facecolor='#D5F0D5', edgecolor='#2CA02C', alpha=0.8))
ax_c.set_xlabel('Employment rate $E/N$ (15--64), 2023 (\\%)', fontsize=9)
ax_c.set_ylabel('Hours per worker, 2023', fontsize=9)
ax_c.set_title('(c) Two-regime split visualised, 2023 (with OLS trendline)',
               fontsize=10, fontweight='bold')
ax_c.set_xlim(58, 85)
ax_c.set_ylim(1300, 1950)
ax_c.tick_params(labelsize=8)
ax_c.grid(alpha=0.25, linewidth=0.4)

# ---------------------------------------------------------------------
# (d) Disconfirmation: 4 high-tax countries span 367hrs within 6pp of wedge
# ---------------------------------------------------------------------
ax_d = fig.add_subplot(gs[1, 3:6])
high_tax = ['DE', 'FR', 'IT', 'SE']
high_tax_wedges = [TAX_WEDGE_2023[c] for c in high_tax]
high_tax_hours = [HRS_WKR_2023[c] for c in high_tax]
spread_hrs = max(high_tax_hours) - min(high_tax_hours)
spread_tax = max(high_tax_wedges) - min(high_tax_wedges)

for c in HRS_WKR_2023:
    if c in high_tax:
        continue
    ax_d.scatter(TAX_WEDGE_2023[c], HRS_WKR_2023[c],
                 color=color_of(c), s=40, edgecolor='black', linewidth=0.3,
                 alpha=0.35, zorder=2)
for c in high_tax:
    ax_d.scatter(TAX_WEDGE_2023[c], HRS_WKR_2023[c],
                 color=color_of(c), s=140, edgecolor='black', linewidth=0.7, zorder=4)
    ax_d.annotate(c, (TAX_WEDGE_2023[c], HRS_WKR_2023[c]),
                  fontsize=10, fontweight='bold', ha='left', va='bottom',
                  xytext=(5, 5), textcoords='offset points')

y_min = min(high_tax_hours) - 100
ax_d.annotate('', xy=(min(high_tax_wedges), y_min), xytext=(max(high_tax_wedges), y_min),
              arrowprops=dict(arrowstyle='<->', color='black', lw=0.8))
ax_d.text((min(high_tax_wedges) + max(high_tax_wedges)) / 2, y_min - 30,
          f'wedge spread = {spread_tax:.1f} pp',
          fontsize=8, ha='center', va='top')

x_min = min(high_tax_wedges) - 0.8
ax_d.annotate('', xy=(x_min, min(high_tax_hours)), xytext=(x_min, max(high_tax_hours)),
              arrowprops=dict(arrowstyle='<->', color='black', lw=0.8))
ax_d.text(x_min - 0.5, (min(high_tax_hours) + max(high_tax_hours)) / 2,
          f'hours spread\n= {spread_hrs} hrs', fontsize=8, ha='right', va='center')

ax_d.set_xlabel('Composite tax wedge $\\tau$, 2023 (\\%)', fontsize=9)
ax_d.set_ylabel('Hours per worker, 2023', fontsize=9)
ax_d.set_title(f'(d) Disconfirmation: 4 highest-$\\tau$ countries span {spread_hrs} hrs within {spread_tax:.1f} pp',
               fontsize=10, fontweight='bold')
ax_d.tick_params(labelsize=8)
ax_d.grid(alpha=0.25, linewidth=0.4)

# ---------------------------------------------------------------------
# Legend
# ---------------------------------------------------------------------
patches = [mpatches.Patch(color=info['color'], label=name)
           for name, info in REGIONS.items()]
fig.legend(handles=patches, loc='lower center', ncol=5, fontsize=9,
           bbox_to_anchor=(0.5, -0.005), frameon=False)

plt.savefig('../figure_panel.pdf', bbox_inches='tight', dpi=200)
plt.savefig('../figure_panel.png', bbox_inches='tight', dpi=150)
print("Figure saved.")
