# Which renderer, and one template or many?

Type: grilling
Status: resolved
Blocked by: —

## Answer

Resolved by grilling 2026-08-05. Every claim below was **measured on this machine** (typst 0.15.1, poppler, pypdf, pdfminer.six) rather than reasoned from the research. Working proof: [`template/typst-poc/`](../template/typst-poc/) — `cv.typ` + `cv-data.json` → `cv.pdf`, one page, and **all three extractors return identical normalised text.**

### 1. Renderer: Typst, single canonical source format

No LaTeX path, no HTML path, no fallback renderer. One source format means one set of layout rules to get right, and the layout rules turned out to be the hard part (see §4). The user's multi-GB TeX Live dependency is not shipped to strangers.

**The verdict the ticket demanded on the user's own template: ADAPT.** Its *structure* is good and survives — parameterised header, single-column flow, the `joblong`/`jobshort` pair, section order. Its *engine* does not. Porting the design costs an afternoon; shipping TeX Live costs every user. Note `jobshort` survives as a **relevance** device (old roles go title-only because they're not relevant), not as a space device — see §5.

### 2. Bootstrap: preflight → detect → offer → run on approval → degrade honestly

Checked at the **start of a tailoring run**, not at PDF time (the offer arrives before the work) and not at session start (a profile-building session needs no renderer).

1. `typst` on PATH → use it.
2. Private venv from a previous run → use it.
3. Neither → name the exact command *and* the 43 MB cost, run only on approval. Platform package manager first (`brew`/`winget`/`scoop`/`cargo`); **`pip install typst` into a private venv** where none exists — never the user's system Python.
4. Declined → emit `cv.typ` + `cv-data.json`, state plainly that no PDF was produced, leave the command behind.

**New fact: `pip install typst` is a real second route.** Measured: PyPI `typst` 0.15.0 compiles in 0.32 s with a text layer identical to the binary's (`'Hello world — Müller, fünf.'`). It rescues any machine with Python but no Homebrew and no sudo. npm's `typst` is stale at 0.10 — not a route.

### 3. Template origin: ours, self-contained, zero `@preview` imports

`basic-resume` was evaluated properly and rejected. It is only 233 lines (so adopting saves little), it is US-shaped (letter paper, GPA, pronouns, no photo or DOB slot), it pulls a transitive `scienceicons` dependency, and its `work()` API has no title-only variant — it **cannot express the demotion lever**. Decisive on top of that: **`@preview` imports fetch at compile time**, proven by the `basic-resume` and `scienceicons` entries sitting in this machine's package cache. That reintroduces the exact network-at-render-time failure that disqualified Tectonic.

Also: `basic-resume` sets `ligatures: false` "so ATS systems do not get confused". **Measured as folklore in Typst** — with ligatures *on*, `Workflow efficiency: classified financial fjord affluent staffing` extracts perfectly on poppler and pypdf. It was a real *LaTeX* problem (which `T1` fontenc fixed in ticket 06); it is not a Typst problem. Don't repeat unevidenced advice.

### 4. 🔑 The Single-Flow Rule — the most important finding on this ticket

Ticket 06 handed over "the `tabularx` skills section scrambles under poppler". **`tabularx` was never the culprit. Multi-column layout is, in every engine.** Rebuilt in Typst and measured:

| Skills layout | poppler `-layout` | poppler raw | pypdf | pdfminer |
|---|---|---|---|---|
| `grid` two-column | ✅ | ❌ all labels, then all values | ✅ | ❌ interleaved |
| `table` (`stroke: none`) | ✅ | ❌ scrambled | ✅ | ❌ scrambled |
| **single flow `*Label* — values`** | ✅ | ✅ | ✅ | ✅ |

**Then the same test on job headers exposed something worse.** The right-aligned date column — the near-universal CV idiom, used by every template surveyed including `basic-resume` — **detaches dates from their roles**:

| Separator between title and dates | poppler | pdfminer |
|---|---|---|
| `,` + normal space | ✅ paired | ✅ paired |
| `#h(1em)` | ✅ paired | ❌ dates exiled to end of page |
| `#h(3em)` | ⚠️ own line, order kept | ❌ exiled |
| `#h(6em)` / `#h(1fr)` / grid column | ❌ dates land *below the bullets* | ❌ exiled |

`#h(1fr)` does **not** save it, despite living in one paragraph. **pdfminer breaks at anything wider than a word space.** On a two-page CV every date ends up in an orphaned pile associated with nothing — and structured work-history parsers and LLM screeners both read exactly that text.

> **The Single-Flow Rule.** Nothing on a candid-cv CV is ever right-aligned or placed in a layout column that carries text. Meaning is carried by text-flow adjacency and typography, never by horizontal position. Anything that must sit apart visually (a photo) goes out of flow via `place()`, where it holds no text and cannot scramble anything.

**House style, verified clean on all three extractors:** one line per entry, differentiated typographically — `*Role* · Employer · _dates_`. Applies to experience and education alike. Costs nothing in vertical space; the two-line and dates-first variants also test clean if the house style is ever revisited.

