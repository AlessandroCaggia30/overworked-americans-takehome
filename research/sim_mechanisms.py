"""
Build simulation figures for problem1.tex (Q4 cap, Q5 union, culture, Q7 frontier).

Common framework (firm-profit-max baseline):
  Worker:  V_w(h) = (1-tau) w h - (alpha/2) h^2     -> h*    = (1-tau) w / alpha
  Firm:    V_f(h) = A h - (beta/2) h^2 - w h        -> hfirm = (A - w) / beta
  Joint:   W(h)   = V_w(h) + V_f(h)                  -> hsoc  = ((1-tau)w + (A-w))/(alpha+beta)
  Nash bargaining over h with weight eta:
           h(eta) = [(1-eta)(A-w) + eta (1-tau) w] / [(1-eta) beta + eta alpha]

Welfare-improving condition for a cap bar_h:
  Delta W(bar_h) > 0  iff  bar_h in (2 hsoc - hfirm, hfirm).
  At baseline alpha = beta, this simplifies to bar_h in (h*, hfirm).

Welfare-improving condition for union strength eta:
  Delta W(eta) > 0  iff  eta in (0, 2 eta_soc).
  Joint surplus is single-peaked at eta_soc with h(eta_soc) = hsoc.

Baseline calibration: A = 2.0, w = 1.0, beta = 2.0, alpha = 2.0, tau = 0.4
  h*    = 0.30,  hsoc = 0.40,  hfirm = 0.50,  eta_soc = 0.50.

EU cultural shift: alpha_EU = 2.7  (35% higher leisure preference).

Output: figure_panel.pdf (Q1; not regenerated here -- see build_figure_panel.py),
        sim_cap.pdf, sim_union.pdf, sim_culture.pdf, sim_q7.pdf.
"""
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec
from matplotlib.ticker import MultipleLocator

# =====================================================================
# Publication-quality style (matches build_figure_panel.py)
# =====================================================================
mpl.rcParams.update({
    'font.family': 'serif',
    'font.serif': ['Times New Roman', 'Times', 'STIX', 'DejaVu Serif'],
    'mathtext.fontset': 'stix',
    'font.size': 9.5,
    'axes.titlesize': 10,
    'axes.labelsize': 10,
    'axes.linewidth': 0.7,
    'axes.spines.top': False,
    'axes.spines.right': False,
    'axes.titleweight': 'bold',
    'axes.titlepad': 8,
    'xtick.labelsize': 8.5,
    'ytick.labelsize': 8.5,
    'legend.fontsize': 8.5,
    'legend.frameon': False,
    'lines.linewidth': 1.7,
    'figure.dpi': 150,
    'savefig.dpi': 300,
    'savefig.bbox': 'tight',
    'pdf.fonttype': 42,
})

# Palette
C_WORKER  = '#1F5F9F'    # deep blue
C_FIRM    = '#D9772A'    # orange
C_TOTAL   = '#1B1B1B'    # near-black
C_SOC     = '#1B7837'    # green (social optimum)
C_OVER    = '#B22222'    # red (overshoot)
C_US      = '#B22222'    # red (US in culture/Q7)
C_EU      = '#1B7837'    # green (EU in culture/Q7)
C_NEUTRAL = '#888888'    # mid-gray
C_LIGHT   = '#cccccc'    # grid

# =====================================================================
# Parameters (baseline)
# =====================================================================
A         = 2.0
W_        = 1.0
BETA      = 2.0
ALPHA     = 2.0      # US baseline leisure-cost
ALPHA_EU  = 2.7      # EU cultural shift
TAU       = 0.40

# =====================================================================
# Closed-form model
# =====================================================================
def h_star(tau=TAU, alpha=ALPHA, w=W_):
    return (1 - tau) * w / alpha

def h_firm(A=A, w=W_, beta=BETA):
    return (A - w) / beta

def h_social(tau=TAU, alpha=ALPHA, A=A, w=W_, beta=BETA):
    return ((1 - tau) * w + (A - w)) / (alpha + beta)

def h_nash(eta, tau=TAU, alpha=ALPHA, A=A, w=W_, beta=BETA):
    num = (1 - eta) * (A - w) + eta * (1 - tau) * w
    den = (1 - eta) * beta + eta * alpha
    return num / den

