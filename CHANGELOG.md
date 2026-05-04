# Changelog

All notable changes to the 3814 Bodega Repositioning deck. Phase numbers correspond to atomic edit scripts in `outputs/` (kept locally, not in git).

Format: keep newest at the top.

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
