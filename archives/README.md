# Archives

Versioned snapshots of the deck.

## Convention

```
v<version>_<YYYY-MM-DD>.html
```

- `<version>` matches the in-progress version number used in dev (currently `v37`)
- `<YYYY-MM-DD>` is the date the snapshot was taken (ISO 8601 — sorts correctly)
- Optional suffix `_<slug>` if multiple snapshots happen on the same day:
  `v34_2026-05-01_pre-color-audit.html`

## When to archive

Archive **before** any of the following:
- Major restructure of a renderer (renderTileShelfBand, renderDoorWall, etc.)
- Bulk SKU changes across 5+ fixtures
- Color palette or theme overhaul
- Floor plan SVG rework
- Anything you'd want to roll back from in one click

## How to archive

From the project root:

```powershell
Copy-Item index.html "archives/v<version>_<date>.html"
```

Or use the ScratchPad button in the deck (if/when wired) to auto-snapshot.

## Current snapshots

| File | Date | Notes |
|------|------|-------|
| `v37_2026-05-04_phase22.html` | 2026-05-04 | **CURRENT.** 70+ slides, 340 SKUs, 7 distributors. Phase 22: G3 face fully repositioned (Chocolate / Cleaning / Paper / Pet) with new product elevations + SKUDB entries. |
| `v37_2026-05-04_phase22_iphone.html` | 2026-05-04 | iPhone-optimized mirror of the v37 deck. |
| `v34_2026-05-01.html` | 2026-05-01 | First GitHub-ready baseline. 41 slides, 317 SKUs, $65,969 inventory. Fixed-scale (18 px/inch) shelf rendering, graphical fixture frames, "Not readable" tile light-grey treatment, D7 unreadable items repositioned. |

`index_pre_phaseXX_*.html` and `iphone_pre_phaseXX_*.html` files are automatic timestamped backups written before every bulk edit. Safe to delete in batch if disk space matters; keeping them lets you bisect any regression at phase granularity.

Decision and audit `.md` files in this folder are reference artifacts that informed prior phases (Schedule A, backstock buy list, floor-plan delta audit). They aren't superseded by the deck; they're the source-of-record for the decisions baked into the deck.

## Restoring an archive

```powershell
Copy-Item "archives/<archive-file>.html" index.html
```

Then refresh the GitHub Pages URL or re-open `index.html` locally.
