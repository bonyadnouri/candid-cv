# What do human reviewers actually reward on a CV?

Research for ticket `05-human-reviewers.md`. Direct, hands-on research (WebSearch/WebFetch), not delegated.

**A note on how this research went, because it's itself a finding:** a large fraction of what ranks for every query in this space is SEO content-marketing copy from resume-builder / CV-optimizer vendors (Resumly.ai, Resume Optimizer Pro, Jobwizard, Hirelytica, TailorForge, StylingCV, ResumePulse, Kickresume's blog, etc.). These sites routinely cite precise-sounding statistics ("resumes with quantified achievements are 3.2x more likely to get a callback," "SHRM's 2026 surveys show hiring managers spend 7.4 seconds...") with **no linked study, no sample size, no methodology** — and sometimes attribute a real number to the wrong, more credible-sounding source (see Q1 and Q2). Treat any number below that isn't traced to a named, checkable source as noise.

## TL;DR — evidenced vs. folklore, by question

| # | Question | Verdict |
|---|---|---|
| 1 | "6 seconds" scan claim | **Folklore wearing a lab coat.** Real press release, no disclosed methodology or sample size, from a company that sells resume/career services. Directionally plausible (screening is fast) but the number itself carries almost no evidentiary weight. |
| 2 | Quantified bullets / STAR-CAR-XYZ | **No real evidence found for resumes specifically.** STAR is a 1970s *interview-evaluation* technique, not a resume-writing method — its use on resumes is an unsourced extrapolation. Every "quantified bullets get 3.2x more callbacks" style stat traces to uncited vendor blogs. |
| 3 | Evidence hierarchy (prestige/title/tenure/gaps) | **Partially evidenced.** Solid academic audit-study evidence on career gaps, age, and "interim jobs." No study found that directly ranks prestige vs. title vs. tenure vs. quantified outcomes against each other. |
| 4 | **Tailoring premise** | **Mechanism is real, magnitude is not well evidenced.** ATS/keyword-match as a gatekeeping mechanism is real and documented. But the specific effect-size numbers everyone cites (11.7% vs 4.2%, "2.5x", "31% more likely") all trace to vendor blogs with undisclosed methodology, not peer-reviewed or audited studies. **This is the most important finding in this document — see Q4 for the full statement.** |
| 5 | Anti-patterns | **Mixed.** Photos: strong academic evidence, and it cuts the *opposite* way in different countries (this matters for the skill). Buzzwords: one real, disclosed-sample survey (CareerBuilder, n=2,000+). Objective statements / skill bar charts / dense text: folklore — no study found either way. |
| 6 | Inflation/honesty boundary | **Prevalence is evidenced; the exact line is not.** Real, disclosed-methodology data on how often recruiters *catch* exaggeration exists. No study empirically tests where recruiters draw the line at the verb-choice level ("led" vs. "contributed to") — that specific distinction is advice-content folklore, stated with total confidence and zero data behind it. |
| 7 | AI-written CVs | **Best-evidenced of the seven, because the surveys are recent, disclosed, and large.** Real, named, dated, methodology-disclosed surveys (Greenhouse, Kickresume) show recruiters detecting and reacting to AI-generated content in 2025–2026. The specific "AI CV register" (word lists like "spearheaded," "delve," "leverage") is *not* backed by a resume-specific study — it's asserted, not measured. |

---

## 1. The "6 seconds" scan claim

