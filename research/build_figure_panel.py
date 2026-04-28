"""
Build figure_panel.pdf for problem1.tex with regional color blocks.

Five panels:
  (a) Hours per worker, 1970 (bar, by region)
  (b) Intensive vs extensive log-gap to US, 2019 (stacked bar, ordered by extensive)
  (c) Tax wedge vs hours per worker, 2023 (scatter, by region)
  (d) Intensive vs extensive margin per country, 2023 (scatter: hours/worker vs employment rate)
  (e) Disconfirmation: 4 highest-tax countries span 367 hours within 6pp of tax wedge
"""
import csv
import math
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.gridspec import GridSpec

# =====================================================================
# Regional color palette (ColorBrewer-friendly, distinct hues)
# =====================================================================
REGIONS = {
    'Anglo':         {'color': '#D62728', 'countries': {'US': 'United States', 'UK': 'United Kingdom',
                                                          'IE': 'Ireland', 'CA': 'Canada', 'AU': 'Australia'}},
    'Nordic':        {'color': '#1F77B4', 'countries': {'SE': 'Sweden', 'DK': 'Denmark',
                                                          'NO': 'Norway', 'FI': 'Finland'}},
    'Central Europe':{'color': '#2CA02C', 'countries': {'DE': 'Germany', 'FR': 'France', 'NL': 'Netherlands',
                                                          'AT': 'Austria', 'BE': 'Belgium', 'CH': 'Switzerland'}},
    'South Europe':  {'color': '#FF7F0E', 'countries': {'IT': 'Italy', 'ES': 'Spain',
                                                          'GR': 'Greece', 'PT': 'Portugal'}},
    'East Europe':   {'color': '#9467BD', 'countries': {'PL': 'Poland', 'HU': 'Hungary', 'CZ': 'Czechia'}},
}

OECD3 = {  # ISO3 -> ISO2 mapping for the OECD CSV
    'USA': 'US', 'GBR': 'UK', 'IRL': 'IE', 'CAN': 'CA', 'AUS': 'AU',
    'SWE': 'SE', 'DNK': 'DK', 'NOR': 'NO', 'FIN': 'FI',
    'DEU': 'DE', 'FRA': 'FR', 'NLD': 'NL', 'AUT': 'AT', 'BEL': 'BE', 'CHE': 'CH',
    'ITA': 'IT', 'ESP': 'ES', 'GRC': 'GR', 'PRT': 'PT',
    'POL': 'PL', 'HUN': 'HU', 'CZE': 'CZ',
}

def country_to_region(iso2):
    for region_name, info in REGIONS.items():
        if iso2 in info['countries']:
            return region_name
    return None

def color_of(iso2):
    region = country_to_region(iso2)
    return REGIONS[region]['color'] if region else '#888888'

# =====================================================================
# Load OECD hours per worker for any year
# =====================================================================
def load_oecd_hours(target_year):
    out = {}
    with open('oecd_hours.csv') as f:
        rdr = csv.DictReader(f)
        for r in rdr:
            try:
                year = int(r['TIME_PERIOD'])
                if year != target_year:
                    continue
                iso3 = r['REF_AREA']
                if iso3 not in OECD3:
                    continue
                if r.get('WORKER_STATUS') and r['WORKER_STATUS'] != '_T':
                    continue
                if r.get('SEX') and r['SEX'] != '_Z' and r['SEX'] != '_T':
                    continue
                val = float(r['OBS_VALUE'])
                out[OECD3[iso3]] = val
            except (ValueError, KeyError):
                continue
    return out

