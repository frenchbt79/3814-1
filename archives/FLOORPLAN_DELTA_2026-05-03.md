# Floor Plan SVG — Delta vs Architect's Reference

**Date:** 2026-05-03
**Reference images:**
- `images/first-floor-plan.png` (architect AS-BUILT, sales floor only)
- `images/floorplans-arch.png` (architect overlay, 3-floor composite)
- `images/floorplans-arch_original.png` (architect original)

**SVG state:** post-Phase-10 (G1+G2 unified gondola; G3+G4 unified gondola)
**Files affected:** `index.html` lines 4451-5062 (outlinePath @ 4457-4473, BEFORE plan @ 4519-4772, AFTER plan @ 4778-5062)

---

## Architect's plan summary

**Building shape:** Tall narrow Chicago row-store, ~28 ft wide × ~80 ft long (proportion read from drawing). Sales floor "STORE 736 SF" is the southern ~2/3 of the building footprint.

**Back-of-house zone (NORTHERN ~1/3 of building):**
- STAIRS — 79 SF, NW corner
- STOR — 69 SF, NE corner
- COOLER (walk-in) — 95 SF, mid-N-west, below stairs
- BREAK room — 122 SF, mid-N-east, below STOR
- A continuous horizontal wall (with two doorways for staff access) separates BOH from sales floor at roughly y ≈ 195 in SVG-coordinate equivalents
- BOH walls themselves are MASONRY/heavy and the rooms appear distinct, not just one big back-room

**Sales floor entrances (TWO):**
1. **South entrance (primary, customer)** — at south wall, door-swing visible mid-south. South wall has a small cutout / chamfer at SW corner near D22/S1.
2. **East entrance (secondary, vestibule)** — at the chamfered SE corner. The east wall steps in/angles between D18/ICE and D19/D20, creating a small vestibule. This is where the "S5" sundries shelf sits in the architect's plan (NOT at top of east wall as currently SVG-coded).

**Wall / footprint nuances:**
- East wall has TWO bump-outs/jogs: one upper (north of S5) for the BREAK room exterior wall, one mid (between D18 and D19) for the chamfered SE entry vestibule.
- West wall is mostly straight but has a small inset/jog above S2 angled shelf (between D21 and D6) — that's where ATM and S3 sit on a slight bump-in.
- South wall has a slight jog at S1/D22 area.

**Major fixtures in architect's plan (sales floor only):**
- Coolers along walls: D1-D6 (SW wall), D7-D10 (north wall against BOH), D11-D12 (NW wall), D13-D18 (E wall), D19-D20 (E wall after SE chamfer), D21 (NW wall), D22 (SW corner)
- Gondolas: G1+G2 (lower center, double-faced), G3+G4 (upper center, double-faced), with endcaps G1.5/G2.5/G3.5/G4.5
- Freezers: F1, F2, F3 (center column, south of G3/G4)
- Counter: OC-1 (FC-1 in plan) — one continuous vertical counter east of freezers
- Back wall: BC-1 — wine/spirits wall east of OC-1
- Shelves: S1, S2 (angled), S2.5, S3, S4, S5 (in SE vestibule), S6 (in front of F1-F3 column), S7 (in SE vestibule)
- ICE — freestanding freezer in the SE area, between D18 and the east entrance
- ATM — west wall

**Critical: there is NO BC-2 in the architect's plan.** BC-1 runs the full length of the back wall.

---

## Current SVG layout summary

- viewBox: `0 0 660 1180` (used by both BEFORE and AFTER)
- Outline path (line 4457-4473): single closed polygon, no internal walls demarcating BOH
- North wall: starts at `M 80,40 → L 230,40 → L 230,15 → L 540,15 → L 540,200` — this draws the WHOLE building outline including what should be BOH
- D7-D10 fixtures coded at y=25 (against the very TOP wall) — wrong; in architect's plan they sit BELOW the BOH rooms at the BOH/sales-floor partition
- East entrance: implied by chamfer at `L 580,610 → L 540,650`, but no door symbol, no vestibule opening drawn
- South entrance: NOT drawn — the south wall just runs `L 460,1140 → L 100,1140` with no door symbol or cutout
- Fixture counts (AFTER plan):
  - Coolers: D1-D22 (22 rects across the wall positions)
  - Gondolas: G1+G2 unified (1 fixture), G3+G4 unified (1 fixture)
  - Endcaps: G1.5, G2.5, G3.5, G4.5 (4 rects)
  - Freezers: F1, F2, F3 (3 rects)
  - Counter: OC-1 (1 rect)
  - Back wall: BC-1, BC-2 (2 rects — BC-2 doesn't exist in architect's plan)
  - Shelves: S1-S7 (7 rects)
  - ICE, ATM (2 structural)
