# Map: the candid-cv skill

> **⚠️ MIGRATED 2026-08-07 — the tracker now lives on GitHub.** The map is [issue #15](https://github.com/bonyadnouri/candid-cv/issues/15); tickets are its sub-issues `#1`–`#14` (same numbers as the files in `issues/`). This file and `issues/` are a frozen archive of the state at migration — do not work from them.

> **Named 2026-08-05: `candid-cv`** (was the working title `topcv`). *Candid* and *candidate* are the same word — Latin *candidus*, "white", from the white togas Roman office-seekers wore — so the name carries both "honest" and "about the candidate", which is precisely the skill's differentiator. Free on npm, no trademark exposure, matches the kebab-case convention of neighbouring skills. The old name was dropped because [topcv.com](https://topcv.com/) is an actively-trading commercial CV service asserting trademark rights over "TopCV".
>
> The scratch directory keeps its `topcv-skill` path to avoid breaking cross-file links; only the product name changed.

**Tracker:** local markdown — tickets in `./issues/`, research output in `./research/`
**Charted:** 2026-08-05

## Destination

A **buildable spec** for `candid-cv` — an agent skill that turns a candidate's durable profile plus one specific job ad into an honestly-optimized CV PDF. The spec resolves every open decision (skill architecture, profile storage, rendering toolchain, research pipeline, tailoring algorithm, honesty rules, packaging constraints) so an implementing agent can build it without coming back with questions.

**The product is the skill, not a website.** Users install it and run it inside whatever harness they already use. If a site ever exists, it is a landing page pointing at the skill — explicitly not part of this effort.

**No skill code is written in this effort.** Building `candid-cv` is a separate effort that starts where this map ends.

## Notes

**Domain:** CV/résumé generation · ATS and recruiter mechanics · Claude Code skill authoring.

**Skills every session should consult:** `/grilling` and `/domain-modeling` by default on any ticket · `/research` for research tickets · `/prototype` for prototype tickets · `/write-a-skill` and `/writing-great-skills` for anything shaping the skill's own structure.

**Domain vocabulary:** [CONTEXT.md](./CONTEXT.md) — keep it current as tickets resolve.

### Standing constraints

Settled while charting. Don't relitigate silently — if a ticket's answer pushes against one of these, say so explicitly and take it back to the user.

- **Honest optimization.** Optimize *selection* and *framing*; never fabricate. Every claim on a generated CV traces back to something the candidate actually supplied. A missing skill is never held against the candidate — the response is to surface different real evidence, not to invent the missing one.
- **Market-agnostic by design.** CV conventions (photo, date of birth, page length, section order, tone) are a **data table** the skill consults for the target market — not norms hardcoded into a template.
- **Claude Code first-class.** Lean fully on AskUserQuestion, subagents, and WebSearch. Other harnesses get a documented degraded path, not a design constraint.
  - **But portability is cheaper than assumed.** The distribution research found the **Agent Skills open standard** (Anthropic, published at `agentskills.io`, released 2025-12-18) — a `SKILL.md` plus optional `scripts/`/`references/`/`assets/` — runs largely unmodified across Claude Code, Cursor, Copilot, Gemini CLI and 20+ other tools. Building `SKILL.md` to that standard costs nothing extra and buys the "use it in whatever harness you already have" property for free. Only the *interview* genuinely depends on Claude Code's question UI; everything else is portable by default.
- **Ingest before interview.** The profile bootstraps from an existing CV, LinkedIn export, or GitHub where available. The interview fills *gaps* rather than starting from zero.
- **Planning, not building.** This map produces a spec.

### Added by the research pass, 2026-08-05

- **The renderer must be correct by construction, not by extractor charity.** Testing three independent extractors (poppler, pypdf, pdfminer.six) showed each behaves differently on the same PDF. XeLaTeX and Tectonic embed wrong ToUnicode maps; LuaLaTeX embeds none. **Only pdfLaTeX, Typst and headless-Chrome HTML pass all three.** Since no ATS documents which parser it runs, passing one extractor is not evidence of anything.
- **The CV a human reads and the CV a parser reads must be the same document.** Hidden keyword injection, white-on-white text, and zero-point fonts are out — even when every hidden keyword is true. This framing, rather than "don't state false facts", is what makes the honesty rule bite; see *What exactly does "honest optimization" forbid?*
- **Don't justify the skill with tailoring statistics.** Every circulating percentage traces to vendor marketing. The mechanism is real; the magnitude is unevidenced. Say so plainly in the README rather than repeating folklore — that honesty is on-brand for a skill whose core principle is not overstating things.
- **An undetectable voice is a hard requirement.** Hiring managers are actively catching AI-written applications (Greenhouse, n=4,136). This constrains the tailoring engine, not just its polish.

### Added by the renderer decision, 2026-08-05

- **The Single-Flow Rule.** Nothing on a generated CV is ever right-aligned or placed in a layout column that carries text. Meaning is carried by text-flow adjacency and typography, never by horizontal position; anything that must sit apart visually goes out of flow via `place()`. Measured, not assumed — right-aligned dates detach from their roles on two of three extractors, and grids scramble label/value pairing. See *Which renderer, and one template or many?*
- **Guarantees are structural, not instructional.** The agent writes `cv-data.json`; it never writes layout. An agent told "don't use a grid" eventually uses a grid. This is the same correct-by-construction reasoning the renderer choice already rests on, applied to the agent's own output.
- **Length is advisory.** Real evidence is never removed to satisfy a page norm. Overflow spills; only bounded typographic tightening reclaims a ragged tail. A hard cap applies solely where the conventions table marks a market as one.

## Decisions so far

<!-- one line per closed ticket: gist + link -->

- [Does the ATS actually read what we think it reads?](./issues/01-ats-reality.md) — **Only pdfLaTeX, Typst and headless-Chrome HTML produce a text layer that is correct regardless of extractor.** XeLaTeX and Tectonic embed *actively wrong* ToUnicode maps; **LuaLaTeX embeds none at all** and fails completely under pypdf, so it is not recommended either. Separately, **keyword auto-rejection is largely a myth** — the real auto-filter is knockout questions on the application form, and CV keywords serve recruiter *search* instead.
- [What CV conventions differ by market and role family?](./issues/02-market-conventions.md) — **Role barely matters, market matters a lot.** Academia is the only genuine structural exception; design needs a prominent portfolio link, not a different template. Collapses the planned template family to **one generic + one academic**. Photo has no safe universal default (Germany expects it, the US penalizes it).
- [Which PDF rendering toolchain survives a stranger's laptop?](./issues/03-rendering-toolchain.md) — **Typst leads** (43 MB binary, 0.37 s, clean everywhere, mature ATS-oriented template ecosystem), but **headless Chrome is a real runner-up**: zero install, clean everywhere, and the format an LLM writes most fluently — its weakness is print-CSS pagination, which matters because "fit one page" is central here. Bootstrap policy either way: **detect, then offer — never install silently.**
- [Where do Claude skills get published, and what does that demand of the repo?](./issues/04-distribution-channels.md) — `skills.sh` is real (Vercel). **Don't bundle a renderer binary** — Anthropic's own plugins don't. **Key constraint: `${CLAUDE_PLUGIN_DATA}` is plugin-only**, so if the profile wants a managed home, `candid-cv` must ship as a *plugin*, not a loose skill. Also: the name `topcv` was dropped — [topcv.com](https://topcv.com/) is a trading commercial CV service with trademark claims.
- [Hand over the LaTeX template](./issues/06-hand-over-template.md) — Supplied and genericised to `template/cv-template.tex`, PII stripped and never written to disk. **It's pdfLaTeX-native, so it survives** — the text layer extracts 12/12 clean across three extractors once `T1` fontenc and `\pdfgentounicode=1` are added. **FontAwesome icons were corrupting the contact line on every extractor and have been removed.** Outstanding: the `tabularx` skills section scrambles under poppler and needs redesign; DOB is hardcoded and must become market-conditional.
- [Which renderer, and one template or many?](./issues/11-renderer-and-templates.md) — **Typst, single canonical source format; the user's template is ADAPTED, not kept.** The agent writes `cv-data.json` and nothing else; the shipped `cv.typ` owns all layout. Biggest finding: **`tabularx` was never the culprit — multi-column layout is, in every engine.** Right-aligned dates, the idiom every CV template uses, detach from their roles on poppler *and* pdfminer. Hence the **Single-Flow Rule** (below). Length is advisory (spill, then tighten typographically — never cut content). Embedded fonts only. Working proof: [`template/typst-poc/`](./template/typst-poc/).
- [What do human reviewers actually reward on a CV?](./issues/05-human-reviewers.md) — **Tailoring's magnitude is unevidenced** (every circulating percentage is vendor marketing); "6 seconds" is a 2012 press release; quantified-bullet and STAR formulas have no résumé-specific support. Best-evidenced finding: **AI-written CVs are being caught** (Greenhouse, n=4,136), making an undetectable voice a hard requirement.

## Not yet specified

In scope, but not yet sharp enough to ticket. Graduates as the frontier advances.

- **The per-application research pipeline's mechanics.** How many subagents run at CV-generation time, what each is briefed to find, how their findings get folded into tailoring, and what happens when research returns nothing useful. Can't be phrased sharply until *Does the ATS actually read what we think it reads?* and *What do human reviewers actually reward on a CV?* land and *How does tailoring choose and rephrase?* has a shape.
- **What the skill emits besides the PDF.** A rationale trace ("why these bullets"), the intermediate `.tex`/source, a diff against the last CV — depends on the tailoring design.
- **The genuine-mismatch failure mode.** What the skill does when the profile honestly doesn't fit the ad (the "engineer who's never built an API" case). Depends on the honesty rule and the tailoring design. Likely a real decision, possibly several.
- **Profile evolution over time.** How the profile is updated after a new job, and whether past generated CVs feed back into it.
- **Evaluation.** How anyone tells whether a generated CV is actually good. Depends on nearly everything else; may be the last ticket on the map.
- **Repo shape and packaging specifics.** The constraints landed (see *Where do Claude skills get published…* and now *Which renderer, and one template or many?* — `assets/cv.typ` ships as an asset, no bundled binaries, no bundled fonts, plus a render script that shells out to `typst`); the remaining fog is the concrete layout, once the plugin-vs-skill fork is decided.

**Graduated 2026-08-05 (renderer decision):**

- *The conditional-sections mechanism* is **resolved**, not graduated — the JSON-driven design settled it. A closed set of known sections, each with a tuned layout and market-driven ordering, plus one generic `additional` escape hatch. See *Which renderer, and one template or many?*
- *The conventions data table's actual schema* has graduated into [What does the market conventions table contain, and how does the skill pick a market?](./issues/14-conventions-table.md). Its consumers are now fully known — the renderer needs paper size, section-heading language, section order, photo policy, DOB policy and page target — so the question is sharp without waiting on the profile format.

**Graduated 2026-08-05:** the plugin-vs-bare-skill fork surfaced by the distribution research is *not* a new ticket — it's folded into *One skill or two?* and *Where does the Candidate Profile live, and what shape is it?*, since the only reason to become a plugin is `${CLAUDE_PLUGIN_DATA}` as a profile home. Deciding it separately from the profile's storage would split one decision across two tickets.

## Out of scope

Ruled beyond the destination. These do not graduate; revisiting means redrawing the destination as a fresh effort.

- **Hiring-manager identification.** Ruled out while charting. Person-level research mostly produces cover-letter material, fails on agency-posted ads, and raises a privacy question the CV never gets to spend. Team-level context, if wanted, would fold into company research instead.
- **Cover letters.** The deliverable is a CV.
- **Application tracking.** No database of applications, no status, no follow-ups. The filename convention is the only record-keeping.
- **LinkedIn / online-profile optimization.** CV output only.
- **Interview preparation.** No STAR-story rehearsal or predicted-question generation, even though the profile would fuel it well.
- **The actual open-source publishing work.** README, license text, and the publish itself are out. Only the *constraints* distribution places on the skill's shape are in — see *Where do Claude skills get published, and what does that demand of the repo?*
- **Academic CVs.** Ruled out 2026-08-05 by *Which renderer, and one template or many?*, which had been holding the academic template open. An academic CV is not a variant but a different document — organised on research/teaching/service pillars rather than career history, uncapped in length, with publications, grants and referees as first-class content — and supporting it would drag that whole schema into the Candidate Profile. v1 **detects an academic post and declines honestly** rather than dressing an academic career in an industry template, which is the failure mode this skill is built on. This leaves the map's "one generic + one academic template" plan at **one generic template**.
- **Helping with the application form itself.** Surfaced 2026-08-05 by the ATS research, which found that automatic rejection happens via **knockout questions on the application form** (work authorization, certifications, salary, location) rather than via CV parsing. That makes form assistance arguably higher-leverage than CV optimization — but it's a different product, and the destination says CV. Recorded here because it's the most interesting thing the research turned up that we are deliberately *not* doing.
