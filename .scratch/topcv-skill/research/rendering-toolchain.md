# Which PDF rendering toolchain survives a stranger's laptop?

Research output for [ticket 03](../issues/03-rendering-toolchain.md).
**Status:** recommendation reached, empirically grounded. Some candidates untested — flagged below.
**Date:** 2026-08-05. Measurements taken on macOS (Apple Silicon), Homebrew, TeX Live 2025.

## Recommendation: Typst

**Typst is the answer, and the margin is not close.** It wins on every axis that matters here — install weight, bootstrap simplicity, compile speed, agent-drivability, and (critically) text-layer cleanliness.

The runner-up is **pdfLaTeX — and only pdfLaTeX** — if the user's existing template must be preserved. **XeLaTeX and Tectonic are disqualified**, and **LuaLaTeX is not recommended**, on text-layer grounds — see [ats-reality.md](./ats-reality.md) Result 6.

> ⚠️ **Corrected 2026-08-05.** An earlier version of this document named LuaLaTeX as a co-runner-up. Testing three independent extractors (poppler, pypdf, pdfminer.six) rather than one showed **LuaLaTeX embeds no `/ToUnicode` map at all** and fails completely under pypdf (0/14). It works only where the extractor happens to infer Unicode from glyph names. Only **pdfLaTeX and Typst** are correct by construction across every extractor tested — and since no ATS documents which parser it runs, that is the only defensible bar.

## Comparison

Text layer scored across **three** extractors (poppler / pypdf / pdfminer.six), not one:

| | Install size | Bootstrap | sudo | Compile speed | Text layer (3 extractors) | Agent-drivability |
|---|---|---|---|---|---|---|
| **Typst 0.15.1** | **43 MB** single binary | `brew install typst` / cargo / direct download | no | **0.37 s** | ✅ **14/14 · 14/14 · 14/14** | ✅ Simple, forgiving syntax |
| pdfLaTeX (TeX Live) | **multi-GB** | Full distribution install | usually | seconds | ✅ **14/14 · 14/14 · 14/14** | ⚠️ Fragile, cryptic errors |
| LuaLaTeX (TeX Live) | same distribution | same | usually | seconds (slowest) | ⚠️ 14/14 · **0/14** · 14/14 — **no ToUnicode map; NOT RECOMMENDED** | ⚠️ Same as above |
| XeLaTeX (TeX Live) | same distribution | same | usually | seconds | ❌ **0/14 · 0/14** · 14/14 — **DISQUALIFIED** | ⚠️ Same as above |
| Tectonic 0.17.0 | 19 MB binary + package cache | self-fetching | no | ❌ **hung >3 min on first run** | ❌ **XeTeX-based — DISQUALIFIED** | ⚠️ LaTeX syntax |
| Pandoc | 261 MB | `brew install pandoc` | no | fast | n/a — still needs a PDF engine | ⚠️ Markdown in, but delegates PDF |
| **HTML→PDF (headless Chrome)** | **0 MB — already installed** | none | no | 2.1 s | ✅ **14/14 · 14/14 · 14/14** | ✅ Most familiar syntax for an LLM |
| WeasyPrint | Python + deps | `pip install` | no | untested | untested | ✅ but heavier dependency tree |

### Measurements

- **Typst binary: 43 MB** (`/opt/homebrew/Cellar/typst/0.15.1/bin/typst`), self-contained, no package manager, no network fetch at compile time.
- **Tectonic binary: 19 MB** — smaller, but the small binary is misleading: it fetches LaTeX packages on demand and **hung for over three minutes on its first compile** of a trivial document in this test. That is a catastrophic first-run experience for someone who just installed a skill, and it requires network access at render time.
- **Pandoc: 261 MB**, and it doesn't solve the problem — it still needs a downstream PDF engine.
- **TeX Live: `du -sh` could not finish traversing the installation in three minutes.** The exact figure wasn't captured, but the failure to enumerate it is the point. A full TeX distribution is a multi-gigabyte install; the `basic`/`small` schemes are smaller but then lack packages that CV templates commonly require.
- **Typst compile: 0.37 s** wall clock for a full CV, versus multi-second LaTeX runs. Matters more than it sounds: an agent iterating on a CV compiles repeatedly.

### The real contest is Typst vs headless Chrome

Tested 2026-08-05, closing the gap this document previously flagged as untested. Chrome renders a CV to PDF with a **perfectly clean text layer on all three extractors**, in 2.1 s, at 59 KB, via:

```
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf=out.pdf "file://$PWD/cv.html"
```

That makes it a genuine rival to Typst, and the trade-off is sharp:

| | Typst | Headless Chrome |
|---|---|---|
| Install | 43 MB, needs bootstrapping | **zero — already on the machine** |
| Speed | **0.37 s** | 2.1 s |
| Text layer | ✅ clean everywhere | ✅ clean everywhere |
| Agent-drivability | good, regular syntax | **best — HTML/CSS is the format an LLM writes most fluently** |
| **Pagination control** | **strong — a document engine, built for exactly this** | **weak — print CSS page-breaking is fiddly, and "make this fit one page" is genuinely hard** |
| Reliability | deterministic binary | Chrome's headless flags have churned across versions (`--headless` vs `--headless=new`) |

**Why Typst still edges it:** the one-page constraint is central to this skill, and fitting content to an exact page count is precisely where print CSS is weakest and a document engine is strongest. The tailoring engine will need to iterate — render, measure, cut, re-render — and Typst gives far better control over that loop.