- "S5" coded at top of east wall (x=540, y=110) — but architect's plan shows S5 is in the SE entrance vestibule, NOT the upper east wall
- "S7" coded at far east x=595 y=700 — outside the building outline (outline x-max is 580)

**Scale estimate:** The architect's "STORE 736 SF" zone occupies roughly the lower 2/3 of the SVG outline (~y=195 to y=1140 = 945 SVG units of height). 736 SF in a ~28-ft-wide store ≈ 26 ft tall. So **1 SVG unit ≈ 0.33 inches** OR equivalently **1 ft ≈ 36 SVG units**. A 30" cooler door = ~90 SVG units wide. Current D7-D10 widths (60-75) are slightly undersized; D12 height of 110 ≈ 36" door (close to right for a 2-door cooler). Scale is approximately consistent.

---

## DELTA — issues found

### F1 — BOH zone completely missing (HIGH)
- **Architect shows:** Northern ~1/3 of building is back-of-house with 4 distinct rooms (STAIRS, STOR, COOLER 95 SF, BREAK 122 SF) separated from sales floor by a continuous wall with two staff doors. This is a critical retail/distributor literacy point — the 736 SF sales-floor number only makes sense if BOH is visibly excluded.
- **SVG shows:** Single outline polygon with D7-D10 sitting at `y=25` against the very top wall. No BOH rooms, no partition wall. The viewer would interpret the sales floor as ~28×40 ft, which is wrong.
- **Fix proposed:**
  - Add a BOH partition wall: `<line x1="80" y1="195" x2="540" y2="195" stroke="#fff" stroke-width="2" opacity="0.7"/>` with two door-gap breaks at approx x=315 (cooler door to sales floor) and x=470 (break-room door).
  - Add 4 BOH room rects with light fill `rgba(80,80,80,0.15)` and labels:
    - STAIRS: `<rect x="80" y="40" width="150" height="80" />` label "STAIRS / 79 SF"
    - STOR: `<rect x="400" y="15" width="140" height="100" />` label "STOR / 69 SF"
    - COOLER: `<rect x="230" y="120" width="170" height="75" />` label "WALK-IN / 95 SF"
    - BREAK: `<rect x="400" y="115" width="140" height="80" />` label "BREAK / 122 SF"
  - Move D7-D10 rects DOWN: change y from 25 → ~200 (just below BOH partition), and re-label as the back beer wall facing INTO the sales floor.
  - Also add the "STORE 736 SF" label inside the sales-floor zone, currently it just says "REPOSITIONED" / "LEGACY".

### F2 — Front entrance(s) not drawn (HIGH)
- **Architect shows:** Two entrances — SOUTH wall door (primary) with door-swing arc visible mid-south, and EAST chamfered vestibule door. South wall has small step/jog at SW corner.
- **SVG shows:** South wall is a flat `L 460,1140 L 100,1140` line. No door symbol, no jog, no vestibule.
- **Fix proposed:**
  - Add a door-swing symbol at south-center: `<path d="M 280,1140 A 45,45 0 0 1 325,1095" fill="none" stroke="#fff" stroke-width="1.2"/>` plus a gap in the south wall at x=280-325.
  - Modify outlinePath south segment to add a small recess for the entry: change `L 460,1100 L 460,1140 L 100,1140` to include vestibule recess near x=280-325.
  - Add a second door symbol at the east chamfer (around x=560, y=640) for the east entrance.

