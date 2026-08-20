---
name: to-spec
description: "Turn the current conversation into a written spec as a local Markdown file. No interview, just synthesis of what you've already discussed. Use for /to-spec, \"write this up as a spec\", or \"turn this into a spec\"."
disable-model-invocation: true
---

# To spec

Synthesize what the conversation already settled into one spec file. This is not an interview. If the design still has open questions, run `grill-me` first, then come back here.

## Where it goes

Write one Markdown file. Match the repo's existing convention if it has one (look for `docs/`, `specs/`, `rfcs/`, or an `adr/` folder). Otherwise create `docs/specs/<short-kebab-name>.md` and say where you put it.

## What it contains

Write only what the conversation established. Do not invent scope, requirements, or decisions that were never discussed. Where something is genuinely undecided, say so under Open questions rather than guessing.

- **Problem.** What we're solving and why now. One paragraph.
- **Goals / Non-goals.** Bullets. Non-goals are what keeps the spec honest, so name them.
- **Approach.** The design that was agreed, at the level a reviewer needs to picture it. Name the real symbols, files, and data shapes discussed, not placeholders.
- **Decisions and trade-offs.** Each decision, the alternative rejected, and the reason. This is the part the code can't recover later, so it carries the most weight.
- **Open questions.** Anything left unsettled, each with who or what would resolve it.
- **Verification.** How we'll know it works: the test, the query, the observable end state.

## Rules

- One spec, one topic. Split if the conversation covered two.
- Write it through the `technical-writing` and `unslop` skills before you hand it back. Cut every word that does no work, one thought per sentence, plain words.
- State counts, paths, and symbols that are true at this commit.

**Reply:** the path you wrote, and the Problem plus Decisions sections inline so the user can react without opening the file.
