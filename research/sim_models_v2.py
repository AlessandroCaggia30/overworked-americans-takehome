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
    bars = ['Data\nlog gap', 'Macro\nPrescott', 'Micro\nPrescott',
            'Residual\n(inst./culture/other)']
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
    """
    Q5 unified figure (two-state):
      (a) Bargain mechanics per state: w_j(eta), h_j(eta) for j in {good, bad}
      (b) Distribution per state: V_w_j(eta), V_f_j(eta)
      (c) Aggregate welfare W^lambda_agg(eta, s=0.5) for varied lambda;
          peak shifts right with lambda
    """
    print("=== Q5 RTM (two-state unified narrative) ===")
    A_pre  = 2.0
    delta  = 0.2
    A_good = A_pre + delta
    A_bad  = A_pre - delta
    s = 0.5  # equal share aggregation

    etas = np.linspace(0.0, 1.0, 401)
    # per-state trajectories
    w_g = np.array([rtm_w(e, A=A_good) for e in etas])
    h_g = np.array([rtm_h(e, A=A_good) for e in etas])
    Vw_g = np.array([rtm_Vw(e, A=A_good) for e in etas])
    Vf_g = np.array([rtm_Vf(e, A=A_good) for e in etas])
    w_b = np.array([rtm_w(e, A=A_bad) for e in etas])
    h_b = np.array([rtm_h(e, A=A_bad) for e in etas])
    Vw_b = np.array([rtm_Vw(e, A=A_bad) for e in etas])
    Vf_b = np.array([rtm_Vf(e, A=A_bad) for e in etas])
    # aggregate at s=0.5
    Vw_agg = s * Vw_g + (1 - s) * Vw_b
    Vf_agg = s * Vf_g + (1 - s) * Vf_b

    # print key per-state values at eta=0.5
    print(f"  At eta=0.5:")
    print(f"    Good (A={A_good}): w={rtm_w(0.5, A=A_good):.4f}, h={rtm_h(0.5, A=A_good):.4f}, "
          f"V_w={rtm_Vw(0.5, A=A_good):.4f}, V_f={rtm_Vf(0.5, A=A_good):.4f}")
    print(f"    Bad  (A={A_bad}): w={rtm_w(0.5, A=A_bad):.4f}, h={rtm_h(0.5, A=A_bad):.4f}, "
          f"V_w={rtm_Vw(0.5, A=A_bad):.4f}, V_f={rtm_Vf(0.5, A=A_bad):.4f}")
    print(f"    Aggregate s=0.5: V_w={s*rtm_Vw(0.5, A=A_good)+(1-s)*rtm_Vw(0.5, A=A_bad):.4f}, "
          f"V_f={s*rtm_Vf(0.5, A=A_good)+(1-s)*rtm_Vf(0.5, A=A_bad):.4f}")
    print()

    fig = plt.figure(figsize=(9.0, 4.0))
    gs = GridSpec(1, 2, wspace=0.30, left=0.08, right=0.98, top=0.88, bottom=0.13)

    # ---- Panel A: bargain mechanics per state ----
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    ax.plot(etas, w_g, color=C_EU, lw=2.2,
            label=r'$w_{\rm good}(\eta)$, $A\!=\!2.2$')
    ax.plot(etas, w_b, color=C_US, lw=2.2,
            label=r'$w_{\rm bad}(\eta)$, $A\!=\!1.8$')
    ax.plot(etas, h_g, color=C_EU, lw=2.0, ls='--',
            label=r'$h_{\rm good}(\eta)$')
    ax.plot(etas, h_b, color=C_US, lw=2.0, ls='--',
            label=r'$h_{\rm bad}(\eta)$')
    ax.set_xlabel(r'Worker bargaining weight $\eta$')
    ax.set_title(r'(a) Per-state mechanics: $w\!\uparrow$, $h\!\downarrow$')
    ax.legend(loc='center left', fontsize=7.8)
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1.8)

    # ---- Panel B: distribution per state ----
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax)
    ax.plot(etas, Vw_g, color=C_EU, lw=2.2,
            label=r'$V_w^{\rm good}$ (worker, $A\!=\!2.2$)')
    ax.plot(etas, Vw_b, color=C_US, lw=2.2,
            label=r'$V_w^{\rm bad}$ (worker, $A\!=\!1.8$)')
    ax.plot(etas, Vf_g, color=C_EU, lw=2.0, ls='--',
            label=r'$V_f^{\rm good}$ (firm)')
    ax.plot(etas, Vf_b, color=C_US, lw=2.0, ls='--',
            label=r'$V_f^{\rm bad}$ (firm)')
    ax.set_xlabel(r'$\eta$')
    ax.set_title(r'(b) Per-state distribution: $V_w\!\uparrow$, $V_f\!\downarrow$')
    ax.legend(loc='upper right', fontsize=7.5)
    ax.set_xlim(0, 1)
    ax.axhline(0, color='black', lw=0.4)

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

    # Panel C: h^star vs h^soc -- the misallocation wedge under cultural premium
    ax = fig.add_subplot(gs[0, 2])
    style_axes(ax, gridx=False)
    h_soc_us  = (A - TAU * W_ - THETA_US) / (ALPHA + BETA)
    h_soc_eu  = (A - TAU * W_ - THETA_EU) / (ALPHA + BETA)
    h_firm_v  = (A - W_) / BETA
    countries = ['US ($\\theta=0$)', 'EU ($\\theta=0.156$)']
    h_star_vals = [h_us, h_eu]
    h_soc_vals  = [h_soc_us, h_soc_eu]
    x = np.arange(2)
    width = 0.28
    bars1 = ax.bar(x - width, h_star_vals, width, color=C_WORKER,
                   label=r'$h^{*}$ (worker free)', edgecolor='white', linewidth=0.5)
    bars2 = ax.bar(x,         h_soc_vals,  width, color=C_SOC,
                   label=r'$h^{\rm soc}$ (joint optimum)',
                   edgecolor='white', linewidth=0.5)
    bars3 = ax.bar(x + width, [h_firm_v, h_firm_v], width, color=C_FIRM,
                   label=r'$h^{\rm firm}$ (firm free)',
                   edgecolor='white', linewidth=0.5)
    for i in range(2):
        ax.annotate(f'{h_star_vals[i]:.3f}', (i - width, h_star_vals[i]),
                    xytext=(0, 3), textcoords='offset points',
                    ha='center', fontsize=8)
        ax.annotate(f'{h_soc_vals[i]:.3f}', (i, h_soc_vals[i]),
                    xytext=(0, 3), textcoords='offset points',
                    ha='center', fontsize=8)
        ax.annotate(f'{h_firm_v:.3f}', (i + width, h_firm_v),
                    xytext=(0, 3), textcoords='offset points',
                    ha='center', fontsize=8)
        wedge = h_soc_vals[i] - h_star_vals[i]
        ax.annotate(f'wedge\n$h^{{\\rm soc}}\\!-\\!h^*\\!=\\!{wedge:.3f}$',
                    (i - 0.5 * width, (h_star_vals[i] + h_soc_vals[i]) / 2),
                    xytext=(-30, 0), textcoords='offset points',
                    fontsize=7.5, ha='right', color='gray')
    ax.set_xticks(x)
    ax.set_xticklabels(countries, fontsize=9)
    ax.set_ylabel(r'$h$')
    ax.set_title(r'(c) Cultural premium widens the $h^{\rm soc}\!-\!h^*$ wedge')
    ax.legend(loc='upper right', fontsize=8)
    ax.set_ylim(0, 0.65)

    plt.savefig(OUT_DIR / 'sim_culture.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_culture.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close()
    print("  -> sim_culture.pdf written.")
    print()


# =====================================================================
# 4) Q7 counterfactual decomposition under RTM + leisure-bonus culture
# =====================================================================
# US: theta^US = 0, no union (eta=0). EU: theta^EU = 0.156, eta=0.5.
# Each country's equilibrium is the RTM bargain at its own (theta, eta);
# country-specific theta enters V_w through the leisure-bonus term.
# Welfare is computed under equal weights (W = V_w + V_f); the
# Saez-Stantcheva lambda extension is applied separately in
# make_redistribution().

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
# 4b) §7.2.2 Q7 full counterfactual: 3 channels + social productivity
# =====================================================================
# Adds:
#   - Cap channel (h_cap regulation, Q4 mechanism) as a third on/off switch
#   - Social-productivity correction A^soc(h) = A_0 [1 + eta_phi*(h/h_ref - 1)]
#     bundling Aschauer 1989 (public goods), Trabandt-Uhlig 2011 (capital),
#     Bils-Klenow 2000 (HC), Rachel 2020 / Aghion-Howitt (R&D).
# Generates a 2x2 figure showing:
#   (a) Delta W^soc(eta_phi) sensitivity -- when does EU dominate?
#   (b) eta_phi literature decomposition (Aschauer + capital + HC + R&D)
#   (c) 8-cell (cul x union x cap) counterfactual welfare bars
#   (d) Shapley decomposition into 3 channels
def make_q7_eta_lambda(eta_us_obs=0.15, eta_eu_obs=0.50,
                       lam_planner=0.30, A_=A):
    """
    Q7 (V2 framework): plot eta*(lambda) curve, mark observed
    (eta_US, eta_EU) and the implied lambda^rev, plus the welfare-loss
    wedge under a common-lambda planner.

    Reading A: common lambda = lam_planner. Both countries should sit
    at eta*(lam_planner). Distance to the curve = welfare loss.

    Reading B: each country at its own optimum -> implied lambda^rev
    inverts eta*(lambda).
    """
    print("=== Q7 V2: eta*(lambda) revealed-preference diagnostic ===")

    # Closed-form: x*(lambda) = 0.3*A*(1+lam)/(0.6+1.6*lam) at baseline
    def x_star(lam):
        return 0.3 * A_ * (1 + lam) / (0.6 + 1.6 * lam)

    # Recover eta* from x* using the Nash bargain quadratic
    # 1.1 x^2 - 0.6(2-eta) x + 0.1(1-eta) = 0
    # Solve for eta given x:
    #   eta * (0.6 x - 0.1) = 1.2 x - 1.1 x^2 - 0.1
    def eta_star(lam):
        x = x_star(lam)
        num = 1.2 * x - 1.1 * x ** 2 - 0.1
        den = 0.6 * x - 0.1
        if abs(den) < 1e-9:
            return 0.0
        return max(0.0, min(1.0, num / den))

    # Inverse: given observed eta, solve for implied lambda^rev numerically
    def lam_rev(eta_obs):
        lam_grid = np.linspace(0.0, 1.0, 5001)
        eta_grid = np.array([eta_star(l) for l in lam_grid])
        idx = int(np.argmin(np.abs(eta_grid - eta_obs)))
        return lam_grid[idx]

    lam_us_rev = lam_rev(eta_us_obs)
    lam_eu_rev = lam_rev(eta_eu_obs)

    # Welfare under W^lambda at given eta (single-sector, A=2)
    def W_lambda(eta_, lam):
        Vw = rtm_Vw(eta_, A=A_)
        Vf = rtm_Vf(eta_, A=A_)
        return (1 + lam) * Vw + (1 - lam) * Vf

    # Reading A: common lam_planner. Welfare loss vs optimum at this lambda.
    eta_opt_A = eta_star(lam_planner)
    W_opt_A = W_lambda(eta_opt_A, lam_planner)
    W_us_A = W_lambda(eta_us_obs, lam_planner)
    W_eu_A = W_lambda(eta_eu_obs, lam_planner)
    loss_us_A = W_opt_A - W_us_A
    loss_eu_A = W_opt_A - W_eu_A

    # Reading B: each country at own implied lambda
    W_us_B = W_lambda(eta_us_obs, lam_us_rev)
    W_eu_B = W_lambda(eta_eu_obs, lam_eu_rev)

    print(f"  eta*(lambda=0.30) = {eta_opt_A:.3f}")
    print(f"  US: eta_obs={eta_us_obs}, lambda^rev={lam_us_rev:.3f}, "
          f"W^0.30(obs)={W_us_A:.4f}, W^0.30(opt)={W_opt_A:.4f}, "
          f"loss={loss_us_A:.4f}")
    print(f"  EU: eta_obs={eta_eu_obs}, lambda^rev={lam_eu_rev:.3f}, "
          f"W^0.30(obs)={W_eu_A:.4f}, W^0.30(opt)={W_opt_A:.4f}, "
          f"loss={loss_eu_A:.4f}")

    # ---- Figure ----
    fig = plt.figure(figsize=(11.0, 4.4))
    gs = GridSpec(1, 2, wspace=0.30, left=0.07, right=0.97,
                  top=0.88, bottom=0.16)

    lam_grid = np.linspace(0.0, 1.0, 401)
    eta_grid = np.array([eta_star(l) for l in lam_grid])

    # Panel (a): eta*(lambda) curve with observed points
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    ax.plot(lam_grid, eta_grid, color='#1B1B1B', lw=2.4,
            label=r'$\eta^{*}(\lambda)$ welfare-optimum')
    # mark common-lambda planner point on the curve
    ax.axvline(lam_planner, color=C_SOC, ls=':', lw=1.2, alpha=0.6)
    ax.scatter([lam_planner], [eta_opt_A], color=C_SOC, s=80, zorder=5,
               edgecolor='white', linewidth=0.9,
               label=fr'$\eta^{{*}}(\lambda\!=\!{lam_planner})\!=\!{eta_opt_A:.2f}$')
    # observed points: at their revealed-preference lambda
    ax.scatter([lam_us_rev], [eta_us_obs], color=C_US, s=110, marker='s',
               zorder=6, edgecolor='white', linewidth=1.0,
               label=fr'US obs ($\hat\eta\!=\!{eta_us_obs}$, $\lambda^{{\rm rev}}\!\approx\!{lam_us_rev:.2f}$)')
    ax.scatter([lam_eu_rev], [eta_eu_obs], color=C_EU, s=110, marker='s',
               zorder=6, edgecolor='white', linewidth=1.0,
               label=fr'EU obs ($\hat\eta\!=\!{eta_eu_obs}$, $\lambda^{{\rm rev}}\!\approx\!{lam_eu_rev:.2f}$)')
    # Reading A wedge: vertical lines from observed to curve at lam=0.30
    ax.plot([lam_planner, lam_planner], [eta_us_obs, eta_opt_A],
            color=C_US, lw=1.2, ls='--', alpha=0.7)
    ax.plot([lam_planner, lam_planner], [eta_eu_obs, eta_opt_A],
            color=C_EU, lw=1.2, ls='--', alpha=0.7)
    ax.set_xlabel(r'Fairness premium $\lambda$')
    ax.set_ylabel(r'Optimal worker bargaining weight $\eta^{*}$')
    ax.set_title(r'(a) $\eta^{*}(\lambda)$: revealed vs.\ common-$\lambda$ readings')
    ax.legend(loc='lower right', fontsize=7.8)
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1.05)

    # Panel (b): welfare loss at common lambda=0.30
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax, gridx=False)
    eta_dense = np.linspace(0.0, 1.0, 401)
    Wlam = np.array([W_lambda(e, lam_planner) for e in eta_dense])
    ax.plot(eta_dense, Wlam, color='#1B1B1B', lw=2.4,
            label=fr'$W^{{\lambda\!=\!{lam_planner}}}(\eta)$')
    # mark optimum
    ax.scatter([eta_opt_A], [W_opt_A], color=C_SOC, s=90, zorder=5,
               edgecolor='white', linewidth=0.9,
               label=fr'optimum at $\eta^{{*}}\!=\!{eta_opt_A:.2f}$')
    # mark US, EU
    ax.scatter([eta_us_obs], [W_us_A], color=C_US, s=110, marker='s',
               zorder=6, edgecolor='white', linewidth=1.0,
               label=fr'US: $W\!=\!{W_us_A:.3f}$ (loss $\!-\!{loss_us_A:.3f}$)')
    ax.scatter([eta_eu_obs], [W_eu_A], color=C_EU, s=110, marker='s',
               zorder=6, edgecolor='white', linewidth=1.0,
               label=fr'EU: $W\!=\!{W_eu_A:.3f}$ (loss $\!-\!{loss_eu_A:.3f}$)')
    # vertical loss segments
    ax.plot([eta_us_obs, eta_us_obs], [W_us_A, W_opt_A],
            color=C_US, lw=1.2, ls='--', alpha=0.7)
    ax.plot([eta_eu_obs, eta_eu_obs], [W_eu_A, W_opt_A],
            color=C_EU, lw=1.2, ls='--', alpha=0.7)
    ax.set_xlabel(r'Bargaining weight $\eta$')
    ax.set_ylabel(rf'$W^{{\lambda\!=\!{lam_planner}}}(\eta)$')
    ax.set_title(rf'(b) Reading A welfare loss at common $\lambda\!=\!{lam_planner}$')
    ax.legend(loc='lower center', fontsize=7.8)
    ax.set_xlim(0, 1)

    plt.savefig(OUT_DIR / 'sim_q7_eta_lambda.pdf', bbox_inches='tight',
                pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_q7_eta_lambda.png', bbox_inches='tight',
                pad_inches=0.05, dpi=200)
    plt.close()
    print("  -> sim_q7_eta_lambda.pdf written.")
    print()
    return {
        'eta_opt_A': eta_opt_A, 'W_opt_A': W_opt_A,
        'lam_us_rev': lam_us_rev, 'lam_eu_rev': lam_eu_rev,
        'loss_us_A': loss_us_A, 'loss_eu_A': loss_eu_A,
    }


