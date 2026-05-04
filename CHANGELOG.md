# Changelog

All notable changes to the 3814 Bodega Repositioning deck. Phase numbers correspond to atomic edit scripts in `outputs/` (kept locally, not in git).

Format: keep newest at the top.

---

## v.260504-r70 — 2026-05-04 (current)

### Phase 70 — Visual fixes (deferred from Phase 66)
- Renamed first duplicate `elev-g1` renderer to `elev-g1-archive` (was silent dead code, second declaration was overwriting it)
- Fixed 2-line vertical text label collision on long brand names: bumped offX floor 2px → 5px and reduced max font 7 → 6
- Padded 3 empty `<td></td>` cells in subtotal/total rows so column alignment doesn't drift in some browsers

### Phase 69 — iPhone audit + polish
- Replaced `100vh` with `100dvh` (iOS Safari address bar handling)
- Bumped search input fonts 11px → 16px to prevent Safari zoom-on-focus
- Added `@media (max-width:1100px)` to move version badge from top-right to bottom-right on narrow screens
- Added `touch-action: manipulation` and `-webkit-tap-highlight-color` for faster + cleaner taps
- Added 36px min-height on `.nav-item` at narrow widths (Apple HIG compliance)
- Added `body { overflow-x: hidden }` so wide tables scroll inside containers, not the whole page
- Added `svg, table { touch-action: pinch-zoom }` so users can pinch-zoom the D1–D6 wall and inventory tables

### Phase 68 — Full app audit + broken link fixes
- Audit found 25 broken `goToSlide('elev-d2..d6')` references in dead-code chip handlers; redirected to `door-d2..d6` slide IDs
- Verified all 53 unique nav targets resolve to a registered slide. Zero broken links across both files.
- All 91 slide types have a registered renderer; all 9 helper functions defined and called.

### Phase 67 — Wrigley scrollable + deeper financials
- Wrigley 2026 calendar: scrollable container with all 81 Cubs home games + 11 concert/special events. Sticky header + tfoot. Search input filters by opponent / event name / date.
- Realistic 2026 NL Central + interleague opponent rotation (Cardinals, Brewers, Reds, Pirates, Mets, Yankees, etc.)
- Per-event walk-by capture math (Cubs 1.0%×$11, concerts 1.5%×$14) with grand total
- Breakeven slide updated to actual staffing spec: $40k owner draw + 1 W-2 (39 hr/wk × $18) + game-day PT + payroll burden
- New monthly fixed-cost total: $22,300 → break-even $71,930/mo

### Phase 66 — Initial visual audit fixes (partial — completed in Phase 70)

### Phase 65 — Visual audit (no code changes; findings only)
- Identified duplicate elev-g1 renderer
- Identified 2-line vertical label collision on long brand names
- Identified 4 cosmetic polish items applied in Phase 70

### Phase 64 — Single combined D1–D6 inventory table
- Replaced 6 separate per-door tables with ONE 9-column scrollable table
- Added DOOR column (searchable)
- Search input above table filters by door / product / format / status with sticky thead/tfoot
- Door section header rows visually separate the 6 doors within one table
- Grand total row spans all 6 doors

### Phase 63 — 7 new gap-fill slides
- Competitive set + pricing matrix (vs 7-Eleven / Walgreens / Mariano's / Murphy's / Cubby Bear)
- Wrigley game-day demand model (window-by-window % lift)
- Margin by category (14 category lines with %, % of rev, % of gross $)
- Break-even monthly revenue
- Working capital + 90-day buffer + day-0 cash needed
- Insurance stack (9 coverages totaling $15k/yr)
- Cubs playoff pre-buy plan (Wild Card / Division / NLCS / World Series scenarios)

### Phase 62 — Sidebar regroup
- Removed go-grocer slide
- Reorganized 84 slides into 11 logical sections (`1 · Vision & Thesis` through `11 · Action`)
- Building plans (basement, 1st floor, 3rd floor) moved to their own "Building & Construction" section
- Added cost totals to "Products NOT to Keep" slide
- Added version badge top-right (click to copy)

### Phase 61a — Cross-door photo audit + corrections
- D3 SH5 ↔ SH4 swap (Red Bull moves to top per photo)
- D4 SH2 fill with AriZona row (was empty)
- D5 SH5 drop Premier Protein (off-category)
- D5 SH1 dairy fix (replaced Starbucks Doubleshot with milk jugs per photo)
- D6 SH5 expand to full Pure juice row
- D6 SH4 Gatorade → Pure juice swap
- D1 SH1 2L lineup re-audit (A&W RB, Crush Orange, Dr Pepper Diet)

