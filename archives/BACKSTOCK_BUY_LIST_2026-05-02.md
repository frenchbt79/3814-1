# Backstock — Master BUY / SKIP list for seller negotiation

**Date:** 2026-05-02
**Purpose:** This is the actionable shopping list. For each line item in the existing owner's backstock, decide BUY (transfers with the business sale) or SKIP (seller removes / clearance / leaves behind).
**Pricing note:** Wholesale costs below are placeholders pulled from the deck's tile data. Real distributor pricing will refine these — easily updateable when you have the live distributor packets back.

---

## Section 1 — Format-aware BUY rules (resolves the 23 ambiguous brands)

The deck has the same brand coded with different statuses depending on FORMAT. This is correct strategy — keep the bodega-friendly formats (12-pks, premium 6-pks), drop the volume-junkers (30-pks, 18-pks of value lager). Translated to BUY rules:

### Beer brands

| Brand | Format | BUY? | Logic |
|-------|--------|------|-------|
| **Bud Light** | 12-pk btl, 12-pk can, 24oz tallboy | ✅ BUY | Bodega anchor formats |
| Bud Light | 18-pk can, 12oz btl single, 30-pk | ❌ SKIP | Volume tier dropped |
| **Coors Light** | 12-pk can, 24oz tallboy | ✅ BUY | Anchor formats |
| Coors Light | 18-pk can, 30-pk can | ❌ SKIP | Volume tier (Schedule A) |
| **Coors Banquet** | 24oz can | ✅ BUY | Premium tallboy |
| Coors Banquet | 24oz tallboy (separate SKU) | ❌ SKIP | Duplicate format-tier |
| **Modelo Especial** | 12-pk btl, 12-pk can, 18-pk, 24oz, 4-pk btl, 12oz btl single, Variety 12-pk | ✅ BUY | Workhorse import — most formats keep |
| Modelo Especial | 12oz btl (loose case) | ❌ SKIP | Single-bottle format dropped |
| **Pacifico** | 12-pk btl, 24oz can | ✅ BUY | Premium import |
| Pacifico | 12oz btl (loose case) | ❌ SKIP | Loose-bottle format dropped |
| **Corona Familiar** | 12-pk btl | ✅ BUY | Anchor import |
| Corona Familiar | 12oz btl (loose) | ❌ SKIP | |
| **Victoria** | 12-pk btl, 12-pk can, 12oz can | ✅ BUY | |
| Victoria | 12oz btl (loose) | ❌ SKIP | |

### CSD / mixers

| Brand | Format | BUY? |
|-------|--------|------|
| **7UP Zero Sugar** | 12oz can, 2L bottle | ✅ BUY |
| **Pepsi** | 20oz bottle | ✅ BUY |
| Pepsi | 12oz can single | ❌ SKIP |
| **A&W Root Beer** | 12oz can, 2L bottle | ✅ BUY |
| A&W Root Beer | 20oz bottle | ❌ SKIP |
| **Dr Pepper Diet** | 12oz can, 2L bottle | ✅ BUY |
| Dr Pepper Diet | 20oz bottle | ❌ SKIP |

### Pure juice line (entire brand SKIP)

| Brand | Format | BUY? | Logic |
|-------|--------|------|-------|
| Pure (all flavors: Apple, Apple Cranberry, Fruit Punch, Lemon-Lime, Orange, Pineapple, Pink Grapefruit) | 15.2oz bottle | ❌ SKIP | Entire long-tail commodity juice line dropped per Schedule A |

### Hard seltzer / FMB

| Brand | Format | BUY? |
|-------|--------|------|
| Hard Mtn Dew | 24oz can | ❌ SKIP — no AFTER plan slot |

---

## Section 2 — Spirits (table-stakes for a liquor store)

The current deck doesn't enumerate the spirits library, but a Wrigleyville liquor store NEEDS spirits. Default rule: **BUY all spirits in the Downstairs Office**, with judgment calls on the value tier.

