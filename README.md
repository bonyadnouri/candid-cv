# candid-cv

Planning repo for **candid-cv** — an agent skill that turns a candidate's durable profile plus one specific job ad into an honestly-optimized CV PDF. Selection and framing may be optimized; facts may not be invented or inflated.

**Status: planning.** The work is organised as a [wayfinder map](https://github.com/bonyadnouri/candid-cv/issues/15) whose sub-issues are the decision tickets — open ones are the frontier. No skill code exists yet; the map's destination is a buildable spec.

Ground already covered (measured, not assumed): only pdfLaTeX, Typst and headless-Chrome HTML produce PDF text layers that extract correctly across poppler, pypdf and pdfminer; multi-column CV layout scrambles under extraction, hence the repo's Single-Flow Rule; ATS keyword auto-rejection is largely a myth (the real filter is knockout questions); and every circulating "tailoring improves callbacks by X%" statistic traces to vendor marketing, so this project doesn't cite any. Details in [`.scratch/topcv-skill/`](.scratch/topcv-skill/).
