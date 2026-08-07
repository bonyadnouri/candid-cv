# Does CV format actually differ by role family?

**Partial research output** for [ticket 02](../issues/02-market-conventions.md). Covers question 5 only; the market conventions table is still outstanding.
**Status:** answered, well-sourced. **Date:** 2026-08-05.

## Answer

**The hypothesis holds, with one refinement.** Role family drives CV *structure* in exactly one case: academia. Everything else rides the same generic skeleton with content emphasis and a few conditional sections.

**Recommendation: one generic template + the market-conventions data table + a conditional-sections list, plus one genuinely separate academic-CV template as the sole role-specific fork.**

This collapses the planned template family substantially. The user's assumption — that a marketing specialist's CV should look different from a software engineer's — is **not supported**. They differ in content, not shape.

## By role family

### Academia — genuine structural exception

The only real fork. Academic CVs organize around **research, teaching, and service** rather than chronological work history, carry unbounded publication lists, grants, and conference presentations, and have **no page cap**. The organizing logic itself differs — this isn't a content variant.

- Harvard GSAS: a resume is "typically shorter, 1–2 pages… [CV] focus[es] on academic awards, conference presentations, and publications" — [Harvard GSAS CVs and Cover Letters](https://hwpi.harvard.edu/files/ocs/files/gsas-cvs-and-cover-letters.pdf)
- UC system: "CVs are typically 2-to-4 pages for a new professional, with a recommended maximum of 10 pages for a seasoned professional" — [UCSB Career Services](https://career.ucsb.edu/explore-grad-school/undergrad-cvs/understand-cvs-vs-resumes)
- Corroborated by [Georgetown](https://careercenter.georgetown.edu/major-career-guides/resumes-cover-letters/curriculum-vitae-cv/), [UNC Writing Center](https://writingcenter.unc.edu/tips-and-tools/curricula-vitae-cvs-versus-resumes/), [MIT CAPD](https://capd.mit.edu/resources/cvs/), [Cornell Grad School](https://gradschool.cornell.edu/career-and-professional-development/pathways-to-success/prepare-for-your-career/take-action/resumes-and-cvs/)

**Strong sourcing** — five independent university career services converge.

### Design — weight exception, not structural

Counter-intuitive and worth noting: designers' *résumés* should be plainer than average, not more designed. AIGA, the design profession's own body, is explicit that **"the portfolio will always be king"** and the resume should stay reverse-chronological with readable fonts, **"avoid[ing] unnecessary visual elements, like a headshot or subjective skill graphics"** — [AIGA Baltimore](https://baltimore.aiga.org/resume-writing-guidance-for-designers/).

Implication: no separate template. A **conditional "portfolio link, prominently placed"** element on the generic template covers it.

### Law — modest variant, same skeleton

Typically one page; **omits** objective/professional-summary/skills sections that generic résumés carry; **adds** bar admission and publications. Standard sections: Education (reverse-chronological), Professional Experience, Affiliations/Activities, Publications, Certifications.

- [ABA Career Center](https://www.americanbar.org/careercenter/blog/resume-and-cover-letter-tips-for-your-law-students/) (via search snippet — direct fetch 403'd)
- Corroborated by [WashU Law Career Center Resume Guide](https://apps.law.wustl.edu/enewsletter/1718/Images/WashULaw_CareerCenterResumeGuide.pdf)

A couple of sections omitted, a couple added — conditional sections, not a fork.

### Software engineering — content variant only

Same generic skeleton plus a **Technical Skills** grid and GitHub/portfolio links.

⚠️ **Weaker sourcing.** No professional-body (IEEE/ACM) résumé-format guidance was found; this rests on SEO-tier career sites — [DataCamp](https://www.datacamp.com/blog/software-engineer-resume), [Pluralsight](https://www.pluralsight.com/resources/blog/upskilling/writing-great-software-engineer-resume-guide), [BeamJobs](https://www.beamjobs.com/resumes/software-engineer-resume-examples). Convergence across many independent sites indicates consistent industry habit rather than fabrication, but treat as habit, not evidence.

### Marketing — content variant, weakest sourcing

Same generic structure (profile, key achievements, skills/tools, experience) with marketing-specific content (KPIs, channel mix, optional CIM membership).

⚠️ **Flag as custom-without-strong-evidence.** CIM/CIPR's own guidance could not be found; only CV-building sites — [resume.io UK](https://resume.io/uk/cv-examples/marketing), [cvmaker.uk](https://www.cvmaker.uk/cv-example/marketing).

## Bonus finding: length flexes by sector

Prospects.ac.uk (Jisc/HECSU-backed, the UK's quasi-official national graduate careers service): **"Although all CVs generally follow the same structure, some sectors such as finance (particularly banking) and consulting often like to see a concise 1-page CV, whereas other sectors such as law and engineering generally want a 2-page document"** — [Prospects: How to write a CV](https://www.prospects.ac.uk/careers-advice/cvs-and-cover-letters/how-to-write-a-cv/) (via search snippet, direct fetch 403'd).

So page length is governed by **market + seniority + a mild sector nudge**. Still a data-table value, not a template fork.

## What this means for topcv

1. **Ticket *Which renderer, and one template or many?* gets simpler.** One generic template plus one academic template, not a family per profession.
2. **A "conditional sections" concept is needed** in the template design: portfolio-link-prominent, technical-skills-grid, bar-admission, publications. Cheaper than template variants and composable.
3. **The conventions data table gains a sector dimension** for page length, alongside market and seniority.
4. **Design is a trap worth remembering** — the instinct to make a designer's CV visually striking is contradicted by the profession's own body.

## Gaps

- Marketing and software-engineering findings rest on SEO-tier sources; no professional body confirms them.
- Non-Anglophone role conventions untested — all sources here are US/UK. Whether German or French practice forks by role is **unknown**.
