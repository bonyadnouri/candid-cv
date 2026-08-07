# Does the ATS actually read what we think it reads?

Status: COMPLETE. Q2 (text layer) is empirically verified twice, independently. Typst has since been tested and added. Q1/Q3/Q5 were finished by the main session after the parallel agents died; their sourcing is weaker than Q2's and is labelled as such.

## What this means for topcv (interim — will be finalized once all sections land)

**The LaTeX question has a real, empirically-verified, non-uniform answer: the renderer choice matters, and the default choice most people reach for (XeLaTeX, for custom-font support) is the one that breaks.**

- `pdflatex` (with standard `T1` fontenc) and `lualatex` (tested both with default fonts and with `fontspec` + a system font) produced PDFs whose text layer extracts **perfectly clean** — `office`, `film`, `staff`, `difficult`, `workflow` all round-trip exactly, with zero ligature artifacts, on current TeX Live 2025 + poppler 26.04.0.
- `xelatex` and `tectonic` (which is XeTeX-based), even on the same current toolchain, produce a text layer where `fi`/`ff`/`fl`/`ffi` sequences are replaced by single precomposed Unicode ligature codepoints (U+FB00–U+FB03: ﬀ ﬁ ﬂ ﬃ). This is **not** a rendering artifact — the glyphs display correctly — it's specifically a text-*extraction* problem: a case-insensitive literal search for "office" against the extracted text returns **zero matches**, because the extracted string is `oﬃce` (`o` + U+FB03 + `c` + `e`), not `office`. This reproduced consistently with both the default Latin Modern fonts and with `fontspec`-loaded Helvetica, and was **not fixed** by `fontspec`'s `Ligatures=NoCommon` option in this test.
- This means: **"LaTeX PDFs don't parse" is too broad a claim to be useful — it depends entirely on the engine.** A LaTeX-based CV template is viable, but only if the pipeline avoids XeTeX-family engines (XeLaTeX, Tectonic) or forces ligatures off at the font level in a way that's actually verified to work, not assumed. `pdflatex`/`lualatex` are the safe choices for this specific hazard.
- This finding is corroborated by a primary source: the LaTeX Project's own issue tracker (latex3/latex2e#465) and a Mozilla/cairo bug report (Bugzilla #1810914) both independently describe the exact mechanism — engines/tools that auto-generate `ToUnicode` CMaps directly from a font's internal Unicode `cmap` table (which is what XeTeX-style engines do) end up mapping ligature glyphs to the font's precomposed Alphabetic Presentation Forms codepoint, because that's literally what's in the font, rather than to the decomposed character sequence. pdfTeX-family engines instead build ligatures via classic TFM-level ligature/kern programs and (when properly configured) map them back to decomposed Unicode explicitly.

(Remaining "what this means" content — on keyword tailoring being aimed at a real reader vs. not — will be added once Q1/Q3/Q5 findings land.)

---

## Q2 — The LaTeX question (EMPIRICAL, fully verified on this machine)

### Method

Environment: macOS, TeX Live 2025 (`pdflatex`/`xelatex`/`lualatex` all report `TeX Live 2025`), `tectonic` 0.16.9, `poppler`/`pdftotext` 26.04.0 (current as of Aug 2026). `typst` was not installed and is **not tested** — flagged as unverified for that engine specifically.

Test document contained, per the ticket's spec:
- Ligature-prone words: `office`, `film`, `staff`, `difficult`, `workflow` (covering `ffi`, `fi`, `ff`, `fl` ligature pairs), repeated in running prose.
- A two-column section (`multicol` package).
- A narrow-`minipage` paragraph forcing automatic hyphenation of long words (`internationalization`, `characterization`, `administrative`) across line breaks.
- A header/footer-style contact-info line.

Compiled five ways:
1. `pdflatex`, modern boilerplate (`\usepackage[T1]{fontenc}`, `\usepackage[utf8]{inputenc}`)
2. `xelatex`, same source, default fonts (no `fontspec`)
3. `lualatex`, same source, default fonts (no `fontspec`)
4. `tectonic`, same source (XeTeX-compatible engine)
5. `pdflatex`, **legacy** boilerplate — no `fontenc`/`inputenc` at all (default OT1 encoding), to test the classically-blamed "old-style LaTeX" setup

