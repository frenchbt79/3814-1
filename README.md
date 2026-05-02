# 3814 N Clark — Bodega Repositioning

Single-file HTML investor / distributor presentation for the East Lakeview Food & Liquor repositioning at 3814 N Clark St, Chicago (one block south of Wrigley Field).

**Owner:** Bradley French · 3814 Clark LLC

---

## View the deck

### On desktop
Open `index.html` in any modern browser (Chrome, Safari, Firefox, Edge).

### On iPhone (via GitHub Pages)
Once pushed to a GitHub repo with Pages enabled:

1. Settings → Pages → Source: `Deploy from branch` → `main` / `/ (root)`
2. GitHub publishes to `https://<username>.github.io/<repo-name>/`
3. Open that URL on iPhone Safari
4. Tap the Share button → "Add to Home Screen" for app-style access

The deck is a single self-contained HTML file (no external assets, fonts, or scripts) so it loads instantly and works offline once cached.

---

## Repo structure

```
3814 Repositioning App/
├── README.md                  ← this file
├── index.html                 ← latest live deck (what GitHub Pages serves)
├── .gitignore
├── docs/                      ← research + audit notes
│   ├── distributor_research.md
│   ├── fixture_audit.md
│   ├── fixture_dims.md
│   └── layout_audit.md
├── archives/                  ← versioned snapshots of the deck
│   ├── README.md
│   └── v34_2026-05-01.html
├── tmp/                       ← local scratch (gitignored)
└── logs/                      ← local logs (gitignored)
```

---

## What's in the deck

- **41+ slides** covering hero / repositioning thesis / market trends
- **Floor plan** with clickable fixtures (D1–D22 cooler doors, F1–F3 freezers, G1–G4 gondolas + endcaps, S1–S7 wall shelves, OC-1, BC-1)
- **Per-fixture planograms** with BEFORE / AFTER shelf-by-shelf SKU layouts at 18 px/inch fixed scale
- **Master fixture sheet** with EXISTING / REPOSITIONED tabs, color-coded by distributor
- **Inventory tables** with $/unit, facings × stacked × depth, line totals
- **Distributor packets** for the 9 active distributors (CBS, Breakthru, SG, Eby-Brown, Reyes, Lakeshore, KeHE, THC Direct, Red Bull)
- **Financials** — 5-yr historical from tax returns + 36-mo forward projection + 5-yr future P&L
- **Wrigley 2026 calendar** — concert + game demand engine
- **Ancillary revenue stack** — ATM, lottery, parking sublet, late-night extension, THC bev

317 SKUs across 9 distributors · $65,969 total inventory · 41 slides

---

## Active workstreams

- SKUDB updates per 2026 trend research
- Floor plan accuracy vs architect's plan (3814northclarkPlans)
- Distributor packets
- Liquor license filing prep (Class B, City of Chicago)

---

## Versioning

Every meaningful revision should be archived to `archives/` before continuing edits. See `archives/README.md` for the naming convention.

The `_v34` suffix on the latest archive corresponds to the in-progress version number — increment when shipping a new revision.

---

## Tech notes

- 100% vanilla HTML / CSS / JavaScript — no build step, no dependencies
- Renders at 1500px max-width with responsive shelves (horizontal scroll inside cooler frames at narrow viewports)
- Mobile viewport meta tag is set; tested for iPhone Safari readability
- All fixture dimensions baked into the JS data structures (no external config)

---

## Liquor license filing notes

- Bradley resides at 3814 N Clark, Apt 2 — same building as the liquor store, so LCP affidavit not required
- Bradley is single — skip Spousal Affidavit (SPA) on all filings