**Why Chrome might still win:** zero-install is worth a great deal for a skill strangers install casually, and it sidesteps the entire bootstrap question along with the distribution research's "don't bundle binaries" constraint. If *Which renderer, and one template or many?* concludes that install friction is the dominant risk, Chrome is the defensible choice.

**Recommendation stands at Typst, but this is now a real decision with a real runner-up rather than a walkover.** Ticket 11 should decide it explicitly.

### Why Typst wins on agent-drivability specifically

This is underweighted in most comparisons and matters a lot here. The skill's agent will be *generating source code* and must recover when it doesn't compile. LaTeX fails with famously cryptic errors, is whitespace- and brace-sensitive, and has a vast surface of package interactions. Typst has a modern, regular syntax, clear error messages with source positions, and no package-installation step. An agent writing Typst will produce compilable output more reliably than one writing LaTeX — which directly reduces the retry loop the spec would otherwise need.

## Can a skill install a binary on the user's machine?

**Judgement: it may offer, it must not do it silently.**

Installing software is a real intrusion, and a CV skill silently running `brew install` would be justifiably alarming. The least-astonishing bootstrap:

1. **Detect** what's present (`typst`, then `pdflatex`/`lualatex` as fallbacks).
2. If nothing is found, **explain and offer** — name the exact command, state the size (43 MB), and let the user run it or approve it.
3. **Never** silently download a binary, and never require network access at render time. This is a second, independent reason to prefer Typst over Tectonic: Typst renders offline once installed; Tectonic phones home for packages.
4. **Degrade honestly** — if no engine is available and the user declines to install one, emit the source file and say plainly that no PDF could be produced. Don't fake it.

This also interacts with distribution constraints — see [distribution-channels.md](./distribution-channels.md) for whether bundling binaries is permitted at all.

## What this costs the user

The user's starting position was a LaTeX template they already own. Choosing Typst means **porting it**. That's real work, and it's the honest trade-off to put in front of them:

- **Porting is a one-time cost** paid by whoever writes the spec, against a permanent gain in install weight (43 MB vs multi-GB), speed, and reliability.
- **Keeping LaTeX is viable** if the template is pdfLaTeX- or LuaLaTeX-based — those extract cleanly. **It is not viable if the template is XeLaTeX-based**, which is the likeliest case for any modern template using custom fonts (Awesome-CV, AltaCV, and most visually-designed templates require XeLaTeX or LuaLaTeX for `fontspec`).
- So the decision partly depends on what *Hand over the LaTeX template* reveals. If it's XeLaTeX, the template needs changing regardless, and porting to Typst becomes much more attractive than porting to LuaLaTeX.

## Not tested — honest gaps

- **HTML→PDF via headless Chrome, WeasyPrint, or Paged.js.** Not tested. A browser is already on nearly every machine, which is a genuine advantage worth someone's time. Print-CSS fidelity for a CV and text-layer quality are both unverified.
- **DOCX output.** Some ATS reportedly prefer it. Not investigated. Given the Q1/Q3 finding that auto-rejection is mostly myth, this is probably lower priority than it sounds — but it's unverified either way.
- **Windows and Linux.** All measurements are macOS/Apple Silicon. Typst ships binaries for all three platforms, but install sizes and behaviour elsewhere are unconfirmed.
## Typst's CV template ecosystem — surveyed, and it's mature (gap closed)

The concern that Typst might be too young to have usable CV templates is **unfounded**. Typst Universe carries a healthy set of actively-maintained, explicitly ATS-oriented CV packages:

| Package | Notes |
|---|---|
| [`basic-resume`](https://typst.app/universe/package/basic-resume/) | Standard résumé "designed to work well with ATS"; explicitly intended as a starting point. **Best default candidate.** |
| [`ats-friendly-resume`](https://typst.app/universe/package/ats-friendly-resume/) | Developer-oriented; updated Oct 2025 |
| [`clickworthy-resume`](https://typst.app/universe/package/clickworthy-resume/) | Flexible, extendable to a full CV, includes cover letter |
| [`vantage-cv`](https://typst.app/universe/package/vantage-cv/) | Two-column — note our own finding that column reading order is extractor-dependent |
| [`simple-technical-resume`](https://typst.app/universe/package/simple-technical-resume/) | Well-reviewed for readability |
| [`simple-xd-resume`](https://typst.app/universe/package/simple-xd-resume/) | Minimal layout for ATS compatibility |
| [`brilliant-cv`](https://typst.app/universe/package/brilliant-cv/) | Feature-rich; updated July 2026. **See warning below.** |

This materially reduces the design work the spec inherits — porting the user's template is no longer the only path; adopting and adapting a maintained package is viable.

### 🚩 A finding that belongs to the honesty ticket, not this one

`brilliant-cv` ships **optional ATS keyword injection — hidden keyword text aimed at automated screeners**, marked as a PDF artifact so screen readers skip it. Its own authors default it to **off**, noting that some screening systems detect and penalize hidden text.

This is the single most concrete instance of the line *What exactly does "honest optimization" forbid?* has to draw. It is: technically clever, genuinely effective against naive parsers, invisible to the human reader, and **flatly deceptive** — the document says something to the machine that it does not say to the person. Under the map's Honest Optimization constraint it should be an unambiguous no, and the fact that a popular template ships it makes stating that prohibition explicitly more necessary, not less. Cross-referenced into ticket 08.

## Not tested — remaining gaps

- **WeasyPrint and Paged.js** specifically. Headless Chrome was tested and works; these two remain unmeasured.
- **PDFBox / PyMuPDF extractors**, and any actual ATS-vendor parser.
- **DOCX output.** Some ATS reportedly prefer it. Not investigated.
- **Windows and Linux.** All measurements are macOS/Apple Silicon.
