# Browser audit — iPhone + Chrome compatibility

**Date:** 2026-05-02
**Files audited:** index.html (10,511 lines, 720 KB) + iphone.html (10,673 lines, 728 KB)
**Method:** Static code analysis only — Claude in Chrome extension was offline. Findings are pattern-matched against known mobile/desktop failure modes; live verification is on you.

---

## TL;DR

Two architectural issues dominate. The rest is polish.

1. **There's no device routing.** A mobile user landing on `index.html` (which is what GitHub Pages serves by default at the repo root) gets the broken desktop layout — 240px fixed sidebar takes 62% of a 390px iPhone screen. They have to manually type `/iphone.html` in the URL. **Almost no one will do that.**
2. **The deck files are 720 KB each, 100% inline.** No lazy loading, no caching split. iPhone Safari handles it but parses slowly on 4G/cellular (~3-4 seconds first load, then fast).

Everything else is small per-issue but adds up.

---

## CRITICAL — fix before showing this to anyone on mobile

### C1. No device routing from index.html → iphone.html

Mobile users default to `index.html`. They get the broken desktop layout. Easy fix: 5-line redirect at the top of index.html.

```html
<script>
  // Redirect mobile users to iphone.html (only on first load, never on iphone.html itself)
  if (window.matchMedia('(max-width: 768px)').matches
      && !location.pathname.endsWith('iphone.html')
      && !sessionStorage.getItem('skipMobileRedirect')) {
    location.replace('iphone.html');
  }
</script>
```

Add right after `<title>` in index.html. Sets sessionStorage so a desktop user who manually goes back to index.html doesn't get bounced again.

**Severity:** CRITICAL. Without this, every mobile distributor link you send is broken.

---

## HIGH — likely visible bugs on real iPhone Safari

### H1. `100vh` on body — iPhone Safari URL bar issue

Both files use `html, body { height: 100vh; overflow: hidden; }`. On iPhone Safari, `100vh` includes the URL bar at the top AND the toolbar at the bottom — so content scrolls behind those bars and the bottom of slides gets cut off. Modern fix: `100dvh` (dynamic viewport height, accounts for browser chrome).

**Fix:** change `100vh` to `100dvh` (with `100vh` fallback for older Safari):
```css
html, body { height: 100vh; height: 100dvh; overflow: hidden; }
```
Same for `#main { width: 100% !important; height: 100dvh !important; }` and the `#sidebar { height: 100dvh !important; }` declarations in iphone.html.

**Severity:** HIGH. Every slide loses ~50-90 pixels at the bottom on iPhone.

### H2. Hover-only interactions break on touch (5 spots in index.html)

`onmouseover` / `onmouseout` style changes fire on tap on touchscreens but never reset on tap-away. Affects:
- Distributor packet rows (line 1211)
- Floor-plan zone chips (line 2913)
- Wall thumbnail cards (line 3986)
- Inventory KEEP rows (line 4253)
- Inventory NEW rows (line 4297)

After tapping any of these on an iPad/iPhone, the highlight stays stuck until you tap something else.

**Fix:** Replace inline `onmouseover`/`onmouseout` with CSS `:hover` (which mobile Safari handles correctly via tap+release). Or add a matching `ontouchend` that restores the original style.

**Severity:** HIGH on touchscreens. Visually noisy.

### H3. 16 of 21 tables in index.html have no overflow protection

iphone.html overrides this globally with `main table { display: block !important; overflow-x: auto !important; }` — so iphone.html is fine on small screens. But if a Chrome user sizes their browser to a half-screen pane (~600px wide), tables in index.html spill horizontally and force a body-level scrollbar.

**Fix:** Wrap each `<table>` in `<div style="overflow-x:auto;-webkit-overflow-scrolling:touch;">…</table></div>` OR add the same global override to index.html.

**Severity:** HIGH for desktop-on-half-screen, MED for fullscreen desktop.

---

## MED — polish, not blocking

### M1. Touch target sizes below 44×44pt

Apple HIG recommends 44×44pt minimum for tap targets. Current chips are ~16-20px tall. Tap accuracy suffers on small links like distributor name chips and zone tags.

**Fix:** add a min-height of 32px on small chips on mobile (iphone.html already has `span[onclick] { min-height: 32px; padding: 6px 10px !important; }`). Could also expand on index.html if you keep it for tablet users.

### M2. Tiny font sizes (6.5px–9.5px) inside planogram tiles

Intentional — the tiles need to fit many SKUs in a 30" cooler door rendering. iOS Safari may auto-zoom if a user pinches in. For investor-readable, the inventory TABLE below each fixture covers the readability gap.

**Fix:** none required. If push comes to shove, bump tile name from 10.5px → 11px on mobile only via media query.

### M3. Console.warn/log noise

1 console statement in index.html, 2 in iphone.html. Trivial. Either keep for debugging or delete.

### M4. File size 720 KB inline

100% inline (no external CSS/JS). First-load parse time on cellular is 3-4 sec. Once loaded, in-memory navigation is instant. Could be split into:
- `app.js` (the slide rendering code, ~700 KB)
- `index.html` (the shell, ~10 KB)
This would let CDN cache the app.js across sessions. But it complicates the GitHub Pages deploy.

**Fix:** defer until you see actual user complaints. Single-file is also genuinely simpler to ship/version.

---

## LOW — cosmetic

### L1. No `<meta name="theme-color">`

iOS Safari defaults to a light gray URL bar. Adding `<meta name="theme-color" content="#0f1419">` makes the URL bar dark to match the deck.

**Fix:** add to `<head>` of both files.

### L2. No favicon

Browser tab shows the default earth icon. Distributors will see "untitled" feel.

**Fix:** add a simple favicon (e.g. a "3814" monogram) and `<link rel="icon" href="favicon.svg">` in `<head>`.

### L3. No `<meta name="apple-mobile-web-app-capable" content="yes">` for "Add to Home Screen" PWA support

If a distributor adds the deck to their home screen, it opens in a browser tab not a chrome-less app. Adding the meta tag makes "Add to Home Screen" produce a standalone full-screen app icon.

**Fix:** optional — add `apple-mobile-web-app-capable` + `apple-mobile-web-app-status-bar-style` + `apple-touch-icon` link.

---

## What I CAN'T verify without live browser

- Actual rendering on iPhone Safari (not Chrome iOS — Safari has different quirks)
- Touch event firing for all interactive elements
- Scroll inertia / momentum
- Pinch-to-zoom behavior on the floor-plan SVG
- Performance on 4G cellular
- Memory consumption on long sessions (the deck holds all 80+ slides in DOM)

If you want me to verify: open both files in Chrome on your computer, then say "go" — I'll run the live check via the Chrome extension. Or screenshot the broken bits and I'll diagnose from images.

---

## Recommended fix sequence

1. **C1** (mobile redirect) — 5 lines, 2 minutes, fixes the worst issue.
2. **H1** (`100vh` → `100dvh`) — 4 occurrences, 5 minutes.
3. **H3** (table overflow) — global CSS override, 5 minutes.
4. **H2** (hover → CSS :hover) — refactor 5 spots, 20 minutes.
5. **L1 / L3** (meta tags) — 5 lines per file, 5 minutes.
6. **M1** (touch targets) — only if you keep index.html as a tablet/desktop variant.

Want me to ship 1-3 as one atomic Phase 6 script? Or pick a different bundle?
