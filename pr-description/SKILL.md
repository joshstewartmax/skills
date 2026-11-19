---
name: pr-description
description: Write or revise a pull request description (PR body) in the user's preferred style. Open with the gist, then carry only what a colleague can't get from the diff, the linked ticket, or CI. Use whenever drafting, editing, or reviewing a PR description.
---

# Writing PR descriptions

A PR description carries what a colleague cannot get from the diff, the linked ticket, or CI. They scan it before they read it, so the first two sentences have to work alone.

## Shape

Open with one or two plain sentences, before any heading, that say what changes and why. Someone who stops reading there should still know what the PR is for.

Scale the rest to the PR:

- A small change gets the opening sentences and nothing else.
- A larger one adds only the sections that have something to say, in this order: Why, What, Trade-offs, Verification, Reviewer notes.

Omit a section that would be empty. Never write "Trade-offs: none" or "Verification: n/a".

Make it easy to scan:

- Use bullets for parallel items, one line each.
- Keep paragraphs to about three lines.
- Link the ticket instead of retelling its context.
- Use words the colleague already knows. A name you coined while working means nothing to them.

## Sections

- **Why.** The problem, plus context a reader can't infer from the code, such as how the change fits a larger effort or why it's sequenced or branched this way. Skip it when the opening sentences already cover it.
- **What.** A behavioural summary at the level of outcomes, not mechanics.
- **Trade-offs.** Only the ones that pass the test below.
- **Verification.** Only checks that ran outside CI, and known gaps.
- **Reviewer notes.** What needs careful eyes, and anything someone must do around the merge, such as run a migration, flip a flag, or deploy in a set order.

## Cut what the diff shows

- **Restated implementation.** If a "decision" describes what the code is ("the wrapper is thin", "X is derived from Y", "the field excludes Z"), cut it.
- **Design narration.** Why the code is structured the way it is, unless it's a trade-off that passes the test below.
- **Per-test narration.** What an individual test asserts is in the diff.
- **Mechanics.** Function names, field names, variable names, file layout.

## Trade-offs

Default to none. Include a trade-off only when one of these holds:

- A reviewer would plausibly ask "why not X?"
- Someone pays the accepted cost after merge, such as an operator, a user, or the next developer.

State the alternative and the cost in a line or two.

- Keep: "Capped at N passes rather than running unbounded. A pathological input stops short instead of pinning a cluster, and the coverage gate catches it."
- Cut: "Outstanding excludes quarantined rows." That is what the code does. Nobody weighed an alternative.
- Cut: "Used a dataclass rather than a dict." A real choice, but no reviewer would question it and nobody pays for it later.

## Verification

CI runs on every PR and the reviewer can see its result, so don't restate it. "Unit tests pass", "added tests for X", and "lint is clean" all go.

Include only checks that ran outside CI:

- "Ran the job on Databricks to confirm it executes in that environment."
- "Smoke-tested a pinned-version backfill in staging."
- "Reproduced the bug on main, then confirmed the fix against the same input."

Name the type of check and where it ran, not the scenarios it covered. A real run in the target environment is often the most valuable line in the description, because nothing in the code records it.

Label checks for what they are. A run on dummy data on your own machine is not "end-to-end".

Report a known gap in one line when a reviewer would otherwise assume it was covered: "Not run against production-sized data."

If CI covers everything, leave the section out.

## The test for every line

Ask whether the reviewer could get this from the diff, the linked ticket, or CI.

- If yes, cut it.
- If no, keep it. That covers why the change exists, a trade-off that passes the test above, a check that ran outside CI, and what the reviewer must do.

A reviewer's time is the scarce resource.
