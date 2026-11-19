---
name: pr-description
description: Write or revise a pull request description (PR body) in the user's preferred style — carry only what the code can't tell the reader (the genuine why and real trade-offs), never restating what the diff already shows. Use whenever drafting, editing, or reviewing a PR description.
---

# Writing PR descriptions

A PR description should carry only what a reviewer **cannot recover by reading the code**. Its value is the non-recoverable context — not a summary of the diff. Clean, self-documenting code means the description never needs to re-explain the implementation.

## Default structure

Three sections, all tight:

- **Why** — the purpose, and any context a reader can't infer from the code: what problem it solves, how it fits a larger effort, why it's sequenced or branched the way it is.
- **What** — a short, behavioural summary at the altitude of outcomes, not mechanics.
- **Verification** — the *types* of checks run and the environments they covered (see below).

Add a trade-off note when there is a genuine one (see below).

## Cut anything the diff already shows

- **Restated implementation.** If a "decision" just describes what the code is ("the wrapper is thin", "X is derived from Y", "the field excludes Z"), cut it. The reader gets that from the diff.
- **Per-test narration.** Don't describe what an individual test asserts — that's in the diff. (Do include a Verification section, but pitched at the level of *types* of checks — see below.)
- **Mechanics** — function names, field names, variable names, file layout. The reader will see them.

## Real trade-offs vs. restatements

Only call something a decision or trade-off if there was a genuine fork where the path *not* taken had a cost you accepted. State the alternative and the cost.

- Real: "Capped at N passes rather than running unbounded — a pathological input stops short instead of pinning a cluster, and the coverage gate catches it." (Alternative = unbounded; cost = a hung cluster.)
- Not real: "Outstanding excludes quarantined rows." (Just what the code does — no alternative weighed.)

## Verification

Always include a short verification section, but pitch it at the level of the *type* of check and the environment it ran in — not the scenarios covered, and not what any single test asserts. Lead with anything verified outside the diff; that's what a reader genuinely cannot recover from the code.

Right altitude:
- "Local unit tests over dummy data using local Spark."
- "Ran the job directly on Databricks to confirm it executes in that environment."
- "Smoke-tested a pinned-version backfill in staging."

Too low (cut):
- Listing the cases covered: "...under each condition — clean convergence, quarantined rows, the pass bound."
- Narrating a test: "the stop test feeds four sweeps and asserts the loop ran three times."

Also watch the labels: a test running locally on dummy data is a unit test, not "end-to-end".

A real run in the target environment, a manual backfill, or a load test is often the most valuable line in the whole description — the code can't tell the reader any of it.

## The test for every line

Ask: *could the reviewer get this by reading the diff?*

- **Yes** → cut it — *except* the Verification section, where a one-line summary of the test types earns its place and the out-of-diff checks belong.
- **No** (why it exists, why it's structured this way, a trade-off and its cost, how it was verified beyond the committed tests) → keep it.

Keep it human and brief. A reviewer's time is the scarce resource.
