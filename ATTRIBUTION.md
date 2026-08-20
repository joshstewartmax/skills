# Attribution

Most skills here are copied, and some are modified, from two upstream sets. Both are MIT licensed. Full license texts are in [`licenses/`](licenses/).

## pstack

By Lauren Tan (poteto). Source: https://github.com/cursor/plugins/tree/main/pstack

Nearly all skills in this repo come from pstack: `unslop`, `technical-writing`, `architect`, `arena`, `blast-radius`, `why`, `how`, `teach`, `recall`, `reflect`, `show-me-your-work`, `automate-me`, `figure-it-out`, `no-comments`, `bro`, and every `principle-*` skill.

### Changes from upstream

pstack targets Cursor. These copies are converted for Claude Code:

- Transcript paths point at `~/.claude/projects/<slug>/<uuid>.jsonl` (slug is the absolute workspace path with each `/` replaced by `-`), not Cursor's `~/.cursor/projects/.../agent-transcripts/`.
- Skill and plugin paths point at `~/.claude/skills` and `~/.claude/plugins`.
- Multi-model workflows (`arena`, `how` critics, `reflect` reviewers, `architect` runners) collapse to the single default model, since only one model is configured. Diversity now comes from parallel runs rather than different models. The `~/.cursor/rules/pstack-models.mdc` config layer is dropped.
- The Cursor `readonly` subagent flag is removed; subagents keep normal tool access and are told not to write as a posture.
- `AskQuestion` becomes `AskUserQuestion`; references to Cursor's built-in `create-skill` become the `skill-creator` skill.

Skills intentionally left out: `interrogate` and `setup-pstack` (multi-model only), `poteto-mode`, `swarm`, `tdd`, `create-verification-skill`, `maintain-verification-skill`, `typescript-best-practices`.

## mattpocock skills

By Matt Pocock. Source: https://github.com/mattpocock/skills

Copied verbatim (only the OpenAI `agents/` adapter files were dropped): `grill-me`, `grilling`, `grill-with-docs`, `domain-modeling`, `handoff`, `claude-handoff`, `prototype`.

## Original skills

`to-spec`, `to-tickets`, and `wayfinder` are written for this repo. They are lightweight takes on the mattpocock engineering skills of the same names: they produce local Markdown files and compose with `unslop`, with no issue tracker or setup step required.
