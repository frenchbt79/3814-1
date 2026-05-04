# 3814 N Clark — Bodega Repositioning

Single-file HTML investor / distributor presentation for the East Lakeview Food & Liquor repositioning at 3814 N Clark St, Chicago — one block south of Wrigley Field.

**Owner:** Bradley French · 3814 Clark LLC

---

## View the deck

This repo serves two versions of the same deck:

| Version | URL pattern | Best for |
|---------|-------------|----------|
| **Desktop** | `https://<username>.github.io/<repo>/` | Laptop, desktop, big screen — full sidebar nav |
| **iPhone** | `https://<username>.github.io/<repo>/iphone.html` | Phone, narrow screens — hamburger menu, stacked layouts, larger tap targets |

Same data, same slides — just different layouts for screen size.

### Add to iPhone Home Screen (recommended)

1. Open the iPhone URL above in **Safari** (not Chrome)
2. Tap the **Share** button (square with up-arrow at the bottom)
3. Tap **Add to Home Screen**
4. Name it "Bodega Deck" and tap **Add**

You now have an app-like icon that opens the deck full-screen, no Safari chrome.

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

## Repo structure

```
.
├── README.md                  ← this file
├── index.html                 ← desktop deck (GitHub Pages serves this at /)
├── iphone.html                ← iPhone-optimized version (served at /iphone.html)
├── .gitignore                 ← excludes local-only folders
├── archives/
│   ├── README.md              ← archive convention
│   └── v34_2026-05-02_restored.html   ← snapshot of v34 after tail-restore
└── docs/                      ← research + audit notes
    ├── distributor_research.md
    ├── fixture_audit.md
    ├── fixture_dims.md
    └── layout_audit.md
```

---

## How to update the deck on GitHub

### Option A — Web UI (easiest, no terminal)

1. On github.com, navigate to your repo
2. Click `index.html`
3. Click the pencil icon (top-right of the file view) to edit
4. Paste new content, scroll down, "Commit changes"
5. GitHub Pages redeploys in ~30-60 seconds. Refresh the live URL.

For larger updates: use **Add file → Upload files** to drag-and-drop a new `index.html` (or any other file) and commit.

### Option B — Local + git (terminal)

If you've cloned the repo locally:

```powershell
git pull
# ... edit index.html ...
git add .
git commit -m "Updated <what changed>"
git push
```

---

## Enabling GitHub Pages (one-time setup)

If Pages isn't already on for this repo:

1. Repo → **Settings** → **Pages**
2. **Source**: `Deploy from a branch`
3. **Branch**: `main` · folder: `/ (root)`
4. Click **Save**
5. Wait ~1 minute, then refresh the page — your live URL appears at the top

---

## Known limitations on iPhone

The deck is dense — designed for a 1500px desktop layout. The iPhone version (`iphone.html`) does its best to:

- Convert the 240px sidebar into a slide-out drawer (tap ☰ in the top-right)
- Stack 4-column grids into 2 (or 1 on very narrow screens)
- Allow horizontal scroll inside cooler-door planograms (the 540px shelf width can't shrink without losing the fixed-scale rendering)
- Allow horizontal scroll on data tables and floor-plan SVGs
- Auto-close the drawer when you tap a nav item

Some slides — especially the 36-month financial table and the floor plan SVG — will still need horizontal scroll on a phone. That's by design; the data integrity matters more than fitting everything on one screen.

---

## Versioning

Snapshots of the deck live in `archives/`. See `archives/README.md` for the naming convention.

The `_v34` suffix on the latest archive corresponds to the in-progress version number — increment when shipping a new revision.

---

## Liquor license filing notes

- Bradley resides at 3814 N Clark, Apt 2 — same building as the liquor store, so LCP affidavit not required
- Bradley is single — skip Spousal Affidavit (SPA) on all filings

---

## Tech notes

- 100% vanilla HTML / CSS / JavaScript — no build step, no dependencies
- Fully self-contained: no external assets, no CDN, no fonts to load
- `index.html` renders at 1500px max-width
- `iphone.html` is the same file with extra mobile-first CSS overrides + a hamburger drawer
- Mobile viewport meta tag is set; tested for iPhone Safari readability