| Brand | Tier | Default | Notes |
|-------|------|---------|-------|
| **Tito's Handmade Vodka** | Anchor | ✅ BUY all formats | Top-3 vodka SKU in 60613 |
| **Patron Silver / Anejo** | Premium | ✅ BUY | Premium gifting tier |
| **Bombay Sapphire / Tanqueray** | Anchor gin | ✅ BUY | |
| **Bacardi (white/spiced)** | Anchor rum | ✅ BUY | |
| **Skrewball Peanut Butter Whiskey** | Anchor flavored whiskey | ✅ BUY | High-velocity Wrigleyville bar-fan SKU |
| **Fireball** | Anchor | ✅ BUY | Top-3 SKU in 60613 |
| **Tullamore Dew Irish** | Mid Irish whiskey | ✅ BUY | |
| **Maker's Mark** | Anchor bourbon | ✅ BUY | |
| **Malibu / Skyy / Kahlua** | Mid mixers | ✅ BUY | |
| **Southern Comfort / Seagram's VO** | Value | 🟡 REVIEW | Lower-tier but transfers with bar-fan demand |
| **Skol / Early Times / Gordon's / Seagram's** | Value-fighter | 🟡 REVIEW | Drop if you want a premium-positioning store, keep if you want price-anchor coverage |

**Recommendation:** BUY all anchor + mid tier. REVIEW the value-fighter shelf — for a Wrigleyville bodega-positioning, drop Skol/Early Times/Gordon's; for a price-anchor positioning, keep them.

---

## Section 3 — Revised backstock totals (resolved)

Applying Section 1+2 rules:

| Room | Total $ | BUY $ | SKIP $ | REVIEW $ |
|------|---------|-------|--------|----------|
| Basement (43 photos) | $30,820 | ~$8,400 | ~$2,200 | **$20,220** wine cellar pending walkthrough |
| Back Cooler (7) | $1,308 | $920 | $245 | $144 (cooler display SKUs) |
| Downstairs Office (4) | $2,984 | **$2,400** (was $0 REVIEW) | $0 | $585 value-fighter spirits |
| Kitchen 1F (4) | $760 | $290 | $215 | $255 (under-counter spirits, label-illegible) |
| Storage Back 1F (8) | $1,260 | $920 | $200 | $140 (Pom + Maison cider unmatched) |
| **TOTAL** | **$37,132** | **~$12,930** | **~$2,860** | **~$21,344** |

REVIEW ($21K, 57%) = essentially the basement wine cellar. Once you walk that physically, almost all of it will be classifiable.

---

## Section 4 — DECK BUGS for separate cleanup (informational)

These are real bugs in the deck (not buying decisions). 14 SKUs are coded with both `keep` AND `remove` on different doors, which makes the BEFORE/AFTER comparison inconsistent. Resolution is door-level (which door does this SKU live on in the AFTER plan).

| SKU + format | Conflict | Resolution proposal |
|--------------|----------|---------------------|
| AriZona Mucho Mango 23oz can | D5 = remove, D6 = keep | Move AriZona line to D5 (per AFTER plan label "Yerba + Tea + AriZona"). Drop D6 entries. |
| AriZona Half & Half 23oz can | Same conflict | Same |
| AriZona Watermelon 23oz can | Same | Same |
| AriZona Green Tea 23oz can | Same | Same |
| AriZona Fruit Punch 23oz can | Same | Same |
| Pure Apple Juice 15.2oz btl | Both keep + remove on D6 | Pure line entirely dropped — change all to `remove` |
| Pure Pineapple 15.2oz btl | Same | Same |
| Pure Lemon-Lime 15.2oz btl | Same | Same |
| Pure Apple Cranberry 15.2oz btl | Same | Same |
| Pure Fruit Punch 15.2oz btl | Same | Same |
| Pure Pink Grapefruit 15.2oz btl | Same | Same |
| 7UP Zero Sugar 12oz can | Both | Keep — drop the `remove` entry |
| Coors Light 18-pk can | 2 keep + 1 remove | Mostly keep — drop the lone `remove` entry |
| Hard Mtn Dew 24oz can | Both | Decide: in or out. Currently no AFTER home — recommend SKIP |

These cosmetic deck-cleanup edits would take ~15 min via Python script. Want me to ship them as Phase 7b after distributor pricing comes in?

---

## Section 5 — What to do with this document

1. **Use Section 1 + Section 2 as your seller-negotiation script.** Walk through with the existing owner: "I'll buy these 12-pks and 24oz tallboys at wholesale, but you'll need to remove the 30-pks and 18-pks before close."
2. **Walk the basement wine cellar with flashlight** — that resolves $20K of REVIEW. Re-shoot the legible bottles, re-run the audit.
3. **Confirm the value-fighter spirits decision** (Skol / Early Times / Gordon's / Seagram's VO — keep or drop?).
4. **When distributor packets come back with real wholesale pricing**, swap the placeholder $ values into Section 3's totals.

Once those 4 steps are done, I can build the actual Backstock slide for the deck with clean numbers.