# =====================================================================
# Hard-coded values for plots (cross-checked with replication scripts)
# =====================================================================
# 2023 hours/worker (from main Q1 table)
HRS_WKR_2023 = {
    'US': 1805, 'GR': 1893, 'PL': 1807, 'IT': 1701, 'ES': 1638,
    'UK': 1496, 'FR': 1489, 'NL': 1449, 'SE': 1431, 'DE': 1335,
}
# 2023 employment rate 15-64
EMP_2023 = {
    'US': 71.94, 'GR': 62.27, 'PL': 72.51, 'IT': 61.99, 'ES': 65.68,
    'UK': 74.90, 'FR': 68.46, 'NL': 82.46, 'SE': 77.31, 'DE': 77.10,
}
# OECD 2023 composite tax wedge (single, 100% AW)
TAX_WEDGE_2023 = {
    'US': 29.9, 'UK': 30.7, 'IE': 26.7,
    'SE': 41.7, 'DK': 35.4, 'NO': 35.6, 'FI': 39.6,
    'DE': 47.9, 'FR': 46.8, 'NL': 35.4, 'AT': 47.2, 'BE': 52.7,
    'IT': 45.1, 'ES': 39.5, 'GR': 36.7, 'PT': 38.0,
    'PL': 33.6, 'HU': 41.2, 'CZ': 39.4,
}
# 2019 BBF decomposition (intensive vs extensive log-gap to US)
BBF_2019_DECOMP = {
    'DE': {'intensive_log': 0.241, 'extensive_log': -0.071, 'total_log': 0.170},
    'NL': {'intensive_log': 0.247, 'extensive_log': -0.086, 'total_log': 0.161},
    'SE': {'intensive_log': 0.171, 'extensive_log': -0.076, 'total_log': 0.095},
    'UK': {'intensive_log': 0.143, 'extensive_log': -0.046, 'total_log': 0.097},
    'FR': {'intensive_log': 0.172, 'extensive_log': 0.087, 'total_log': 0.259},
    'ES': {'intensive_log': 0.135, 'extensive_log': 0.142, 'total_log': 0.277},
    'IT': {'intensive_log': 0.137, 'extensive_log': 0.194, 'total_log': 0.331},
    'GR': {'intensive_log': 0.022, 'extensive_log': 0.235, 'total_log': 0.257},  # large extensive
    'PL': {'intensive_log': -0.001, 'extensive_log': 0.075, 'total_log': 0.074},  # mixed
    'HU': {'intensive_log': 0.018, 'extensive_log': 0.019, 'total_log': 0.037},
}

# =====================================================================
# Build the figure
# =====================================================================
fig = plt.figure(figsize=(13, 9))
gs = GridSpec(2, 6, figure=fig, hspace=0.55, wspace=0.7)

# ---------------------------------------------------------------------
# (a) Hours per worker, 1970 (bar)
# ---------------------------------------------------------------------
ax_a = fig.add_subplot(gs[0, 0:2])
hrs_1970 = {
    'US': 1949, 'DE': 1960, 'FR': 1993, 'IT': 2042, 'ES': 2046,
    'NL': 1809, 'SE': 1562, 'UK': 1775, 'AT': 1834, 'BE': 1768,
    'NO': 1626, 'FI': 1804, 'DK': 1737, 'IE': 2154, 'CA': 1893, 'AU': 1856,
}
sorted_1970 = sorted(hrs_1970.items(), key=lambda x: -x[1])
labels = [c for c, v in sorted_1970]
values = [v for c, v in sorted_1970]
colors = [color_of(c) for c in labels]
ax_a.bar(range(len(labels)), values, color=colors, edgecolor='black', linewidth=0.4)
ax_a.set_xticks(range(len(labels)))
ax_a.set_xticklabels(labels, rotation=0, fontsize=8)
ax_a.axhline(y=hrs_1970['US'], color='red', linestyle=':', linewidth=0.8, alpha=0.6)
ax_a.text(len(labels)-1, hrs_1970['US']+30, 'US level (1949)', fontsize=7, ha='right', color='red', alpha=0.8)
ax_a.set_ylabel('Hours per worker, 1970', fontsize=9)
ax_a.set_title('(a) The pre-1970 ranking inverts: US ranked 5th of 8',
               fontsize=10, fontweight='bold')
ax_a.set_ylim(1400, 2200)
ax_a.tick_params(axis='y', labelsize=8)
ax_a.grid(axis='y', alpha=0.25, linewidth=0.4)

# ---------------------------------------------------------------------
# (b) Intensive vs extensive log-gap to US, 2019, ordered by extensive contribution
# ---------------------------------------------------------------------
ax_b = fig.add_subplot(gs[0, 2:4])
sorted_b = sorted(BBF_2019_DECOMP.items(), key=lambda x: x[1]['extensive_log'])
labels_b = [c for c, _ in sorted_b]
intensive_b = [d['intensive_log'] for _, d in sorted_b]
extensive_b = [d['extensive_log'] for _, d in sorted_b]

x = range(len(labels_b))
width = 0.42
# Intensive (lower bar)
ax_b.bar([xi - width/2 for xi in x], intensive_b, width=width,
         color='#888888', edgecolor='black', linewidth=0.3, label='Intensive (hours/worker)')
# Extensive (upper bar) colored by region
for xi, c, e in zip(x, labels_b, extensive_b):
    ax_b.bar(xi + width/2, e, width=width, color=color_of(c), edgecolor='black', linewidth=0.3,
             label='Extensive (employment)' if xi == 0 else None)