### 5. Length: let it spill, then tighten typographically

The page count is **advisory**. Fit one page where it fits naturally; otherwise run long. Real evidence is never destroyed to satisfy a formatting norm — a cap is enforced only where the conventions table marks a market as hard-one-page. This deliberately rejects an automatic demotion ladder: the honesty principle outranks the layout norm.

**Ragged tail:** when the final page is nearly empty, tighten within a bounded, declared range (leading, section spacing, margins) and re-render. **Content is never touched.** If tightening doesn't reclaim the tail, ship as-is and say so. The proof-of-concept threads this through a single `tight` variable, bounded `[0.85, 1.0]`.

### 6. Injection: the agent writes JSON and nothing else

The agent emits `cv-data.json` — pure content, no markup. The shipped `cv.typ` reads it via Typst's native `json()` and owns 100% of layout. **This is what makes §4 enforceable.** An agent *told* "never use a grid" will eventually use a grid; an agent that cannot write layout cannot regress the extraction guarantees. Compile failure reduces to "is this valid JSON".

**A second, unplanned vindication:** the first photo test failed to compile with ``error: label `<example.com>` does not exist`` — Typst markup reads `@example.com` as a *label reference*. Every CV carries an email address, so any design where the agent writes Typst markup hits this on the first real run. JSON strings are inert content and never parse as markup.

### 7. Photo: table gates, candidate decides once

Measured first: a photo does **not** break extraction either way, because the photo column carries no text — so this is a pure policy call, not a mechanical one. `place()` out-of-flow is still the specified implementation, per the Single-Flow Rule.

- Market marked **harmful** (US, UK) → never included, no question asked.
- Market marked **expected** (DE/AT/CH) → the first DACH application surfaces the trade-off honestly (≈19% of German recruiters reportedly discard photo-less applications, against the appearance-bias exposure a photo creates) and stores the answer as a standing profile preference. Never asked again unless changed.

### 8. Fonts: embedded only, Libertinus Serif

`typst fonts --ignore-system-fonts` returns exactly **DejaVu Sans Mono, Libertinus Serif, New Computer Modern, New Computer Modern Math**. Restricting to those makes line breaks, page count and appearance identical on every machine with nothing installed — which the tightening rule depends on, since a substituted font changes line breaks and therefore page count. The proof-of-concept compiles under `--ignore-system-fonts` and extracts identically.

Default **Libertinus Serif** — a neutral professional serif, not the instantly-recognisable LaTeX look of Computer Modern. No font is bundled. If a candidate requests another face, validate against `typst fonts` and **say plainly it is unavailable rather than letting Typst silently substitute.**

### 9. Sections: closed set + one escape hatch

Known sections each get a tuned layout and market-driven ordering: profile, experience, skills, education, plus conditional portfolio link, technical-skills block, certifications, languages, publications, bar admission. One generic `additional: [{title, items}]` array catches what real careers produce (Ehrenamt, Patente, Wehrdienst) and renders it in the house style after education. Nothing genuine about a candidate becomes unexpressible; nothing improvised reaches the PDF in an untested shape.

### Consequences for other tickets

- **Academic CVs are now out of scope** (recorded on the map). v1 detects an academic post and declines honestly rather than dressing an academic career in an industry template. This also keeps publications/grants/teaching out of the profile schema — relevant to *Where does the Candidate Profile live, and what shape is it?*
- **The conventions table's consumers are now fully known**, which sharpened that fog into a ticket: *What does the market conventions table contain, and how does the skill pick a market?*
- **Packaging inherits constraints**: `assets/cv.typ` ships as a skill asset; no bundled binaries and no bundled fonts; a render script that shells out to `typst`.
- **Tailoring inherits a smaller job than expected** — no page-fitting ladder to drive, since length is advisory.

### An ADR is warranted

The ticket called it and it stands: the renderer choice and the Single-Flow Rule are both hard to reverse and both counter-intuitive (every CV template on the internet right-aligns dates). Future readers will ask why, and the measurements are the answer.

<!-- 06 resolved 2026-08-05. Nothing blocks this ticket now. -->

## The template arrived, and it changes the calculus

See ticket 06 for the full empirical evaluation. Headlines:

- **It's pdfLaTeX-native**, not XeLaTeX — so it is *not* disqualified. "Keep and harden" is now a live option against "port to Typst", where before the assumption was that porting was forced.
- **Its text layer is clean** (12/12 across three extractors) once `T1` fontenc and `\pdfgentounicode=1` are added, both of which have been applied.
- **FontAwesome icons were corrupting the contact line and have been removed.** Don't reintroduce them in any candidate template — the finding generalises beyond this file.
- **The `tabularx` two-column skills section scrambles under poppler** — labels and values separate into blocks, destroying the pairing. This needs redesign whatever engine wins. That is *this ticket's* work.
- **Date of birth is hardcoded** and must become market-conditional.

### The decision this ticket now owns

