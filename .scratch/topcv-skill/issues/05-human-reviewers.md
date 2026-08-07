# What do human reviewers actually reward on a CV?

Type: research
Status: resolved
Blocked by: —

## Answer

Full findings: [research/human-reviewers.md](../research/human-reviewers.md). This ticket's most valuable output is knowing how much of the received wisdom is unsupported.

**The uncomfortable one first — does tailoring actually work?** The *mechanism* is real, but **the magnitude is not evidenced**. Every circulating figure ("11.7% vs 4.2%", "2.5× callbacks", "31% more likely") traces to vendor blogs with no disclosed methodology; none could be verified. No study was found isolating "human prefers tailored" from "ATS filters on keywords" — the two are conflated everywhere. **Honest framing: directionally true, unquantifiable.** The skill must not be sold on a percentage.

**The "6 seconds" claim is a press release.** TheLadders, 2012 (updated 2018 to 7.4s), a company selling résumé services, with no disclosed sample size or methodology in either version. One source had laundered it into a fake "SHRM 2026" citation. Directionally plausible; not data.

**Quantified bullets and STAR/CAR/XYZ have essentially no résumé-specific evidence.** STAR originated as a 1970s behavioural-*interview* technique, not a writing method.

**The inflation boundary is a design choice, not a finding.** Prevalence is well evidenced (HireRight: 75–88% of employers catch discrepancies; Kickresume n=1,004). But the specific word-level line — "led" vs "contributed to" — that advice content states with total confidence is **asserted, never measured**. → *What exactly does "honest optimization" forbid?* must therefore produce a **designed policy**, and should say so honestly rather than claiming evidence it doesn't have.

**Best-evidenced finding of the seven: AI-written CVs are being caught.** Greenhouse, Nov 2025, n=4,136, methodology disclosed: 65% of hiring managers caught deceptive AI use, 91% spotted candidate deception generally, 39% of US hiring managers added in-person interviews specifically to filter AI fakes. ⚠️ The specific "AI word list" (spearheaded/delve/leverage/robust) is vendor assertion, not résumé-specific study. **This makes avoiding a detectable AI register a hard requirement for the tailoring engine, not a nicety.**

## Question

The ATS is only the first gate. A human decides. Establish what recruiters and hiring managers **demonstrably** respond to — separating evidence from the enormous volume of confident, unsourced CV advice.

1. **The scan.** The "recruiters spend 6 seconds" claim traces to a single small eye-tracking study. Find the actual study, assess how well it holds up, and find better evidence if it exists. What do reviewers look at first, and in what order?
2. **Bullet construction.** Is there real evidence that quantified achievements outperform responsibility statements? Does the STAR/CAR/XYZ formula have support, or is it just a teachable shape? What actually makes a bullet land?
3. **Evidence hierarchy.** How do reviewers weigh company prestige vs job title vs tenure vs concrete outcomes? What does a career gap or short tenure actually cost?
4. **The tailoring premise.** Is there evidence that a CV tailored to a specific job outperforms a generic one — and by how much? **The whole skill rests on this.** If the effect is marginal, say so plainly; that's a finding worth having.
5. **Anti-patterns.** What reliably hurts — buzzwords, "hardworking team player", skill-level bar charts, objectives, references-on-request, dense text, overdesign?
6. **The honest-optimization boundary.** How do reviewers detect and react to inflated CVs? What separates legitimate reframing from what reads as exaggeration? This directly feeds *What exactly does "honest optimization" forbid?*
7. **AI-written CVs.** With LLM-generated applications now flooding pipelines, are reviewers detecting and penalizing them? Is there a recognizable "AI CV" register to actively avoid?

Prefer studies, large-scale hiring-platform data, and recruiter surveys with methodology. **Label the folklore as folklore** — the value here is knowing which advice to ignore.

## Output

`.scratch/topcv-skill/research/human-reviewers.md`, with an explicit split between well-evidenced findings and popular-but-unsupported claims.