### Phase 58–59 — D1–D6 continuous-wall real-scale slide
- All 6 cooler doors rendered as one 180" × 71" SVG with continuous shelves
- Per-door product placement (each door's products start at its own left edge, not flowing across)
- Door dividers + handle markers visible
- All 5 shelf horizontal lines run edge-to-edge across the wall

### Phase 56–57 — Vertical-rotated text labels
- Brand name labels rotated -90deg (vertical, reads bottom-to-top)
- Auto-fit font sizing
- 2-line wrap for very long brand names (split at space)

### Phase 51–52 — Real bottle/can silhouettes
- Replaced rounded rects with SVG paths matching real bottle/can silhouettes
- Wine bottle, beer long-neck, plastic bottle, can, jar, tin, pack — all unique shapes
- Cylinder-shading gradients (left highlight + right shadow + top gloss + bottom shade)
- "1×N" depth badges in top-right corner
- Empty silhouette ghost-fill for under-stocked shelves

### Phase 48 — D1–D6 real-scale standalone slides + photo-accurate dimensions
- Cooler door 30" W × 71" H × 30" D real-scale
- Bradley's exact shelf positions: 7" floor + 15.5" / 14.5" / 8" / 11" / 12" + 3" top casing
- Per-shelf dimension annotations
- BEFORE/AFTER stacked vertically for iPhone

---

## v37 — 2026-05-04

### Phase 22 — G3 fixture elevation + SKUDB
- Replaced stale G3 elevation tiles (Premium chocolate / International snacks / Functional CBD) with current strategy
- New B section: Cleaning Essentials (Dawn, Lysol Wipes, Bounty, Hefty, Clorox)
- New C1 section: Paper Goods 3′ × 5 shelves (Solo cups, Dixie plates, Hefty cutlery, Reynolds wrap, Ziploc, Bounty napkins)
- New C2 section: Pet / Bodega Animal Supplies 3′ × 5 shelves (Friskies, Fancy Feast, Pedigree, Greenies, Beggin' Strips, Milk-Bone, Tidy Cats litter, Frisco potty pads)
- Replaced 8 stale G3 protein-bar SKUDB entries with 47 new entries covering all four sections (KEHE for chocolate, EBY-BROWN for cleaning + paper + pet) — every entry tagged status:'NEW' with size, qty, unitCost
- Total SKUDB now: 340 entries

### Phase 21 — G3 section C split
- Split G3 section C (Paper Goods) into two halves on the floor plan SVG
  - C1 = Paper 3′ × 5 shelves
  - C2 = Pet 3′ × 5 shelves
- Added horizontal mid-divider between C1 and C2 on the SVG
- Updated Inventory & Cost summary rows + Master Fixture Sheet G3 description

### Phase 20 — Side-by-side floor plans (Uptown standalone study)
- Added a second floor plan SVG on the Uptown Store slide showing 3814's actual fixture footprint with Uptown product categories mapped to each fixture
- Side-by-side with the Uptown reference plan (Phase 19)
- Labeled as standalone study — explicitly NOT the active 3814 repositioning plan
- Both plans interactive — click any zone to highlight matching row in the Uptown table

### Phase 19 — Uptown Store concept floor plan
- Added an interactive concept SVG floor plan for the Uptown Store reference (Clark Haus)
- Door numbering by category (CSD, Energy, Beer Macro, etc.)
- Each fixture clickable, scrolls to and flashes the matching category row in the Uptown product table

### Phase 18 — G3 minimal cleaning + paper supplies
- Restored minimal cleaning + paper goods sections to G3 face (sections B + C)
- Updated floor plan SVG labels and Inventory & Cost rows

---

## v36 — 2026-05-03

### Phase 17 — Uptown product scoring
- Added popularity / trend / restock columns to Uptown table (Phase 17b/c/d/f)
- Added % of Store column with estimated allocation
- Sortable column headers with direction indicators
- Phase 17e: fixed sort bug (tryInit was firing on every click)
- Mirrored Popularity / Trend / Restock columns to main Inventory & Cost slide

### Phase 16 — Popularity bars + trend arrows
- Rendered visual popularity bars + trend arrows for all 429 Uptown products

### Phase 15 — Market research scoring
- Hard-dive research on all 429 Uptown products with popularity + trend scoring

### Phase 14 — Uptown Store sidebar
- Built Uptown Store reference slide
- 14b: grouped table by Distributor → Type → Product (15-row scrollable per group)

---

## v35 — 2026-05-03

### Phase 13 — Interactive floor plan editor
- Drag/resize/rotate gizmos for repositioning fixtures live in-browser
- localStorage persistence

### Phase 12 — 12-section gondola split
- Floor plan SVG: split G1+G2 and G3+G4 as single gondolas with two faces each (12 ft total)
- Added ice zone at the ice bin

### Phase 11 — REVERTED (1-month backstock cap was too aggressive — kept 2-month plan)

### Phase 10 — Floor plan delta audit
- Audited current SVG vs architect's plan, deferred 10 known issues

### Phase 9 — Distributor packet refresh
- Updated all distributor packets with new Schedule A scope

### Phase 8 — Backstock + Day-1 Cash slides
- Built then removed — kept just numbers in inventory tables (Phase 8e revert)
- Day-1 cash narrative updated for $5,737 backstock

### Phase 7 — KEEP/DROP disambiguation
- Resolved 14 deck SKU+format conflicts

---

## v34 — 2026-05-01 (initial GitHub-ready baseline)

- 41 slides, 317 SKUs, $65,969 inventory
- Fixed-scale (18 px/inch) shelf rendering
- Graphical fixture frames with light-grey "Not readable" tile treatment
- D7 unreadable items repositioned
- All 9 distributors active

---

## Conventions

- Each Phase script in `outputs/` (Python via bash) does atomic edits to both `index.html` and `iphone.html`
- Backups written to `archives/index_pre_phaseXX_<datetime>.html` before every bulk edit
- Mirror requirement: every edit must apply identically to both desktop and iPhone decks
- Verify after every phase: line counts, tail check (`</html>`), `node --check` on extracted inline JS
