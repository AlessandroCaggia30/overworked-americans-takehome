"""
Build figure_panel.pdf for problem1.tex (publication quality).

Three panels, horizontal layout:
  (a) Hours per worker, 1970-2024, % deviation from US (line per country)
  (b) Effective labour wedge (McDaniel 2011), 1970-2007, % deviation from US (line)
  (c) Composite tax wedge vs hours per worker, 2023 (scatter + OLS)

Q1 message: tax wedge correlates with hours, but residual variance is large;
taxes alone do not explain the cross-country pattern.
"""
import csv
import math
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.gridspec import GridSpec
from matplotlib.ticker import MultipleLocator

# =====================================================================
# Publication style
# =====================================================================
mpl.rcParams.update({
    'font.family': 'serif',
    'font.serif': ['Times New Roman', 'Times', 'STIX', 'DejaVu Serif'],
    'mathtext.fontset': 'stix',
    'font.size': 9,
    'axes.titlesize': 10,
    'axes.labelsize': 9.5,
    'axes.linewidth': 0.7,
    'axes.spines.top': False,
    'axes.spines.right': False,
    'axes.titleweight': 'bold',
    'axes.titlepad': 6,
    'xtick.labelsize': 8.5,
    'ytick.labelsize': 8.5,
    'xtick.direction': 'out',
    'ytick.direction': 'out',
    'xtick.major.size': 3.5,
    'ytick.major.size': 3.5,
    'xtick.major.width': 0.6,
    'ytick.major.width': 0.6,
    'xtick.minor.size': 2.0,
    'ytick.minor.size': 2.0,
    'xtick.minor.width': 0.4,
    'ytick.minor.width': 0.4,
    'legend.fontsize': 8,
    'legend.frameon': False,
    'lines.linewidth': 1.5,
    'lines.markersize': 5,
    'figure.dpi': 150,
    'savefig.dpi': 300,
    'savefig.bbox': 'tight',
    'pdf.fonttype': 42,
})