Plus two follow-up compiles isolating the font-loading variable:
6. `xelatex` + `fontspec` + `\setmainfont{Helvetica}` (a real, commonly-used CV font, not Computer/Latin Modern)
7. `xelatex` + `fontspec` + `\setmainfont{Helvetica}[Ligatures=NoCommon]` (testing the documented fontspec mitigation)
8. `lualatex` + `fontspec` + `\setmainfont{Helvetica}` (isolating "is it XeTeX specifically, or fontspec in general")

Extraction: `pdftotext` (poppler) in default mode, `-layout` mode, and `-raw` mode; cross-checked with `pdffonts` (embedding/subsetting/ToUnicode presence) and a Python/Unicode codepoint dump of the extracted bytes.

### Result 1 — Ligatures: engine-dependent, and the common default (XeLaTeX) is the one that breaks

| Engine | Fonts | `pdffonts` ToUnicode (`uni`) | Extracted `office` | Literal case-insensitive `office` matches |
|---|---|---|---|---|
| pdflatex (T1 fontenc) | LM/CM Type1 | yes | `office` | 5/5 clean |
| pdflatex (legacy, no fontenc, OT1) | CM Type1 | yes | `office` | 4/4 clean (one instance lost to a *different*, reading-order issue — see Result 2) |
| lualatex, default fonts | LM Type1 | **no** (poppler falls back to glyph-name inference and still gets it right) | `office` | 5/5 clean |
| lualatex + fontspec + Helvetica | Helvetica (system OT font) | — | `office` | clean |
| xelatex, default fonts | LM Type1C (OpenType-processed) | yes | `oﬃce` (U+FB03) | **0/5 — literal match fails** |
| xelatex + fontspec + Helvetica | Helvetica | — | `ofﬁce` (U+FB01) | **fails** |
| xelatex + fontspec + Helvetica, `Ligatures=NoCommon` | Helvetica | — | `ofﬁce` (U+FB01) — **unchanged, mitigation did not work** | **fails** |
| tectonic (XeTeX-based) | LM Type1C | yes | `oﬃce` (U+FB03) | **0/5 — literal match fails** |

Exact codepoint verification (Python `unicodedata`, xelatex output): the extracted "ligature" characters are genuine, correctly-formed Unicode — `U+FB03 LATIN SMALL LIGATURE FFI`, `U+FB01 LATIN SMALL LIGATURE FI`, `U+FB00 LATIN SMALL LIGATURE FF`, `U+FB02 LATIN SMALL LIGATURE FL` — not mojibake, not private-use-area garbage, not missing glyphs. That's precisely what makes this hazard insidious: the PDF *displays* correctly and the extracted text is *valid, well-formed Unicode* — it just isn't the sequence of ASCII letters that a literal keyword-matcher (or a human eyeballing extracted text without checking for exotic Unicode) is looking for. A `grep -i "office"` (or an equivalent naive substring match) against the xelatex/tectonic output returns nothing.

