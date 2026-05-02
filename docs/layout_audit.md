# Visual / Layout Audit — 2026-05-01

Every issue found. **No fixes applied yet.** Review, mark which ones to tackle, and I'll batch them.

---

## 🔴 BLOCKING — affects readability or correctness

### 1. Pie chart labels are inside the slices (Category Mix slide)
- **What:** Both donut charts (BEFORE / AFTER inventory mix) put `Liquor 23.6%`, `Beer 17.5%`, etc. labels INSIDE each slice. Small slices (Grocery/Cleaning 10.3%, Wine 11.4%, Seltzer/RTD/THC 9.1%) have cramped, overlapping text.
- **Want:** Leader lines from each slice → outside label callout. Standard donut-chart-with-callouts treatment.
- **Risk to fix:** Medium — needs SVG label-placement math (angle → outside endpoint).

### 2. SKU tile names truncate with "…" mid-word
- **Where:** Every door elevation slide.
- **Examples from D16 screenshot:** `AriZona Mu…`, `Hard Mtn D…`, `Modelo Esp…`, `Sun Cruiser Lemon…`.
- **Cause:** `text-overflow:ellipsis; white-space:nowrap` on tiles whose width is set by `(facings/totalFacings)*100%`. When 5–6 tiles share a shelf, each gets ~20%, which is too narrow for long names.
- **Fix options:** (a) allow 2-line wrap, (b) shorten SKU names in data, (c) set a min-width and let shelves overflow horizontally with scroll.

### 3. Right-edge tile clipping in BEFORE | AFTER side-by-side
- **Where:** Door slides where one shelf has more tiles than fits in the half-width column.
- **Example from D16 screenshot:** SH 2 right side shows `Sun…` / `8-…` truncated where the tile got clipped past the AFTER column border.
- **Cause:** Each column is `1fr` (~50% minus 12px gap), but the tile band is full-width within that. Tiles are positioned with flex, no wrap, so they spill past.
- **Fix:** add `overflow:hidden` on the shelf band container, OR allow tiles to wrap to a second line.

### 4. `5 SH` hard-coded in header right column
- **Where:** All door slides — header right cell shows e.g. `30" W × 84" H × 30" D · 5 SH`.
- **Issue:** I just added 6th shelves to D15–D18 (cap) but the header still says "5 SH". The number should come from `shelfData[door.tag].length`, not be hard-coded into the dim string.
- **Fix:** straightforward — `renderDoorWall` already has `ds.shelfCount`; just use it.

### 5. Most BEFORE/AFTER inventory totals showing `$0`
- **Where:** Many doors (D7, D8, D9, D11–D14, D17–D22 in particular).
- **Cause:** Original `shelfData` tiles for these doors don't include `cost:` values. `cost × facings = $0`.
- **Fix:** backfill cost data — wholesale unit prices per SKU. ~200+ tiles to touch.

---

## 🟠 HIGH — visible cosmetic problems

### 6. Door dim string overflows when slider note is long
- **Where:** D13–D18 sliders.
- **Example:** `30" W × 84" H × 30" D (slider — pair w/ D15, 60" cooler) · 5 SH` is one long unbreakable line that wraps awkwardly or pushes the distributor link out of view.
- **Fix:** abbreviate (e.g. "slider · pair D14") or stack the slider note on its own line below the dim line.

### 7. Tile width inconsistency between adjacent shelves
- **Cause:** Each shelf's tiles share the row's `totalFacings`. Shelf with 5 tiles × 1 facing = each 20%. Shelf with 7 tiles × 1 facing = each 14.3%. So tile widths shift between shelves on the same door.
- **Visual effect:** SKU tiles don't form a clean column grid — they jump in width row to row.
- **Fix options:** (a) accept it (genuine planogram density varies), (b) lock all tiles to a min-width and let shelves wrap, (c) use a fixed grid (e.g., 12-column) regardless of facings.

### 8. The newly-added "cap" tier (top shelf, SH 6) on D15–D18 isn't visually distinct
- **Where:** D15, D16, D17, D18.
- **Cause:** I labeled the new 6th shelf with `tier:'cap'` but the renderer has no special styling for cap vs eye-up. They look identical.
- **Fix:** subtle background or border treatment for the cap tier so it reads as "above eye level".

### 9. Sidebar navigation labels wrap to 2 lines for the Doors entries
- **Where:** Sidebar.
- **Example:** `Doors D11–D14 (upper-left wall)` wraps to 2 lines on the default sidebar width.
- **Fix:** shorten labels (e.g. `D11–D14 · Upper-left`) or widen the sidebar column.