# =====================================================================
# Regional palette
# =====================================================================
REGIONS = {
    'Anglo':          {'color': '#B22222', 'countries': {'US', 'UK', 'IE', 'CA', 'AU'}},
    'Nordic':         {'color': '#2E5E9E', 'countries': {'SE', 'DK', 'NO', 'FI'}},
    'Central Europe': {'color': '#1B7837', 'countries': {'DE', 'FR', 'NL', 'AT', 'BE', 'CH'}},
    'South Europe':   {'color': '#D9772A', 'countries': {'IT', 'ES', 'GR', 'PT'}},
    'East Europe':    {'color': '#7F4FA0', 'countries': {'PL', 'HU', 'CZ'}},
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
    return '#666666'


def load_oecd_hours_series():
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
# Data
# =====================================================================
# 2023 cross-section (OECD Taxing Wages + OECD hours)
HRS_WKR_2023 = {
    'US': 1805, 'GR': 1893, 'PL': 1807, 'IT': 1701, 'ES': 1638,
    'UK': 1496, 'FR': 1489, 'NL': 1449, 'SE': 1431, 'DE': 1335,
    'AT': 1480, 'BE': 1456, 'DK': 1370, 'FI': 1561, 'NO': 1424,
    'IE': 1722, 'PT': 1702, 'HU': 1727, 'CZ': 1731,
}
TAX_WEDGE_2023 = {
    'US': 29.9, 'UK': 30.7, 'IE': 26.7,
    'SE': 41.7, 'DK': 35.4, 'NO': 35.6, 'FI': 39.6,
    'DE': 47.9, 'FR': 46.8, 'NL': 35.4, 'AT': 47.2, 'BE': 52.7,
    'IT': 45.1, 'ES': 39.5, 'GR': 36.7, 'PT': 38.0,
    'PL': 33.6, 'HU': 41.2, 'CZ': 39.4,
}
# McDaniel (2011) effective labour income tax rate (%), national-accounts
TAX_WEDGE_TS = {
    'US': {1970: 18.3, 1975: 22.2, 1980: 23.2, 1985: 23.6, 1990: 24.5,
           1995: 24.7, 2000: 26.0, 2005: 23.4, 2007: 25.2},
    'DE': {1970: 31.8, 1975: 35.6, 1980: 37.8, 1985: 38.5, 1990: 38.8,
           1995: 40.4, 2000: 40.7, 2005: 39.6, 2007: 39.4},
    'FR': {1970: 31.6, 1975: 34.8, 1980: 38.8, 1985: 41.8, 1990: 43.5,
           1995: 44.7, 2000: 44.3, 2005: 44.3, 2007: 43.4},
    'IT': {1970: 24.6, 1975: 29.9, 1980: 33.6, 1985: 35.3, 1990: 38.5,
           1995: 43.5, 2000: 41.8, 2005: 42.2, 2007: 43.4},
    'SE': {1970: 39.8, 1975: 46.1, 1980: 51.2, 1985: 51.5, 1990: 55.7,
           1995: 53.5, 2000: 52.7, 2005: 49.8, 2007: 48.8},
    'UK': {1970: 25.2, 1975: 28.1, 1980: 30.0, 1985: 29.8, 1990: 28.7,
           1995: 27.5, 2000: 27.6, 2005: 27.2, 2007: 28.6},
}


def smart_label(ax, x, y, text, color, dx=4, dy=0, **kw):
    ax.annotate(text, (x, y), fontsize=8, color=color,
                ha='left', va='center', xytext=(dx, dy),
                textcoords='offset points', fontweight='bold', **kw)


def style_axes(ax, gridx=False, gridy=True):
    ax.grid(axis='y' if gridy and not gridx else 'both' if gridx and gridy else 'x',
            color='#cccccc', linewidth=0.4, alpha=0.7, zorder=0)
    ax.set_axisbelow(True)
    for spine in ('left', 'bottom'):
        ax.spines[spine].set_color('#333333')


# =====================================================================
# Build figure -- 3 panels horizontal
# =====================================================================
fig = plt.figure(figsize=(14.5, 4.2))
gs = GridSpec(1, 3, figure=fig, wspace=0.32,
              left=0.05, right=0.985, top=0.88, bottom=0.16)

# ---------------------------------------------------------------------
# (a) Hours per worker, % deviation from US, 1970-2024
# ---------------------------------------------------------------------
ax_a = fig.add_subplot(gs[0, 0])
ax_a.axhline(0, color='#888888', linewidth=0.6, zorder=1)

hours_ts = load_oecd_hours_series()
us_series = hours_ts.get('US', {})

focus_a = ['DE', 'FR', 'IT', 'ES', 'NL', 'SE', 'UK']
end_pts_a = []
for iso2 in focus_a:
    series = hours_ts.get(iso2, {})
    yrs = sorted(y for y in series if 1970 <= y <= 2024 and y in us_series)
    if not yrs:
        continue
    vals = [(series[y] / us_series[y] - 1.0) * 100.0 for y in yrs]
    ax_a.plot(yrs, vals, color=color_of(iso2), linewidth=1.4, alpha=0.9,
              solid_capstyle='round')
    end_pts_a.append((iso2, yrs[-1], vals[-1]))

# Stagger end-point labels
end_pts_a.sort(key=lambda t: -t[2])
last_y = None
for iso2, xv, yv in end_pts_a:
    if last_y is not None and abs(yv - last_y) < 1.6:
        yv_lbl = last_y - 1.8
    else:
        yv_lbl = yv
    smart_label(ax_a, xv, yv_lbl, iso2, color_of(iso2), dx=4, dy=0)
    last_y = yv_lbl

# Annotate the US zero line
ax_a.text(2025, 0.4, 'US', fontsize=8, color=color_of('US'),
          fontweight='bold', ha='left', va='bottom')

ax_a.set_xlabel('Year')
ax_a.set_ylabel('Hours per worker, \\% deviation from US')
ax_a.set_title(r'(a) Hours per worker, \% dev.\ from US',
               loc='left')
ax_a.set_xlim(1970, 2032)
ax_a.set_ylim(-30, 8)
ax_a.xaxis.set_major_locator(MultipleLocator(10))
ax_a.xaxis.set_minor_locator(MultipleLocator(2))
ax_a.yaxis.set_major_locator(MultipleLocator(5))
ax_a.yaxis.set_minor_locator(MultipleLocator(1))
style_axes(ax_a)

# ---------------------------------------------------------------------
# (b) Effective labour wedge, % deviation from US, 1970-2007
# ---------------------------------------------------------------------
ax_b = fig.add_subplot(gs[0, 1])
ax_b.axhline(0, color='#888888', linewidth=0.6, zorder=1)

us_wedge = TAX_WEDGE_TS['US']
focus_b = ['DE', 'FR', 'IT', 'SE', 'UK']
end_pts_b = []
for iso2 in focus_b:
    series = TAX_WEDGE_TS[iso2]
    yrs = sorted(y for y in series if y in us_wedge)
    vals = [(series[y] / us_wedge[y] - 1.0) * 100.0 for y in yrs]
    ax_b.plot(yrs, vals, color=color_of(iso2), linewidth=1.4,
              marker='o', markersize=3.0, markeredgecolor='white',
              markeredgewidth=0.5, alpha=0.92)
    end_pts_b.append((iso2, yrs[-1], vals[-1]))

end_pts_b.sort(key=lambda t: -t[2])
last_y = None
for iso2, xv, yv in end_pts_b:
    if last_y is not None and abs(yv - last_y) < 8:
        yv_lbl = last_y - 9
    else:
        yv_lbl = yv
    smart_label(ax_b, xv, yv_lbl, iso2, color_of(iso2), dx=5, dy=0)
    last_y = yv_lbl

ax_b.text(2008, 1.5, 'US', fontsize=8, color=color_of('US'),
          fontweight='bold', ha='left', va='bottom')

ax_b.set_xlabel('Year')
ax_b.set_ylabel(r'Eff.\ labour wedge $\tau_h$, \% deviation from US')
ax_b.set_title(r'(b) Tax wedge $\tau_h$, \% dev.\ from US  $\cdot$  McDaniel (2011)',
               loc='left')
ax_b.set_xlim(1969, 2014)
ax_b.set_ylim(-5, 130)
ax_b.xaxis.set_major_locator(MultipleLocator(10))
ax_b.xaxis.set_minor_locator(MultipleLocator(2))
ax_b.yaxis.set_major_locator(MultipleLocator(20))
ax_b.yaxis.set_minor_locator(MultipleLocator(5))
style_axes(ax_b)

# ---------------------------------------------------------------------
# (c) Tax wedge vs hours per worker, 2023 (scatter + OLS)
# ---------------------------------------------------------------------
ax_c = fig.add_subplot(gs[0, 2])
common = sorted(set(TAX_WEDGE_2023) & set(HRS_WKR_2023))
xs = [TAX_WEDGE_2023[c] for c in common]
ys = [HRS_WKR_2023[c] for c in common]

n = len(xs)
xbar = sum(xs) / n; ybar = sum(ys) / n
ssx = sum((xv - xbar) ** 2 for xv in xs)
ssxy = sum((xv - xbar) * (yv - ybar) for xv, yv in zip(xs, ys))
ssy = sum((yv - ybar) ** 2 for yv in ys)
slope = ssxy / ssx
intercept = ybar - slope * xbar
r = ssxy / math.sqrt(ssx * ssy)
yhat = [slope * xv + intercept for xv in xs]
sigma_resid = math.sqrt(sum((y - yh) ** 2 for y, yh in zip(ys, yhat)) / (n - 2))

xr = [min(xs) - 1, max(xs) + 1]
yr_fit = [slope * x + intercept for x in xr]
ax_c.fill_between(xr,
                  [yf - sigma_resid for yf in yr_fit],
                  [yf + sigma_resid for yf in yr_fit],
                  color='#cccccc', alpha=0.35, zorder=1,
                  label=r'$\pm 1\,\sigma_{\mathrm{resid}}\!\approx\!' + f'{sigma_resid:.0f}' + '$ hrs')
ax_c.plot(xr, yr_fit, color='#333333', linestyle='--',
          linewidth=1.3, alpha=0.85, zorder=2,
          label=(r'OLS $r=' + f'{r:.2f}' + r',\;R^2=' + f'{r*r:.2f}' + '$'))

E_OFFSETS = {
    'US': (6, 2), 'GR': (6, 2), 'PL': (-12, 6), 'IT': (-10, -10),
    'ES': (-10, -10), 'UK': (-12, 6), 'FR': (-10, -10), 'NL': (6, 4),
    'SE': (-10, -12), 'DE': (-12, -10), 'AT': (-12, 6), 'BE': (6, 2),
    'IE': (6, 4), 'PT': (-10, -10), 'HU': (6, 2), 'CZ': (-12, -10),
    'DK': (6, 4), 'FI': (-10, -10), 'NO': (6, -10),
}
for c in common:
    xv, yv = TAX_WEDGE_2023[c], HRS_WKR_2023[c]
    ax_c.scatter(xv, yv, color=color_of(c), s=70,
                 edgecolor='white', linewidth=1.0, zorder=4)
    dx, dy = E_OFFSETS.get(c, (5, 4))
    ax_c.annotate(c, (xv, yv), fontsize=8, color=color_of(c),
                  fontweight='bold', ha='left', va='center',
                  xytext=(dx, dy), textcoords='offset points', zorder=5)

ax_c.set_xlabel(r'Composite tax wedge $\tau$, 2023 (\%)')
ax_c.set_ylabel('Hours per worker, 2023')
ax_c.set_title(r'(c) Tax wedge vs hours, 2023  $\cdot$  noisy negative slope',
               loc='left')
ax_c.set_xlim(25, 55)
ax_c.set_ylim(1280, 1980)
ax_c.xaxis.set_major_locator(MultipleLocator(5))
ax_c.xaxis.set_minor_locator(MultipleLocator(1))
ax_c.yaxis.set_major_locator(MultipleLocator(100))
ax_c.yaxis.set_minor_locator(MultipleLocator(50))
ax_c.legend(loc='upper right', frameon=True, framealpha=0.95,
            edgecolor='#bbbbbb', fancybox=False, fontsize=7.5)
style_axes(ax_c, gridx=True)

# ---------------------------------------------------------------------
# Regional legend at the very bottom
# ---------------------------------------------------------------------
patches = [mpatches.Patch(facecolor=info['color'], edgecolor='white',
                          label=name)
           for name, info in REGIONS.items()]
fig.legend(handles=patches, loc='lower center', ncol=5, fontsize=8.5,
           bbox_to_anchor=(0.5, 0.0), frameon=False,
           handlelength=1.2, handleheight=0.9, columnspacing=2.0)

plt.savefig('../figures/figure_panel.pdf', bbox_inches='tight', pad_inches=0.05)
plt.savefig('../figures/figure_panel.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
print(f"Figure saved.  R^2={r*r:.3f}, slope={slope:.2f} hrs/pp, sigma_resid={sigma_resid:.0f} hrs")
