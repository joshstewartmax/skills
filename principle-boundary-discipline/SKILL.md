---
name: principle-boundary-discipline
description: "Apply when wiring validation, error handling, or framework adapters. Concentrate guards at system boundaries (CLI, config, network, external APIs); trust internal types and keep business logic in pure functions."
disable-model-invocation: true
---

# Boundary Discipline

Place validation, type narrowing, and error handling at system boundaries. Trust internal code unconditionally. Business logic lives in pure functions; the shell is thin and mechanical.

**Why:** Scattered validation is noisy, redundant, and gives a false sense of safety. Validate data once at the boundary. Keep logic out of framework wiring so it can be tested without the framework.

**The pattern:**
- **At boundaries** (CLI args, config files, external APIs, network protocols): validate, return errors, handle defensively.
- **Inside the system:** typed data, error propagation, no re-validation. Trust the types.
- **Across the boundary.** Expose domain concepts, not the boundary's private representation. Keep general-purpose mechanism inside and special-purpose policy at the edge.

**Applications:**

Validation and error handling:
- Validate config at parse time (the boundary), not inside business logic
- Parse raw data into domain types at the boundary
- Do not re-export transport, storage, framework, or wire types through the public surface
- No redundant nil checks deep in call chains if the boundary already validated

Code organization:
- Business logic in pure functions with no framework dependencies
- Parse functions: pure transforms from raw bytes to typed state
- Prompt construction: structured state in, string out
- Scoring and assessment: pure transforms from state to results

Testing across a boundary:
- **The interface is the test surface.** Test a module through the same interface its callers use. If a test has to reach past the interface, the module is the wrong shape. When you deepen shallow modules, write tests at the new interface and delete the old per-piece tests instead of keeping both.
- **Match the test strategy to the dependency.** Pure, in-process logic: test it directly. A dependency with a local stand-in (a local database, an in-memory filesystem): test with the stand-in. An owned-remote or third-party dependency: put it behind a port, inject a real adapter in production and an in-memory or mock adapter in tests. Add the port only once a second adapter actually exists.

**The tests:**
- "Is this data crossing a system boundary right now?" If not, validation is redundant.
- "Can this be a pure function that the shell just calls?" If yes, extract it.
