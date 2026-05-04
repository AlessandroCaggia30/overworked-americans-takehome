"""
sim_models_v2.py
================
Updated simulations for problem1.tex, reflecting the canonical-model rewrites:

  Q2  -- macro-micro elasticity decomposition (NEW figure: sim_decomposition.pdf)
  Q4  -- hours cap (unchanged math; not regenerated here, see sim_mechanisms.py)
  Q5  -- canonical right-to-manage RTM (REPLACES old sim_union.pdf with RTM)
         output: sim_union_rtm.pdf
  Q6  -- AGS (2005) leisure-complementarity multi-equilibrium model
         output: sim_culture_ags.pdf
  Q7  -- counterfactual decomposition under RTM + AGS
         output: sim_q7_v2.pdf

Baseline parameters (single-sector unless noted):
  alpha = 2.0, beta = 2.0, tau = 0.4, A = 2.0, w = 1.0 (where applicable)

All numerics are computed analytically; figures are precise.
"""
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib.gridspec import GridSpec
from pathlib import Path

# =====================================================================
# Style
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

C_WORKER = '#1F5F9F'
C_FIRM   = '#D9772A'
C_TOTAL  = '#1B1B1B'
C_SOC    = '#1B7837'
C_OVER   = '#B22222'
C_US     = '#B22222'
C_EU     = '#1B7837'
C_NEUT   = '#888888'
C_LIGHT  = '#cccccc'

OUT_DIR = Path('..') / 'figures'
OUT_DIR.mkdir(exist_ok=True)


def style_axes(ax, gridx=True, gridy=True):
    if gridx:
        ax.xaxis.grid(True, linestyle=':', linewidth=0.5, color=C_LIGHT)
    if gridy:
        ax.yaxis.grid(True, linestyle=':', linewidth=0.5, color=C_LIGHT)
    ax.set_axisbelow(True)


