#!/usr/bin/env python3
"""For each paper: extract abstract + first ~2k chars of intro + key numerical lines."""
import os, re, glob, sys

TXT_DIR = "/Users/Alessandro/Desktop/people/Alessandro/website/my note taking app/Advanced Micro/Exam material/Take_home/papers/txt"
OUT_DIR = "/Users/Alessandro/Desktop/people/Alessandro/website/my note taking app/Advanced Micro/Exam material/Take_home/research/summaries"
os.makedirs(OUT_DIR, exist_ok=True)

# regex catching numerical claim lines
NUM_RE = re.compile(r"(\d{1,4}(?:[.,]\d+)?\s*(?:%|percent|hrs|hours|pp|points|Frisch|elasticity)|Table\s+\d|Figure\s+\d|coefficient|standard error)", re.I)
KEY_RE = re.compile(r"\b(Frisch|elasticity|hours|wedge|tax(?:es)?|labor supply|labour supply|substitution|extensive|intensive|home production|leisure|childcare|child penalty|union|vacation|gender|female|aggregate)\b", re.I)

for txt in sorted(glob.glob(os.path.join(TXT_DIR, "*.txt"))):
    name = os.path.basename(txt).replace(".txt","")
    with open(txt, errors="ignore") as f:
        raw = f.read()
    out = []
    out.append(f"=== {name} ===")
    out.append(f"len_chars={len(raw)}")
    # First 4000 chars (abstract+intro)
    head = raw[:4500]
    out.append("\n--- HEAD (first 4500 chars) ---")
    out.append(head)
    # Try to find conclusion section
    m = re.search(r"\n\s*(?:Conclusion|Concluding Remarks|Discussion|Summary)[\s\S]{0,4500}", raw, re.I)
    if m:
        out.append("\n--- CONCLUSION (≤4500 chars after match) ---")
        out.append(m.group(0)[:4500])
    # Extract numerical-claim lines
    nums = []
    for line in raw.splitlines():
        if NUM_RE.search(line) and KEY_RE.search(line) and 30 < len(line) < 220:
            nums.append(line.strip())
    out.append("\n--- NUMERICAL-CLAIM LINES (filtered) ---")
    out.extend(nums[:60])
    with open(os.path.join(OUT_DIR, name + ".sum"), "w") as f:
        f.write("\n".join(out))

print(f"Wrote summaries to {OUT_DIR}")