**Status: EVIDENCED**, both empirically (fully reproducible above) and by primary-source corroboration:
- LaTeX Project's own tracker, [latex3/latex2e#465](https://github.com/latex3/latex2e/issues/465): confirms XeTeX/LuaTeX auto-generate `/ToUnicode` CMaps for Unicode-based fonts while pdfTeX needs `glyphtounicode.tex` + `\pdfgentounicode=1` loaded manually — i.e., the engines *do* generate a mapping, but (per our empirical test) that mapping is not reliably decomposed for XeTeX.
- Mozilla Bugzilla [#1810914](https://bugzilla.mozilla.org/show_bug.cgi?id=1810914) (unrelated PDF-producer, cairo/Firefox print-to-PDF, but the identical underlying mechanism): "when cairo generates the PDF subset font, it doesn't know what the original text was, it just has the glyphs to work with" — ToUnicode is derived from the font's internal `cmap` table, and fonts that expose a ligature glyph at a Presentation-Forms codepoint (U+FB00–FB06) cause that codepoint to leak into the ToUnicode map verbatim. The bug reporter states the correct/expected behavior is decomposition to `<00660069>` ("fi"), and explicitly cites pdfTeX as the tool that does this correctly. This is a general PDF-production phenomenon, not a LaTeX-specific or "legacy" one — it reproduces on the newest available poppler and the newest available xelatex/tectonic.

**This directly falsifies the "ligature mojibake is legacy/fixed" assumption for XeTeX-family engines specifically** — it is current, reproducible, and un-fixed as of TeX Live 2025. It equally falsifies the inverse over-broad claim ("LaTeX PDFs never parse cleanly") — pdfLaTeX and LuaLaTeX, tested identically, had **zero** ligature-related extraction problems, including with the "legacy" no-`fontenc` OT1 setup that folklore usually blames.

### Result 2 — Multi-column reading order: usually fine, but not guaranteed, and tool/flag-dependent

Reading order for `multicol`-generated two-column content extracted correctly, in original left-column-then-right-column order, under `pdftotext` default mode, `-layout` mode, and even `-raw` (content-stream order) — because LaTeX's box model writes an entire column's content to the PDF content stream before starting the next column, so naive content-stream-order extraction happens to preserve column order for genuine multi-column LaTeX layouts.

However, this was **not perfectly reliable**: the "legacy" (OT1, no fontenc) pdflatex variant — same content, same layout, only the font-encoding boilerplate differs — showed a real reading-order defect under `pdftotext`'s **default** mode: a later section header ("Hyphenation Test") was extracted *before* the second half of the two-column paragraph above it, i.e. poppler's automatic column-clustering heuristic misjudged the page geometry for that specific font-metric variant. Explicit `pdftotext -layout` fixed it. This means: **reading order is not an invariant property of the PDF — it depends on which extractor and which flags are used**, and a change as small as font-encoding boilerplate can flip a borderline heuristic decision. Real ATS/parsing pipelines are very unlikely to all use `poppler -layout`; many use PDFBox, PyMuPDF, pdfminer, or vendor-proprietary extractors with their own (unknown, undocumented) column-detection heuristics.

**Status: EVIDENCED** (empirical, reproducible in this test) that column order is *usually* preserved for LaTeX-style column layouts but is a heuristic, not a guarantee, and is sensitive to extractor choice/flags/font metrics. Not sufficient data to generalize to what non-poppler extractors (the ones ATS vendors likely actually use) do with multi-column resumes — that requires the vendor-side research in Q1/Q4.

### Result 3 — Hyphenation

Automatically-hyphenated line breaks (from the narrow-minipage test) extracted with a **literal hyphen character inserted at the break point** in every engine tested (e.g. `internationaliza-` / `tion` becomes two extraction tokens joined by a hard hyphen, not rejoined into `internationalization`). This is expected PDF/TeX behavior — LaTeX inserts a real hyphen glyph at automatic break points, and text extraction has no way to know it should be treated as a soft/removable hyphen versus a real one. A keyword matcher doing literal substring search for `internationalization` would fail against text that contains `internationaliza-` and `tion` as separate extracted fragments (with a line break or space between them, depending on the extractor's line-joining behavior). This affects **any long, hyphenatable word that happens to break across a line** — not specific to LaTeX; it would affect Word/InDesign-produced PDFs equally, since it's a PDF-text-layer-level phenomenon, not a LaTeX-specific one. Practical mitigation: disable automatic hyphenation for the CV template, or accept the (small, positional) risk.

**Status: EVIDENCED** (empirical).

### Result 4 — Type 1 font encoding / ToUnicode presence

Contrary to the ticket's hypothesis that missing ToUnicode maps would cause extraction failure: `lualatex`'s output had **no ToUnicode CMap at all** (`pdffonts` reports `uni: no`) and *still* extracted perfectly, because poppler fell back to inferring Unicode values from the embedded font's PostScript glyph names (a well-established poppler behavior, not tested against other extractors here). This suggests the "Type 1 font without ToUnicode map = broken extraction" folklore is **incomplete**: whether it breaks depends on the specific extractor's fallback behavior, not just on whether a ToUnicode map is present. This is a narrower, more tool-dependent claim than the folklore version.

**Status: WIDELY CLAIMED, PARTIALLY EVIDENCED, MORE NUANCED THAN THE FOLKLORE** — missing ToUnicode alone did not break extraction with poppler in this test; it may break extraction with other tools that lack poppler's glyph-name fallback (untested — flagged as open).

### Result 5 — Typst: tested, clean (gap closed)

The gap flagged below has since been closed by the main session. `typst` 0.15.1 **was** available (at `/opt/homebrew/bin/typst`) and has now been tested on an equivalent CV document.

**Typst extracts perfectly clean — 14/14 literal keyword matches, zero exotic codepoints.**

Independent re-run of the whole comparison by the main session, using a separate test document and a scripted codepoint audit:

| Engine | Literal keyword matches | Exotic codepoints in extracted text |
|---|---|---|
| pdflatex (T1 fontenc) | **14/14** | none |
| lualatex | **14/14** | none |
| **typst 0.15.1** | **14/14** | none |
| xelatex | **0/14** | U+FB00 ﬀ, U+FB01 ﬁ, U+FB02 ﬂ, U+FB03 ﬃ |

Test words: office, workflow, efficiency, five, affiliated, Difficult, fluent, first, fifteen, film, files, staffing, notification, Staff. This is a second, independent confirmation of Result 1 on a different source document — the pdfLaTeX/LuaLaTeX/XeLaTeX split reproduces exactly.

Typst additionally handled the umlaut (`Müller`), the en-dash range (`2021–2026`), the middot separator, and two-column `#columns(2)` reading order correctly. Compile time was **0.37 s** versus multi-second LaTeX runs.

**Status: EVIDENCED** (empirical, reproducible).

### Result 6 — ⚠️ CORRECTION: the extractor matters as much as the engine, and LuaLaTeX is NOT safe

**This supersedes the "pdfLaTeX and LuaLaTeX are the safe choices" conclusion in Result 1.** That conclusion was drawn from poppler alone. Testing three independent extractors changes it materially.

| Engine | `pdffonts` ToUnicode | poppler | pypdf | pdfplumber (pdfminer.six) |
|---|---|---|---|---|
| **pdflatex** | `uni: yes`, correct | ✅ 14/14 | ✅ 14/14 | ✅ 14/14 |
| **typst** | `uni: yes`, correct | ✅ 14/14 | ✅ 14/14 | ✅ 14/14 |
| lualatex | **`uni: no` — absent** | ✅ 14/14 | ❌ **0/14** | ✅ 14/14 |
| xelatex | `uni: yes`, **wrong** | ❌ 0/14 | ❌ 0/14 | ✅ 14/14 |

Verified extraction of the same bullet:

```
lualatex + pypdf      : • Led oﬃce workﬂow automation, improving eﬃciency by 40% across ﬁve aﬃliated teams.
lualatex + pdfplumber : • Led office workflow automation, improving efficiency by 40% across five affiliated teams.
```

**The mechanism, now fully explained:**

- **pdfLaTeX and Typst** embed a `/ToUnicode` CMap that maps each ligature glyph back to its *decomposed* character sequence. The text layer is **correct by construction** — every extractor gets it right because the PDF tells the truth.
- **LuaLaTeX embeds no `/ToUnicode` map at all** (`uni: no`). Extractors must infer Unicode from PostScript glyph names. poppler and pdfminer.six both have that fallback; **pypdf does not**. LuaLaTeX is therefore **fragile — it works only by the charity of whichever extractor happens to read it.**
- **XeLaTeX embeds a `/ToUnicode` map that points at the ligature codepoint** (U+FB00–FB03). It is not missing metadata, it is *actively wrong* metadata. poppler and pypdf trust it and produce corrupt text; pdfminer.six normalizes ligatures anyway and rescues it despite the PDF.

**Revised conclusion: only pdfLaTeX and Typst produce a text layer that is correct regardless of extractor.** Since nobody knows which parser a given ATS runs — and vendors don't document it — "correct by construction" is the only defensible bar. LuaLaTeX drops from *recommended* to *not recommended*; XeLaTeX and Tectonic remain disqualified.

**Status: EVIDENCED** (empirical, three independent extractors, mechanism confirmed via `pdffonts`).

### Not tested

- **PDFBox** (Java — plausibly what enterprise ATS vendors actually run) and **PyMuPDF**: still untested. Given that three extractors produced three different behaviours, further variation should be assumed rather than ruled out.
- **Actual ATS-vendor parsers:** untested and undocumented. This is the irreducible gap — the correct response is to pick an engine that is right by construction rather than to bet on any particular parser's leniency.
- **Tectonic** was attempted by the main session and **hung for over 3 minutes on first run** fetching packages from the network. The parallel agent did test it successfully and found it broken in the same way as XeLaTeX (it is XeTeX-based). The first-run hang is itself a finding for the toolchain ticket — see [rendering-toolchain.md](./rendering-toolchain.md).

---

## Q1/Q3/Q5 — Vendor behaviour: what the machine actually does

⚠️ **Sourcing caveat, stated up front.** Q2's findings are empirical and reproducible. This section is not. The searchable literature on ATS behaviour is dominated by companies selling CV-optimization services — and, awkwardly, *the sources debunking the ATS myth are the same commercial class that manufactured it*. Almost nothing here reaches the evidentiary standard of the text-layer testing above. Treat as **directionally credible, individually unverified**.

### Auto-rejection is largely a myth — but the real mechanism sits elsewhere

The widespread belief that an ATS silently deletes resumes for missing keywords appears to be **substantially false**, at least for the modern startup-tier systems:

- **Greenhouse** reportedly does not score or rank resumes at all; its architecture is built around structured hiring with human calibration, and rejections are manual decisions. ([Jobscan](https://www.jobscan.co/blog/greenhouse-ats-what-job-seekers-need-to-know/), [Hiration](https://www.hiration.com/blog/ats-auto-reject-resume-myth/))
- **Lever** reportedly does not score resumes; recruiters work from search results.
- **Ashby** offers an opt-in AI review, but a human must still act on it.
- An Enhancv 2025 survey reported 92% of recruiters saying their systems do not auto-reject at all, with only 8% having content-based rejection configured. ⚠️ **n = 25.** That sample is far too small to carry the weight commonly placed on it — note it, don't lean on it.

**But automatic rejection does happen — via knockout questions on the application form, not via the CV.** Knockout questions are mandatory screening questions with a disqualifying answer, evaluated before any human review and upstream of resume screening entirely. Typical criteria: work authorization, required certification, salary expectation, geographic eligibility. ([Cadient](https://cadient.ai/article/knockout-questions-how-to-filter-50-percent-of-unqualified-applicants-automatically), [Jobscan](https://www.jobscan.co/blog/knockout-questions-answer-application/), [Truffle](https://www.hiretruffle.com/blog/knockout-questions))

This is the single most useful reframing in this document: **the CV is not the thing that gets you auto-rejected. The form is.** Optimizing a PDF against an imagined keyword-scoring robot is aiming at the wrong target.

### What this leaves keyword matching for

If systems mostly rank and search rather than reject, keywords still matter — but for a different reason. Recruiters *search* the ATS database for candidates. Appearing in that search result set is the real mechanism, and it rewards using the vocabulary a recruiter would actually type. That is a materially weaker and more specific claim than "match the job ad's keywords or be deleted", and the spec should be honest about it.

Whether that search is literal, stemmed, or semantic could not be established from credible sources. **Open question.**

## Q4 — What structure survives

Partially answered empirically in Q2 Results 2–3: multi-column reading order is *usually* preserved for genuine column layouts but is a heuristic that varies by extractor and flags; automatic hyphenation inserts real hyphens that break literal matching for any long word that happens to break across a line.

Vendor-side specifics on tables, headers/footers, icons, and text-in-graphics were not established from credible sources. **Open question**, though the conservative design implication is clear enough regardless: keep the CV single-column where it matters, avoid putting text in graphics, and disable automatic hyphenation.
