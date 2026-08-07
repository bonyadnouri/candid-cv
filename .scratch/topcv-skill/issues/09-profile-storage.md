# Where does the Candidate Profile live, and what shape is it?

Type: grilling
Status: open
Blocked by: —

## Question

The **Candidate Profile** is the durable artifact the whole skill rests on — everything about the candidate's experience, projects, education, and links, held independently of any one job. Two questions, tangled:

### Where does it live?

The user raised this directly: *"if they're using it inside a project we also need to figure out how it makes sense."*

- **`${CLAUDE_PLUGIN_DATA}`** (`~/.claude/plugins/data/{id}/`) — **the distribution research settled this option's existence and it's now the front-runner.** It's the first-party per-user store: survives plugin updates, shown to the user with its size before deletion, cleaned up on uninstall. **Catch: it is plugin-only.** Taking it means candid-cv ships as a *plugin*, not a loose skill — so decide this **jointly with** *One skill or two?* rather than separately.
- `$HOME` ad-hoc (e.g. `~/.candid-cv/`) — permitted (Claude Code has ordinary filesystem access, gated only by normal permission prompts), but forfeits the free lifecycle management above.
- Project directory — visible, versionable, but then the profile is trapped in whichever repo it was made in, and a CV profile isn't really "project" data.
- A dedicated CV repo the user keeps — clean, but demands setup before first use.
- Configurable with a sensible default.

Also settle: is it **private data that must never be committed or transmitted**? It holds employment history and contact details. Does that need explicit handling — a `.gitignore` line, a warning, a refusal to write into a repo with a public remote?

### What shape is it?

- **Format.** Markdown (agent-friendly, human-editable, hard to validate), YAML/JSON (structured, validatable, tedious to hand-edit), or a hybrid — structured frontmatter over prose.
- **Granularity.** This is the load-bearing one. The user wants tailoring to *"adjust the phrasing of each of these points and also select what kind of points to put in"*. That demands the profile hold **atomic, reusable facts** — a pool of achievements, each independently selectable — rather than pre-written CV bullets. Get this wrong and tailoring degrades into rewriting a fixed CV.
- **What an atom holds.** Raw fact, context, metrics, technologies, the candidate's own words, confidence level, evidence pointer (see *What exactly does "honest optimization" forbid?*).
- **One file or many.** One file is simple but grows unwieldy; per-role or per-project files scale but complicate loading.
- **Size and context budget.** A rich profile for a 15-year career could be large. Does the whole thing load every time, or is it indexed and selectively read? This constrains the tailoring design.

Use `/domain-modeling` — this ticket defines the central term of the whole domain. Write the resolved vocabulary into [CONTEXT.md](../CONTEXT.md).

## What the answer must produce

A concrete schema — a worked example profile with two or three real-looking entries — plus the storage location, format, privacy handling, and loading strategy.

## Unblocks

*What does the gap-filling interview feel like?* and *How does tailoring choose and rephrase?* both wait on this.