def make_q7_lambda_s(delta=0.2, A_pre=2.0, eta_baseline=0.5):
    """
    Q7 figure (1x2) consolidating the lambda- and s-dependence dropped
    from Q5 (former §5.3 panel-d and former §5.5 sim_aggregation).
      (a) Aggregate W^lambda(eta, s=0.5) for lambda in {0, 0.30, 0.50, 1};
          peaks at eta*(lambda) marked.
      (b) Rigidity cost (Flex-Rigid) as a function of sector share s
          under lambda=0 (equal weights) vs lambda=0.30 (realistic).
    """
    print("=== Q7 lambda-s sensitivity (sim_q7_lambda_s) ===")
    A_good = A_pre + delta
    A_bad  = A_pre - delta

    # ---- Panel (a) data: W^lambda(eta) at s=0.5 ----
    etas = np.linspace(0.0, 1.0, 401)
    Vw_g = np.array([rtm_Vw(e, A=A_good) for e in etas])
    Vf_g = np.array([rtm_Vf(e, A=A_good) for e in etas])
    Vw_b = np.array([rtm_Vw(e, A=A_bad)  for e in etas])
    Vf_b = np.array([rtm_Vf(e, A=A_bad)  for e in etas])
    Vw_agg = 0.5 * Vw_g + 0.5 * Vw_b
    Vf_agg = 0.5 * Vf_g + 0.5 * Vf_b

    # ---- Panel (b) data: rigidity cost over s under two lambdas ----
    w_pre = rtm_w(eta_baseline, A=A_pre)
    # flexible: each sector renegotiates RTM at new A_j
    _, _, Vw_g_fl, Vf_g_fl, _ = rtm_country(eta_baseline, 0.0, A_=A_good)
    _, _, Vw_b_fl, Vf_b_fl, _ = rtm_country(eta_baseline, 0.0, A_=A_bad)
    # rigid: bad sector wage stuck at w_pre
    h_b_rg = (A_bad - w_pre) / BETA
    Vw_b_rg = (1 - TAU) * w_pre * h_b_rg - 0.5 * ALPHA * h_b_rg ** 2
    Vf_b_rg = A_bad * h_b_rg - 0.5 * BETA * h_b_rg ** 2 - w_pre * h_b_rg
    # good sector identical under flex / rigid
    Vw_g_rg, Vf_g_rg = Vw_g_fl, Vf_g_fl

    s_grid = np.linspace(0.0, 1.0, 200)
    def cost_at(lam):
        Wfl_g = (1 + lam) * Vw_g_fl + (1 - lam) * Vf_g_fl
        Wfl_b = (1 + lam) * Vw_b_fl + (1 - lam) * Vf_b_fl
        Wrg_g = (1 + lam) * Vw_g_rg + (1 - lam) * Vf_g_rg
        Wrg_b = (1 + lam) * Vw_b_rg + (1 - lam) * Vf_b_rg
        Wfl = s_grid * Wfl_g + (1 - s_grid) * Wfl_b
        Wrg = s_grid * Wrg_g + (1 - s_grid) * Wrg_b
        return Wfl - Wrg

    cost_lam0    = cost_at(0.00)
    cost_lam_30  = cost_at(0.30)

    print(f"  Rigidity cost at s=0: lambda=0 -> {cost_lam0[0]:+.4f}, "
          f"lambda=0.30 -> {cost_lam_30[0]:+.4f}")
    print(f"  Rigidity cost at s=1: lambda=0 -> {cost_lam0[-1]:+.4f}, "
          f"lambda=0.30 -> {cost_lam_30[-1]:+.4f}")

    # ---- Figure ----
    fig = plt.figure(figsize=(11.0, 4.2))
    gs = GridSpec(1, 2, wspace=0.30, left=0.07, right=0.97,
                  top=0.88, bottom=0.16)

    # Panel (a): W^lambda(eta) with peaks
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    lambdas = [0.00, 0.30, 0.50, 1.00]
    colors_l = ['#1B1B1B', C_SOC, C_FIRM, C_OVER]
    labels_l = [r'$\lambda=0$ (equal)',
                r'$\lambda=0.30$ \textbf{(realistic)}',
                r'$\lambda=0.50$',
                r'$\lambda=1$ (Rawlsian)']
    for lam, col, lab in zip(lambdas, colors_l, labels_l):
        Wlam_agg = (1 + lam) * Vw_agg + (1 - lam) * Vf_agg
        lw = 2.6 if lam == 0.30 else 1.8
        ax.plot(etas, Wlam_agg, color=col, lw=lw, label=lab)
        idx = int(np.argmax(Wlam_agg))
        ax.scatter([etas[idx]], [Wlam_agg[idx]], color=col, s=52,
                   edgecolor='white', linewidth=0.8, zorder=5)
    ax.set_xlabel(r'Worker bargaining weight $\eta$')
    ax.set_ylabel(r'$\bar W^{\lambda}(\eta, s\!=\!0.5)$')
    ax.set_title(r'(a) Aggregate welfare: $\eta^{*}(\lambda\!=\!0.30)\!\approx\!0.58$')
    ax.legend(loc='lower left', fontsize=7.8)
    ax.set_xlim(0, 1)

    # Panel (b): rigidity cost vs s under two lambdas
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax)
    ax.plot(s_grid, cost_lam0,   color='#1B1B1B', lw=2.0,
            label=r'$\lambda=0$ (equal)')
    ax.plot(s_grid, cost_lam_30, color=C_SOC, lw=2.6,
            label=r'$\lambda=0.30$ \textbf{(realistic)}')
    ax.fill_between(s_grid, 0, cost_lam0,   color='#1B1B1B', alpha=0.06)
    ax.fill_between(s_grid, 0, cost_lam_30, color=C_SOC, alpha=0.16)
    ax.axhline(0, color='black', lw=0.5)
    ax.set_xlabel(r'Share of good sector $s$')
    ax.set_ylabel(r'Rigidity cost $\bar W^{\lambda}_{\rm flex}-\bar W^{\lambda}_{\rm rigid}$')
    ax.set_title(r'(b) $\lambda\!=\!0.30$ shrinks rigidity cost $\sim\!4\times$ at $s\!=\!0$')
    ax.legend(loc='upper right', fontsize=8.5)
    ax.set_xlim(0, 1)

    plt.savefig(OUT_DIR / 'sim_q7_lambda_s.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_q7_lambda_s.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close()
    print("  -> sim_q7_lambda_s.pdf written.")
    print()


def make_q7_full(eta_phi=0.40, h_cap=0.40, theta_eu=THETA_EU, eta_eu=0.5):
    print("=== Q7 full: 3-channel counterfactual + social productivity ===")
    print(f"  Calibration: eta_phi={eta_phi}, h_cap={h_cap}, theta^EU={theta_eu}")

    def cell(theta_c, eta_w, cap_on):
        w_b, h_b, _, _, _ = rtm_country(eta_w, theta_c)
        if cap_on and h_b > h_cap:
            h_eq = h_cap
            cap_binds = True
        else:
            h_eq = h_b
            cap_binds = False
        Vw = (1 - TAU) * w_b * h_eq - 0.5 * ALPHA * h_eq * h_eq + theta_c * (1 - h_eq)
        Vf = A * h_eq - 0.5 * BETA * h_eq * h_eq - w_b * h_eq
        W = Vw + Vf
        return {'theta': theta_c, 'eta_w': eta_w, 'cap_on': cap_on,
                'w': w_b, 'h': h_eq, 'h_unc': h_b,
                'Vw': Vw, 'Vf': Vf, 'W': W, 'cap_binds': cap_binds}

    # Build 8 cells indexed by (cul, un, cap) in {0,1}^3
    grid = {}
    for cul in (0, 1):
        for un in (0, 1):
            for cap in (0, 1):
                grid[(cul, un, cap)] = cell(theta_eu if cul else 0.0,
                                            eta_eu if un else 0.0,
                                            bool(cap))

    us = grid[(0, 0, 0)]
    eu_full = grid[(1, 1, 1)]
    h_ref = us['h']

    # Social-productivity boost: V_f gets (A^soc - A_0)*h = A_0*eta_phi*(h/h_ref-1)*h
    def soc(h_eq, ep):
        return A * ep * (h_eq / h_ref - 1.0) * h_eq

    for c in grid.values():
        c['soc'] = soc(c['h'], eta_phi)
        c['W_soc'] = c['W'] + c['soc']

    # Print all 8 cells
    for key, c in sorted(grid.items()):
        tag = ('cul' if key[0] else 'no-cul') + ',' + \
              ('un'  if key[1] else 'no-un')  + ',' + \
              ('cap' if key[2] else 'no-cap')
        print(f"  {tag:<22}: h={c['h']:.3f} (unc={c['h_unc']:.3f}, "
              f"binds={c['cap_binds']}), W={c['W']:.4f}, "
              f"soc={c['soc']:+.4f}, W_soc={c['W_soc']:.4f}")

    # Shapley over 3 channels (culture, union, cap)
    from itertools import permutations
    sh = {'culture': 0.0, 'union': 0.0, 'cap': 0.0}
    for perm in permutations(['culture', 'union', 'cap']):
        state = [0, 0, 0]
        prev = grid[tuple(state)]['W_soc']
        for ch in perm:
            idx = {'culture': 0, 'union': 1, 'cap': 2}[ch]
            state[idx] = 1
            new = grid[tuple(state)]['W_soc']
            sh[ch] += (new - prev)
            prev = new
    for k in sh:
        sh[k] /= 6
    delta_total = eu_full['W_soc'] - us['W_soc']
    print(f"  Shapley culture = {sh['culture']:+.4f}")
    print(f"  Shapley union   = {sh['union']:+.4f}")
    print(f"  Shapley cap     = {sh['cap']:+.4f}")
    print(f"  Sum             = {sum(sh.values()):+.4f} (should equal {delta_total:+.4f})")
    print()

    # eta_phi sensitivity for three trajectories vs US base (W_soc difference)
    eta_grid = np.linspace(0.0, 1.0, 200)
    def trajectory(target_cell):
        c = target_cell
        out = []
        for ep in eta_grid:
            W_soc_target = c['W'] + soc(c['h'], ep)
            W_soc_us = us['W'] + soc(us['h'], ep)  # always 0
            out.append(W_soc_target - W_soc_us)
        return np.array(out)

    t_cul   = trajectory(grid[(1, 0, 0)])  # +culture only
    t_culun = trajectory(grid[(1, 1, 0)])  # +cul +union
    t_full  = trajectory(grid[(1, 1, 1)])  # full EU

    # Figure
    fig = plt.figure(figsize=(11.0, 8.6))
    gs = GridSpec(2, 2, wspace=0.28, hspace=0.46,
                  left=0.07, right=0.98, top=0.94, bottom=0.07)

    # Panel (a) — eta_phi sensitivity
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    ax.plot(eta_grid, t_cul,   color=C_EU,     lw=2.4, label='+culture only')
    ax.plot(eta_grid, t_culun, color=C_WORKER, lw=2.0, label='+culture +union')
    ax.plot(eta_grid, t_full,  color=C_OVER,   lw=2.4, label='EU full (cul+un+cap)')
    ax.axhline(0, color='black', lw=0.5)
    ax.axvline(eta_phi, color=C_NEUT, ls=':', lw=1.0)
    ax.annotate(fr'central $\eta_\phi={eta_phi}$',
                (eta_phi, 0.015), xytext=(4, 0),
                textcoords='offset points', fontsize=8, color=C_NEUT)
    # mark sign-flip thresholds
    for traj, col in [(t_cul, C_EU), (t_culun, C_WORKER), (t_full, C_OVER)]:
        # find first crossing of zero
        signs = np.sign(traj)
        crossings = np.where(np.diff(signs) != 0)[0]
        if len(crossings) > 0:
            i = crossings[0]
            x0 = eta_grid[i] - traj[i] * (eta_grid[i+1] - eta_grid[i]) / (traj[i+1] - traj[i])
            ax.scatter([x0], [0], color=col, s=70, zorder=5,
                       edgecolor='white', linewidth=0.9)
    ax.set_xlabel(r'Social-productivity elasticity $\eta_\phi$')
    ax.set_ylabel(r'$\Delta W^{\rm soc}$ (cell $-$ US base)')
    ax.set_title(r'(a) When does the EU still welfare-dominate? $\Delta W^{\rm soc}(\eta_\phi)$')
    ax.legend(loc='lower left', fontsize=7.8)
    ax.set_xlim(0, 1)

    # Panel (b) — eta_phi decomposition
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax, gridx=False)
    sub_chans = ['Public goods\n(Aschauer 89,\nBarro 90)',
                 'Capital\n(Trabandt-\nUhlig 11)',
                 'On-job HC\n(Bils-Klenow 00)',
                 'R\\&D / TFP\n(Rachel 20,\nAghion-Howitt)',
                 r'\textbf{Total $\eta_\phi$}']
    sub_vals = [0.20, 0.10, 0.05, 0.05, 0.40]
    sub_cols = [C_SOC, C_WORKER, C_FIRM, C_OVER, '#1B1B1B']
    ax.bar(np.arange(5), sub_vals, color=sub_cols,
           edgecolor='white', linewidth=0.6, width=0.65)
    for i, v in enumerate(sub_vals):
        ax.annotate(f'{v:.2f}', (i, v), xytext=(0, 4),
                    textcoords='offset points', ha='center',
                    fontsize=9, fontweight='bold' if i == 4 else 'normal')
    ax.set_xticks(np.arange(5))
    ax.set_xticklabels(sub_chans, fontsize=7.5)
    ax.set_ylabel(r'Elasticity contribution')
    ax.set_title(r'(b) $\eta_\phi$ decomposition (literature-anchored)')
    ax.set_ylim(0, 0.5)

    # Panel (c) — 8-cell counterfactual
    ax = fig.add_subplot(gs[1, 0])
    style_axes(ax, gridx=False)
    order = [(0,0,0), (0,0,1), (0,1,0), (0,1,1),
             (1,0,0), (1,0,1), (1,1,0), (1,1,1)]
    Ws = [grid[k]['W_soc'] for k in order]
    short = ['US\nbase', '+cap', '+un', '+un\n+cap',
             '+cul', '+cul\n+cap', '+cul\n+un', 'EU\nfull']
    cols_8 = []
    for k in order:
        n = sum(k)
        cols_8.append([C_US, C_NEUT, C_WORKER, C_EU][min(n, 3)])
    ax.bar(np.arange(8), Ws, color=cols_8,
           edgecolor='white', linewidth=0.5, width=0.65)
    for i, w_ in enumerate(Ws):
        ax.annotate(f'{w_:.3f}', (i, w_), xytext=(0, 4),
                    textcoords='offset points', ha='center', fontsize=7.5)
    ax.set_xticks(np.arange(8))
    ax.set_xticklabels(short, fontsize=7.5)
    ax.set_ylabel(r'$W^{\rm soc}$')
    ax.set_title(rf'(c) 8-cell counterfactual at $\eta_\phi\!=\!{eta_phi}$, '
                 rf'$\bar h\!=\!{h_cap}$')
    pad = 0.02 * (max(Ws) - min(Ws) + 0.01)
    ax.set_ylim(min(Ws) - 4*pad, max(Ws) + 6*pad)

    # Panel (d) — Shapley decomposition
    ax = fig.add_subplot(gs[1, 1])
    style_axes(ax, gridx=False)
    sh_keys = ['culture', 'union', 'cap']
    sh_vals = [sh[k] for k in sh_keys]
    sh_cols = [C_EU, C_WORKER, C_OVER]
    sh_labs = [r'Culture $\theta^c$', r'Union $\eta_w$', r'Cap $\bar h$']
    ax.bar(np.arange(3), sh_vals, color=sh_cols,
           edgecolor='white', linewidth=0.5, width=0.55)
    for i, v in enumerate(sh_vals):
        ax.annotate(f'${v:+.4f}$', (i, v),
                    xytext=(0, 6 if v >= 0 else -14),
                    textcoords='offset points', ha='center',
                    fontsize=10, fontweight='bold')
    ax.axhline(0, color='black', lw=0.6)
    ax.axhline(delta_total, color=C_TOTAL, ls=':', lw=1.0,
               label=fr'Total $\Delta W^{{\rm soc}}\!=\!{delta_total:+.4f}$')
    ax.set_xticks(np.arange(3))
    ax.set_xticklabels(sh_labs, fontsize=9)
    ax.set_ylabel(r'Shapley contribution')
    ax.set_title(r'(d) Shapley channels: culture / union / cap')
    ax.legend(loc='best', fontsize=8)

    plt.savefig(OUT_DIR / 'sim_q7_full.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_q7_full.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close()
    print("  -> sim_q7_full.pdf written.")
    print()

    return {
        'eta_phi': eta_phi, 'h_cap': h_cap,
        'delta_total': delta_total, 'sh': sh,
        'grid': grid,
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
    """
    §7.6 Q7-specific Saez-Stantcheva sensitivity figure.
    Two panels (the Q5 criterion-dependent welfare panel moved to make_rtm()):
      (a) eta*(lambda) -- the welfare-maximising bargaining strength as
          a function of the redistribution premium
      (b) Q7 EU-US gap and Shapley channel decomposition (culture, union)
          as a function of lambda
    """
    print("=== §7.6 Q7 sensitivity under generalised welfare weights ===")

    etas = np.linspace(0.0, 1.0, 401)
    Vw_arr = np.array([rtm_Vw(e) for e in etas])
    Vf_arr = np.array([rtm_Vf(e) for e in etas])
    lam_grid = np.linspace(0.0, 1.0, 401)

    fig = plt.figure(figsize=(11.0, 4.2))
    gs = GridSpec(1, 2, wspace=0.30, left=0.07, right=0.97, top=0.88, bottom=0.14)

    # ---- Panel (a) -- eta*(lambda) ----
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    eta_grid = []
    for lam in lam_grid:
        Wlam = (1 + lam) * Vw_arr + (1 - lam) * Vf_arr
        eta_grid.append(etas[int(np.argmax(Wlam))])
    eta_grid = np.array(eta_grid)
    ax.plot(lam_grid, eta_grid, color=C_TOTAL, lw=2.4,
            label=r'$\eta^{*}(\lambda)$')
    ax.axvline(0.30, color=C_SOC, ls=':', lw=1.2,
               label=r'realistic $\lambda=0.30$')
    idx30 = int(np.argmin(np.abs(lam_grid - 0.30)))
    ax.scatter([0.30], [eta_grid[idx30]], color=C_SOC, s=80,
               edgecolor='white', linewidth=0.8, zorder=5)
    ax.annotate(f'$\\eta^*\\!\\approx\\!{eta_grid[idx30]:.2f}$',
                (0.30, eta_grid[idx30]), xytext=(10, -18),
                textcoords='offset points', fontsize=10, color=C_SOC)
    ax.set_xlabel(r'Redistribution premium $\lambda$')
    ax.set_ylabel(r'Welfare-maximising $\eta^{*}$')
    ax.set_title(r'(a) Optimum union strength as $\lambda$ rises')
    ax.legend(loc='lower right', fontsize=9)
    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1)

    # ---- Panel (b) -- Q7 ΔW^λ + Shapley decomposition ----
    ax = fig.add_subplot(gs[0, 1])
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
    ax.set_xlabel(r'Redistribution premium $\lambda$')
    ax.set_ylabel(r'EU--US welfare gap (sim.\ units)')
    ax.set_title(r'(b) Q7 channel decomposition under $W^{\lambda}$')
    ax.legend(loc='upper left', fontsize=9)
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

    # ---- Figure: 1x3 panels ----
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
# 7) §5.6 Aggregation across sector shares
# =====================================================================
# Aggregate hours and welfare as a function of the share s of the good
# sector. For each regime (free market / flexible / rigid):
#   bar_X(s) = s * X_good + (1-s) * X_bad
# This isolates how the "rigidity cost" depends on sector composition.

def make_aggregation(delta=0.2, eta_baseline=0.5, A_pre=2.0):
    print("=== §5.6 Aggregation across sector shares ===")

    A_good = A_pre + delta
    A_bad  = A_pre - delta
    w_pre  = rtm_w(eta_baseline, A=A_pre)

    # Free market: eta=0 (firm-power) at each state's new A
    w_g_fm, h_g_fm, Vw_g_fm, Vf_g_fm, W_g_fm = rtm_country(0.0, 0.0, A_=A_good)
    w_b_fm, h_b_fm, Vw_b_fm, Vf_b_fm, W_b_fm = rtm_country(0.0, 0.0, A_=A_bad)

    # Flexible bargain: eta=eta_baseline
    w_g_fl, h_g_fl, Vw_g_fl, Vf_g_fl, W_g_fl = rtm_country(eta_baseline, 0.0, A_=A_good)
    w_b_fl, h_b_fl, Vw_b_fl, Vf_b_fl, W_b_fl = rtm_country(eta_baseline, 0.0, A_=A_bad)

    # Rigid: good = flex; bad = wage stuck at w_pre
    h_b_rg = (A_bad - w_pre) / BETA
    Vw_b_rg = (1 - TAU) * w_pre * h_b_rg - 0.5 * ALPHA * h_b_rg ** 2
    Vf_b_rg = A_bad * h_b_rg - 0.5 * BETA * h_b_rg ** 2 - w_pre * h_b_rg
    W_b_rg = Vw_b_rg + Vf_b_rg

    s = np.linspace(0.0, 1.0, 200)

    # Aggregate hours
    h_agg_fm = s * h_g_fm + (1 - s) * h_b_fm
    h_agg_fl = s * h_g_fl + (1 - s) * h_b_fl
    h_agg_rg = s * h_g_fl + (1 - s) * h_b_rg

    # Aggregate welfare
    W_agg_fm = s * W_g_fm + (1 - s) * W_b_fm
    W_agg_fl = s * W_g_fl + (1 - s) * W_b_fl
    W_agg_rg = s * W_g_fl + (1 - s) * W_b_rg

    # Welfare costs (decompositions)
    cost_rigid     = W_agg_fl - W_agg_rg   # rigidity vs flex
    cost_unionised = W_agg_fm - W_agg_fl   # flex vs free market
    cost_total     = W_agg_fm - W_agg_rg   # rigidity + unionisation

    print(f"  At s=0.5 (equal mix):")
    print(f"    h_agg:  FM={s.mean()*h_g_fm + (1-s.mean())*h_b_fm:.4f}, "
          f"flex={s.mean()*h_g_fl + (1-s.mean())*h_b_fl:.4f}, "
          f"rigid={s.mean()*h_g_fl + (1-s.mean())*h_b_rg:.4f}")
    i_half = int(len(s) / 2)
    print(f"    W_agg:  FM={W_agg_fm[i_half]:.4f}, flex={W_agg_fl[i_half]:.4f}, "
          f"rigid={W_agg_rg[i_half]:.4f}")
    print(f"  Rigidity cost (flex-rigid) at s=0: {cost_rigid[0]:+.4f}, "
          f"at s=1: {cost_rigid[-1]:+.4f}")
    print(f"  Total cost (FM-rigid)      at s=0: {cost_total[0]:+.4f}, "
          f"at s=1: {cost_total[-1]:+.4f}")
    print()

    fig = plt.figure(figsize=(13.2, 4.0))
    gs = GridSpec(1, 3, wspace=0.32, left=0.06, right=0.98, top=0.88, bottom=0.13)

    # ---- Panel A: aggregate hours ----
    ax = fig.add_subplot(gs[0, 0])
    style_axes(ax)
    ax.plot(s, h_agg_fm, color=C_NEUT, lw=2.0, ls='--', label='Free market')
    ax.plot(s, h_agg_fl, color=C_WORKER, lw=2.0, label='Flexible union')
    ax.plot(s, h_agg_rg, color=C_OVER, lw=2.4, label='Rigid union')
    ax.set_xlabel(r'Share of good sector $s$')
    ax.set_ylabel(r'Aggregate hours $\bar h(s)$')
    ax.set_title('(a) Aggregate hours by composition')
    ax.legend(loc='upper left', fontsize=8.5)
    ax.set_xlim(0, 1)

    # ---- Panel B: aggregate welfare ----
    ax = fig.add_subplot(gs[0, 1])
    style_axes(ax)
    ax.plot(s, W_agg_fm, color=C_NEUT, lw=2.0, ls='--', label='Free market')
    ax.plot(s, W_agg_fl, color=C_WORKER, lw=2.0, label='Flexible union')
    ax.plot(s, W_agg_rg, color=C_OVER, lw=2.4, label='Rigid union')
    ax.set_xlabel(r'Share of good sector $s$')
    ax.set_ylabel(r'Aggregate welfare $\bar W(s)$')
    ax.set_title('(b) Aggregate welfare by composition')
    ax.legend(loc='upper left', fontsize=8.5)
    ax.set_xlim(0, 1)

    # ---- Panel C: welfare cost decomposition ----
    ax = fig.add_subplot(gs[0, 2])
    style_axes(ax)
    ax.plot(s, cost_rigid,     color=C_OVER, lw=2.4,
            label=r'Rigidity cost (Flex$-$Rigid)')
    ax.plot(s, cost_unionised, color=C_WORKER, lw=2.0,
            label=r'Unionisation cost (FM$-$Flex)')
    ax.plot(s, cost_total,     color=C_TOTAL, lw=2.0, ls=':',
            label=r'Total cost (FM$-$Rigid)')
    ax.fill_between(s, 0, cost_rigid, color=C_OVER, alpha=0.12)
    ax.set_xlabel(r'Share of good sector $s$')
    ax.set_ylabel(r'Welfare cost vs benchmark')
    ax.set_title(r'(c) Rigidity cost concentrated at low $s$')
    ax.legend(loc='upper right', fontsize=8.5)
    ax.set_xlim(0, 1)
    ax.axhline(0, color='black', lw=0.4)

    plt.savefig(OUT_DIR / 'sim_aggregation.pdf', bbox_inches='tight', pad_inches=0.05)
    plt.savefig(OUT_DIR / 'sim_aggregation.png', bbox_inches='tight', pad_inches=0.05, dpi=200)
    plt.close()
    print("  -> sim_aggregation.pdf written.")
    print()


# =====================================================================
# Main
# =====================================================================
if __name__ == '__main__':
    make_decomposition()
    make_rtm()
    make_culture()
    res = make_q7_v2()
    res_full = make_q7_full()
    make_q7_lambda_s()
    make_q7_eta_lambda()
    res_l = make_redistribution()
    res_s = make_shocks()
    make_aggregation()
    print("=== Summary ===")
    print(f"  Q7 net welfare gap  : {res['W_eu'] - res['W_us']:+.4f}")
    print(f"  Q7 Shapley culture  : {res['sh_culture']:+.4f}")
    print(f"  Q7 Shapley union    : {res['sh_union']:+.4f}")
    idx30 = int(np.argmin(np.abs(res_l['lam_grid'] - 0.30)))
    print(f"  λ=0.30 ΔW           : {res_l['delta_W'][idx30]:+.4f}")
    print(f"  λ=0.30 η*           : {res_l['eta_star'][idx30]:.3f}")
