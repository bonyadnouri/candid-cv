# One skill or two?

Type: grilling
Status: open
Blocked by: —

## Question

`candid-cv` does two genuinely different things:

- **Profile building** — a long, one-time (then occasionally-updated) session that ingests an existing CV and interviews the gaps, producing durable knowledge about the candidate.
- **Tailoring** — a short, repeated, per-job session that selects from that profile, rephrases for one ad, and renders a PDF.

Different cadence, different duration, different mental mode. Decide how they're packaged. The user explicitly deferred this to a ticket rather than answering during charting.

Argue at least:

1. **One skill, two entry points.** Detects whether a profile exists; no profile → interview, profile → tailor. One install, one name. Risk: a skill whose description has to cover both jobs is a skill the model may trigger at the wrong moment — and skill descriptions are the *only* thing the agent sees when choosing.
2. **Two skills** (`/cv-profile` and `/candid-cv`). Sharp descriptions, sharp triggers, explicit invocation. Costs a dependency the user must understand, and a first-run experience where invoking the wrong one is possible.
3. **One skill with sub-commands or arguments.** Middle ground; check what the harness actually supports before assuming it works.

Feed in from `/write-a-skill` and `/writing-great-skills`: the description is the entire trigger surface, and a skill over ~100 lines wants splitting into reference files regardless. That constraint may settle this on its own.

## ✅ Naming — SETTLED 2026-08-05, do not reopen

**The skill is `candid-cv`.** The user delegated the choice; it was made and verified rather than left open.

- **Why the old name went:** [topcv.com](https://topcv.com/) is an established, actively-trading commercial CV-writing service asserting trademark rights over "TopCV" in its own terms. No skill registry held the name (npm 404, zero matches across 2,332 community-marketplace entries), so the collision was *brand*, not ecosystem — but that's the one that produces takedown requests.
- **Why `candid-cv`:** *candid* and *candidate* are etymologically the same word (Latin *candidus*, "white", from the togas Roman office-seekers wore). The name therefore means both "honest" and "about the candidate" — which is exactly the differentiator, since generating a CV is commodity and not lying while doing it is not. Reads well as `/candid-cv`, matches the kebab-case convention of neighbouring skills.
- **Verified:** `candidcv` and `candid-cv` both free on npm; no trademark or product collision found in search.

**Also settled by the user:** the product is **the skill itself**, not a web service. Any website would be a landing page pointing at the skill. This removes the "should it be a hosted product" question from this ticket entirely.

What remains open on this ticket is the **packaging** question below — one skill or two, and plugin vs bare skill.

## Added by the distribution research (2026-08-05)

A fourth axis has appeared, and it may dominate the others: **plugin or bare skill?**

`${CLAUDE_PLUGIN_DATA}` (`~/.claude/plugins/data/{id}/`) is the sanctioned per-user store — it survives updates and is cleaned up on uninstall — and it is **plugin-only**. A loose `.claude/skills/<name>/` folder doesn't get it. So if the Candidate Profile wants a managed home, candid-cv must ship as a plugin.

Decide this **jointly with** *Where does the Candidate Profile live, and what shape is it?* — the only reason to become a plugin is the profile store, so splitting the decision across two tickets would fragment it. Whichever ticket is worked second should adopt the first one's answer rather than reopening it.

Plugins also get `SessionStart` hooks (useful for the renderer bootstrap) and `${CLAUDE_PLUGIN_ROOT}` for pre-approving bundled scripts without a permission prompt.

## What the answer must produce

The chosen packaging, the invocation surface (names, arguments, what triggers what), and a first cut at each skill's `description` frontmatter — since that's the thing that decides whether any of this ever fires.
