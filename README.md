# 3814 N Clark — Bodega Repositioning

Single-file HTML investor / distributor presentation for the East Lakeview Food & Liquor repositioning at 3814 N Clark St, Chicago (one block south of Wrigley Field).

**Owner:** Bradley French · 3814 Clark LLC

**Current version:** v.260504-r70 · 2026-05-04 (Phase 70 — visual fixes, iPhone polish, GitHub-ready)

---

## View the deck

### On desktop

Open `index.html` in any modern browser (Chrome, Safari, Firefox, Edge).

### On iPhone

Open `iphone.html` directly, or use the desktop deck — it auto-redirects mobile user agents to `iphone.html` so you can land on either URL.

### Via GitHub Pages

Once pushed to a GitHub repo with Pages enabled:

1. Settings → Pages → Source: `Deploy from branch` → `main` / `/ (root)`
2. GitHub publishes to `https://<username>.github.io/<repo-name>/`
3. Open that URL on iPhone Safari — auto-redirects to `iphone.html`
4. Tap the Share button → "Add to Home Screen" for app-style access

Both decks are self-contained single HTML files (no external assets, fonts, or scripts) so they load instantly and work offline once cached.

---

## What's in the deck

- **91 slides** organized in 11 sections: Vision & Thesis · Inventory & Economics · Store Strategy · Cooler Wall (D1–D22) · Freezers · Center Gondolas · Counter & Wall Shelves · Distributor Packets · Building & Construction · Financials · Action
- **Interactive floor plan** with clickable fixtures (D1–D22 cooler doors, F1–F3 freezers, G1–G4 gondolas + endcaps, S1–S7 wall shelves, OC-1, BC-1, ATM)
- **Drag/resize/rotate floor plan editor** with localStorage persistence (Phase 13)
- **Per-fixture planograms** — BEFORE / AFTER shelf-by-shelf SKU layouts at 18 px/inch fixed scale
- **Master fixture sheet** — EXISTING / REPOSITIONED tabs, color-coded by distributor
- **Inventory tables** — $/unit, facings × stacked × depth, line totals, popularity / trend / restock columns
- **Distributor packets** for the 7 active distributors (CBS, Breakthru, Eby-Brown, Reyes, Lakeshore, KeHE, Direct)
- **Schedule A** — items the seller must remove before closing
- **Backstock buy list** — 2-month velocity-capped buy plan for cash conservation
- **Uptown Store reference** — Clark Haus precedent with 429 products categorized + popularity-scored, side-by-side floor-plan study
- **Wrigley 2026 calendar** — concert + game demand engine
- **Ancillary revenue stack** — ATM, lottery, parking sublet, late-night extension, THC bev
- **Financials** — 5-yr historical from tax returns + 36-mo forward projection + 5-yr future P&L

**91 slides · 9 distributors · v.260504-r70**

### New since v37 (Phases 48–70)

- **D1–D6 real-scale continuous wall** — 180" × 71" SVG with photo-accurate product silhouettes (real bottle/can shapes, brand colors, vertical-rotated labels, depth shading)
- **Per-door inventory** — single 9-column scrollable table with searchable DOOR / PRODUCT / FORMAT / STATUS / F×S×D / UNITS / $/UNIT / TOTAL columns; click a product on the wall to scroll-and-highlight its inventory row
- **7 new gap-fill slides** — competitive set + pricing matrix, Wrigley game-day demand model, margin by category, break-even monthly revenue, working capital + 90-day buffer, insurance stack, Cubs playoff pre-buy
- **Wrigley 2026 calendar** — all 81 home games + 11 concert/special events scrollable with search filter
- **Sidebar regroup** — 11 logical sections with collapsible groups, count badges, and click-to-collapse persistence
- **Version badge** top-right of every slide (`v.260504-rNN`) — click to copy the version string for revert references
- **iPhone polish** — 100dvh, 16px form inputs (no zoom), pinch-zoom on SVG/tables, faster tap response, 36px tap targets, version badge moves to bottom-right on narrow screens
- **Photo-accurate D1–D6 source data** — full audit pass against photos in `Existing Busines Photos/`, with corrections to D3 (Red Bull on top), D4 SH2 (AriZona row), D6 SH4 (Pure juice not Gatorade), D5 SH1 (dairy), D1 SH1 (correct 2L lineup)

