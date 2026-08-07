# Where do Claude skills get published, and what does that demand of the repo?

Type: research
Status: resolved
Blocked by: —

## Answer

Full findings: [research/distribution-channels.md](../research/distribution-channels.md).

**`skills.sh` is real** — a Vercel-built directory over the `npx skills` CLI, supporting 75+ agent tools. Publishing *is* having a public GitHub repo with `SKILL.md` files; there's no submission queue. It produced this repo's own `skills-lock.json`. Limits: 10 MiB/download, 25 MiB extracted, 1,000 files.

**The architecture-constraining findings:**

1. **Don't bundle a renderer binary.** Plugins *may* ship a `bin/` added to PATH, but Anthropic's own official plugins deliberately don't — they require separate installation. That's the precedent, and it independently confirms the detect-then-offer bootstrap from the toolchain ticket.
2. **Runtime dependency installation is explicitly sanctioned in Claude Code** ("full network access"), with a documented `SessionStart`-hook pattern for caching installs. But the **claude.ai / API Skills sandbox has no network access and no runtime installation** — so the spec must not assume Claude Code's permissions universally.
3. **🔑 A real fork in the road: plugin vs bare skill.** `${CLAUDE_PLUGIN_DATA}` (`~/.claude/plugins/data/{id}/`) is the sanctioned per-user store — survives updates, cleaned up on uninstall — **and it is plugin-only**. A bare `.claude/skills/<name>/` folder doesn't get it. **If the Candidate Profile wants a durable managed home, candid-cv must ship as a plugin, not a loose skill.** This directly constrains *One skill or two?* and *Where does the Candidate Profile live, and what shape is it?*
4. **Bundled executable scripts are the intended mechanism** for deterministic work, with `${CLAUDE_SKILL_DIR}`/`${CLAUDE_PLUGIN_ROOT}` existing so a skill can pre-approve running its own script without a permission prompt. That's exactly the right shape for the render step.
5. **No meaningful review gate.** Plain GitHub + a skills.sh listing is a complete, review-free distribution path used by real widely-used skill collections.

## Question

The skill is going open source. Distribution constraints can reach back into architecture — a channel that forbids bundled binaries or mandates a manifest shape would change how the skill bootstraps its renderer or stores profiles. Find those constraints **before** the architecture sets.

1. **What channels actually exist in 2026** for distributing Claude Code skills? Verify or debunk `skills.sh` specifically — the user recalls the name but isn't sure it's real. Also check: Anthropic's official plugin marketplace and `/plugin` mechanism, plugin marketplace repos, the `.claude/skills/` convention, `.agents/skills/`, npm, and plain GitHub + install instructions.
2. **For each real channel:** how is a skill submitted, what manifest or metadata is required, what repo layout is expected, is there review or curation, and how do users install and update?
3. **Hard constraints that could bite.** Can a distributed skill bundle or download a binary? Ship executable scripts? Write outside the project directory (this matters for storing a profile in `$HOME`)? Require network access at runtime? Any size limits?
4. **Convention, not just permission.** What do well-regarded published skills actually look like — repo layout, how they bundle reference docs and scripts, how they handle per-user state? Cite two or three good examples worth imitating.
5. **Naming.** Is the name taken in any of these channels? (Resolved: `topcv` was, effectively — renamed to `candid-cv`.)

Ground this in **primary sources**: Anthropic's own docs, real marketplace repos, actual published skills. Where you can only find secondary claims, say so.

Note: the user's own machine has skills under both `.claude/skills/` and `.agents/skills/` with a `skills-lock.json` at the repo root — worth understanding what tooling produced that, since it hints at how skills are being distributed in practice.

## Output

`.scratch/topcv-skill/research/distribution-channels.md`. Lead with the constraints that reach back into architecture — that's the part the rest of the map is waiting on.
