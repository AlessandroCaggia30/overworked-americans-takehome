"""
Q2 synthesis-model calibration — fully reproducible.

Closed-form synthesis (Cogan 1981 / Heckman 1974 / Chang--Kim 2006):
  Each worker has fixed cost b_i ~ Logistic(mu_b, sigma_b).
  Conditional on participating, intensive choice gives h*(tau) = (1-tau)/(alpha+(1-tau)).
  Threshold: beta(tau) = log(wh*) + alpha*log(1-h*) - log(T_n)
                       = alpha*log(1-h*) - log(T_n_ratio)        [normalising wh*=1]
  Participation: P(tau) = [1 + exp(-(beta(tau)-mu_b)/sigma_b)]^{-1}.

Calibration strategy:
  alpha = 1.32 common (anchored to US h*=0.33 at tau=0.35).
  sigma_b = 0.20 common (a moderate cross-country dispersion baseline).
  T_n_ratio (replacement rate) country-specific from OECD social-protection statistics.
  mu_b is the only country-specific fitted parameter; solved analytically to match
  the OECD 2023 employment rate for each country.

This is just-identified: 1 fitted parameter (mu_b) per country, 1 moment (P_data).
The pattern that emerges (low mu_b for Northern, high for Mediterranean+East) is the
content of the synthesis: it tells us where the institutional fixed-cost dispersion
is concentrated, given the model.
"""
import math

ALPHA = 1.32
SIGMA_B = 0.20
COUNTRIES = [
    # name,     tau,   T_n_ratio,  P_data
    ('US',      0.35,  0.30,       0.7194),  # OECD 2023
    ('Germany', 0.56,  0.50,       0.7710),  # OECD 2023
    ('Sweden',  0.54,  0.55,       0.7731),  # OECD 2023
    ('France',  0.56,  0.50,       0.6846),  # OECD 2023
    ('Italy',   0.55,  0.40,       0.6199),  # OECD 2023
]

def h_star(tau, alpha=ALPHA):
    return (1 - tau) / (alpha + 1 - tau)

def beta_threshold(tau, T_n_ratio, alpha=ALPHA):
    """V^w - V^n at the optimum, normalising wh* = 1."""
    h = h_star(tau, alpha)
    return alpha * math.log(1 - h) - math.log(T_n_ratio)

def fit_mu_b(beta, P_data, sigma_b=SIGMA_B):
    """Solve P_data = 1/(1+exp(-(beta-mu_b)/sigma_b)) for mu_b analytically."""
    if not (0 < P_data < 1):
        raise ValueError(f"P_data must be in (0,1); got {P_data}")
    return beta - sigma_b * math.log(P_data / (1 - P_data))

def participation(beta, mu_b, sigma_b=SIGMA_B):
    return 1.0 / (1.0 + math.exp(-(beta - mu_b) / sigma_b))

# =====================================================================
# Run calibration
# =====================================================================
print("=" * 80)
print("Q2 SYNTHESIS-MODEL CALIBRATION (alpha=1.32, sigma_b=0.20 common)")
print("=" * 80)
print(f"{'Country':10s} {'tau':>5s} {'h*(tau)':>9s} {'T_n/wh*':>8s} {'beta':>7s} {'mu_b':>7s} {'P pred':>7s} {'P data':>7s} {'gap (pp)':>9s}")

for name, tau, T_n, P_data in COUNTRIES:
    h = h_star(tau)
    beta = beta_threshold(tau, T_n)
    mu_b = fit_mu_b(beta, P_data)
    P_pred = participation(beta, mu_b)
    gap_pp = (P_pred - P_data) * 100
    print(f"{name:10s} {tau:>5.2f} {h:>9.4f} {T_n:>8.2f} {beta:>+7.3f} {mu_b:>+7.3f} {P_pred:>7.4f} {P_data:>7.4f} {gap_pp:>+9.4f}")

print()
print("All P_pred match P_data exactly (just-identified, mu_b solves for the OECD employment rate).")
print()

# =====================================================================
# Aggregate hours per adult: H/N = P(tau) * h*(tau)
# =====================================================================
print("Aggregate hours per adult H/N = P(tau) * h*(tau):")
print(f"{'Country':10s} {'h*':>8s} {'P':>8s} {'H/N pred':>10s} {'H/N implied (data)':>18s}")
# H/N "data" implied from OECD: hours/worker (annual) * P
# We use stylised h* in time units (fraction of available time)
for name, tau, T_n, P_data in COUNTRIES:
    h = h_star(tau)
    beta = beta_threshold(tau, T_n)
    mu_b = fit_mu_b(beta, P_data)
    P_pred = participation(beta, mu_b)
    HoverN = P_pred * h
    HoverN_data = P_data * h  # by construction P_pred = P_data so equivalent
    print(f"{name:10s} {h:>8.4f} {P_pred:>8.4f} {HoverN:>10.4f} {HoverN_data:>18.4f}")

# =====================================================================
# Elasticity decomposition at the US point
# =====================================================================
print()
print("Elasticity decomposition at the US point (tau=0.35):")
tau_us = 0.35
h_us = h_star(tau_us)
eps_int = ALPHA / (ALPHA + (1 - tau_us))
print(f"  Intensive Frisch eps^int = alpha/(alpha+(1-tau)) = {ALPHA}/{ALPHA + 1 - tau_us:.2f} = {eps_int:.3f}")
print(f"  (this is the model-implied individual intensive Frisch at US)")
print(f"  CGM 2011 consensus: ~0.30 -- the model's individual intensive elasticity is HIGHER")
print(f"  than the CGM consensus; the model can match aggregate Frisch only because")
print(f"  P also moves with tau, contributing an extensive component to the aggregate response.")