### F3 — S5 in wrong location (MED)
- **Architect shows:** S5 is in the EAST entrance vestibule (between D18 cooler and D13 row, in the small alcove created by the east wall jog at upper-east). It sits at approximately y=560 in SVG coords (matching y of D17/D18 area on east wall, not upper).
- **SVG shows:** S5 coded at `x=540, y=110, w=40, h=70` — placed at the very TOP of the east wall, far above where the architect's plan puts it.
- **Fix proposed:** Move S5 rect to `x=545, y=210, width=35, height=40` — directly south of the BOH/STOR door, north of D13 (between top of D13 and the BOH wall). Keep label "S5 Sundries" but reduce size to match architect.

### F4 — S7 placed OUTSIDE building outline (HIGH)
- **Architect shows:** No S7 in this exact form. The SE vestibule area contains the chamfered east wall and an entry. There's a small alcove south of D20 where a vestibule shelf could exist (~x=510-560, y=790-830).
- **SVG shows:** S7 at `x=595, y=700, w=55, h=55` — but the building outline extends only to x=580 and chamfers to x=540 at y=650. **S7 is rendered floating outside the wall** (visually appears outside the building).
- **Fix proposed:** Either (a) DELETE S7 entirely (it doesn't appear in architect's plan) or (b) relocate into the actual SE vestibule alcove south of D20: `<rect x="490" y="790" width="50" height="40" .../>`. If keeping S7 as "NEW Phase 2", relocate AND adjust east wall outline to create a small bump-out vestibule at SE corner that visually contains the shelf.

### F5 — BC-2 fixture doesn't exist in architect's plan (MED)
- **Architect shows:** BC-1 is one continuous fixture along the back wall (east of OC-1/FC-1) from the chamfered SE area up to D18. There is no BC-2 — the south end of BC-1 just terminates at the south wall.
- **SVG shows:** BC-1 (`x=458, y=700, h=250`) PLUS a separate BC-2 below (`x=458, y=960, h=90`) labeled "Sundries". This is a Phase-1 invention, not in the as-built plan.
- **Fix proposed:**
  - Option A: DELETE BC-2 rect + label entirely (lines 4983-4987 in AFTER plan; lines 4709-4712 in BEFORE plan).
  - Option B: extend BC-1 height from 250 to 350 to absorb BC-2's footprint into one continuous back-wall fixture. This matches architect's plan.
  - Recommend Option B (preserve sundries SKU narrative) — change BC-1 from `(458, 700, 50, 250)` to `(458, 700, 50, 350)` and remove BC-2.

### F6 — Outline ghost: D7-D10 phantom row (HIGH)
- **Architect shows:** D7-D10 are coolers facing INTO the sales floor at the BOH partition wall.
- **SVG shows:** D7-D10 are rendered correctly as fixtures BUT their positioning at y=25 (very top of building) leaves a large "ghost" empty zone between y=95 (bottom of D7-D10) and y=200 (where D12 starts) — this empty band is where the BOH rooms should be. Currently it reads as wasted space / drawing error.
- **Fix proposed:** Cascading from F1 — once BOH rooms are added in the y=15-195 band, move D7-D10 down to y=200-270 (just south of the BOH partition wall). This clears the visual ghost.

### F7 — North wall vestibule notch is fictitious (LOW)
- **Architect shows:** No vestibule notch at top of building (the top is just the north exterior wall of the STAIRS/STOR rooms, which is straight). The current SVG `M 80,40 L 230,40 L 230,15 L 540,15` creates a step/notch at the top-left that doesn't match the architect's plan.
- **SVG shows:** The top wall steps from y=40 to y=15 at x=230, creating a notch shape.
- **Fix proposed:** Simplify top wall to `M 80,15 L 540,15` (flat top). Or, if preserving the existing chamfered-to-sidewalk look, keep the step but at minimum re-label it as "north exterior wall of stairs/stor" rather than implying a vestibule.