### 10. Schedule A table — descriptions getting too long for the cell
- **Where:** Floor plan slide → Schedule A table.
- **Example:** The G3.5 / G4.5 entries I added recently have long descriptive text that wraps inelegantly into the column.
- **Fix:** truncate the description to first ~10 words + tooltip with full text on hover.

### 11. Floor plan SVG can horizontal-scroll on smaller monitors
- **Where:** Floor plan slide.
- **Cause:** The BEFORE/AFTER stacked SVGs are fixed-pixel viewBox; the `.floor-plan-wrapper` allows horizontal scroll but most users won't notice they need to scroll.
- **Fix:** force `width:100%` with auto-fit aspect ratio so SVGs scale down to fit viewport.

### 12. "Slide title" margin is inconsistent across slides
- Some slides use `class="slide-title"`, others use raw `<h2>`. Top margin varies 14–24px.
- **Fix:** consolidate on one class.

---

## 🟡 MEDIUM — polish / consistency

### 13. Status legend appears on every door slide (redundant)
- BEFORE | AFTER tile slides show a 4-color legend at the top, but it's identical across all 4 wall slides.
- Could move to a single global legend at the top of the Fixtures section, OR collapse into a tooltip.

### 14. Card border / radius / padding inconsistency
- "Accent" cards use 1.5px border, generic cards use 1px. Border-radius varies (4px, 6px, 8px).
- Some cards have `padding:12px 18px`, others `padding:14px 16px`.
- **Fix:** define 2 card styles (card-default, card-accent) with consistent padding/radius.

### 15. The wall summary 5-column header card cramps on narrow viewports
- 5 cells × `1fr` at the default sidebar-collapsed width = each cell ~250px. The "DISTRIBUTORS" cell often has a long string ("CBS · LAKESHORE · BREAKTHRU · SOUTHERN GLAZER'S · RED BULL · KEHE") that wraps to 3 lines, making the card taller than needed.
- **Fix:** `grid-template-columns: 1fr 1fr 1fr 2fr 1.2fr` (give Distributors more room).

### 16. Tooltip box on the floor plan can clip off the right edge
- **Where:** Floor plan slide hover.
- **Fix:** flip tooltip to left side of cursor when within 200px of right edge.

### 17. Sidebar grouping headers are subtle
- "Doors", "Freezers", "Counter & Back Wall", "Gondolas", "Shelves" — the labels are only ~9–10px caps and easy to miss.
- **Fix:** beef up the section labels with more contrast and a little more whitespace above each.

### 18. Endcap "to be repositioned" surround is heavy-handed visually
- **Where:** G3.5 / G4.5 slides.
- **Issue:** 3px red border + tinted background + big banner stacks on top of another card with header. A lot of visual chrome.
- **Fix:** lighter surround treatment — a single colored accent stripe + label.

### 19. Distributor packet pages — table column widths uneven
- Some pages have product description column too narrow, $/case too wide.
- Need per-page review.

### 20. Inventory & Cost slide table — dollar columns don't right-align consistently
- Some rows have currency formatted with `$` prefix and comma separators, others don't.
- **Fix:** consolidate `fmtMoney` helper and apply everywhere.

---

## 🟢 LOW — minor / nice-to-have

### 21. Hero slide stat-grid uses 4 cells; could be 5 to include lease/payback
### 22. Footer / nav controls (prev/next) could show current section (e.g. "Doors → D11–D14")
### 23. Print stylesheet doesn't exist — printing the deck will look broken
### 24. Hover state on tile blocks — currently no visible affordance that they're inspectable; cursor stays default
### 25. Loading state — entire deck renders synchronously; on slow first paint, sidebar appears before slide content (brief flash of empty)
### 26. Color palette — uses hardcoded hex (`#5dcaa5`, `#85B7EB`, etc.) in tile renderer alongside `var(--teal)` etc. elsewhere. Should be all CSS variables.
### 27. Dark mode is the only mode — light mode would be nice for printing
### 28. Sidebar is fixed-position; on mobile would need a hamburger toggle (currently not responsive)

---

## Suggested order of attack

1. **Pie chart leader-line redesign** (#1) — biggest visible win
2. **Tile name handling** (#2 + #3 + #7) — combined fix, biggest impact across all door slides
3. **6 SH dynamic** (#4) — quick win
4. **Cost backfill on door tiles** (#5) — large data task; can be programmatic
5. **Card / column consistency pass** (#12 + #14 + #15 + #20) — single CSS cleanup
6. **Cap tier styling + status legend cleanup** (#8 + #13)
7. **Floor plan + sidebar polish** (#9, #11, #16, #17)
8. Lower-priority items as time allows

Tell me which ones to tackle and I'll batch the fixes.
