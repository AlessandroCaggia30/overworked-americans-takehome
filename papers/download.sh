#!/usr/bin/env bash
# Bulk-download PDFs of references cited in problem1.tex.
# Sources: NBER WPs, Federal Reserve Bank archives, author pages.
# Run: bash download.sh
# Re-runs are safe (skips files already present).

set -u
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

fetch() {
  local out="$1"; local url="$2"
  if [[ -s "$out" ]]; then echo "[skip] $out"; return; fi
  echo "[get ] $out  <-  $url"
  curl -sSL -A "Mozilla/5.0" -o "$out.tmp" "$url" && \
    [[ -s "$out.tmp" ]] && mv "$out.tmp" "$out" || rm -f "$out.tmp"
}

# === Q1: Documenting the gap ============================================
fetch "prescott_2004_FRBM.pdf"            "https://www.minneapolisfed.org/research/qr/qr2811.pdf"
fetch "ohanian_raffo_rogerson_2008_NBER12786.pdf" "https://www.nber.org/system/files/working_papers/w12786/w12786.pdf"
fetch "bick_brueggemann_fuchs_2019_NBER25826.pdf" "https://www.nber.org/system/files/working_papers/w25826/w25826.pdf"
fetch "kleven_landais_posch_steinhauer_zweimuller_2019_NBER25524.pdf" "https://www.nber.org/system/files/working_papers/w25524/w25524.pdf"
fetch "aguiar_hurst_2007_NBER11895.pdf"   "https://www.nber.org/system/files/working_papers/w11895/w11895.pdf"
fetch "gruber_wise_1999_NBER6134.pdf"     "https://www.nber.org/system/files/working_papers/w6134/w6134.pdf"
fetch "boppart_krusell_2020_NBER22215.pdf" "https://www.nber.org/system/files/working_papers/w22215/w22215.pdf"
fetch "blanchard_wolfers_2000_NBER7282.pdf" "https://www.nber.org/system/files/working_papers/w7282/w7282.pdf"
fetch "burda_hamermesh_weil_2013_NBER13000.pdf" "https://www.nber.org/system/files/working_papers/w13000/w13000.pdf"

# === Q2: Tax wedge & labour supply ======================================
fetch "rogerson_2006_NBER12230.pdf"       "https://www.nber.org/system/files/working_papers/w12230/w12230.pdf"
fetch "bick_fuchs_2018_NBER22255.pdf"     "https://www.nber.org/system/files/working_papers/w22255/w22255.pdf"

# === Q3: Aggregation, indivisibility, lotteries =========================
fetch "chetty_guren_manoli_weber_2011_NBER16729.pdf" "https://www.nber.org/system/files/working_papers/w16729/w16729.pdf"
fetch "rogerson_2008_NBER12889_JPE.pdf"   "https://www.nber.org/system/files/working_papers/w12889/w12889.pdf"
fetch "rogerson_wallenius_2009_NBER13017.pdf" "https://www.nber.org/system/files/working_papers/w13017/w13017.pdf"
fetch "prescott_rogerson_wallenius_2009_NBER15179.pdf" "https://www.nber.org/system/files/working_papers/w15179/w15179.pdf"
fetch "chang_kim_2006_RichmondFed.pdf"    "https://www.richmondfed.org/-/media/RichmondFedOrg/publications/research/working_papers/2005/pdf/wp05-9.pdf"
fetch "krueger_mueller_2016_NBER22025.pdf" "https://www.nber.org/system/files/working_papers/w22025/w22025.pdf"
fetch "freeman_schettkat_2005_NBER10876.pdf" "https://www.nber.org/system/files/working_papers/w10876/w10876.pdf"
fetch "krusell_mukoyama_rogerson_sahin_2017_RED.pdf" "https://www.nber.org/system/files/working_papers/w15453/w15453.pdf"

# === Q4: Hours regulation, monopsony =====================================
fetch "crepon_kramarz_2002_NBER8987.pdf"  "https://www.nber.org/system/files/working_papers/w8987/w8987.pdf"

# === Q5: Unions, sectoral shifts, unemployment ==========================
fetch "card_lemieux_riddell_2004_NBER9473.pdf" "https://www.nber.org/system/files/working_papers/w9473/w9473.pdf"
fetch "ljungqvist_sargent_1998_NBER6262.pdf"   "https://www.nber.org/system/files/working_papers/w6262/w6262.pdf"

# === Q6: Divorce, female labour supply ==================================
fetch "stevenson_wolfers_2006_QJE_NBER12944.pdf" "https://www.nber.org/system/files/working_papers/w12944/w12944.pdf"
fetch "voena_2015_AER_NBER17367.pdf"      "https://www.nber.org/system/files/working_papers/w17367/w17367.pdf"
fetch "fernandez_fogli_2009_NBER13373.pdf" "https://www.nber.org/system/files/working_papers/w13373/w13373.pdf"
fetch "olivetti_petrongolo_2017_NBER22301.pdf" "https://www.nber.org/system/files/working_papers/w22301/w22301.pdf"

# === Q7: Welfare, insurance, mortality, SWB =============================
fetch "heathcote_storesletten_violante_2014_NBER19268.pdf" "https://www.nber.org/system/files/working_papers/w19268/w19268.pdf"
fetch "heathcote_storesletten_violante_2017_QJE_NBER19899.pdf" "https://www.nber.org/system/files/working_papers/w19899/w19899.pdf"
fetch "heathcote_perri_violante_2010_NBER15483.pdf" "https://www.nber.org/system/files/working_papers/w15483/w15483.pdf"
fetch "jones_klenow_2016_AER_NBER16352.pdf" "https://www.nber.org/system/files/working_papers/w16352/w16352.pdf"
fetch "hall_jones_2007_QJE_NBER10737.pdf"  "https://www.nber.org/system/files/working_papers/w10737/w10737.pdf"
fetch "becker_philipson_soares_2005_AER_NBER9765.pdf" "https://www.nber.org/system/files/working_papers/w9765/w9765.pdf"
fetch "stevenson_wolfers_2008_Brookings_NBER14282.pdf" "https://www.nber.org/system/files/working_papers/w14282/w14282.pdf"
fetch "alesina_glaeser_sacerdote_2005_NBER11278.pdf" "https://www.nber.org/system/files/working_papers/w11278/w11278.pdf"
fetch "alesina_glaeser_sacerdote_2001_BPEA.pdf" "https://www.nber.org/system/files/working_papers/w8524/w8524.pdf"
fetch "saez_stantcheva_2016_AER_NBER18835.pdf" "https://www.nber.org/system/files/working_papers/w18835/w18835.pdf"
fetch "piketty_saez_stantcheva_2014_NBER17616.pdf" "https://www.nber.org/system/files/working_papers/w17616/w17616.pdf"

echo
echo "Done. Downloaded files:"
ls -lh *.pdf 2>/dev/null | awk '{print $5, $9}'