### F8 — East wall chamfer at SE corner is in wrong position (MED)
- **Architect shows:** The SE chamfered corner sits BELOW D18 and ABOVE D19/D20 — i.e., the chamfer is the entry vestibule between roughly y=600 (south end of D18) and y=665 (north end of D19). The wall goes east-then-south at the chamfer to give space for the entrance.
- **SVG shows:** Chamfer is drawn from `L 580,610 L 540,650` — close, but the chamfer is too short and the wall continues straight to y=1100 below it. ICE freezer (`x=415, y=615, w=75, h=55`) sits ON TOP of where the chamfer cut-line passes, which is geometrically inconsistent.
- **Fix proposed:** Verify ICE freezer position — architect places ICE inside the chamfered SE alcove, freestanding on the floor, with the entry vestibule door to its EAST. Move ICE slightly NW: from `(415, 615)` to `(440, 620)` so it sits cleanly INSIDE the angled vestibule rather than spanning the chamfer line. Extend chamfer slightly: `L 580,600 L 530,660 L 530,1100`.

### F9 — South wall jog at SW corner not represented (LOW)
- **Architect shows:** South wall has a small chamfer/step at SW corner near D22/S1 — the building corner is angled, not square.
- **SVG shows:** Outline has `L 100,1140 L 100,1080 L 80,1080` — there IS a step here. Actually pretty close to architect; this is mostly OK but the outer step at `100→80` is slightly more pronounced than the architect's chamfer.
- **Fix proposed:** Minor — change `L 100,1140 L 100,1080 L 80,1080` to `L 105,1140 L 80,1115 L 80,1080` to make it a proper diagonal chamfer. LOW priority cosmetic.

### F10 — S6 placement vs architect (LOW)
- **Architect shows:** S6 sits IN FRONT OF (west side of) F1 freezer, full-height, between G2 gondola and the freezer column. Coded at `x=300, y=760, w=18, h=90` in current SVG.
- **SVG shows:** S6 is at the top of F1 only (90 tall) — but architect's plan shows S6 extending the FULL height of F1+F2+F3 column (a tall narrow shelf adjacent to all three freezers). Should be ~90×3 = 270 tall.
- **Fix proposed:** Resize S6 from `(300, 760, 18, 90)` to `(300, 760, 18, 290)` to span the full freezer column height as architect shows.

### F11 — Counter labeled OC-1 in SVG but FC-1 in architect's plan (LOW)
- **Architect shows:** Center counter labeled "FC-1" with "BC-1" behind it.
- **SVG shows:** Counter labeled "OC-1" throughout (legacy POS-counter naming).
- **Fix proposed:** Either rename SVG label to FC-1 to match architect, OR update architect-side glossary in the deck to clarify "OC-1 = FC-1 = front counter / over counter". Cosmetic.

### F12 — D19/D20 widths/positions vs architect (LOW)
- **Architect shows:** D19/D20 are short shallow coolers along the chamfered east wall, near the SE corner. They sit at an angle following the chamfered wall, not square against an east wall.
- **SVG shows:** D19/D20 are square rects at `x=510, y=665/725, w=60, h=55`. Square, not angled.
- **Fix proposed:** Apply a `transform="rotate(-22 540 692)"` (matching the SE chamfer angle) to D19/D20 group rects, so they sit on the angled wall as architect drew. LOW priority — most viewers won't notice.

---

## Issues table

