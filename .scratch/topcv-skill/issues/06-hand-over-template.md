# Hand over the LaTeX template

Type: task
Status: resolved
Blocked by: —

## Answer

Template supplied by the user 2026-08-05 and genericised to [`template/cv-template.tex`](../template/cv-template.tex). **All PII was stripped and the original was never written to disk** — name, date of birth, phone, email, and full employer history existed only in conversation.

### Provenance and engine

- **Hand-rolled**, not from a known family (not moderncv/AltaCV/Awesome-CV/deedy). Built on plain `article` with `tabularx`, `titlesec`, `enumitem`, `hyperref`, `fontawesome5`, and two custom environments (`jobshort`, `joblong`).
- **Compiles under pdfLaTeX.** ✅ — which is the single luckiest fact about it, since pdfLaTeX is one of only two LaTeX engines that produce a correct text layer. Had it been an Awesome-CV/AltaCV derivative it would have required XeLaTeX and been unusable as-is.
- Single page, German-language, no photo, includes date of birth.

### Amenability to being driven programmatically: good

Content separates from layout cleanly. `joblong`/`jobshort` are a genuinely useful pair — an agent can demote a role from bulleted to title-only to protect the page budget, which is exactly the lever the tailoring engine needs. Sections can be dropped without collapse. Header fields were lifted into macros during genericisation.

### Empirical verdict — three problems found, one fixed

Tested by compiling and extracting with **three independent extractors** (poppler, pypdf, pdfminer.six).

**1. ✅ Character-level text layer: clean.** 12/12 keyword matches on all three extractors, zero ligature artifacts, German umlauts (`Müller`, `Qualitätssicherung`, `fünf`) all survive. Two hardening lines were added during genericisation: `\usepackage[T1]{fontenc}` and `\input{glyphtounicode}\pdfgentounicode=1`, which forces a correct `/ToUnicode` map. **Side benefit: this makes the template fail to compile under XeLaTeX** — an accidental but welcome guardrail against the engine that corrupts text.

**2. ❌ FontAwesome icons corrupted the contact line on every extractor. FIXED.** Measured, before removal:

```
pypdf      : /envel⌢pefirst.last@example.com| ♂¶obile0000 0000000| ♂¶ap-¶arkerCity| /bir◎hday-cakeTT.MM.JJJJ
pdfplumber : # first.last@example.com | H 0000 0000000 | * City | Q TT.MM.JJJJ
poppler    : # first.last@example.com | H 0000 0000000 | * City | Q TT.MM.JJJJ
```

FontAwesome glyphs carry no usable Unicode mapping, so glyph names leak in as literal text — and **on pypdf the junk fuses to the email address with no separator**. That is the highest-value line on the whole document for a parser. Icons removed; re-verified clean on all three:

```
poppler / pdfplumber : first.last@example.com | 0000 0000000 | City | TT.MM.JJJJ
pypdf                : first.last@example.com|0000 0000000|City|TT.MM.JJJJ
```

**3. ⚠️ `tabularx` skills pairing breaks under poppler only. NOT fixed — belongs to ticket 11.** pypdf and pdfminer.six both pair label-to-value correctly. Poppler's column-clustering splits them into two blocks, so all four competence *labels* extract first, then all four *value* lists — destroying the association in precisely the section keyword matching cares about most. Extractor-dependent rather than inherent, but poppler is very widely deployed. Fixing it means restructuring the skills section away from a two-column `tabularx`, which is a design decision, not a mechanical fix.

Minor, noted not fixed: pdfminer.six drops inter-word spaces on the `\footnotesize` centred closing line.

### Handed to ticket 11

- Keep-or-port decision: the template is **better than expected** and pdfLaTeX-native, so "keep and harden" is now a real option against "port to Typst".
- The `tabularx` skills structure needs redesign regardless of engine.
- Date of birth is present and hardcoded — must become market-conditional.
- Real-world signal: unknown. The user did not say whether this template has been used in live applications.

## Question

Nothing to decide — the user has a LaTeX CV template they intend to use and said they'd supply it later. *Which renderer, and one template or many?* can't be resolved until it's here and has been looked at.

## What's needed

Drop the template into `.scratch/topcv-skill/template/` (the `.tex` file, plus any `.cls`/`.sty` it depends on and a compiled PDF if one exists).

Then capture, in the answer:

- Where it came from — a known template family (moderncv, AltaCV, Awesome-CV, deedy-resume, friggeri, RenderCV) or hand-rolled? Which one matters, because the ATS research findings apply per-family.
- Which engine compiles it: pdfLaTeX, XeLaTeX, or LuaLaTeX.
- Whether it currently compiles on the user's machine, and what's installed to make that work.
- Whether the user has actually applied for jobs with it, and whether anything came back — weak signal, but it's real-world signal.

## Answer should record

The path to the template, the engine, the family it descends from, and a first read on how amenable it is to being driven programmatically — how cleanly content separates from layout, and whether a section can be dropped without the whole thing collapsing.
