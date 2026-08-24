---
name: final-draft
description: Edit text so it reads as if the current understanding was the plan from
  the start, with no trace of the edits or the conversation that produced it.
---

# Final draft

Text that grows through edits or a conversation keeps a record of its own history:
corrections to earlier versions, points bolted on in brackets, sections that exist
only to note what changed. A reader who wasn't there sees a document arguing with a
draft they never read. Edit it so the history is gone and only the destination remains.

## The test

A first-time reader should not be able to reconstruct an earlier version from what's
left. If a sentence only makes sense as a reaction to a previous draft, state the
current point directly instead, or cut it.

## Process

1. Read it as someone with no memory of how it was written.
2. Find every place that reacts to a prior version instead of stating the current one.
3. Rewrite from the current understanding, as if it was the plan all along.
4. Rebuild headings and structure to match what the text now says, not what it used to.
5. Self-audit: can I still reverse-engineer an earlier draft? Does anything argue with
   a claim the reader never saw?

## Patterns to detect and fix

1. **Corrective framing.** "This is not a new capability, just reliability", "X is not
   a gate but a boost", "rather than", "actually". The text negates a claim the reader
   never saw. Fix: state what it is. "The semantic layer improves reliability."

2. **Bolt-on brackets.** A title or sentence kept whole with the real point appended in
   brackets: "Query own data (reliability climbs)". The bracket usually holds the key
   point. Fix: fold it into the main statement and delete the bracket. "Reliability over
   Codat's own data."

3. **Decision-log residue.** Sections like "Open decisions (resolved)", "Note:",
   "Update:", "As we clarified". These record the conversation, not the subject. Fix:
   delete the section, move any live content to where it belongs, drop the history.

4. **Superseded scaffolding.** Old headings or ordering left in place after the content
   moved on, so the skeleton fights the body. Fix: rebuild the structure around the
   current model.

5. **Pre-emptive rebuttal.** "It might seem like X, but", "one could argue, however".
   Answering an objection that only came up while drafting. Fix: cut it unless a
   first-time reader would genuinely raise it.

6. **Over-emphasis on the last correction.** Stressing the freshly-corrected point
   harder than its weight ("this is really just reliability"). To a new reader the
   emphasis is out of proportion. Fix: give it normal weight.

7. **Process and time words.** "now", "originally", "previously", "we've updated", "on
   reflection", "it turns out". These mark a before and an after. Fix: delete, and write
   in the plain present.

8. **Duplicate points from merged passes.** The same idea stated twice in slightly
   different words because two drafts both made it. Fix: keep the clearest one.

## When not to apply

Some documents exist to record history: changelogs, migration notes, architecture
decision records, postmortems, commit messages, release notes. There the before-and-
after is the content. Leave it.