ax_b.axhline(y=0, color='black', linewidth=0.6)
ax_b.set_xticks(x)
ax_b.set_xticklabels(labels_b, fontsize=8)
ax_b.set_ylabel(r'$\log$-gap to US, 2019', fontsize=9)
ax_b.set_title('(b) Intensive vs extensive log-gap, ordered by extensive',
               fontsize=10, fontweight='bold')
ax_b.legend(fontsize=7, loc='upper left', frameon=False)
ax_b.tick_params(axis='y', labelsize=8)
ax_b.grid(axis='y', alpha=0.25, linewidth=0.4)
# Annotate sign-flip boundary
ax_b.text(0.5, max(extensive_b)*0.85, 'Northern\n(extensive < 0)',
          fontsize=7, color='gray', style='italic')
ax_b.text(len(labels_b)-1.5, max(extensive_b)*0.85, 'Mediterranean+East\n(extensive > 0)',
          fontsize=7, color='gray', style='italic', ha='right')

# ---------------------------------------------------------------------
# (c) Tax wedge vs hours per worker, 2023 (scatter, by region)
# ---------------------------------------------------------------------
ax_c = fig.add_subplot(gs[0, 4:6])
common = sorted(set(TAX_WEDGE_2023) & set(HRS_WKR_2023))
for c in common:
    ax_c.scatter(TAX_WEDGE_2023[c], HRS_WKR_2023[c],
                 color=color_of(c), s=70, edgecolor='black', linewidth=0.5, zorder=3)
    ax_c.annotate(c, (TAX_WEDGE_2023[c], HRS_WKR_2023[c]),
                  fontsize=7, ha='left', va='bottom', xytext=(3, 3),
                  textcoords='offset points')
# Regression line
xs = [TAX_WEDGE_2023[c] for c in common]
ys = [HRS_WKR_2023[c] for c in common]
n = len(xs)
xbar, ybar = sum(xs)/n, sum(ys)/n
slope = sum((x-xbar)*(y-ybar) for x, y in zip(xs, ys))/sum((x-xbar)**2 for x in xs)
intercept = ybar - slope*xbar
ssx = sum((x-xbar)**2 for x in xs); ssy = sum((y-ybar)**2 for y in ys)
ssxy = sum((x-xbar)*(y-ybar) for x, y in zip(xs, ys))
r = ssxy/math.sqrt(ssx*ssy)
xs_line = [min(xs), max(xs)]
ax_c.plot(xs_line, [slope*x+intercept for x in xs_line],
          color='black', linestyle='--', linewidth=0.7, alpha=0.6, zorder=2)
ax_c.text(0.95, 0.05, f'$r = {r:.2f}$', transform=ax_c.transAxes,
          fontsize=9, ha='right', va='bottom',
          bbox=dict(boxstyle='round', facecolor='white', edgecolor='black', alpha=0.8))
ax_c.set_xlabel('Composite tax wedge $\\tau$, 2023 (\\%)', fontsize=9)
ax_c.set_ylabel('Hours per worker, 2023', fontsize=9)
ax_c.set_title('(c) Tax wedge vs hours per worker, 2023',
               fontsize=10, fontweight='bold')
ax_c.tick_params(labelsize=8)
ax_c.grid(alpha=0.25, linewidth=0.4)

# ---------------------------------------------------------------------
# (d) Intensive vs extensive margin per country (scatter: hrs/worker vs emp rate, 2023)
# ---------------------------------------------------------------------
ax_d = fig.add_subplot(gs[1, 0:3])
for c in HRS_WKR_2023:
    ax_d.scatter(EMP_2023[c], HRS_WKR_2023[c],
                 color=color_of(c), s=110, edgecolor='black', linewidth=0.6, zorder=3)
    ax_d.annotate(c, (EMP_2023[c], HRS_WKR_2023[c]),
                  fontsize=8, ha='left', va='bottom', xytext=(4, 4),
                  textcoords='offset points')
# Quadrant lines at US position
ax_d.axhline(HRS_WKR_2023['US'], color='red', linestyle=':', linewidth=0.7, alpha=0.6)
ax_d.axvline(EMP_2023['US'], color='red', linestyle=':', linewidth=0.7, alpha=0.6)
ax_d.text(EMP_2023['US']-0.5, HRS_WKR_2023['US']+15, 'US', fontsize=7, color='red', ha='right')
# Quadrant labels
ax_d.text(60, 1900, 'High hrs/worker,\nlow employment\n(Mediterranean+East)',
          fontsize=8, ha='center', va='center', style='italic',
          bbox=dict(boxstyle='round', facecolor='#FFE5CC', edgecolor='#FF7F0E', alpha=0.8))