1. **Keep the hardened pdfLaTeX template, or port to Typst?** Trade-off: keeping avoids porting work and preserves a layout the user likes, but carries the multi-GB TeX Live dependency. Porting to Typst buys a 43 MB install, 0.37 s compiles, and easier agent generation. **Zero-install headless Chrome is the third option** and shouldn't be dismissed just because a LaTeX template now exists.
2. **Redesign the skills section** so label-to-value survives poppler. Likely a single-column `\textbf{Label} — values` run of paragraphs rather than a table.
3. **The academic template — the one genuine second template.** Per-domain templates were investigated and rejected (see below). Academia is the sole real structural fork: organized on research/teaching/service pillars rather than career history, with no page cap. It has **deliberately not been built yet**, because building it in LaTeX before decision 1 is settled would be wasted work if Typst wins. Build it *after* the renderer is chosen.
4. Bootstrap behaviour, conditional sections, DOB/photo toggles, content-injection mechanism — as originally scoped below.

### ❌ Per-domain templates: investigated and rejected

The user asked for a template per professional domain. **The research does not support it** — see [role-family.md](../research/role-family.md). Law, software engineering, marketing and design all ride one generic skeleton; the differences are content and emphasis, not structure. Design was the counter-intuitive case: AIGA's own guidance says a designer's résumé should be *plainer* than average, because the portfolio carries the weight.

What replaces a template family:

| Need | Mechanism |
|---|---|
| Design roles | conditional **portfolio link, prominently placed** |
| Technical roles | conditional **technical-skills block** |
| Law | conditional **bar admission** + **publications**; omit summary/skills |
| Marketing | phrasing guidance only — no structural change |
| Sector page-length nudge (finance/consulting 1p, law/engineering 2p) | **conventions data table** value |
| **Academia** | **a genuinely separate template** — the only fork |

This is a real simplification: one generic template + one academic template + a conditional-sections list + the market conventions table, instead of a per-profession family that would each need maintaining.

<!-- 01, 02, 03 resolved 2026-08-05. Research now says: Typst recommended (43MB vs multi-GB);
     XeLaTeX and Tectonic disqualified on text-layer grounds; role-specific templates are
     largely folklore, so this collapses to one generic + one academic template plus
     conditional sections. Only the template handover still blocks. -->

## What the research already settled

Read the answers on tickets 01, 02 and 03 before starting — much of this ticket is now decided:

- **Renderer:** Typst is the strong recommendation. XeLaTeX/Tectonic are **disqualified** (0/14 keyword extraction).
- **Photo:** no universal answer — Germany wants one, the US penalizes one. Template must support both; probably surface the trade-off to the user for German applications.
- **Template count:** one generic + one academic, plus conditional sections (portfolio-link, technical-skills grid, bar admission, publications). **Not** a per-profession family.
- **Length:** flexes by market + seniority + a mild sector nudge. Data-table value.

**What genuinely remains:** the verdict on the user's own template (needs ticket 06), whether porting to Typst is worth its cost, the bootstrap behaviour, and the content-injection mechanism.

## Question

The user's starting position: a single LaTeX template of their own, ideally one page, possibly with role-specific variants. Three research tickets and the template handover land first because any of them could overturn that.

Settle:

1. **The renderer.** LaTeX (which engine), Typst, HTML→PDF, or something else — driven by *Which PDF rendering toolchain survives a stranger's laptop?* and the text-layer findings in *Does the ATS actually read what we think it reads?*. If LaTeX PDFs parse badly, the user's template premise is dead and this becomes a migration decision rather than an adoption one.
2. **The bootstrap.** What happens on a machine with no toolchain — install, fall back, or fail with instructions. Decide the least-astonishing behaviour, given a skill installing a binary is a real intrusion.
3. **The user's template: keep, adapt, or replace?** Evaluate what came back from *Hand over the LaTeX template* against the findings. Judge it on: text-layer extraction quality, whether sections can be dropped without collapse, how cleanly content separates from layout, and whether it matches current convention. **Be willing to tell the user it isn't fitting** — they asked for exactly that verdict.
4. **Photo or no photo.** The user leans no. *What CV conventions differ by market and role family?* should settle whether that's right per market. Given market-agnostic design, the template must probably support both — decide whether that's one template with a switch or two variants.
5. **One template or a family?** The user floated role-specific templates (marketing vs engineer vs lawyer). If ticket 02 finds role barely matters outside academia and design, this collapses to one template plus a conventions table — much simpler. If it finds real differences, decide how many variants and what governs selection.
6. **Length.** One page preferred, longer allowed. What decides, and what does the skill do when content overflows — cut, compress, or spill to page two? This is where the tailoring engine's selection pressure comes from, so the rule matters.
7. **The templating mechanism.** How does generated content get into the renderer? Placeholder substitution, a data file the template reads, or the agent writing source directly? The last is most flexible and most likely to produce something that won't compile — decide how compile failures are caught and recovered.

## What the answer must produce

The chosen renderer with justification, the bootstrap behaviour, a verdict on the user's template, the template count and selection rule, and the content-injection mechanism. An ADR is probably warranted — this is hard to reverse and future readers will ask why.
