# skills

My personal set of Claude Code skills. Most are copied and adapted from [pstack](https://github.com/cursor/plugins/tree/main/pstack) (Lauren Tan) and [mattpocock/skills](https://github.com/mattpocock/skills) (Matt Pocock); a few are my own. See [ATTRIBUTION.md](ATTRIBUTION.md) for sources, licenses, and what I changed.

The theme is less code, higher quality: cut slop from writing, prove work against the real thing before calling it done, and keep the reasoning behind a change where the next reader can find it.

## Install

Clone, then link every skill into `~/.claude/skills` and every agent into `~/.claude/agents`:

```bash
git clone https://github.com/joshstewartmax/skills ~/repos/skills
cd ~/repos/skills
./install.sh
```

`install.sh` symlinks each skill and each agent, so edits in the repo take effect immediately. Re-run it any time you add one. It backs up any real path it would overwrite to `<name>.bak`.

## What's here

### Writing and communication
- **unslop** cuts AI tells from any writing. Most other skills run it as a final pass.
- **technical-writing** a layered standard (Diataxis, Google developer style, ASD-STE100 Simplified English, Global English) for docs, RFCs, readmes, PR descriptions, and commits.
- **teach** explains a body of work plainly, weaving in `how` and `why`.
- **bro** restates the last message in plain language, no jargon.

### Understanding a codebase
- **how** explains how a subsystem works: runtime flow, architecture, onboarding mental models.
- **why** explains why it's shaped this way, querying source control, tickets, docs, chat, observability, and analytics in parallel.
- **recall** rebuilds where you left off from your own transcripts and the shared record, and hands back a tight brief.

### Design and planning
- **architect** sketch types, signatures, and module structure first, get sign-off, then stay in the loop.
- **arena** spawn N candidates for one artifact, pick a base, graft the best parts of the losers in.
- **prototype** throwaway code to answer one design question (a logic demo or UI variants).
- **grill-me** / **grilling** / **grill-with-docs** a relentless interview that stress-tests a plan before you build (the docs variant also writes ADRs and a glossary).
- **domain-modeling** build and sharpen the project's domain model and glossary.
- **to-spec** turn the conversation into a spec Markdown file.
- **to-tickets** break a plan into tracer-bullet ticket files, each declaring what blocks it.
- **wayfinder** plan work too big for one session as a map of decision files, resolved one at a time.

### Verification and review
- **blast-radius** find what a change breaks beyond the diff, then prove the one safety fact by running code.
- **no-comments** strip comments that restate the code, and encode real constraints in structure instead. Spawns the **Comment Sicko** agent (in `agents/`) to hunt them.
- **show-me-your-work** keep a reviewable decision log for long or unattended runs.
- **reflect** review the active transcript with parallel critics and route each lesson to a skill edit.

### Working context
- **handoff** compact the conversation into a handoff document.
- **claude-handoff** hand off to a fresh background agent that picks the work up immediately.
- **automate-me** capture your working style into a personal `-mode` skill from recent transcripts.
- **figure-it-out** an auditable playbook for large migrations and ambitious multi-part changes.

### Principles
Twenty-one one-page principle skills that the skills above lean on: `prove-it-works`, `laziness-protocol`, `subtract-before-you-add`, `minimize-reader-load`, `guard-the-context-window`, `build-the-lever`, `fix-root-causes`, `sequence-verifiable-units`, `encode-lessons-in-structure`, `make-operations-idempotent`, `separate-before-serializing-shared-state`, `migrate-callers-then-delete-legacy-apis`, `model-the-domain`, `foundational-thinking`, `boundary-discipline`, `type-system-discipline`, `exhaust-the-design-space`, `redesign-from-first-principles`, `outcome-oriented-execution`, `experience-first`, `never-block-on-the-human`.

## A note on the model

The pstack skills were built for multi-model workflows. This set runs on a single default model, so `arena`, `reflect`, `how`, and `architect` get their diversity from parallel runs of one model rather than from different models. `interrogate` and `setup-pstack` are left out for the same reason.
