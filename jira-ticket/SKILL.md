---
name: jira-ticket
description: Write or create Jira tickets (stories, tasks, bugs) in my ticket format, a repo-tagged active-voice title, brief context and acceptance criteria. Use whenever drafting a Jira ticket, creating one through the Atlassian tools, or splitting work into tickets under an epic.
---

# Jira ticket

Every ticket uses this format:

```
[<repo name>] <title in active voice>

<brief context and why this ticket is needed>

## Acceptance criteria:
- <ac_1>
- <ac_2>
- ...
```

The first line is the ticket's summary. Everything after it is the description.

## Title

- `<repo name>` is the repository the work lands in, as named on GitHub, for example `[bce-mcp]` or `[infrastructure-as-code]`.
- Write the title as an imperative action: "Grant the eval service principal write access to the eval set schema", not "Eval set permissions".
- Work that touches two repos is two tickets, one per repo. Say in each which one has to land first.

## Context

A few sentences a teammate can act on without the conversation that produced the ticket:

- What is true today, and why that's a problem.
- What this ticket changes, at the level of outcomes.
- Dependencies and ordering on other tickets or repos.
- A link to the PR, design doc or thread when one exists.

No implementation detail that belongs in the code or the PR.

## Acceptance criteria

- Each criterion is an observable outcome someone could check, not a step to perform.
- Name the concrete thing: the principal, schema, command, file or behaviour.
- Include what must not change when that's a real risk, for example "No other principal's grants on the schema change".
- Keep the heading exactly `## Acceptance criteria:`.

## Creating it in Jira

1. Read the epic or parent first to get the project key and to confirm it exists.
2. Default the issue type to Story unless the user names another.
3. Set the parent to the epic, and pass the description as Markdown.
4. Read one created ticket back to confirm the parent was set.
5. Reply with each ticket's key, linked, and its title.

Run `unslop` over the text before creating the ticket.