# =====================================================================
# 1) Q2 macro-micro elasticity decomposition
# =====================================================================
def make_decomposition():
    """
    Show: at alpha_micro consistent with eps^M = 0.30 at US point,
    Prescott model alone explains only ~half the US-EU log hours gap.
    """
    tau_us = 0.35
    tau_eu = 0.56
    h_us_obs = 0.330
    h_eu_obs = 0.247

    # Macro-calibrated alpha (anchored to h_US)
    alpha_macro = (1 - tau_us) * (1 - h_us_obs) / h_us_obs  # = 1.32

    # Micro-consistent alpha: eps^M = alpha/(alpha + 1-tau_us) = 0.30
    target_eps = 0.30
    alpha_micro = target_eps * (1 - tau_us) / (1 - target_eps)  # = 0.279

    def h_pres(tau, alpha):
        return (1 - tau) / (alpha + 1 - tau)

    h_us_macro = h_pres(tau_us, alpha_macro)
    h_eu_macro = h_pres(tau_eu, alpha_macro)
    h_us_micro = h_pres(tau_us, alpha_micro)
    h_eu_micro = h_pres(tau_eu, alpha_micro)

    log_gap_data  = np.log(h_eu_obs / h_us_obs)
    log_gap_macro = np.log(h_eu_macro / h_us_macro)
    log_gap_micro = np.log(h_eu_micro / h_us_micro)

    print("=== Q2 Macro-micro decomposition ===")
    print(f"  alpha_macro = {alpha_macro:.4f}, eps^M(US) = {alpha_macro/(alpha_macro+1-tau_us):.3f}")
    print(f"  alpha_micro = {alpha_micro:.4f}, eps^M(US) = {alpha_micro/(alpha_micro+1-tau_us):.3f}")
    print(f"  h(US, alpha_micro) = {h_us_micro:.4f}, h(EU, alpha_micro) = {h_eu_micro:.4f}")
    print(f"  Data log gap   = {log_gap_data:.4f} ({100*log_gap_data:.1f}%)")
    print(f"  Macro log gap  = {log_gap_macro:.4f} ({100*log_gap_macro:.1f}%)")
    print(f"  Micro log gap  = {log_gap_micro:.4f} ({100*log_gap_micro:.1f}%)")
    print(f"  Tax share at micro = {log_gap_micro/log_gap_data:.3f}")
    print()

    fig = plt.figure(figsize=(13.2, 4.2))
    gs = GridSpec(1, 3, wspace=0.35, left=0.06, right=0.98, top=0.88, bottom=0.13)

    # Panel A: Prescott h*(tau) for two alphas
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    taus = np.linspace(0.20, 0.65, 200)
    ax.plot(taus, h_pres(taus, alpha_macro), color=C_TOTAL,
            label=fr'$\alpha^{{macro}}={alpha_macro:.2f}$', lw=2)
    ax.plot(taus, h_pres(taus, alpha_micro), color=C_WORKER, ls='--',
            label=fr'$\alpha^{{micro}}={alpha_micro:.2f}$', lw=2)
    ax.scatter([tau_us, tau_eu], [h_us_obs, h_eu_obs], color=C_OVER,
               zorder=5, s=42, edgecolor='white', linewidth=0.7,
               label='Data (US, EU)')
    ax.annotate('US', (tau_us, h_us_obs), xytext=(8, 6),
                textcoords='offset points', fontsize=9, color=C_OVER)
    ax.annotate('EU', (tau_eu, h_eu_obs), xytext=(8, 6),
                textcoords='offset points', fontsize=9, color=C_OVER)
    ax.set_xlabel(r'Composite labour wedge $\tau$')
    ax.set_ylabel(r'$h^{*}(\tau, \alpha)$')
    ax.set_title('(a) Prescott supply at macro vs.\\ micro $\\alpha$')
    ax.legend(loc='upper right')
    ax.set_ylim(0.20, 0.80)

    # Panel B: log-gap decomposition (waterfall)
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax)
    bars = ['Data\nlog gap', 'Macro\nPrescott', 'Micro\nPrescott', 'Residual\n(institutions)']
    vals = [-100*log_gap_data, -100*log_gap_macro, -100*log_gap_micro,
            -100*(log_gap_data - log_gap_micro)]
    colors = [C_OVER, C_NEUT, C_WORKER, C_SOC]
    x = np.arange(len(bars))
    ax.bar(x, vals, color=colors, edgecolor='white', linewidth=0.5)
    for i, v in enumerate(vals):
        ax.annotate(f'{v:.1f}%', (x[i], v), xytext=(0, 4),
                    textcoords='offset points', ha='center', fontsize=9)
    ax.set_xticks(x)
    ax.set_xticklabels(bars, fontsize=8.5)
    ax.set_ylabel(r'$|\Delta \log h|$ (\%)')
    ax.set_title(r'(b) Decomposition: tax channel $\approx 49\%$')
    ax.axhline(0, color='black', lw=0.4)
    ax.set_ylim(0, 35)

    # Panel C: implied multiplicative drag gamma per country
    ax = fig.add_subplot(gs[0, 2])
    style_axes(ax)
    gam_us = h_us_obs / h_us_micro
    gam_eu = h_eu_obs / h_eu_micro
    bars = ['$\\gamma^{US}$', '$\\gamma^{EU}$']
    vals = [gam_us, gam_eu]
    cols = [C_US, C_EU]
    x = np.arange(2)
    ax.bar(x, vals, color=cols, edgecolor='white', linewidth=0.5, width=0.55)
    for i, v in enumerate(vals):
        ax.annotate(f'{v:.3f}', (x[i], v), xytext=(0, 4),
                    textcoords='offset points', ha='center', fontsize=9)
    ax.set_xticks(x)
    ax.set_xticklabels(bars, fontsize=11)
    ax.set_ylabel(r'$\gamma \equiv h^{obs}/h^{*}_{Prescott}$')
    ax.set_title(r'(c) Institutional drag is tighter in the EU')
    ax.set_ylim(0, 0.6)
    ax.axhline(gam_us, color=C_US, ls=':', lw=0.8, alpha=0.6)

    plt.savefig(OUT_DIR / 'sim_decomposition.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_decomposition.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close()
    print("  -> sim_decomposition.pdf written.")
    print()


# =====================================================================
# 2) Q5 canonical right-to-manage (RTM)
# =====================================================================
# Worker IR: V_w >= V_w^0 = 0.05 (calibrated so eta=0 reproduces
# original baseline w=1, h=0.5)
#
# Composite payoffs along firm labour-demand h^d(w) = (A-w)/beta:
#   V_w(w) = (1-tau) w (A-w)/beta - alpha (A-w)^2 / (2 beta^2)
#   V_f(w) = (A-w)^2 / (2 beta)
#
# Nash bargain: max [V_w(w) - V_w^0]^eta * V_f(w)^(1-eta).
#
# At baseline alpha = beta = 2, tau = 0.4, A = 2, V_w^0 = 0.05,
# the FOC reduces (in x = A - w) to the quadratic
#   1.1 x^2 - 0.6 (2 - eta) x + 0.1 (1 - eta) = 0
# whose larger root is the equilibrium x*(eta).

ALPHA = 2.0
BETA  = 2.0
TAU   = 0.40
A     = 2.0
VW0   = 0.05  # worker outside

def rtm_x(eta, alpha=ALPHA, beta=BETA, tau=TAU, A=A, vw0=VW0):
    """
    Equilibrium x = A - w under canonical RTM Nash bargain.

    Derivation (general parameters):
      V_w(x) = A_v * x - B_v * x^2,   A_v = (1-tau)*A/beta,
                                       B_v = (1-tau)/beta + alpha/(2 beta^2)
      V_f(x) = x^2 / (2 beta)

    FOC of Nash bargain max [V_w - vw0]^eta * V_f^(1-eta) reduces to
       2 B_v * x^2  -  A_v (2-eta) * x  +  2 vw0 (1-eta) = 0.

    At baseline alpha=beta=2, tau=0.4, A=2, vw0=0.05 this is
       1.1 x^2 - 0.6 (2-eta) x + 0.1 (1-eta) = 0
    giving x=1 at eta=0 (i.e., w=1, h=0.5 -- the original baseline).
    """
    A_v = (1 - tau) * A / beta
    B_v = (1 - tau) / beta + alpha / (2 * beta * beta)
    a_coef = 2 * B_v
    b_lin  = A_v * (2 - eta)
    c_const = 2 * vw0 * (1 - eta)
    disc = b_lin**2 - 4 * a_coef * c_const
    disc = max(disc, 0.0)
    return (b_lin + np.sqrt(disc)) / (2 * a_coef)


def rtm_w(eta, **kw):
    A_ = kw.get('A', A)
    return A_ - rtm_x(eta, **kw)


def rtm_h(eta, **kw):
    return rtm_x(eta, **kw) / kw.get('beta', BETA)


def rtm_Vw(eta, **kw):
    w = rtm_w(eta, **kw)
    h = rtm_h(eta, **kw)
    alpha = kw.get('alpha', ALPHA)
    tau = kw.get('tau', TAU)
    return (1 - tau) * w * h - 0.5 * alpha * h * h


def rtm_Vf(eta, **kw):
    w = rtm_w(eta, **kw)
    h = rtm_h(eta, **kw)
    A_ = kw.get('A', A)
    beta = kw.get('beta', BETA)
    return A_ * h - 0.5 * beta * h * h - w * h


def rtm_W(eta, **kw):
    return rtm_Vw(eta, **kw) + rtm_Vf(eta, **kw)


def make_rtm():
    print("=== Q5 RTM ===")
    etas = np.linspace(0.0, 1.0, 401)
    ws   = np.array([rtm_w(e) for e in etas])
    hs   = np.array([rtm_h(e) for e in etas])
    Vw   = np.array([rtm_Vw(e) for e in etas])
    Vf   = np.array([rtm_Vf(e) for e in etas])
    Wt   = Vw + Vf

    # Print key points
    grid = [0.0, 0.10, 0.25, 0.50, 0.75, 1.00]
    print(f"  {'eta':>5} {'w':>7} {'h':>7} {'V_w':>7} {'V_f':>7} {'W':>7}")
    for e in grid:
        print(f"  {e:>5.2f} {rtm_w(e):>7.4f} {rtm_h(e):>7.4f} "
              f"{rtm_Vw(e):>7.4f} {rtm_Vf(e):>7.4f} {rtm_W(e):>7.4f}")
    print()

    fig = plt.figure(figsize=(13.2, 4.0))
    gs = GridSpec(1, 3, wspace=0.32, left=0.06, right=0.98, top=0.88, bottom=0.13)

    # Panel A: w(eta), h(eta)
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    ax.plot(etas, ws, color=C_FIRM, lw=2, label='Bargained wage $w(\\eta)$')
    ax.plot(etas, hs, color=C_WORKER, lw=2, label='Equilibrium hours $h(\\eta)$')
    ax.set_xlabel(r'Worker bargaining weight $\eta$')
    ax.set_title('(a) Wage rises, hours fall')
    ax.legend(loc='center left')
    ax.set_xlim(0, 1)

    # Panel B: surplus split
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax)
    ax.plot(etas, Vw, color=C_WORKER, lw=2, label='$V_w$ (worker)')
    ax.plot(etas, Vf, color=C_FIRM, lw=2, label='$V_f$ (firm)')
    ax.plot(etas, Wt, color=C_TOTAL, lw=2.2, label='$W = V_w + V_f$')
    ax.fill_between(etas, 0, Vw, color=C_WORKER, alpha=0.10)
    ax.set_xlabel(r'$\eta$')
    ax.set_title('(b) $V_w$ rises, $V_f$ falls, $W$ falls')
    ax.legend(loc='upper right')
    ax.set_xlim(0, 1)
    ax.axhline(0, color='black', lw=0.4)

    # Panel C: Delta W vs eta = 0 baseline
    ax = fig.add_subplot(gs[0, 2])
    style_axes(ax)
    dW = Wt - rtm_W(0.0)
    dVw = Vw - rtm_Vw(0.0)
    ax.plot(etas, dW, color=C_TOTAL, lw=2.2, label=r'$\Delta W$ (joint)')
    ax.plot(etas, dVw, color=C_WORKER, lw=2, ls='--',
            label=r'$\Delta V_w$ (worker)')
    ax.fill_between(etas, dW, 0, where=(dW <= 0), color=C_OVER, alpha=0.18,
                    label='Welfare-reducing region')
    ax.set_xlabel(r'$\eta$')
    ax.set_title(r'(c) $W$ monotone in $\eta$ (no welfare-improving region)')
    ax.legend(loc='lower left')
    ax.set_xlim(0, 1)
    ax.axhline(0, color='black', lw=0.5)

    plt.savefig(OUT_DIR / 'sim_union_rtm.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_union_rtm.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close()
    print("  -> sim_union_rtm.pdf written.")
    print()


# =====================================================================
# 3) Q6 Culture as a leisure-bonus on the worker's payoff
# =====================================================================
# V_w(h; theta^c) = (1-tau) w h - (alpha/2) h^2 + theta^c * (1-h)
# Country-specific cultural premium on leisure: theta^US = 0, theta^EU > 0
# Higher theta = more enjoyment from leisure = lower h* AND higher welfare
#
# Reference: standard preference-for-leisure parameter (Bowles-Park 2005,
# EJ 115; Olovsson 2009, IER 50(1); preference component of
# Boppart-Krusell 2020, JPE 128(1); AGS 2005, NBER Macro Annual 20).

THETA_US = 0.0
THETA_EU = 0.156   # calibrated so h*_EU = 0.222 at common alpha=2
W_ = 1.0


def h_star_culture(theta_c, alpha=ALPHA, tau=TAU, w=W_):
    """Worker's first-best hours under cultural leisure-bonus theta^c."""
    return ((1 - tau) * w - theta_c) / alpha


def Vw_culture(h, theta_c, alpha=ALPHA, tau=TAU, w=W_):
    """Worker payoff under cultural leisure-bonus theta^c."""
    return (1 - tau) * w * h - 0.5 * alpha * h**2 + theta_c * (1 - h)


def Vf_at_h(h, A_=A, beta=BETA, w=W_):
    """Firm payoff at given hours."""
    return A_ * h - 0.5 * beta * h**2 - w * h


def make_culture():
    print("=== Q6 Culture as leisure-bonus (theta^c) ===")
    h_us = h_star_culture(THETA_US)
    h_eu = h_star_culture(THETA_EU)
    print(f"  theta^US = {THETA_US}, h*_US = {h_us:.4f}")
    print(f"  theta^EU = {THETA_EU}, h*_EU = {h_eu:.4f}")
    print(f"  Cross-country gap: Delta h* = {h_eu - h_us:.4f}")

    # Welfare at each country's first-best (worker freely picks h*)
    Vw_us = Vw_culture(h_us, THETA_US)
    Vw_eu = Vw_culture(h_eu, THETA_EU)
    Vf_us = Vf_at_h(h_us)
    Vf_eu = Vf_at_h(h_eu)
    W_us = Vw_us + Vf_us
    W_eu = Vw_eu + Vf_eu
    print(f"  At own first-best:  V_w_US={Vw_us:.4f}, V_f_US={Vf_us:.4f}, W_US={W_us:.4f}")
    print(f"                      V_w_EU={Vw_eu:.4f}, V_f_EU={Vf_eu:.4f}, W_EU={W_eu:.4f}")
    print(f"                      Delta W = {W_eu - W_us:+.4f}  (EU welfare-DOMINANT)")
    print()

    fig = plt.figure(figsize=(13.2, 4.2))
    gs = GridSpec(1, 3, wspace=0.32, left=0.06, right=0.98, top=0.88, bottom=0.13)

    # Panel A: h*(tau) for two values of theta
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    taus = np.linspace(0.10, 0.70, 400)
    h_us_curve = ((1 - taus) * W_ - THETA_US) / ALPHA
    h_eu_curve = ((1 - taus) * W_ - THETA_EU) / ALPHA
    ax.plot(taus, h_us_curve, color=C_US, lw=2,
            label=fr'US: $\theta^{{US}}={THETA_US}$')
    ax.plot(taus, h_eu_curve, color=C_EU, lw=2,
            label=fr'EU: $\theta^{{EU}}={THETA_EU}$')
    ax.fill_between(taus, h_eu_curve, h_us_curve,
                    color=C_NEUT, alpha=0.15,
                    label='culture-induced gap')
    ax.scatter([TAU], [h_us], color=C_US, s=60, zorder=5,
               edgecolor='white', linewidth=0.8)
    ax.scatter([TAU], [h_eu], color=C_EU, s=60, zorder=5,
               edgecolor='white', linewidth=0.8)
    ax.annotate(f'$h^*_{{US}}={h_us:.3f}$', (TAU, h_us), xytext=(8, 6),
                textcoords='offset points', fontsize=8.5, color=C_US)
    ax.annotate(f'$h^*_{{EU}}={h_eu:.3f}$', (TAU, h_eu), xytext=(8, -14),
                textcoords='offset points', fontsize=8.5, color=C_EU)
    ax.set_xlabel(r'Composite labour wedge $\tau$')
    ax.set_ylabel(r"$h^{*}(\tau, \theta^c)$")
    ax.set_title(r'(a) Higher $\theta^c$ shifts $h^*$ down at every $\tau$')
    ax.legend(loc='upper right')
    ax.set_xlim(0.10, 0.70)

    # Panel B: V_w(h) at fixed tau for two values of theta
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax)
    hs = np.linspace(0.0, 0.7, 400)
    Vw_us_curve = (1 - TAU) * W_ * hs - 0.5 * ALPHA * hs**2 + THETA_US * (1 - hs)
    Vw_eu_curve = (1 - TAU) * W_ * hs - 0.5 * ALPHA * hs**2 + THETA_EU * (1 - hs)
    ax.plot(hs, Vw_us_curve, color=C_US, lw=2,
            label=fr'$V_w(h;\theta^{{US}}=0)$')
    ax.plot(hs, Vw_eu_curve, color=C_EU, lw=2,
            label=fr'$V_w(h;\theta^{{EU}}=0.156)$')
    ax.scatter([h_us], [Vw_us], color=C_US, s=60, zorder=5,
               edgecolor='white', linewidth=0.8)
    ax.scatter([h_eu], [Vw_eu], color=C_EU, s=60, zorder=5,
               edgecolor='white', linewidth=0.8)
    h_firm = (A - W_) / BETA
    ax.axvline(h_firm, color=C_FIRM, lw=0.8, ls=':',
               label=f'$h^{{firm}}={h_firm}$')
    ax.axhline(0, color='black', lw=0.4)
    ax.annotate(f'$V_w$ peak\n(US, $h^*={h_us:.2f}$)',
                (h_us, Vw_us), xytext=(-5, -22),
                textcoords='offset points', fontsize=8,
                color=C_US, ha='center')
    ax.annotate(f'$V_w$ peak\n(EU, $h^*={h_eu:.2f}$,\nhigher peak!)',
                (h_eu, Vw_eu), xytext=(8, 12),
                textcoords='offset points', fontsize=8,
                color=C_EU, ha='left')
    ax.set_xlabel(r'$h$')
    ax.set_ylabel(r'$V_w(h;\theta^c)$')
    ax.set_title(r'(b) EU peak is HIGHER (and at lower $h$)')
    ax.legend(loc='lower left', fontsize=7.5)
    ax.set_xlim(0, 0.7)

    # Panel C: welfare at each country's first-best (V_w + V_f stacked)
    ax = fig.add_subplot(gs[0, 2])
    style_axes(ax)
    bars = ['US\n($\\theta^{US}=0$,\n$h^*=0.300$)',
            'EU\n($\\theta^{EU}=0.156$,\n$h^*=0.222$)']
    Wvals = [W_us, W_eu]
    Vwvals = [Vw_us, Vw_eu]
    Vfvals = [Vf_us, Vf_eu]
    x = np.arange(2)
    width = 0.55
    ax.bar(x, Vwvals, width, color=C_WORKER, label='$V_w$',
           edgecolor='white', linewidth=0.5)
    ax.bar(x, Vfvals, width, bottom=Vwvals, color=C_FIRM, label='$V_f$',
           edgecolor='white', linewidth=0.5)
    for i in range(2):
        ax.annotate(f'$W={Wvals[i]:.3f}$',
                    (x[i], Wvals[i]), xytext=(0, 4),
                    textcoords='offset points', ha='center', fontsize=9,
                    fontweight='bold')
    ax.set_xticks(x)
    ax.set_xticklabels(bars, fontsize=8.5)
    ax.set_ylabel(r'Joint surplus $W$')
    ax.set_title(r'(c) EU welfare-DOMINATES: $\Delta W=$' +
                 f'${W_eu-W_us:+.3f}$')
    ax.legend(loc='upper left')
    ax.set_ylim(0, 0.45)

    plt.savefig(OUT_DIR / 'sim_culture.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_culture.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close()
    print("  -> sim_culture.pdf written.")
    print()


# =====================================================================
# 4) Q7 counterfactual decomposition under RTM + AGS
# =====================================================================
# US: AGS-coordinated on h_H, no union (eta=0). W_US = 0.425.
# EU: AGS-coordinated on h_L, with union (eta=0.5). W_EU = ?
#
# To combine the channels, we layer: at AGS equilibrium, h is fixed by
# coordination (h=h_L for EU, h=h_H for US). On top of that, RTM bargain
# determines wages. With h fixed by AGS, the firm pays w*h regardless;
# the union pushes w up, redistributing from V_f to V_w but reducing W
# via the tax wedge tau*w*h. We compute this layered welfare.

def rtm_country(eta, theta_c, alpha=ALPHA, beta=BETA, tau=TAU, A_=A, vw0=VW0):
    """
    RTM equilibrium at country-specific cultural leisure-bonus theta^c.

    Worker payoff (with leisure bonus):
        V_w(w,h;theta_c) = (1-tau)*w*h - alpha/2*h^2 + theta_c*(1-h)
    Firm payoff:
        V_f(w,h) = A*h - beta/2*h^2 - w*h
    Firm sets h = h^d(w) = (A-w)/beta on labour demand.

    In x = A - w (so h = x/beta, w = A - x):
        V_w(x; theta_c) = A_v_eff * x  -  B_v * x^2  +  theta_c
        V_f(x)          = x^2 / (2 beta)
        A_v_eff = ((1-tau)*A - theta_c) / beta
        B_v     = (1-tau)/beta + alpha/(2 beta^2)

    Nash FOC of max [V_w - vw0]^eta * V_f^(1-eta) reduces to
        2*B_v * x^2  -  A_v_eff * (2-eta) * x  +  2*(vw0 - theta_c)*(1-eta) = 0
    """
    A_v_eff = ((1 - tau) * A_ - theta_c) / beta
    B_v = (1 - tau) / beta + alpha / (2 * beta * beta)
    a_coef = 2 * B_v
    b_lin = A_v_eff * (2 - eta)
    c_const = 2 * (vw0 - theta_c) * (1 - eta)
    disc = b_lin * b_lin - 4 * a_coef * c_const
    disc = max(disc, 0.0)
    x = (b_lin + np.sqrt(disc)) / (2 * a_coef)
    w = A_ - x
    h = x / beta
    Vw = (1 - tau) * w * h - 0.5 * alpha * h * h + theta_c * (1 - h)
    Vf = A_ * h - 0.5 * beta * h * h - w * h
    return w, h, Vw, Vf, Vw + Vf


def make_q7_v2():
    print("=== Q7 counterfactual under RTM + leisure-bonus culture ===")
    # US: theta = 0, eta = 0 (firm-power); RTM IR-binding gives w=1, h=0.5
    w_us, h_us_eq, Vw_us, Vf_us, W_us = rtm_country(0.0, THETA_US)
    # EU: theta = THETA_EU, eta = 0.5
    w_eu, h_eu_eq, Vw_eu, Vf_eu, W_eu = rtm_country(0.5, THETA_EU)
    # CF1 (shut down EU union, keep EU culture: theta^EU, eta=0)
    w_cf1, h_cf1, Vw_cf1, Vf_cf1, W_cf1 = rtm_country(0.0, THETA_EU)
    # CF2 (shut down EU culture, keep EU union: theta^US, eta=0.5)
    w_cf2, h_cf2, Vw_cf2, Vf_cf2, W_cf2 = rtm_country(0.5, THETA_US)

    print(f"  US (theta={THETA_US}, eta=0):     w={w_us:.3f}, h={h_us_eq:.3f}, "
          f"V_w={Vw_us:.4f}, V_f={Vf_us:.4f}, W={W_us:.4f}")
    print(f"  EU (theta={THETA_EU}, eta=0.5):  w={w_eu:.3f}, h={h_eu_eq:.3f}, "
          f"V_w={Vw_eu:.4f}, V_f={Vf_eu:.4f}, W={W_eu:.4f}")
    print(f"  CF1 (theta={THETA_EU}, eta=0):   w={w_cf1:.3f}, h={h_cf1:.3f}, "
          f"V_w={Vw_cf1:.4f}, V_f={Vf_cf1:.4f}, W={W_cf1:.4f}")
    print(f"  CF2 (theta={THETA_US}, eta=0.5):  w={w_cf2:.3f}, h={h_cf2:.3f}, "
          f"V_w={Vw_cf2:.4f}, V_f={Vf_cf2:.4f}, W={W_cf2:.4f}")
    print(f"  Net Delta W (EU - US): {W_eu - W_us:+.4f}")

    # Path A: US -> +culture -> +union
    dA_culture = W_cf1 - W_us  # alpha shift at eta=0
    dA_union   = W_eu  - W_cf1 # union added at alpha^EU
    # Path B: US -> +union -> +culture
    dB_union   = W_cf2 - W_us
    dB_culture = W_eu  - W_cf2
    # Shapley
    sh_culture = 0.5 * (dA_culture + dB_culture)
    sh_union   = 0.5 * (dA_union   + dB_union)
    print(f"  Path A: culture={dA_culture:+.4f}, union={dA_union:+.4f}")
    print(f"  Path B: union={dB_union:+.4f}, culture={dB_culture:+.4f}")
    print(f"  Shapley culture = {sh_culture:+.4f}")
    print(f"  Shapley union   = {sh_union:+.4f}")
    print(f"  Shapley sum     = {sh_culture+sh_union:+.4f}  (should equal total {W_eu-W_us:+.4f})")
    print()

    fig = plt.figure(figsize=(13.2, 4.4))
    gs = GridSpec(1, 2, wspace=0.30, left=0.07, right=0.97, top=0.88, bottom=0.14)

    # Panel A: welfare frontier W(eta) for two values of theta
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    etas = np.linspace(0.0, 1.0, 200)
    W_us_curve = np.array([rtm_country(e, THETA_US)[4] for e in etas])
    W_eu_curve = np.array([rtm_country(e, THETA_EU)[4] for e in etas])
    ax.plot(etas, W_us_curve, color=C_US, lw=2.2,
            label=fr'$W$ at US culture ($\theta^{{US}}={THETA_US}$)')
    ax.plot(etas, W_eu_curve, color=C_EU, lw=2.2,
            label=fr'$W$ at EU culture ($\theta^{{EU}}={THETA_EU}$)')
    ax.scatter([0.0],   [W_us],  color=C_US, s=70, zorder=5,
               edgecolor='white', linewidth=0.8, label=f'US: $W={W_us:.3f}$')
    ax.scatter([0.5],   [W_eu],  color=C_EU, s=70, zorder=5,
               edgecolor='white', linewidth=0.8, label=f'EU: $W={W_eu:.3f}$')
    ax.scatter([0.0],   [W_cf1], facecolor='white', edgecolor=C_EU,
               linewidth=1.5, s=60, zorder=5,
               label=f'CF1 ($\\theta^{{EU}},\\eta=0$): $W={W_cf1:.3f}$')
    ax.scatter([0.5],   [W_cf2], facecolor='white', edgecolor=C_US,
               linewidth=1.5, s=60, zorder=5,
               label=f'CF2 ($\\theta^{{US}},\\eta=0.5$): $W={W_cf2:.3f}$')
    ax.set_xlabel(r'Worker bargaining $\eta$')
    ax.set_ylabel(r'Joint welfare $W = V_w + V_f$')
    ax.set_title(r'(a) Welfare frontiers: US culture vs.\ EU culture')
    ax.legend(loc='best', fontsize=7.5)
    ax.set_xlim(0, 1)

    # Panel B: waterfall decomposition (Path A US -> +culture -> +union)
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax)
    labels = ['US\nbase', '+culture\n($\\theta^{EU}$)', '+union\n($\\eta^{EU}=0.5$)',
              'EU\nendpoint']
    levels = [W_us, W_cf1, W_eu, W_eu]
    deltas = [W_us, dA_culture, dA_union, 0.0]
    x = np.arange(len(labels))
    ax.bar(x, levels, color=[C_NEUT, C_NEUT, C_NEUT, C_OVER],
           alpha=0.20, edgecolor='white', linewidth=0.5, width=0.55)
    for i in range(1, 3):
        delta = deltas[i]
        col = C_OVER if delta < 0 else C_SOC
        ax.annotate(f'${delta:+.4f}$',
                    (x[i], levels[i]),
                    xytext=(0, 6),
                    textcoords='offset points',
                    ha='center', fontsize=9, color=col, fontweight='bold')
    for i in [0, 3]:
        ax.annotate(f'$W={levels[i]:.3f}$', (x[i], levels[i]),
                    xytext=(0, 6), textcoords='offset points',
                    ha='center', fontsize=9, fontweight='bold')
    for i in range(len(labels)-1):
        ax.plot([x[i]+0.275, x[i+1]-0.275], [levels[i], levels[i+1]],
                color=C_TOTAL, lw=0.6, ls=':')
    ax.set_xticks(x)
    ax.set_xticklabels(labels, fontsize=8.5)
    ax.set_ylabel(r'$W$')
    ax.set_title(rf'(b) Decomposition: net $\Delta W = {W_eu - W_us:+.4f}$  '
                 rf'(Shapley: culture ${sh_culture:+.4f}$, union ${sh_union:+.4f}$)')
    ax.set_ylim(0, max(levels) * 1.15)

    plt.savefig(OUT_DIR / 'sim_q7.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_q7.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close()
    print("  -> sim_q7.pdf written.")
    print()

    return {
        'W_us': W_us, 'W_eu': W_eu, 'W_cf1': W_cf1, 'W_cf2': W_cf2,
        'dA_culture': dA_culture, 'dA_union': dA_union,
        'dB_union': dB_union, 'dB_culture': dB_culture,
        'sh_culture': sh_culture, 'sh_union': sh_union,
    }


# =====================================================================
# 5) §5.5b Welfare under generalised welfare weights (Saez-Stantcheva 2016)
# =====================================================================
# W^λ(η) = (1+λ) V_w(η) + (1-λ) V_f(η)
# λ ∈ [0,1] is the redistribution premium the planner attaches to a
# worker dollar over a firm-owner dollar.
# λ=0 → equal-weight utilitarian (the §5.4 baseline);
# λ=0.30 → realistic central case (HSV 2017 + log utility);
# λ=1   → Rawlsian (only worker surplus counts).

def make_redistribution():
    print("=== §5.5b Generalised welfare weights (Saez-Stantcheva 2016) ===")

    etas = np.linspace(0.0, 1.0, 401)
    Vw_arr = np.array([rtm_Vw(e) for e in etas])
    Vf_arr = np.array([rtm_Vf(e) for e in etas])

    lambdas = [0.00, 0.20, 0.30, 0.50, 1.00]
    colors_l = ['#1B1B1B', '#7060A0', '#1B7837', '#D9772A', '#B22222']

    fig = plt.figure(figsize=(13.2, 4.4))
    gs = GridSpec(1, 3, wspace=0.34, left=0.06, right=0.98, top=0.88, bottom=0.13)

    # ---- Panel (a) -- W^λ(η) for several λ ----
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    for lam, col in zip(lambdas, colors_l):
        Wlam = (1 + lam) * Vw_arr + (1 - lam) * Vf_arr
        ax.plot(etas, Wlam, color=col, lw=2,
                label=fr'$\lambda={lam:.2f}$')
        idx = int(np.argmax(Wlam))
        ax.scatter([etas[idx]], [Wlam[idx]], color=col, s=46,
                   edgecolor='white', linewidth=0.7, zorder=5)
    ax.set_xlabel(r'Worker bargaining weight $\eta$')
    ax.set_ylabel(r'$W^{\lambda}(\eta)$')
    ax.set_title(r'(a) $W^{\lambda}(\eta)$ -- peak shifts right with $\lambda$')
    ax.legend(loc='lower left', fontsize=8)
    ax.set_xlim(0, 1)

    # ---- Panel (b) -- η*(λ) ----
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax)
    lam_grid = np.linspace(0.0, 1.0, 401)
    eta_grid = []
    for lam in lam_grid:
        Wlam = (1 + lam) * Vw_arr + (1 - lam) * Vf_arr
        eta_grid.append(etas[int(np.argmax(Wlam))])
    eta_grid = np.array(eta_grid)
    ax.plot(lam_grid, eta_grid, color=C_TOTAL, lw=2.2,
            label=r'$\eta^{*}(\lambda)$')
    ax.axvline(0.30, color=C_SOC, ls=':', lw=1.1,
               label=r'realistic $\lambda=0.30$')
    idx30 = int(np.argmin(np.abs(lam_grid - 0.30)))
    ax.scatter([0.30], [eta_grid[idx30]], color=C_SOC, s=72,
               edgecolor='white', linewidth=0.8, zorder=5)
    ax.annotate(f'$\\eta^*\\approx{eta_grid[idx30]:.2f}$',
                (0.30, eta_grid[idx30]), xytext=(8, -16),
                textcoords='offset points', fontsize=9, color=C_SOC)
    ax.set_xlabel(r'Redistribution premium $\lambda$')
    ax.set_ylabel(r'Welfare-maximising $\eta^{*}$')
    ax.set_title(r'(b) Optimum $\eta^{*}(\lambda)$ slides $0\to 1$')
    ax.legend(loc='lower right', fontsize=9)
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1)

    # ---- Panel (c) -- Q7 ΔW^λ + Shapley decomposition ----
    ax = fig.add_subplot(gs[0, 2])
    style_axes(ax)
    _, _, Vw_us, Vf_us, _ = rtm_country(0.0, THETA_US)
    _, _, Vw_eu, Vf_eu, _ = rtm_country(0.5, THETA_EU)
    _, _, Vw_cf1, Vf_cf1, _ = rtm_country(0.0, THETA_EU)
    _, _, Vw_cf2, Vf_cf2, _ = rtm_country(0.5, THETA_US)

    delta_W = []
    sh_culture = []
    sh_union = []
    for lam in lam_grid:
        f = lambda Vw_, Vf_: (1 + lam) * Vw_ + (1 - lam) * Vf_
        W_us, W_eu = f(Vw_us, Vf_us), f(Vw_eu, Vf_eu)
        W_cf1, W_cf2 = f(Vw_cf1, Vf_cf1), f(Vw_cf2, Vf_cf2)
        dA_c = W_cf1 - W_us
        dA_u = W_eu - W_cf1
        dB_u = W_cf2 - W_us
        dB_c = W_eu - W_cf2
        delta_W.append(W_eu - W_us)
        sh_culture.append(0.5 * (dA_c + dB_c))
        sh_union.append(0.5 * (dA_u + dB_u))
    delta_W = np.array(delta_W)
    sh_culture = np.array(sh_culture)
    sh_union = np.array(sh_union)

    ax.plot(lam_grid, delta_W, color=C_TOTAL, lw=2.4,
            label=r'$\Delta W^{\lambda}_{\rm Q7}$ (total)')
    ax.plot(lam_grid, sh_culture, color=C_EU, lw=2,
            label='Shapley culture')
    ax.plot(lam_grid, sh_union, color=C_WORKER, lw=2,
            label='Shapley union')
    ax.axvline(0.30, color=C_SOC, ls=':', lw=1.1)
    ax.axhline(0, color='black', lw=0.4)
    ax.scatter([0.30], [delta_W[idx30]], color=C_TOTAL, s=60,
               edgecolor='white', linewidth=0.7, zorder=5)
    ax.scatter([0.30], [sh_culture[idx30]], color=C_EU, s=44,
               edgecolor='white', linewidth=0.7, zorder=5)
    ax.scatter([0.30], [sh_union[idx30]], color=C_WORKER, s=44,
               edgecolor='white', linewidth=0.7, zorder=5)
    ax.set_xlabel(r'$\lambda$')
    ax.set_ylabel(r'EU--US welfare gap, units of sim.')
    ax.set_title(r'(c) Q7 decomposition under $W^{\lambda}$')
    ax.legend(loc='upper left', fontsize=8)
    ax.set_xlim(0, 1)

    plt.savefig(OUT_DIR / 'sim_redistribution.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_redistribution.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close()

    print(f"  At λ=0.30: η* = {eta_grid[idx30]:.3f}, "
          f"ΔW^λ_Q7 = {delta_W[idx30]:+.4f}, "
          f"Shapley culture = {sh_culture[idx30]:+.4f}, "
          f"Shapley union = {sh_union[idx30]:+.4f}")
    print("  -> sim_redistribution.pdf written.")
    print()

    return {
        'lam_grid': lam_grid, 'eta_star': eta_grid,
        'delta_W': delta_W,
        'sh_culture': sh_culture, 'sh_union': sh_union,
    }


# =====================================================================
# 6) §5.6 Sectoral shocks under union wage rigidity
# =====================================================================
# Pre-shock: both sectors at A_pre = 2, RTM bargain at eta=0.5.
# Asymmetric shock δ: good sector A_pre + δ, bad sector A_pre - δ.
# Three post-shock regimes:
#   (a) No-union: w stuck at pre-shock, h = (A_j - w_pre)/β.
#   (b) Flexible: each sector renegotiates RTM at new A_j.
#   (c) Rigid union: good sector renegotiates upward (= flex);
#       bad sector wage stuck at w_pre (downward rigidity).

def make_shocks(delta=0.2, eta_baseline=0.5, A_pre=2.0):
    print("=== §5.6 Sectoral shocks under union wage rigidity ===")

    # Pre-shock baseline
    w_pre = rtm_w(eta_baseline, A=A_pre)
    h_pre = rtm_h(eta_baseline, A=A_pre)
    Vw_pre = rtm_Vw(eta_baseline, A=A_pre)
    Vf_pre = rtm_Vf(eta_baseline, A=A_pre)
    W_pre = Vw_pre + Vf_pre
    print(f"  Pre-shock: w={w_pre:.4f}, h={h_pre:.4f}, "
          f"V_w={Vw_pre:.4f}, V_f={Vf_pre:.4f}, W={W_pre:.4f}")

    A_good = A_pre + delta
    A_bad = A_pre - delta

    def Vw_at(w, h):
        return (1 - TAU) * w * h - 0.5 * ALPHA * h * h

    def Vf_at(w, h, A_):
        return A_ * h - 0.5 * BETA * h * h - w * h

    # Regime (a): Free market — no union, firm-power (eta=0) RTM at new A.
    # Worker IR-binding (V_w = V_w^0); wage adjusts to the productivity shock.
    w_g_nu = rtm_w(0.0, A=A_good)
    h_g_nu = rtm_h(0.0, A=A_good)
    Vw_g_nu, Vf_g_nu = rtm_Vw(0.0, A=A_good), rtm_Vf(0.0, A=A_good)
    w_b_nu = rtm_w(0.0, A=A_bad)
    h_b_nu = rtm_h(0.0, A=A_bad)
    Vw_b_nu, Vf_b_nu = rtm_Vw(0.0, A=A_bad), rtm_Vf(0.0, A=A_bad)

    # Regime (b): Flexible bargain — both sectors renegotiate RTM at new A_j
    w_g_fl, h_g_fl = rtm_w(eta_baseline, A=A_good), rtm_h(eta_baseline, A=A_good)
    Vw_g_fl, Vf_g_fl = rtm_Vw(eta_baseline, A=A_good), rtm_Vf(eta_baseline, A=A_good)
    w_b_fl, h_b_fl = rtm_w(eta_baseline, A=A_bad), rtm_h(eta_baseline, A=A_bad)
    Vw_b_fl, Vf_b_fl = rtm_Vw(eta_baseline, A=A_bad), rtm_Vf(eta_baseline, A=A_bad)

    # Regime (c): Rigid union — good = flexible (wages can rise freely);
    # bad sector wage stuck at pre-shock level w_pre, firm reads off
    # labour demand at that stuck wage.
    w_g_rg, h_g_rg = w_g_fl, h_g_fl
    Vw_g_rg, Vf_g_rg = Vw_g_fl, Vf_g_fl
    w_b_rg = w_pre
    h_b_rg = (A_bad - w_pre) / BETA
    Vw_b_rg = Vw_at(w_b_rg, h_b_rg)
    Vf_b_rg = Vf_at(w_b_rg, h_b_rg, A_bad)

    print(f"  Good sector (A={A_good}):")
    print(f"    Free market: w={w_g_nu:.3f}, h={h_g_nu:.3f}, V_w={Vw_g_nu:.4f}, V_f={Vf_g_nu:.4f}")
    print(f"    Flexible:    w={w_g_fl:.3f}, h={h_g_fl:.3f}, V_w={Vw_g_fl:.4f}, V_f={Vf_g_fl:.4f}")
    print(f"    Rigid:       w={w_g_rg:.3f}, h={h_g_rg:.3f}, V_w={Vw_g_rg:.4f}, V_f={Vf_g_rg:.4f}")
    print(f"  Bad sector (A={A_bad}):")
    print(f"    Free market: w={w_b_nu:.3f}, h={h_b_nu:.3f}, V_w={Vw_b_nu:.4f}, V_f={Vf_b_nu:.4f}")
    print(f"    Flexible:    w={w_b_fl:.3f}, h={h_b_fl:.3f}, V_w={Vw_b_fl:.4f}, V_f={Vf_b_fl:.4f}")
    print(f"    Rigid:       w={w_b_rg:.3f}, h={h_b_rg:.3f}, V_w={Vw_b_rg:.4f}, V_f={Vf_b_rg:.4f}")
    print()

    # ---- Figure: 3 panels ----
    fig = plt.figure(figsize=(13.2, 4.4))
    gs = GridSpec(1, 3, wspace=0.34, left=0.06, right=0.98, top=0.88, bottom=0.13)

    # Panel A: labour-demand curves with equilibria
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    ws = np.linspace(0.5, 1.8, 200)
    hd_pre = (A_pre - ws) / BETA
    hd_good = (A_good - ws) / BETA
    hd_bad = (A_bad - ws) / BETA
    ax.plot(ws, hd_pre, color=C_NEUT, lw=1.4, ls='--',
            label=fr'pre-shock $A={A_pre}$')
    ax.plot(ws, hd_good, color=C_EU, lw=2,
            label=fr'good $A={A_good}$')
    ax.plot(ws, hd_bad, color=C_US, lw=2,
            label=fr'bad $A={A_bad}$')
    # pre-shock anchor
    ax.scatter([w_pre], [h_pre], color=C_NEUT, s=70,
               edgecolor='white', linewidth=0.7, zorder=5)
    ax.annotate('pre', (w_pre, h_pre), xytext=(8, -2),
                textcoords='offset points', fontsize=8, color='black')
    # good sector
    ax.scatter([w_g_nu], [h_g_nu], facecolor='white', edgecolor=C_EU,
               linewidth=1.5, s=60, zorder=5)
    ax.scatter([w_g_fl], [h_g_fl], color=C_EU, s=70,
               edgecolor='white', linewidth=0.7, zorder=5)
    ax.annotate('good\n(free mkt)', (w_g_nu, h_g_nu), xytext=(-50, -2),
                textcoords='offset points', fontsize=7.5, color=C_EU)
    ax.annotate('good\n(union)', (w_g_fl, h_g_fl), xytext=(8, -3),
                textcoords='offset points', fontsize=7.5, color=C_EU)
    # bad sector
    ax.scatter([w_b_nu], [h_b_nu], facecolor='white', edgecolor=C_US,
               linewidth=1.5, s=60, zorder=5)
    ax.scatter([w_b_fl], [h_b_fl], color=C_US, s=70,
               edgecolor='white', linewidth=0.7, zorder=5)
    ax.scatter([w_pre], [h_b_rg], color=C_US, s=70, marker='s',
               edgecolor='white', linewidth=0.7, zorder=5)
    ax.annotate('bad\n(free mkt)', (w_b_nu, h_b_nu), xytext=(-58, 0),
                textcoords='offset points', fontsize=7.5, color=C_US)
    ax.annotate('bad\n(flex)', (w_b_fl, h_b_fl), xytext=(-32, -8),
                textcoords='offset points', fontsize=7.5, color=C_US)
    ax.annotate('bad\n(rigid)', (w_pre, h_b_rg), xytext=(8, -16),
                textcoords='offset points', fontsize=7.5, color=C_US)
    ax.set_xlabel(r'Wage $w$')
    ax.set_ylabel(r'Hours $h$')
    ax.set_title('(a) Labour-demand shifts and equilibria')
    ax.legend(loc='upper right', fontsize=8)
    ax.set_xlim(0.55, 1.75)
    ax.set_ylim(0, 0.65)

    regimes = ['Free market', 'Flexible union', 'Rigid union']
    width = 0.35
    x = np.arange(3)

    # Panel B: hours bar chart
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax, gridx=False)
    h_g = [h_g_nu, h_g_fl, h_g_rg]
    h_b = [h_b_nu, h_b_fl, h_b_rg]
    ax.bar(x - width / 2, h_g, width, color=C_EU, label='Good sector',
           edgecolor='white', linewidth=0.5)
    ax.bar(x + width / 2, h_b, width, color=C_US, label='Bad sector',
           edgecolor='white', linewidth=0.5)
    ax.axhline(h_pre, color=C_NEUT, ls=':', lw=1, label='pre-shock $h$')
    for i, (g, b) in enumerate(zip(h_g, h_b)):
        ax.annotate(f'{g:.3f}', (i - width / 2, g), xytext=(0, 3),
                    textcoords='offset points', ha='center', fontsize=8)
        ax.annotate(f'{b:.3f}', (i + width / 2, b), xytext=(0, 3),
                    textcoords='offset points', ha='center', fontsize=8)
    ax.set_xticks(x)
    ax.set_xticklabels(regimes, fontsize=8.5)
    ax.set_ylabel(r'Equilibrium hours $h$')
    ax.set_title(r'(b) Hours response to $\pm\delta$ shock')
    ax.legend(loc='upper right', fontsize=8)
    ax.set_ylim(0, 0.6)

    # Panel C: firm-profit bar chart
    ax = fig.add_subplot(gs[0, 2])
    style_axes(ax, gridx=False)
    Vf_g = [Vf_g_nu, Vf_g_fl, Vf_g_rg]
    Vf_b = [Vf_b_nu, Vf_b_fl, Vf_b_rg]
    ax.bar(x - width / 2, Vf_g, width, color=C_EU, label='Good sector',
           edgecolor='white', linewidth=0.5)
    ax.bar(x + width / 2, Vf_b, width, color=C_US, label='Bad sector',
           edgecolor='white', linewidth=0.5)
    ax.axhline(Vf_pre, color=C_NEUT, ls=':', lw=1, label='pre-shock $V_f$')
    for i, (g, b) in enumerate(zip(Vf_g, Vf_b)):
        ax.annotate(f'{g:.3f}', (i - width / 2, g), xytext=(0, 3),
                    textcoords='offset points', ha='center', fontsize=8)
        ax.annotate(f'{b:.3f}', (i + width / 2, b), xytext=(0, 3),
                    textcoords='offset points', ha='center', fontsize=8)
    ax.set_xticks(x)
    ax.set_xticklabels(regimes, fontsize=8.5)
    ax.set_ylabel(r'Firm profit $V_f$')
    ax.set_title('(c) Firm profit -- bad sector amplified by rigidity')
    ax.legend(loc='upper right', fontsize=8)
    ax.set_ylim(0, max(Vf_g) * 1.25)

    plt.savefig(OUT_DIR / 'sim_shocks.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_shocks.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close()
    print("  -> sim_shocks.pdf written.")
    print()

    return {
        'w_pre': w_pre, 'h_pre': h_pre,
        'h_good': {'no_union': h_g_nu, 'flex': h_g_fl, 'rigid': h_g_rg},
        'h_bad':  {'no_union': h_b_nu, 'flex': h_b_fl, 'rigid': h_b_rg},
        'Vf_good': {'no_union': Vf_g_nu, 'flex': Vf_g_fl, 'rigid': Vf_g_rg},
        'Vf_bad':  {'no_union': Vf_b_nu, 'flex': Vf_b_fl, 'rigid': Vf_b_rg},
    }


# =====================================================================
# Main
# =====================================================================
if __name__ == '__main__':
    make_decomposition()
    make_rtm()
    make_culture()
    res = make_q7_v2()
    res_l = make_redistribution()
    res_s = make_shocks()
    print("=== Summary ===")
    print(f"  Q7 net welfare gap  : {res['W_eu'] - res['W_us']:+.4f}")
    print(f"  Q7 Shapley culture  : {res['sh_culture']:+.4f}")
    print(f"  Q7 Shapley union    : {res['sh_union']:+.4f}")
    idx30 = int(np.argmin(np.abs(res_l['lam_grid'] - 0.30)))
    print(f"  λ=0.30 ΔW           : {res_l['delta_W'][idx30]:+.4f}")
    print(f"  λ=0.30 η*           : {res_l['eta_star'][idx30]:.3f}")
