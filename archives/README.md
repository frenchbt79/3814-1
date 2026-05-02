# Archives

Versioned snapshots of the deck.

## Convention

```
v<version>_<YYYY-MM-DD>.html
```

- `<version>` matches the in-progress version number used in dev (currently `v34`)
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
| `v34_2026-05-01.html` | 2026-05-01 | First archive — initial GitHub setup. State: 41 slides, 317 SKUs, $65,969 inventory. Fixed-scale (18 px/inch) shelf rendering, graphical fixture frames, "Not readable" tile light-grey treatment, D7 unreadable items repositioned. |

## Restoring an archive

```powershell
Copy-Item "archives/<archive-file>.html" index.html
```

Then refresh the GitHub Pages URL or re-open `index.html` locally.
