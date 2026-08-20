---
name: wayfinder
description: "Plan a chunk of work too big for one session as a local map of decision tickets, then resolve them one at a time until the way to the destination is clear. Use for /wayfinder, \"plan this big piece of work\", or work that won't fit in one agent session."
disable-model-invocation: true
---

# Wayfinder

For work too large to hold in one session: instead of planning it all up front, lay out a **map of the decisions** that stand between here and the destination, then resolve them one at a time. Each resolved decision sharpens the map and often reveals the next one. Local Markdown, no tracker.

Reach for this when the work spans many sessions or the shape isn't knowable yet. For work you can already slice, use `to-tickets` instead.

## The map

One directory, one file per decision. Create `docs/wayfinder/` (or match an existing convention) with:

- `MAP.md`: the destination in one paragraph, then a table of every open decision with its status (`open`, `resolved`, `blocked`) and what it blocks.
- `NNN-<decision>.md`: one file per decision.

## Each decision file

```
# <NNN>: <the decision, as a question>

**Status:** open | resolved | blocked
**Blocks:** <NNN, NNN or "the destination">

## Why this is on the path
What about the destination forces this decision.

## Options
The real alternatives, each with its trade-off. Name code, files, and data shapes.

## Resolution
Empty until resolved. Then: what was decided, why, and what it opened up.
```

## The loop

1. Write the destination and the decisions you can already see into `MAP.md`.
2. Pick the frontier: a decision whose prerequisites are all resolved. If a decision needs a fact from the code or environment, find it yourself (dispatch a subagent); don't guess and don't block the whole map on it.
3. Resolve it. Where a decision is genuinely the user's to make, put the options to them through `grill-me` and wait. Write the Resolution.
4. Update `MAP.md`. A resolved decision usually surfaces new ones: add them.
5. Repeat until every decision is resolved and the path to the destination is clear. Then hand off to `to-tickets`.

## Rules

- Never mark a decision resolved without writing down why and what it opened.
- Keep `MAP.md` the single source of truth for status. Don't let it drift from the decision files.
- Write every file through the `unslop` skill.

**Reply:** the destination, and the current `MAP.md` decision table with statuses.