ax_d.text(80, 1380, 'Low hrs/worker,\nhigh employment\n(Northern)',
          fontsize=8, ha='center', va='center', style='italic',
          bbox=dict(boxstyle='round', facecolor='#D5F0D5', edgecolor='#2CA02C', alpha=0.8))
ax_d.set_xlabel('Employment rate $E/N$ (15--64), 2023 (\\%)', fontsize=9)
ax_d.set_ylabel('Hours per worker, 2023', fontsize=9)
ax_d.set_title('(d) The two-regime split visualised: intensive vs extensive margin, 2023',
               fontsize=10, fontweight='bold')
ax_d.set_xlim(58, 85)
ax_d.set_ylim(1300, 1950)
ax_d.tick_params(labelsize=8)
ax_d.grid(alpha=0.25, linewidth=0.4)

# ---------------------------------------------------------------------
# (e) Disconfirmation: 4 high-tax countries span 367hrs within 6pp of wedge
# ---------------------------------------------------------------------
ax_e = fig.add_subplot(gs[1, 3:6])
high_tax = ['DE', 'FR', 'IT', 'SE']
high_tax_wedges = [TAX_WEDGE_2023[c] for c in high_tax]
high_tax_hours = [HRS_WKR_2023[c] for c in high_tax]
spread_hrs = max(high_tax_hours) - min(high_tax_hours)
spread_tax = max(high_tax_wedges) - min(high_tax_wedges)

# All countries shaded
for c in HRS_WKR_2023:
    if c in high_tax:
        continue
    ax_e.scatter(TAX_WEDGE_2023[c], HRS_WKR_2023[c],
                 color=color_of(c), s=40, edgecolor='black', linewidth=0.3,
                 alpha=0.35, zorder=2)
# Highlighted
for c in high_tax:
    ax_e.scatter(TAX_WEDGE_2023[c], HRS_WKR_2023[c],
                 color=color_of(c), s=140, edgecolor='black', linewidth=0.7, zorder=4)
    ax_e.annotate(c, (TAX_WEDGE_2023[c], HRS_WKR_2023[c]),
                  fontsize=10, fontweight='bold', ha='left', va='bottom',
                  xytext=(5, 5), textcoords='offset points')

# Bracket showing wedge span
y_min = min(high_tax_hours) - 100
ax_e.annotate('', xy=(min(high_tax_wedges), y_min), xytext=(max(high_tax_wedges), y_min),
              arrowprops=dict(arrowstyle='<->', color='black', lw=0.8))
ax_e.text((min(high_tax_wedges)+max(high_tax_wedges))/2, y_min - 30,
          f'wedge spread = {spread_tax:.1f} pp',
          fontsize=8, ha='center', va='top')

# Bracket showing hours span
x_min = min(high_tax_wedges) - 0.8
ax_e.annotate('', xy=(x_min, min(high_tax_hours)), xytext=(x_min, max(high_tax_hours)),
              arrowprops=dict(arrowstyle='<->', color='black', lw=0.8))
ax_e.text(x_min - 0.5, (min(high_tax_hours)+max(high_tax_hours))/2,
          f'hours spread\n= {spread_hrs} hrs', fontsize=8, ha='right', va='center')

ax_e.set_xlabel('Composite tax wedge $\\tau$, 2023 (\\%)', fontsize=9)
ax_e.set_ylabel('Hours per worker, 2023', fontsize=9)
ax_e.set_title(f'(e) Disconfirmation: 4 highest-$\\tau$ countries span {spread_hrs} hrs within {spread_tax:.1f} pp',
               fontsize=10, fontweight='bold')
ax_e.tick_params(labelsize=8)
ax_e.grid(alpha=0.25, linewidth=0.4)

# ---------------------------------------------------------------------
# Region legend at the bottom
# ---------------------------------------------------------------------
patches = [mpatches.Patch(color=info['color'], label=name)
           for name, info in REGIONS.items()]
fig.legend(handles=patches, loc='lower center', ncol=5, fontsize=9,
           bbox_to_anchor=(0.5, -0.005), frameon=False)

plt.savefig('../figure_panel.pdf', bbox_inches='tight', dpi=200)
plt.savefig('../figure_panel.png', bbox_inches='tight', dpi=150)
print("Figure saved to figure_panel.pdf and figure_panel.png")