### Evidenced (weakly)
- The claim originates from an eye-tracking study commissioned by **TheLadders** (a job-matching/career-coaching company), first reported around 2012, with a 2018 "update" to **7.4 seconds**. The 2018 update's own press release states the study "utilized eye tracking... to analyze... a group of professional recruiters" reviewing resumes and job profiles — but the release **discloses no sample size, no recruiter-recruitment method, and no equipment/protocol detail**. ([PRNewswire release, TheLadders, 2018](https://www.prnewswire.com/news-releases/ladders-updates-popular-recruiter-eye-tracking-study-with-new-key-insights-on-how-job-seekers-can-improve-their-resumes-300744217.html))
- Secondary reporting on the same study (e.g., [HR Dive](https://www.hrdive.com/news/eye-tracking-study-shows-recruiters-look-at-resumes-for-7-seconds/541582/)) adds no methodological detail either — it repeats the number without independent verification or expert critique.
- What little is disclosed: ~80% of the six/seven seconds went to name, current/previous titles, employment dates, and education — i.e., the "identity/credentials" block, not accomplishments. If true, this is the one genuinely actionable finding (front-load identity signals), but it rests on the same undisclosed sample.
- **Honest assessment of weight:** This is not a peer-reviewed study. It has never been independently replicated by an academic or a party without a commercial stake in the "your resume needs professional help" narrative. TheLadders sells resume-writing and career-coaching services — the finding is also the pitch for its product. The number should be treated as **a marketing claim with a plausible kernel** (screening probably *is* fast), not as a load-bearing fact. Use "reviewers make fast keep/toss decisions on early cues" as the takeaway; do not use "6 seconds" or "7.4 seconds" as a designed-for number anywhere in the skill.

### Popular but unsupported
- The specific "6 seconds" (or "7.4 seconds") figure has been laundered into unrelated "authoritative" sources — one search result asserted "According to 2026 SHRM recruiter surveys, hiring managers spend an average of 7.4 seconds on initial resume scans," which is almost certainly the TheLadders number re-attributed to SHRM by a content site, since no such SHRM study surfaced anywhere else. This is a textbook case of citation laundering — treat any "SHRM says 7.4 seconds" claim as false attribution.
- No larger, better, or more rigorous eye-tracking study of recruiter resume-scanning was found in this research pass. If one exists in the I/O psychology literature, it wasn't discoverable through the search terms tried (search budget was exhausted before an academic-database-specific pass could be done — flagging this as a real gap, not a negative finding).

---

## 2. Bullet construction: quantification and STAR/CAR/XYZ

### Evidenced
- Nothing solid. No audit study, survey with disclosed methodology, or academic paper was found that tests whether quantified bullets outperform plain responsibility statements in real callback rates.

### Popular but unsupported
- Every claim found ("3.2x more likely to get a callback," "quantifying every bullet increases interview rates by up to 40%," "80% of bullets should contain a number") traces to resume-vendor blogs (Resumly.ai, Resume Optimizer Pro, resume.io, etc.) with zero cited methodology, sample, or source study. These are **plausible-sounding, unverifiable numbers manufactured for SEO content**, not evidence.
- **STAR (Situation, Task, Action, Result)** did not originate as a resume-writing technique. It was developed by organizational psychologists at **Development Dimensions International (DDI)** in the 1970s as a **structured behavioral-interview evaluation method** — a way for an *interviewer* to elicit and score a candidate's past-behavior story, on the premise that past behavior predicts future performance. Its migration onto resumes ("compress STAR into one bullet") is a later, informal adaptation with no evidence base of its own — it's a teachable shape borrowed from a different, and itself only indirectly evidenced, discipline (structured interviewing does have decades of I/O-psychology support as *more predictive than unstructured interviews*; that evidence does not transfer to "writing resume bullets in STAR shape gets you more callbacks").
- CAR and XYZ (Google's format) appear to be even more recent teaching heuristics with no independent evidence found either way.

---

## 3. Evidence hierarchy: prestige, title, tenure, gaps

### Evidenced
- **Career/employment gaps and short "interim" jobs measurably hurt**, per a real academic audit study: Farber, Silverman & von Wachter, *"Factors Determining Callbacks to Job Applications by the Unemployed: An Audit Study,"* published in *RSF: The Russell Sage Foundation Journal of the Social Sciences* (also circulated as [NBER Working Paper 21689](https://www.nber.org/system/files/working_papers/w21689/w21689.pdf)). Methodology: 11,154 fictitious applications sent across four rounds to real job postings for administrative-support roles in 8 U.S. cities, varying applicant characteristics. Findings, directly from the paper (confirmed via [RSF journal](https://www.rsfjournal.org/content/3/3/168)):
  - **Duration of unemployment itself had no measurable effect** on callback rates — contradicts a lot of folk wisdom that "long gaps look bad."
  - **Age mattered a lot**: applicants aged 55–58 got substantially fewer callbacks than younger ones.
  - **Taking a lower-level "interim" job while searching significantly reduced callbacks** — worse than having an open gap.
  - Caveat: this study's population is college-educated women applying to administrative-support jobs — the findings may not generalize to other role families.
- A large-scale correspondence-study literature exists on **name-signaled identity (race, gender, etc.) affecting callbacks**, most famously Bertrand & Mullainathan's "Are Emily and Greg More Employable Than Lakisha and Jamal?" (NBER Working Paper 9873). A 2024 meta-analysis of 21 North American correspondence studies (592 social signals) found perceived "warmth and competence" of a name/signal moderately correlates with callback rates (ρ = .33, p = .03), and that **Black applicants received ~20% fewer callbacks than white applicants** in the pooled data — with high heterogeneity across studies (Gallo, Hausladen, Hsu, Jenkins, Ona & Camerer, [PMC11236140](https://pmc.ncbi.nlm.nih.gov/articles/PMC11236140/)). This bears on the skill only indirectly (it's about discrimination, not resume construction choices), but it's worth knowing the strongest, most-replicated finding in the whole hiring-audit literature is about *identity signaling*, not about anything a CV-writing tool can optimize.
- Two more employment-gap-adjacent studies surfaced but were **not independently fetched/verified** in this pass (flagging honestly rather than asserting their contents): a ScienceDirect field experiment titled "Sick and tell: A field experiment analyzing the effects of an illness-related employment gap on the callback rate," and a PMC paper titled "Reducing discrimination against job seekers with and without employment gaps." Titles suggest they're relevant and legitimate (peer-reviewed venues) but their specific findings should be verified before being relied on.

### Popular but unsupported
- No study was found that head-to-head ranks how much weight reviewers give to **company prestige vs. job title vs. tenure length vs. concrete quantified outcomes**. This is a real gap — the "evidence hierarchy" the ticket asks about doesn't appear to exist in the literature in the direct form asked. What exists is scattered: gaps/age/interim-jobs are evidenced (above); prestige-vs-title-vs-outcomes trade-offs are not.
- A widely-repeated but unverified claim (found via AI-search-summary, not independently confirmed) describes a UK pre-registered field experiment finding that listing prior jobs by **years-worked instead of exact dates** increases callbacks by ~8% relative to a resume with visible gaps. Plausible, but I could not trace it to a primary source before the search budget ran out — do not treat as confirmed.

---

## 4. The tailoring premise — the highest-priority question

**This is the single most consequential finding in this document, and it needs to be stated plainly: the mechanism behind tailoring is real, but the specific magnitude everyone quotes is not evidenced by anything that survives scrutiny.**

### What's actually evidenced
- **ATS/keyword-match as a gatekeeping mechanism is real and structurally well-understood** — hiring platforms genuinely parse and score resumes against job-description keywords, and low-matching resumes are more likely to be filtered before a human ever sees them. This is a documented mechanical fact about how modern hiring pipelines are built, not a disputed claim.
- There is a large, credible academic literature (audit/correspondence studies) establishing that **varying resume content in a targeted way changes callback rates** for many other variables (name, age, employment status, gaps — see Q3). The *methodology* for testing "does variant X of a resume get more callbacks" is well established and rigorous when done right (Farber/Silverman/von Wachter above is a good example of what a real version of this study looks like).

### What is NOT evidenced (and this is the important part)
- Nearly every specific number attached to "tailoring works" in this space traces to **vendor content with no disclosed methodology**:
  - "Candidates who tailor their resumes are 31% more likely to land an interview" — no source study named.
  - "A study of 15,000 applications revealed... 11.7% callback rate [tailored] vs. 4.2% [generic]" — attributed in secondary summaries to "Wellfound, 2024" but no actual paper, blog post, or dataset was locatable; this reads as a fabricated-precision statistic.
  - "Jobscan's industry data shows tailored resumes get 50% more callbacks" — no linked data, no methodology.
  - "Resumes hitting 70%+ keyword match get 2.5x more callbacks (Resumly.ai, 2025)" — Resumly.ai is a resume-optimization SaaS product; this is a product-marketing claim from an interested party citing itself.
  - A claim of a real "field experiment on 7,287 applications" with tailored-cover-letter callback rates of 16.4% vs. 12.5% vs. 10.7% surfaced in one search summary. **I could not independently verify this against a primary source** before the search budget for this session was exhausted — it may be real, but I'm flagging it as unconfirmed rather than reporting it as fact.
- No audit study was found that isolates "human reviewer preference for a tailored resume" as distinct from "ATS keyword-match mechanically filtering resumes before a human ever looks." **These are two different mechanisms and the popular literature conflates them constantly.** A resume can clear a keyword filter (mechanical) without a human reviewer consciously valuing "tailored-ness" as such once they're reading it (psychological/behavioral) — and no study in this pass separated the two effects.

### Honest bottom line
The premise the skill rests on — "a CV tailored to a specific job outperforms a generic one" — is **plausible and probably true as a mechanical matter** (keyword/skill matching genuinely gates visibility in ATS-mediated pipelines), but **the effect size cannot currently be quantified from credible sources**. Every specific percentage in wide circulation is either unsourced, self-interested, or unverifiable. If the skill's design wants a defensible number to lean on, there isn't a good one yet — the honest framing is "tailoring plausibly increases the odds a resume clears the mechanical gate and reads as relevant to a skimming human, but no credible study puts a number on it." Do not let the skill's copy or design assume a specific lift percentage; treat this as directionally-true-but-unquantified rather than settled science.

---

## 5. Anti-patterns

### Evidenced
- **Photos on resumes are a genuinely evidenced anti-pattern in some contexts and a genuinely evidenced *requirement* in others** — this is not folklore, it's real audit-study literature, and it cuts by country:
  - Correspondence-study evidence of photo-driven ethnic/racial discrimination exists for **Austria, Germany, and Peru** (per a review cited in [Oxford Review of Economic Policy](https://academic.oup.com/oxrep/article/40/3/579/7907283) on résumés in Germany/Netherlands, and a broader review of correspondence experiments since 2005).
  - Ethnic and racial minorities engage in documented "résumé whitening" (concealing/downplaying ethnic cues, including omitting photos) specifically to reduce this discrimination.
  - Norm split by geography: in the **US, UK, and Canada, a photo is discouraged / can trigger discrimination liability concerns**; in **Germany, Austria, Switzerland, and much of Asia, a photo is expected or effectively required** by HR convention. This directly matters for the skill's design if it's meant to work across markets — "never include a photo" would be wrong advice in DACH markets, "always include one" would be wrong (and legally risky) in the US.
- **Generic buzzwords/clichés are disliked by recruiters**, per a CareerBuilder survey of 2,000+ hiring managers and HR professionals (disclosed sample size, though CareerBuilder is itself a recruiting-adjacent company and the survey methodology beyond sample size wasn't independently verified here): "results-driven," "team player," and "hardworking" were named as disliked, in favor of concrete, checkable action verbs ("achieved," "improved," "trained"). This is better-sourced than most of what's in this document, but still a single vendor-run survey, not a controlled outcome study — it tells you what recruiters *say* they dislike, not that avoiding these words causally changes callback rates.

### Popular but unsupported
- "Objective statements are outdated," "skill-level bar/star charts confuse ATS parsers and look unprofessional," "references available upon request is a wasted line," "dense unreadable text hurts you," "overdesigned templates hurt you" — all are near-universal advice-content claims. **No study, survey, or audit was found supporting or refuting any of these specifically.** They may well be true (some — like "ATS parsers choke on bar-chart graphics" — are at least mechanically plausible given how parsers work), but this pass found zero primary evidence either way. Label these as inherited folklore, not evidence, until someone finds a real source.

---

## 6. The honest-optimization boundary: inflation and exaggeration

### Evidenced (prevalence and detection)
- **HireRight's annual Global Benchmark surveys** (a real background-screening company running a genuine, disclosed, multi-year survey program — commercially interested in the topic, but with actual longitudinal sample data, not a one-off content-marketing number) show:
  - 2016 benchmark: 88% of employers found a resume misrepresentation.
  - More recent data: 85% of employers found lies on applicant resumes (vs. 66% "five years prior" per the same reporting lineage).
  - 2025 Global Benchmark: over 75% of employers worldwide caught at least one candidate discrepancy during screening. ([HR Dive coverage of HireRight](https://www.hrdive.com/news/hireright-85-of-employers-have-spotted-lies-on-resumes/440743/); [HireRight press materials](https://hireright.com/news/press-release/hireright-survey-finds-88-percent-of-employers-have-found-a-misrepresentati))
- **Kickresume's December 2025 survey** (n=1,004, methodology disclosed, but sampled from Kickresume's own user base — flag: likely skewed toward people who already use an AI resume tool, not representative of the general applicant pool): only 38% report *never* exaggerating; 46% admit "polishing slightly," 12% "exaggerating impact," 4% "fabricating titles/dates." On the HR side of the same survey: 39% of HR respondents estimated exaggerations appear in 26–50% of applications, and 31% estimated 51–75%. ([Kickresume survey](https://www.kickresume.com/en/press/resume-trends-survey/))
- **Embellishing responsibility/scope of a role** (claiming to have "led" or "managed" something one merely participated in) is repeatedly named, across multiple sources, as the *most common* category of resume fraud — more common than fabricating credentials outright.

### NOT evidenced — the actual line
- **No study was found that empirically tests where recruiters draw the line at the level of specific word choice** (e.g., "contributed to the migration" vs. "drove the migration" for the same underlying role). Every source that describes this distinction — including fairly confident-sounding vendor content — is giving advice/opinion, not reporting a finding. One representative example of the (unsourced) advice: a candidate who "contributed to backend development" is honest, a candidate who claims to have "led a team of 12 engineers" when they didn't is not, and "a recruiter often cannot tell the difference from the resume alone" — this is a reasonable-sounding claim but it is **asserted, not measured**, in every source found.
- Practical implication for the skill's honesty rule: you cannot cite a study to justify a specific verb-choice boundary (e.g., "never use 'led' unless you had direct reports"). The boundary the skill adopts will have to be a **designed policy choice**, not an evidence-backed one — which is fine, but it should be labeled internally as a judgment call, not "the research shows recruiters react badly to X wording," because no research says that with any granularity.
- What *is* indirectly supported: **inflated claims get caught at a much higher rate than people producing them probably assume** (75–91% of employers catch *something*, per HireRight/Greenhouse data above), which supports a design principle of "assume claims will be checked, especially at interview or reference stage" — but that's a prevalence/detection finding, not a wording-boundary finding.

---

## 7. AI-written CVs

This is the best-evidenced of the seven questions, because the underlying surveys are recent (Nov–Dec 2025), large, and methodology-disclosed — a rare combination in this space.

### Evidenced
- **Greenhouse, "The 2026 AI in Hiring Report"** (surveyed November 19, 2025; n=4,136 total across US/UK/Ireland/Germany — 2,900 job seekers + 1,236 recruiters/hiring managers; US subset 1,200 + 665). Verified via direct fetch of [Greenhouse's own newsroom page](https://www.greenhouse.com/newsroom/an-ai-trust-crisis-70-of-hiring-managers-trust-ai-to-make-faster-and-better-hiring-decisions-only-8-of-job-seekers-call-it-fair):
  - **65% of hiring managers have caught applicants using AI deceptively** (detection methods cited: reading from AI-generated scripts 32%, hidden prompt injection in resumes 22%, deepfakes 18%).
  - **91% of recruiters/hiring managers have spotted or suspected candidate deception** in general (not just AI-specific).
  - **74% are more concerned about fake credentials/misrepresented experience than a year ago.**
  - Recruiters are changing behavior in response: **39% of US hiring managers report doing more in-person interviews** specifically to separate real candidates from AI-assisted fakes.
  - Recruiters are also spending real time on this: 34% report spending up to half their week filtering spam/junk applications.
  - Note: Greenhouse is an ATS vendor with a commercial interest in "AI fraud is a growing problem, use our verification tooling" — the methodology (real disclosed N, named date, named markets) is much stronger than most sources in this document, but the framing/emphasis should be read with that incentive in mind.
- **Kickresume survey** (n=1,004, Dec 2025, self-selected from Kickresume's own user base — flagged above as likely biased toward people already using AI resume tools, so treat the specific percentages as upper-bound / non-representative):
  - 44% of HR professionals claim they can "easily" detect AI-written resume content (vs. 27% of job seekers who think HR can).
  - 85% of job seekers *believe* recruiters can spot AI use.
  - 55% of AI-tool users say their primary motivation is "to sound more confident and professional" (only 24% cite saving time) — mildly interesting for skill design: people aren't just using AI for speed, they're using it because they don't trust their own voice to read as competent.
- A claim that "69% of HR professionals now use AI to support recruiting activities (up from 51% the year before), per SHRM's 2025 Talent Trends Survey" surfaced in a secondary aggregator. **Not independently fetched/verified from SHRM directly** in this pass — flagging as plausible (SHRM is a legitimate, large-sample professional association with a real annual survey program) but unconfirmed at the primary-source level here.

### NOT evidenced — the "AI CV register"
- The specific claim that there's a recognizable "AI CV register" — particular words (**"spearheaded," "delve," "leverage," "robust," "seamless," "drove," "owned," "championed"**), structures, or rhythms that recruiters specifically flag — was found stated confidently in vendor blog content (e.g., "the verbs give it away first — every bullet opens with spearheaded, drove, owned, or championed... plus a summary that could belong to any of a thousand people") but **no resume-specific study was found that empirically validates this word list**. This is adjacent to a real, separately-documented phenomenon in *other* domains — academic writing and product reviews have been shown in published research to carry detectable "excess vocabulary" after LLM adoption (words like "delve," "boast," "showcase," "intricate" spiking in frequency in post-ChatGPT scientific abstracts) — but **that literature is about scientific writing, not resumes, and this research pass did not locate a resume-specific equivalent study.** Treat the "AI CV word list" as a plausible hypothesis worth designing around cautiously (i.e., a generator built on this skill should probably avoid those words anyway, since they're clichéd regardless of AI provenance — see Q5), not as an evidenced detection mechanism.
- One search result claimed "internal estimates at large enterprises suggest 60-80% of resumes received in 2026 show clear signs of LLM authorship" and "human pattern-matching... driving a 62% rejection rate on flagged resumes" — these came from a vendor blog (hirelytica.com) with no named source, no methodology, no attribution to any actual enterprise or study. This has the shape of a fabricated statistic and should not be used.
- The finding that "generic content, not AI-assistance per se, is the actual rejection trigger" (i.e., recruiters say they penalize resumes that read as generic/unpersonalized, not resumes they merely suspect were AI-assisted) appeared consistently across several sources, but the sources making this specific distinction were vendor blogs without disclosed methodology — plausible and consistent with the disclosed Greenhouse/Kickresume data above (which is about *deceptive* AI use and fraud, not "used AI to write, but honestly"), but not itself independently evidenced at the same standard.

---

## Gaps and honest limitations of this research pass

- The WebSearch budget for this session was exhausted partway through — a few threads (objective statements, skill bar charts, direct SHRM primary-source verification, a deeper academic-database pass for Q1) were left less thoroughly checked than the four priority questions (4, 6, 7, 1). These are marked inline above rather than silently filled in.
- Several claims surfaced only through AI-generated search-result summaries rather than a directly fetched primary source (the UK employment-gap "years vs. dates" experiment in Q3, the 7,287-application cover-letter field experiment in Q4, the SHRM 69%-AI-adoption figure in Q7). These are flagged as unconfirmed rather than reported as fact — worth an independent verification pass if the skill design leans on any of them specifically.
- No academic full-text database (JSTOR, PsycINFO, EconLit) was searched directly — this research relied on open web search and whatever primary sources were reachable via WebFetch. The academic evidence found (Farber/Silverman/von Wachter, the warmth/competence meta-analysis, the photo-discrimination literature) came up because they happened to rank in general search, not because of a systematic literature search. A dedicated academic-database pass could surface more (especially for Q2 and Q3's prestige/title/tenure ranking, where nothing was found).
