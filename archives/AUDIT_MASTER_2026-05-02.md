# 3814 N Clark — BEFORE Inventory Master Audit

**Date:** 2026-05-02
**Source:** 5 parallel agent reviews of 163 photos in `Existing Busines Photos/`
**Detail files:**
- `audit_D1-D3_2026-05-02.md`
- `audit_D4-D6_2026-05-02.md`
- `audit_D7-D14_2026-05-02.md`
- `audit_D15-D22_G1_2026-05-02.md`
- `img_triage_2026-05-02.md`

---

## TL;DR — This is bigger than "empty shelves"

The user's premise was: "the deck shows empty space where actual product exists." That's true in some places (D6 Pure juice wall, D4 SH 5). But the audit surfaced **three structural problems** that dwarf the merchandising gaps.

---

## 1. WHOLE-WALL CATEGORY MISMATCH — D7-D10 are BEER, not wine

The deck codes D7-D10 as "Chilled Wine Program":
- D7 Sauv Blanc / Pinot Grigio / Albariño
- D8 Whispering Angel / Miraval rosé
- D9 Prosecco / Cava
- D10 Pol Roger / Billecart Champagne

**Photos prove these doors are all packaged BEER and FMBs** (Heineken, Coors, Modelo, Bud Light, Schlitz, IPAs, Twisted Tea, Pabst, Lagunitas, Spaten). Door numbers "7", "8", "9", "10" are physically stenciled on the glass — there's no ambiguity.

The user's anchor claim "D9 has 9 Pure bottles full width" is **denied** by the photos. Door 9 shows craft IPA / macro-bottle 12-pks. Pure juice lives on D6 (left wall).

**Implication:** Either the deck's wine program needs to move to a different door set (which doors?), or the AFTER plan needs to repurpose D7-D10 from beer to wine — which is a major repositioning thesis change, not just a label fix.

---

## 2. G4 IS A PHANTOM FIXTURE — there is no 4th gondola

The deck has 4 gondolas (G1, G2, G3, G4). Photos show **only ~2 main 12-ft gondolas** on the sales floor:
- One snack / soda gondola (G1+G2 in the deck)
- One pantry / sundries gondola (G3 in the deck)

**G4 "Curated Wine 220-SKU reset" doesn't exist in this store.** Wine actually lives on the warm BC-1 back wall (IMG_1026-1031).

**Implication:** the entire G4 deep-dive slide, the G4.5 endcap, the floor plan G4 rectangle, the master fixture sheet G4 line — all phantom. The 220-SKU curated wine reset is the centerpiece of the BREAKTHRU distributor pitch, so this isn't a cosmetic fix.

There is also an uncataloged "Chill"-branded locking liquor/champagne cooler visible in IMG_1048-1049 that may be where premium wine actually goes.

---

## 3. AFTER-state SKUs are leaking into BEFORE — bug across ~half the doors

Multiple doors have `status:'new'` SKUs coded inside `beforeShelves`. The BEFORE pane is supposed to show ONLY existing/legacy inventory — `new` tiles are aspirational and shouldn't render there.

**Confirmed leaks:**
- D3: Alani Nu ×4, Ghost Energy ×3, Prime Hydration ×3, Smartwater Alkaline, Voss, Liquid Death sparkling, Liquid Death 1L, Mountain Valley Spring
- D4: La Colombe, Vita Coco (also missing Nesquik that IS present)
- D6: Pure juice wall gutted, Suja, Bolthouse, Naked, Evolution Fresh, POM, Welch's all leaking in
- D15: Cutwater / Onda / Lone River are AFTER plan, not BEFORE actual
- D19/D20: Domaines Ott / grower champagne are AFTER plan; actual is Cupcake / Barefoot / Coppola / Joel Gott
- G1: Siete / Hu / Chomps / Tony's are AFTER plan; actual is Lay's / Doritos / Pringles / Tostitos / Pure / 2L PETs

**Implication:** the BEFORE/AFTER comparison narrative — the core argument of the deck — is quietly broken. Distributor reviewers seeing "BEFORE" today are seeing partial-future state, which makes the "look how much we're upgrading" story collapse.

---

## 4. Smaller per-door findings (real but secondary)

| Door | Issue | Severity |
|------|-------|----------|
| D1 | Largely accurate; minor right-edge cleanup on SH 5 | Low |
| D2 | SH 5 + SH 4 are 40-50% empty in reality but coded full (Boylan, Stewart's not visible) | Med |
| D3 | Missing Monster Original on SH 5 (3 facings visible left-anchor) | Med |
| D4 | Phantom Pepsi tile coded as `remove`; SH 5 missing 6 facings (Nesquik, Vita Coco, La Colombe) | Med |
| D5 | SH 4 mis-categorized as Pure Leaf — actually Electrolit/AriZona/Gatorade Zero | Med |
| D6 | Pure juice wall gutted (8-10 facings real → 7 single facings coded); missing Simply Lemonade, Mott's, Philadelphia, Land O Lakes, Colby Jack | High |
| D7-D10 | Coded as wine; actually beer (see Issue #1) | **Critical** |
| D11 | Largely accurate (functional bev) | — |
| D12 | Largely accurate (fresh food) | — |
| D13-D14 | Beer singles / RTD — broadly accurate | Low |
| D15 | Singles + 4-pks: domestic (Bud, Corona, Stella, Modelo, Heineken, Surfside) NOT Cutwater/Onda/Lone River | High |
| D16 | High Noon dominant + Sun Cruiser + WYNK Delta-9 + Plift — broadly correct (Phase 2 NEW) | Low |
| D17/D18 | Top 2 shelves Chandon/Prosecco bottles missing from code; bottom 3 White Claw/Truly/Vizzy/Topo Chico — partial | Med |
| D19/D20 | Bargain whites under Coors Light shelf-talker — NOT premium grower champagne | High |
| D21 | Red Bull DSD — accurate, just add Pink/Peach/Yellow/Coconut/Black Editions | Low |
| D22 | Poppi top, Monaco mid, Senorita bottom; SH 4 has ~12" empty right; no BeatBox/BuzzBallz | Med |
| G1 | Mainstream chips + 2L PETs + 12-pk floor slabs — NOT BFY snacks (see Issue #3) | High |

---

## What needs the user's decision before any code touch

1. **D7-D10 reality is beer.** Does the AFTER plan need to repurpose these doors from beer to wine, or does the wine program move to a different door set?
2. **G4 doesn't exist.** Drop G4 from the floor plan + slides entirely, or reframe G4 as "BC-1 wine wall extension" so the BREAKTHRU wine pitch still has a home?
3. **AFTER → BEFORE leakage** is fixable by data-only edits (move `status:'new'` tiles out of beforeShelves arrays), but reveals a code-organization problem worth a one-time cleanup.
4. **Re-shoot G1 left 4 ft (G1A section)** — current photo cuts off the south end of the gondola.

Once the strategic calls are made on items 1 and 2, the remaining per-door fixes (4) are routine atomic edits via the existing Python-script pattern.