def V_worker(h, tau=TAU, alpha=ALPHA, w=W_):
    return (1 - tau) * w * h - 0.5 * alpha * h**2

def V_firm(h, A=A, w=W_, beta=BETA):
    return A * h - 0.5 * beta * h**2 - w * h

def W_total(h, tau=TAU, alpha=ALPHA, A=A, w=W_, beta=BETA):
    return V_worker(h, tau, alpha, w) + V_firm(h, A, w, beta)


def style_axes(ax, gridx=True, gridy=True):
    """Light grid + spines styling."""
    if gridx and gridy:
        ax.grid(axis='both', color=C_LIGHT, linewidth=0.4, alpha=0.6, zorder=0)
    elif gridy:
        ax.grid(axis='y', color=C_LIGHT, linewidth=0.4, alpha=0.6, zorder=0)
    elif gridx:
        ax.grid(axis='x', color=C_LIGHT, linewidth=0.4, alpha=0.6, zorder=0)
    ax.set_axisbelow(True)
    for spine in ('left', 'bottom'):
        ax.spines[spine].set_color('#333333')


# =====================================================================
# SIM 1: Hours cap (3 panels: surplus, components, Delta-W)
# =====================================================================
def make_sim_cap():
    fig = plt.figure(figsize=(13.2, 4.0))
    gs = GridSpec(1, 3, figure=fig, wspace=0.30,
                  left=0.045, right=0.985, top=0.90, bottom=0.16)

    h_w   = h_star(TAU, ALPHA)
    h_f   = h_firm()
    h_soc = h_social(TAU, ALPHA)

    h_grid = np.linspace(0.01, h_f + 0.10, 600)

    # ----- Panel (a): primitive functions over the FULL choice domain -----
    ax = fig.add_subplot(gs[0, 0])
    Vw_full = V_worker(h_grid, TAU, ALPHA)
    Vf_full = V_firm(h_grid)
    Wt_full = Vw_full + Vf_full

    ax.plot(h_grid, Vw_full, color=C_WORKER, linewidth=1.7, label=r'Worker $V_w(h)$')
    ax.plot(h_grid, Vf_full, color=C_FIRM,   linewidth=1.7, label=r'Firm $V_f(h)$')
    ax.plot(h_grid, Wt_full, color=C_TOTAL,  linewidth=2.2, label=r'Total $W(h)=V_w+V_f$')

    # Mark each function's maximum
    for h_max, color, lbl, va in [(h_w,   C_WORKER, r'$h^\ast$', 'top'),
                                  (h_soc, C_SOC,    r'$h^{\rm soc}$', 'bottom'),
                                  (h_f,   C_FIRM,   r'$h^{\rm firm}$', 'top')]:
        ax.axvline(h_max, color=color, linestyle='--', linewidth=0.8, alpha=0.7)
        # Mark the maximum point on the relevant curve with a dot
        if lbl == r'$h^\ast$':
            ax.scatter([h_max], [V_worker(h_max, TAU, ALPHA)], color=color, s=42,
                       zorder=5, edgecolor='white', linewidth=0.9)
        elif lbl == r'$h^{\rm soc}$':
            ax.scatter([h_max], [W_total(h_max, TAU, ALPHA)], color=color, s=42,
                       zorder=5, edgecolor='white', linewidth=0.9)
        elif lbl == r'$h^{\rm firm}$':
            ax.scatter([h_max], [V_firm(h_max)], color=color, s=42,
                       zorder=5, edgecolor='white', linewidth=0.9)
        ax.text(h_max, 0.42, lbl, color=color, fontsize=10,
                fontweight='bold', ha='center', va='bottom')

    ax.axhline(0, color='#bbbbbb', linewidth=0.5)
    ax.set_xlabel(r'Hours $h$')
    ax.set_ylabel(r'Surplus')
    ax.set_title(r'(a) Primitives: $V_w(h)$, $V_f(h)$, $W(h)$', loc='left')
    ax.set_xlim(0, h_f + 0.08)
    ax.set_ylim(-0.06, 0.45)
    ax.legend(loc='lower center', fontsize=8.5, ncol=1)
    style_axes(ax)

    # ----- Panel (b): equilibrium under cap -- min{cap, h_firm} -----
    ax = fig.add_subplot(gs[0, 1])
    cbar = h_grid
    h_eq = np.minimum(cbar, h_f)
    Vw_eq = V_worker(h_eq, TAU, ALPHA)
    Vf_eq = V_firm(h_eq)
    Wt_eq = Vw_eq + Vf_eq

    ax.plot(cbar, Vw_eq, color=C_WORKER, linewidth=1.7, label=r'Worker $V_w(h^{eq})$')
    ax.plot(cbar, Vf_eq, color=C_FIRM,   linewidth=1.7, label=r'Firm $V_f(h^{eq})$')
    ax.plot(cbar, Wt_eq, color=C_TOTAL,  linewidth=2.2, label=r'Total $W$')

    for h_max, color, lbl in [(h_w, C_WORKER, r'$h^\ast$'),
                              (h_soc, C_SOC,  r'$h^{\rm soc}$'),
                              (h_f, C_FIRM,   r'$h^{\rm firm}$')]:
        ax.axvline(h_max, color=color, linestyle='--', linewidth=0.8, alpha=0.7)
        ax.text(h_max, 0.42, lbl, color=color, fontsize=10,
                fontweight='bold', ha='center', va='bottom')

    # Mark joint optimum
    ax.scatter([h_soc], [W_total(h_soc, TAU, ALPHA)], color=C_SOC, s=70,
               zorder=6, edgecolor='white', linewidth=1.0,
               label=r'$\arg\max_{\bar h} W$')

    ax.set_xlabel(r'Cap level $\bar h$  ($h^{eq}=\min\{\bar h,h^{\rm firm}\}$)')
    ax.set_ylabel(r'Surplus at constrained equilibrium')
    ax.set_title(r'(b) Surplus along $h^{eq}(\bar h)$', loc='left')
    ax.set_xlim(0, h_f + 0.08)
    ax.set_ylim(-0.06, 0.45)
    ax.legend(loc='lower right', fontsize=8.5)
    style_axes(ax)

    # ----- Panel (c): Delta-W vs no-cap baseline + welfare-improving region -----
    ax = fig.add_subplot(gs[0, 2])
    Wt_base = W_total(h_f, TAU, ALPHA)
    dW = Wt_eq - Wt_base
    ax.axhline(0, color='#888888', linewidth=0.6)
    ax.plot(cbar, dW, color=C_TOTAL, linewidth=2.2)
    ax.fill_between(cbar, 0, dW, where=(dW > 0), alpha=0.28, color=C_SOC,
                    label='cap welfare-improving')
    ax.fill_between(cbar, 0, dW, where=(dW < 0), alpha=0.28, color=C_OVER,
                    label='cap welfare-reducing (overshoot)')

    for h_max, color, lbl in [(h_w, C_WORKER, r'$h^\ast$'),
                              (h_soc, C_SOC,  r'$h^{\rm soc}$'),
                              (h_f, C_FIRM,   r'$h^{\rm firm}$')]:
        ax.axvline(h_max, color=color, linestyle='--', linewidth=0.8, alpha=0.7)
        ax.text(h_max, dW.max() * 1.05 + 0.005, lbl, color=color, fontsize=10,
                fontweight='bold', ha='center', va='bottom')

    # Annotate optimum
    i_opt = dW.argmax()
    ax.scatter([cbar[i_opt]], [dW[i_opt]], color=C_SOC, s=70,
               zorder=6, edgecolor='white', linewidth=1.0)
    ax.annotate(rf'optimum: $\bar h={cbar[i_opt]:.2f},\;\Delta W={dW[i_opt]:.4f}$',
                xy=(cbar[i_opt], dW[i_opt]),
                xytext=(cbar[i_opt] + 0.07, dW[i_opt] + 0.005),
                fontsize=8.5, color=C_SOC,
                arrowprops=dict(arrowstyle='->', color=C_SOC, lw=0.8))

    ax.set_xlabel(r'Cap level $\bar h$')
    ax.set_ylabel(r'$\Delta W(\bar h) = W(\bar h) - W(h^{\rm firm})$')
    ax.set_title(r'(c) Welfare gain over no-cap baseline', loc='left')
    ax.set_xlim(0, h_f + 0.08)
    ax.set_ylim(dW.min() - 0.02, dW.max() * 1.30 + 0.04)
    ax.legend(loc='lower right', fontsize=8.5)
    style_axes(ax)

    plt.savefig('../figures/sim_cap.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig('../figures/sim_cap.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close(fig)
    print(f"sim_cap: h*={h_w:.3f}, h_soc={h_soc:.3f}, h_firm={h_f:.3f},  "
          f"max dW={dW.max():.4f} at cap={cbar[dW.argmax()]:.3f}")


# =====================================================================
# SIM 2: Single union (3 panels)
# =====================================================================
def make_sim_union():
    fig = plt.figure(figsize=(13.2, 4.0))
    gs = GridSpec(1, 3, figure=fig, wspace=0.30,
                  left=0.045, right=0.985, top=0.90, bottom=0.16)

    eta = np.linspace(0, 1, 400)
    h   = h_nash(eta, TAU, ALPHA)
    Vw  = V_worker(h, TAU, ALPHA)
    Vf  = V_firm(h)
    Wt  = Vw + Vf

    h_w   = h_star(TAU, ALPHA)
    h_f   = h_firm()
    h_soc = h_social(TAU, ALPHA)
    eta_soc = eta[Wt.argmax()]

    # ----- Panel (a): h(eta) -----
    ax = fig.add_subplot(gs[0, 0])
    ax.plot(eta, h, color=C_TOTAL, linewidth=2.2, label=r'$h(\eta)$')
    ax.axhline(h_f, color=C_FIRM, linestyle='--', linewidth=0.9, alpha=0.7)
    ax.axhline(h_w, color=C_WORKER, linestyle='--', linewidth=0.9, alpha=0.7)
    ax.axhline(h_soc, color=C_SOC, linestyle=':', linewidth=1.0, alpha=0.7)

    ax.text(0.02, h_f + 0.005, r'$h^{\rm firm}$', color=C_FIRM, fontsize=10, fontweight='bold')
    ax.text(0.02, h_w - 0.012, r'$h^\ast$',        color=C_WORKER, fontsize=10, fontweight='bold')
    ax.text(0.98, h_soc + 0.005, r'$h^{\rm soc}$', color=C_SOC, fontsize=10, fontweight='bold', ha='right')

    ax.axvline(eta_soc, color=C_SOC, linestyle=':', linewidth=1.0, alpha=0.6)
    ax.scatter([eta_soc], [h_social(TAU, ALPHA)], color=C_SOC, s=70, zorder=6,
               edgecolor='white', linewidth=1.0)
    ax.annotate(rf'$\eta^{{\rm soc}}={eta_soc:.2f}$',
                xy=(eta_soc, h_social(TAU, ALPHA)),
                xytext=(eta_soc + 0.06, h_social(TAU, ALPHA) + 0.025),
                fontsize=8.5, color=C_SOC,
                arrowprops=dict(arrowstyle='->', color=C_SOC, lw=0.8))

    ax.set_xlabel(r'Worker bargaining power $\eta$')
    ax.set_ylabel(r'Equilibrium hours $h(\eta)$')
    ax.set_title(r'(a) $h(\eta)$ runs from $h^{\rm firm}$ to $h^\ast$', loc='left')
    ax.set_xlim(0, 1)
    ax.set_ylim(h_w - 0.04, h_f + 0.04)
    ax.legend(loc='lower left', fontsize=8.5)
    style_axes(ax)

    # ----- Panel (b): surplus components -----
    ax = fig.add_subplot(gs[0, 1])
    ax.plot(eta, Vw, color=C_WORKER, linewidth=1.7, label=r'Worker $V_w$')
    ax.plot(eta, Vf, color=C_FIRM,   linewidth=1.7, label=r'Firm $V_f$')
    ax.plot(eta, Wt, color=C_TOTAL,  linewidth=2.3, label=r'Total $W$')
    ax.axvline(eta_soc, color=C_SOC, linestyle=':', linewidth=1.0, alpha=0.7)
    ax.scatter([eta_soc], [Wt.max()], color=C_SOC, s=70, zorder=6,
               edgecolor='white', linewidth=1.0)
    ax.text(eta_soc + 0.01, Wt.max() + 0.005, rf'$\eta^{{\rm soc}}={eta_soc:.2f}$',
            color=C_SOC, fontsize=8.5)

    ax.set_xlabel(r'Worker bargaining power $\eta$')
    ax.set_ylabel(r'Surplus')
    ax.set_title(r'(b) $W(\eta)$ single-peaked at $\eta^{\rm soc}$', loc='left')
    ax.set_xlim(0, 1)
    ax.legend(loc='center right', fontsize=8.5)
    style_axes(ax)

    # ----- Panel (c): Delta-W vs no-union baseline -----
    ax = fig.add_subplot(gs[0, 2])
    Wt_base = W_total(h_f, TAU, ALPHA)
    dW = Wt - Wt_base
    ax.axhline(0, color='#888888', linewidth=0.6)
    ax.plot(eta, dW, color=C_TOTAL, linewidth=2.2)
    ax.fill_between(eta, 0, dW, where=(dW > 0), alpha=0.28, color=C_SOC,
                    label='union welfare-improving')
    ax.fill_between(eta, 0, dW, where=(dW < 0), alpha=0.28, color=C_OVER,
                    label='union welfare-reducing (over-bargained)')
    ax.axvline(eta_soc, color=C_SOC, linestyle=':', linewidth=1.0, alpha=0.7)
    ax.scatter([eta_soc], [dW.max()], color=C_SOC, s=70, zorder=6,
               edgecolor='white', linewidth=1.0)
    ax.annotate(rf'optimum at $\eta^{{\rm soc}}={eta_soc:.2f},\;\Delta W={dW.max():.4f}$',
                xy=(eta_soc, dW.max()),
                xytext=(eta_soc - 0.4, dW.max() + 0.005),
                fontsize=8.5, color=C_SOC,
                arrowprops=dict(arrowstyle='->', color=C_SOC, lw=0.8))

    ax.set_xlabel(r'Worker bargaining power $\eta$')
    ax.set_ylabel(r'$\Delta W(\eta) = W(\eta) - W(h^{\rm firm})$')
    ax.set_title(r'(c) Welfare gain vs no-union baseline', loc='left')
    ax.set_xlim(0, 1)
    ax.set_ylim(dW.min() - 0.005, dW.max() * 1.4 + 0.005)
    ax.legend(loc='lower left', fontsize=8.5)
    style_axes(ax)

    plt.savefig('../figures/sim_union.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig('../figures/sim_union.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close(fig)
    print(f"sim_union: h(0)={h[0]:.3f}, h(1)={h[-1]:.3f}, eta_soc={eta_soc:.3f},  "
          f"max dW={dW.max():.4f}")


# =====================================================================
# SIM 3: Culture as alpha-shift (h*(tau, alpha))
# =====================================================================
def make_sim_culture():
    fig = plt.figure(figsize=(13.2, 4.2))
    gs = GridSpec(1, 2, figure=fig, wspace=0.25,
                  left=0.06, right=0.985, top=0.90, bottom=0.16,
                  width_ratios=[1, 1])

    tau_grid = np.linspace(0, 0.65, 400)

    # ----- Panel (a): h*(tau) for two alpha values -----
    ax = fig.add_subplot(gs[0, 0])
    h_us = (1 - tau_grid) * W_ / ALPHA
    h_eu = (1 - tau_grid) * W_ / ALPHA_EU

    ax.plot(tau_grid, h_us, color=C_US, linewidth=2.0,
            label=rf'US: $\alpha={ALPHA:.1f}$')
    ax.plot(tau_grid, h_eu, color=C_EU, linewidth=2.0,
            label=rf'EU: $\alpha={ALPHA_EU:.1f}$ (cultural shift)')
    ax.fill_between(tau_grid, h_eu, h_us, alpha=0.18, color=C_NEUTRAL,
                    label=r'culture gap $\Delta h^\ast(\tau)$')

    # Reference taus
    for tau_ref, lbl, c in [(0.30, r'US $\tau$', C_US), (0.47, r'EU $\tau$', C_EU)]:
        ax.axvline(tau_ref, color=c, linestyle=':', linewidth=0.7, alpha=0.5)
        ax.text(tau_ref, 0.025, lbl, color=c, fontsize=8.5,
                ha='center', va='bottom', rotation=90, alpha=0.85)

    # Mark the equilibrium gap at tau = 0.4 (baseline)
    h_us_baseline = h_star(TAU, ALPHA)
    h_eu_baseline = h_star(TAU, ALPHA_EU)
    ax.scatter([TAU, TAU], [h_us_baseline, h_eu_baseline],
               color=[C_US, C_EU], s=60, zorder=6, edgecolor='white', linewidth=1.0)
    ax.annotate(rf'$h^\ast_{{US}}={h_us_baseline:.3f}$',
                xy=(TAU, h_us_baseline), xytext=(TAU - 0.15, h_us_baseline + 0.05),
                fontsize=8.5, color=C_US,
                arrowprops=dict(arrowstyle='->', color=C_US, lw=0.7))
    ax.annotate(rf'$h^\ast_{{EU}}={h_eu_baseline:.3f}$',
                xy=(TAU, h_eu_baseline), xytext=(TAU + 0.10, h_eu_baseline - 0.06),
                fontsize=8.5, color=C_EU,
                arrowprops=dict(arrowstyle='->', color=C_EU, lw=0.7))

    ax.set_xlabel(r'Tax wedge $\tau$')
    ax.set_ylabel(r"$h^\ast(\tau,\alpha)=(1-\tau)w/\alpha$")
    ax.set_title(r'(a) Culture as a downward shift in $h^\ast$', loc='left')
    ax.set_xlim(0, 0.65)
    ax.set_ylim(0, 0.55)
    ax.legend(loc='upper right', fontsize=8.5)
    style_axes(ax)

    # ----- Panel (b): worker payoff V_w(h) for two alpha values, marking h* -----
    ax = fig.add_subplot(gs[0, 1])
    h_grid = np.linspace(0, 0.6, 400)
    Vw_us = V_worker(h_grid, TAU, ALPHA)
    Vw_eu = V_worker(h_grid, TAU, ALPHA_EU)

    ax.plot(h_grid, Vw_us, color=C_US, linewidth=2.0,
            label=rf'US worker: $V_w(h;\,\alpha={ALPHA:.1f})$')
    ax.plot(h_grid, Vw_eu, color=C_EU, linewidth=2.0,
            label=rf'EU worker: $V_w(h;\,\alpha={ALPHA_EU:.1f})$')
    ax.axhline(0, color='#bbbbbb', linewidth=0.5)

    # Mark optima
    ax.axvline(h_us_baseline, color=C_US, linestyle='--', linewidth=0.8, alpha=0.6)
    ax.axvline(h_eu_baseline, color=C_EU, linestyle='--', linewidth=0.8, alpha=0.6)
    ax.scatter([h_us_baseline], [V_worker(h_us_baseline, TAU, ALPHA)],
               color=C_US, s=60, zorder=6, edgecolor='white', linewidth=1.0)
    ax.scatter([h_eu_baseline], [V_worker(h_eu_baseline, TAU, ALPHA_EU)],
               color=C_EU, s=60, zorder=6, edgecolor='white', linewidth=1.0)

    ax.text(h_us_baseline, V_worker(h_us_baseline, TAU, ALPHA) + 0.012,
            r'$h^\ast_{US}$', color=C_US, fontsize=10, fontweight='bold', ha='center')
    ax.text(h_eu_baseline, V_worker(h_eu_baseline, TAU, ALPHA_EU) + 0.012,
            r'$h^\ast_{EU}$', color=C_EU, fontsize=10, fontweight='bold', ha='center')

    ax.set_xlabel(r'Hours $h$')
    ax.set_ylabel(r'Worker surplus $V_w(h;\,\alpha,\tau)$')
    ax.set_title(rf'(b) Worker $V_w$ at $\tau={TAU}$: each $\alpha$ has its own peak',
                 loc='left')
    ax.set_xlim(0, 0.6)
    ax.legend(loc='lower center', fontsize=8.5)
    style_axes(ax)

    plt.savefig('../figures/sim_culture.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig('../figures/sim_culture.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close(fig)
    print(f"sim_culture: h*_US(tau={TAU})={h_us_baseline:.3f}, "
          f"h*_EU(tau={TAU})={h_eu_baseline:.3f}, "
          f"gap={h_us_baseline - h_eu_baseline:.3f}")


# =====================================================================
# SIM 4 (Q7): Welfare frontier US vs EU
# =====================================================================
def make_sim_q7():
    fig = plt.figure(figsize=(13.2, 4.5))
    gs = GridSpec(1, 2, figure=fig, wspace=0.27,
                  left=0.06, right=0.985, top=0.90, bottom=0.15,
                  width_ratios=[1, 1])

    # ----- Panel (a): W(eta) for two alpha values, with US/EU equilibria marked -----
    ax = fig.add_subplot(gs[0, 0])
    eta = np.linspace(0, 1, 400)

    h_grid_us  = h_nash(eta, TAU, ALPHA)
    Wt_us      = V_worker(h_grid_us, TAU, ALPHA) + V_firm(h_grid_us)
    h_grid_eu  = h_nash(eta, TAU, ALPHA_EU)
    Wt_eu      = V_worker(h_grid_eu, TAU, ALPHA_EU) + V_firm(h_grid_eu)

    ax.plot(eta, Wt_us, color=C_US, linewidth=2.2,
            label=rf'$W(\eta;\,\alpha={ALPHA:.1f})$ -- US culture')
    ax.plot(eta, Wt_eu, color=C_EU, linewidth=2.2,
            label=rf'$W(\eta;\,\alpha={ALPHA_EU:.1f})$ -- EU culture')

    # US equilibrium: eta = 0 (no union), alpha_US
    eta_US, alpha_US_eq = 0.0, ALPHA
    h_US = h_nash(eta_US, TAU, alpha_US_eq)
    W_US = V_worker(h_US, TAU, alpha_US_eq) + V_firm(h_US)

    # EU equilibrium: eta = 0.5 (Continental coverage), alpha_EU
    eta_EU, alpha_EU_eq = 0.5, ALPHA_EU
    h_EU = h_nash(eta_EU, TAU, alpha_EU_eq)
    W_EU = V_worker(h_EU, TAU, alpha_EU_eq) + V_firm(h_EU)

    ax.scatter([eta_US], [W_US], color=C_US, s=120, zorder=6,
               edgecolor='white', linewidth=1.4, marker='o',
               label=rf'US: $\eta={eta_US},\,\alpha={alpha_US_eq:.1f}$, $W={W_US:.3f}$')
    ax.scatter([eta_EU], [W_EU], color=C_EU, s=120, zorder=6,
               edgecolor='white', linewidth=1.4, marker='s',
               label=rf'EU: $\eta={eta_EU},\,\alpha={alpha_EU_eq:.1f}$, $W={W_EU:.3f}$')

    # Counterfactual EU points
    # CF1: shut down union (eta -> 0), keep alpha_EU
    h_cf1 = h_nash(0.0, TAU, ALPHA_EU)
    W_cf1 = V_worker(h_cf1, TAU, ALPHA_EU) + V_firm(h_cf1)
    ax.scatter([0.0], [W_cf1], color=C_EU, s=70, zorder=6,
               edgecolor='white', linewidth=1.0, marker='X',
               label=rf'CF1 $\eta=0,\alpha=\alpha^{{EU}}$: $W={W_cf1:.3f}$')

    # CF2: shift culture (alpha -> alpha_US), keep eta
    h_cf2 = h_nash(eta_EU, TAU, ALPHA)
    W_cf2 = V_worker(h_cf2, TAU, ALPHA) + V_firm(h_cf2)
    ax.scatter([eta_EU], [W_cf2], color=C_US, s=70, zorder=6,
               edgecolor='white', linewidth=1.0, marker='X',
               label=rf'CF2 $\eta={eta_EU},\alpha=\alpha^{{US}}$: $W={W_cf2:.3f}$')

    ax.set_xlabel(r'Worker bargaining power $\eta$')
    ax.set_ylabel(r'Total welfare $W$')
    ax.set_title(r'(a) Welfare frontier: $W(\eta;\alpha)$ and US/EU equilibria',
                 loc='left')
    ax.set_xlim(-0.04, 1.04)
    ax.legend(loc='lower center', fontsize=7.6, ncol=1, columnspacing=0.8)
    style_axes(ax)

    # ----- Panel (b): waterfall decomposition US -> EU -----
    ax = fig.add_subplot(gs[0, 1])

    # Path: US -> apply EU culture (alpha=2.7 at eta=0) -> apply EU union (eta=0.5 at alpha=2.7)
    # Step 0: US baseline
    s0 = W_US
    # Step 1: cultural shift only (alpha = 2.7, eta = 0)
    h_s1 = h_nash(0.0, TAU, ALPHA_EU)
    s1 = V_worker(h_s1, TAU, ALPHA_EU) + V_firm(h_s1)
    # Step 2: add union (eta = 0.5, alpha = 2.7) = EU
    h_s2 = h_nash(eta_EU, TAU, ALPHA_EU)
    s2 = V_worker(h_s2, TAU, ALPHA_EU) + V_firm(h_s2)

    labels = ['US\nbaseline\n($\\eta=0$,\n$\\alpha=$2.0)',
              '+ culture\n($\\alpha\\to 2.7$,\n$\\eta=0$)',
              '+ union\n($\\eta\\to 0.5$,\n$\\alpha=2.7$)\n= EU']
    levels = [s0, s1, s2]

    # Plot bars at each level
    x_pos = np.arange(3)
    colors_steps = [C_US, '#A0716A', C_EU]
    bars = ax.bar(x_pos, levels, width=0.55, color=colors_steps,
                  edgecolor='white', linewidth=1.0, zorder=3)

    # Connectors (light gray)
    for i in range(2):
        ax.plot([x_pos[i] + 0.275, x_pos[i + 1] - 0.275],
                [levels[i], levels[i]],
                color='#888888', linewidth=0.8, linestyle=':', zorder=2)

    # Annotate magnitudes
    for i, lvl in enumerate(levels):
        ax.text(x_pos[i], lvl + 0.005, f'$W={lvl:.3f}$',
                ha='center', va='bottom', fontsize=9, fontweight='bold',
                color=colors_steps[i])

    # Annotate deltas
    for i in range(1, 3):
        delta = levels[i] - levels[i - 1]
        sign = '+' if delta >= 0 else '$-$'
        ax.annotate(f'$\\Delta={delta:+.3f}$',
                    xy=((x_pos[i - 1] + x_pos[i]) / 2, max(levels[i - 1], levels[i]) + 0.018),
                    fontsize=8.5,
                    color=C_OVER if delta < 0 else C_SOC,
                    ha='center', va='bottom')

    ax.set_xticks(x_pos)
    ax.set_xticklabels(labels, fontsize=8.5)
    ax.set_ylabel(r'Total welfare $W$')
    ax.set_title(r'(b) US $\to$ EU decomposition: which channel costs how much',
                 loc='left')
    ax.set_ylim(0, max(levels) * 1.18)
    ax.grid(axis='y', color=C_LIGHT, linewidth=0.4, alpha=0.6, zorder=0)
    ax.set_axisbelow(True)
    for spine in ('left', 'bottom'):
        ax.spines[spine].set_color('#333333')

    plt.savefig('../figures/sim_q7.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig('../figures/sim_q7.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close(fig)
    print(f"sim_q7: W_US={W_US:.4f}, W_EU={W_EU:.4f}, W_EU-W_US={W_EU - W_US:+.4f}")
    print(f"        CF1 (no union, EU culture): W={W_cf1:.4f} (welfare destroyed: {W_cf1 - W_EU:+.4f})")
    print(f"        CF2 (US culture, EU union): W={W_cf2:.4f} (welfare gained:    {W_cf2 - W_EU:+.4f})")


# =====================================================================
# Run all
# =====================================================================
if __name__ == '__main__':
    print("=== Sim 1: hours cap ===")
    make_sim_cap()
    print("\n=== Sim 2: union ===")
    make_sim_union()
    print("\n=== Sim 3: culture ===")
    make_sim_culture()
    print("\n=== Sim 4 (Q7): welfare frontier ===")
    make_sim_q7()
    print("\nFigures saved to ../sim_{cap,union,culture,q7}.{pdf,png}")
