# Custom skills — 3814 Bodega Repositioning project

Four expert skills tuned for this project (and reusable for similar work):

| Skill | Triggers | Use for |
|-------|----------|---------|
| **food-beverage-planner** | "what should we stock", "category mix", "SKU selection", "wholesale pricing", "margin strategy", "distributor packet", "beverage wall", "snack aisle", "wine reset" | Retail F&B assortment, distributor mix, pricing, margin engineering, demand forecasting |
| **architect** | "floor plan", "Revit", "AutoCAD", "BIM", "code compliance", "egress", "ADA", "fixture layout", "tenant improvement", "space planning" | Healthcare, education, retail/hospitality TI work; Revit/Dynamo automation; code analysis |
| **app-developer-designer** | "build an app", "web dashboard", "HTML page", "mobile responsive", "iPhone version", "professional UI", "sidebar collapse", "drag and drop", "interactive deck" | Single-file web apps, dashboards, decks, mobile-responsive UI, drag-and-drop, localStorage patterns |
| **planogram-expert** | "planogram", "shelf layout", "facings", "SKU placement", "cooler door", "gondola", "endcap", "shelf-by-shelf", "facing count", "fixture elevation", "BEFORE / AFTER plan" | Retail shelf layouts, fixed-scale rendering, facing optimization, category adjacency, repositioning workflows |

## How to install

These are stored locally in this project's `skills/` folder. To use them as Claude skills (so they auto-trigger in Claude / Cowork):

### Option A — Manual copy

1. Copy each subfolder into your Claude user-skills directory:
   ```
   C:\Users\bfren\AppData\Roaming\Claude\local-agent-mode-sessions\skills-plugin\<session-id>\<workspace-id>\skills\user\
   ```
   (The exact path varies — check your Claude installation.)

2. Restart Claude or run `/skills` to refresh.

### Option B — Reference in conversation

Even without installing, you can paste the SKILL.md content into a Claude conversation and say "use this skill". Claude will follow the instructions for that turn.

### Option C — Project-scoped

Drop the `skills/` folder into any project's root and reference it in your project instructions ("Use skills from `skills/<name>/SKILL.md` when relevant").

## Authoring conventions

Each SKILL.md follows the standard frontmatter + content format:

```markdown
---
name: skill-name
description: When to use this skill — include trigger phrases that match user intent.
---

# Skill body
- Instructions, principles, frameworks
- Specific examples and references
- "When to use" / "When NOT to use" boundaries
```

## Updating these skills

These are living documents. As you learn what works in your projects, edit the relevant SKILL.md and:
1. Add new categories / playbooks / patterns under existing sections.
2. Add to the trigger phrases in the description (improves auto-routing).
3. Add a "Common pitfalls" section if you keep hitting the same problems.

The goal: each skill should encode 1–3 years of your hard-won expertise so Claude can give you advice as good as your own.
