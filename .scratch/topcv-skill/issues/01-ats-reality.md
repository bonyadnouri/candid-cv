# Does the ATS actually read what we think it reads?

Type: research
Status: resolved
Blocked by: —

## Answer

Full findings: [research/ats-reality.md](../research/ats-reality.md).

**Two headline results.**

1. **The LaTeX hazard is real but engine-specific** — verified empirically, twice, independently. pdfLaTeX, LuaLaTeX and Typst all extract **14/14 clean**. XeLaTeX and Tectonic extract **0/14**, replacing `fi`/`ff`/`fl`/`ffi` with Unicode presentation-form codepoints (U+FB00–FB03), so a literal search for "office" returns nothing. The PDF *looks* perfect; only the text layer is corrupt. `fontspec`'s `Ligatures=NoCommon` did **not** fix it. Since most visually-designed CV templates (Awesome-CV, AltaCV) require XeLaTeX for custom fonts, this is a live trap.
2. **Auto-rejection by keyword is largely a myth — the real filter is elsewhere.** Greenhouse, Lever and Ashby reportedly don't score or auto-reject on CV content; rejection is a human decision. What *does* auto-reject is **knockout questions on the application form** (work authorization, certifications, salary, location), evaluated upstream of any CV review. Keywords still matter, but for **recruiter database search**, not for surviving a filter — a materially weaker and more specific claim than the folklore.

⚠️ Result 1 is empirical and solid. Result 2 rests on CV-vendor sources — note the irony that the sources debunking the ATS myth are the same commercial class that manufactured it.

## Question

Most CV advice about "ATS optimization" is folklore repeated by companies selling CV services. Establish what applicant tracking systems **actually** do in 2026, from primary sources — vendor documentation, published parser specs, vendor engineering blogs, resume-parsing library source — not from CV-advice blogs.

Answer specifically:

1. **Which systems matter.** Workday, Greenhouse, Lever, SmartRecruiters, Ashby, Personio, Teamtailor, iCIMS, Taleo. What is each actually doing to an uploaded PDF — full text extraction, structured field parsing, LLM extraction, or nothing at all until a human opens it?
2. **The LaTeX question — this is the one that matters most.** Do PDFs produced by LaTeX engines parse correctly? LaTeX has known text-layer hazards: ligature glyphs (`ﬁ`, `ﬀ`) that extract as mojibake, hyphenation artifacts, multi-column reading order, glyph-level kerning that breaks word boundaries, Type 1 font encoding without a `ToUnicode` map. Establish which of these are real in modern engines (pdfLaTeX vs XeLaTeX vs LuaLaTeX vs Tectonic vs Typst) and which are legacy folklore. **Verify empirically where you can** — generate a sample PDF and extract its text with `pdftotext`, `pdfplumber`, or similar, and report what actually comes out.
3. **Auto-rejection.** Is there evidence any major ATS auto-rejects on keyword match, or is that a myth? Distinguish "the system scores/ranks" from "the system rejects".
4. **What structure survives.** Do tables, columns, headers/footers, icons, and text-in-graphics survive extraction? Which section headings do parsers recognize?
5. **Keyword handling.** If keyword matching is real, is it literal string match, stemmed, or semantic? Does exact phrasing from the job ad matter, and does keyword stuffing get detected?

Flag clearly which findings are **evidenced** versus **widely-claimed-but-unsourced**. A confident answer that "X is folklore" is as valuable as confirming it's real.

## Why this blocks things

If LaTeX PDFs parse badly, the single-LaTeX-template premise is dead and *Which renderer, and one template or many?* changes shape entirely. If ATS keyword matching is folklore, a large part of the intended tailoring logic is wasted effort aimed at a machine that isn't reading.

## Output

`.scratch/topcv-skill/research/ats-reality.md`, every claim cited to its source.