---

## Repo structure

```
3814 Repositioning App/
├── README.md                    ← this file
├── CHANGELOG.md                 ← phase-by-phase history
├── index.html                   ← desktop deck (GitHub Pages serves this)
├── iphone.html                  ← mobile-optimized deck
├── settings.json                ← local app state
├── .gitignore
├── _bootstrap.ps1               ← PowerShell setup (folders + desktop shortcut)
├── _git_setup.ps1               ← PowerShell git init + first commit
├── docs/                        ← research + audit notes
│   ├── distributor_research.md
│   ├── fixture_audit.md
│   ├── fixture_dims.md
│   └── layout_audit.md
├── images/                      ← deck assets
├── archives/                    ← versioned snapshots + decision docs
│   ├── README.md
│   ├── v34_2026-05-01.html
│   ├── v37_2026-05-04_phase22.html
│   ├── v37_2026-05-04_phase22_iphone.html
│   ├── BACKSTOCK_DECISION_2026-05-02.md
│   ├── BACKSTOCK_BUY_LIST_2026-05-02.md
│   ├── BACKSTOCK_2MONTH_BUY_2026-05-02.md
│   ├── SCHEDULE_A_2026-05-02.md
│   ├── AUDIT_BROWSER_2026-05-02.md
│   ├── AUDIT_MASTER_2026-05-02.md
│   ├── DECISION_2026-05-02.md
│   └── FLOORPLAN_DELTA_2026-05-03.md
├── tmp/                         ← local scratch (gitignored)
├── logs/                        ← local logs (gitignored)
├── cache/                       ← local cache (gitignored)
└── downloads/                   ← local downloads (gitignored)
```

---

## First-time GitHub setup

From PowerShell, in the project root:

```powershell
.\_git_setup.ps1
```

That script:

1. Verifies git is installed
2. Initializes a fresh repo on `main`
3. Sets `user.email` and `user.name` to Bradley French
4. Stages all files and creates the first commit

Then create a new GitHub repo (suggested name: `3814-bodega-deck`, do NOT initialize with README) and push:

```powershell
git remote add origin https://github.com/<username>/3814-bodega-deck.git
git push -u origin main
```

Repo Settings → Pages → Source: `Deploy from branch` → `main` / `(root)` → Save. Pages URL appears within a minute.

---

## Day-to-day workflow

```powershell
# After making edits to index.html / iphone.html
git add index.html iphone.html
git commit -m "Phase XX — short description"
git push
```

GitHub Pages re-deploys within ~30 seconds.

---

## Active workstreams

- SKUDB updates per 2026 trend research
- Floor plan accuracy vs architect's plan (3814northclarkPlans)
- Distributor packets refresh
- Liquor license filing prep (Class B, City of Chicago)
- G3 face fully repositioned (Phase 22): Chocolate / Cleaning / Paper / Pet

---

## Versioning

Every meaningful revision should be archived to `archives/` before continuing edits. See `archives/README.md` for the naming convention. The current version number lives in this README's header line.

A timestamped backup is also written to `archives/index_pre_phaseXX_<datetime>.html` automatically before any bulk edit.

---

## Tech notes

- 100% vanilla HTML / CSS / JavaScript — no build step, no dependencies
- Renders at 1500px max-width with responsive shelves (horizontal scroll inside cooler frames at narrow viewports)
- Mobile viewport meta tag is set; desktop deck auto-redirects mobile user agents to `iphone.html`
- All fixture dimensions baked into the JS data structures (no external config)
- localStorage used for floor-plan editor persistence only — no other browser storage
- Editor includes drag/resize/rotate gizmos for repositioning fixtures live in-browser

---

## Liquor license filing notes

- Bradley resides at 3814 N Clark, Apt 2 — same building as the liquor store, so LCP affidavit not required
- Bradley is single — skip Spousal Affidavit (SPA) on all filings
