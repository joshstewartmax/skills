---
name: to-tickets
description: "Break a plan, spec, or the current conversation into tracer-bullet tickets as local Markdown files, each declaring the tickets that block it. Use for /to-tickets, \"break this into tickets\", or \"turn this plan into tickets\"."
disable-model-invocation: true
---

# To tickets

Break the work into **tracer-bullet** tickets: thin vertical slices that each ship something end to end, not horizontal layers you can't test alone. Write them as local Markdown files. No issue tracker required.

## Where they go

One file per ticket. Match the repo's convention if it has one; otherwise create `docs/tickets/` and write `NNN-<short-kebab-name>.md`, numbered in a sensible build order. Say where you put them.

## Gather context first

Work from what's already in the conversation. If the user points at a spec file or a prior plan, read it in full first. Explore the codebase enough that ticket titles use the real symbols, files, and domain words, not invented ones. Look for a cheap prefactor that makes the later slices easy, and make it its own early ticket: make the change easy, then make the easy change.

## Each ticket file

```
# <NNN>: <imperative title naming the real thing>

**Blocked by:** <NNN, NNN or "none">

## Outcome
One or two sentences: the observable end state when this ticket is done.

## Slice
What this ticket changes, end to end. Name the files and symbols. Keep it to the thinnest cut that stands on its own.

## Verify
The test, query, or observable behavior that proves this slice works.
```

## Rules

- Every ticket ends in a verifiable state. If you can't write the Verify section, the slice is wrong: resplit it.
- Declare blocking edges explicitly in **Blocked by**. A ticket with no edges can start now.
- Prefer three slices that each ship over one that does everything and one that can't be tested.
- Write every ticket through the `unslop` skill. Plain titles, one thought per sentence.

**Reply:** the list of ticket files you wrote, each as `NNN title (blocked by ...)`, in build order.