| # | Severity | Issue | Architect | SVG | Fix |
|---|----------|-------|-----------|-----|-----|
| F1 | HIGH | BOH zone (4 rooms) missing | STAIRS/STOR/COOLER/BREAK across north 1/3 | None drawn | Add 4 rects + partition wall with door gaps in y=15-195 band; relabel sales area "STORE 736 SF" |
| F2 | HIGH | Entrances not drawn | South door + east chamfer door, with swings | Flat south wall, chamfer with no door symbol | Add door-swing arcs at south-center and east chamfer |
| F3 | MED | S5 wrong location | In SE vestibule (~y=560) | At top east wall (y=110) | Move S5 to (545, 210, 35, 40) |
| F4 | HIGH | S7 floats outside building | Not present (or in alcove) | x=595 — outside x-max=580 outline | Delete OR relocate into alcove (490, 790, 50, 40) and add wall bump-out |
| F5 | MED | BC-2 fictitious | One continuous BC-1 along back wall | BC-1 + BC-2 (separate) | Extend BC-1 to h=350; remove BC-2 |
| F6 | HIGH | D7-D10 ghost row at top | D7-D10 face sales floor at BOH partition | Coded at y=25, leaving y=95-200 visual void | Move D7-D10 to y=200-270 (cascades from F1) |
| F7 | LOW | North wall fake notch | Straight north wall | Step from y=40 to y=15 at x=230 | Flatten to `M 80,15 L 540,15` |
| F8 | MED | SE chamfer + ICE inconsistency | Chamfer is the vestibule; ICE inside vestibule | Chamfer cuts through ICE rect | Move ICE to (440, 620); extend chamfer to L 530,660 L 530,1100 |
| F9 | LOW | SW corner step too sharp | Angled chamfer | Right-angle step | Diagonalize `L 105,1140 L 80,1115 L 80,1080` |
| F10 | LOW | S6 height too short | Full freezer-column height | h=90 (covers only F1) | Resize to h=290 |
| F11 | LOW | OC-1 vs FC-1 naming | "FC-1" in plan | "OC-1" in SVG | Rename SVG label or add glossary |
| F12 | LOW | D19/D20 not angled | Sit on chamfered wall (rotated ~22°) | Square rects | Apply `transform="rotate(-22 540 692)"` |

---

## Implementation notes

**Coordinate scale:** 1 SVG unit ≈ 0.33 inches; 1 ft ≈ 36 SVG units; 30" cooler door ≈ 90 units. Current fixtures are roughly to scale (D12 height 110 ≈ 36" width which matches architect proportions).

**Apply to BOTH plans:** All structural fixes (F1, F2, F4, F5, F6, F7, F8, F9) MUST be applied to both BEFORE plan (lines 4519-4772) AND AFTER plan (lines 4778-5062), because they share `outlinePath` (defined once at line 4457-4473) and both render fixture rects independently. The outline change affects both plans automatically. Fixture rect coordinate changes (D7-D10 y move, S5 relocation, BC-2 deletion, S7 relocation, ICE move) need to be edited TWICE — once per plan.

**Preserve click handlers:** The AFTER plan uses `${click("TAG")}` wrapping `<g>` blocks for each fixture. Any rect that gets moved must keep its surrounding `<g ${click("...")}>` wrapper and the corresponding label `<text>` elements. Coordinates of labels must move with the rects (label `text x` is usually `rect.x + rect.w/2`, label `text y` is `rect.y + 18` for header).

**Schedule A safety:** S2 / S2.5 / G3.5 / G4.5 / S5 / BC-2 are all referenced in the Schedule A removal list (lines 5067-5078). If BC-2 is deleted from the SVG entirely (per F5 Option A), the Schedule A row "BC-1 — Generic value spirits" still applies because it refers to the SKU mix on BC-1 itself, not BC-2. Removing BC-2 fixture only removes the "Sundries (REMOVE)" badge in the BEFORE plan — make sure scheduleA[5] ('S2 / S2.5 — Full-size HBA') still has visual representation in BEFORE plan. Currently S2 + S2.5 are both shown as `[REMOVE]` red rects in BEFORE plan at lines 4761-4765, that's fine.

**Recommended fix order (lowest blast radius first):**
1. F11 (rename) — pure label change, 0 layout impact
2. F12 (D19/D20 rotate) — single transform attribute
3. F10 (S6 resize) — one number change
4. F7 (north wall flatten) — one outlinePath edit
5. F9 (SW corner) — one outlinePath edit
6. F8 (SE chamfer + ICE) — outlinePath + one fixture move (×2 plans)
7. F5 (BC-2 → extend BC-1) — fixture changes (×2 plans)
8. F3 (S5 move) — fixture move (×2 plans)
9. F4 (S7 delete or relocate) — fixture deletion (×2 plans)
10. F6 (D7-D10 down) — coordinated with F1
11. F1 (BOH rooms + partition) — biggest structural addition
12. F2 (door swings) — last, decorative, after structure settles

**Backup before edits:** Per memory rule, copy `index.html` to `archives/index_pre_floorplan_fix_2026-05-03.html` before running any multi-fix script.
