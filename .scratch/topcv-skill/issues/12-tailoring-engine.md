# How does tailoring choose and rephrase?

Type: grilling
Status: open
Blocked by: 08, 09

<!-- 05 resolved 2026-08-05. -->

## What the research already settled

- **Tailoring's magnitude is unevidenced.** The mechanism is real; every circulating percentage is vendor marketing. Design for it, but don't justify decisions with numbers that don't exist.
- **Keywords serve recruiter *search*, not survival of a filter.** Auto-rejection happens via knockout questions on the application form, not CV parsing. This significantly reframes question 1 (selection): optimizing for an imagined scoring robot is aiming at the wrong target.
- **Avoiding a detectable AI register is a hard requirement, not a nicety** — Greenhouse (n=4,136, Nov 2025): 65% of hiring managers caught deceptive AI use; 39% added in-person interviews to filter fakes. This lands directly on question 4 (voice).
- **Quantified-bullet and STAR/CAR/XYZ formulas have no résumé-specific evidence.** Don't hardcode a bullet formula on the assumption it's proven.

## Question

This is the heart of the skill. Given a Candidate Profile, an extracted job ad, and company research, produce the content of one CV. Blocked on the profile schema (what it selects *from*), the honesty rule (what it may *do* to a fact), and the human-reviewer findings (what it should be *aiming* for).

Settle:

1. **Selection.** How are profile atoms scored against the ad? Explicit relevance scoring, or an agent judging holistically? How much does the ad's stated must-have vs nice-to-have split weigh? What guarantees the *strongest* material survives rather than merely the *most matching* — a candidate's best achievement may be tangential and still be the thing that gets them the interview.
2. **The budget.** One page is a hard constraint that forces cuts. Is selection budget-aware from the start, or does it over-select and then trim? What's the unit of cutting — whole roles, individual bullets, or words within a bullet?
3. **Rephrasing.** Per selected atom, how is the wording chosen? How much does the ad's vocabulary govern? Where's the boundary against the honesty rule — this is where *What exactly does "honest optimization" forbid?* actually gets applied, so the two must agree.
4. **Voice.** Whose voice is the CV in? A profile built from the candidate's own words carries their register; a rewritten CV may not sound like them at all — which matters when they're asked about it in an interview. And if *What do human reviewers actually reward on a CV?* finds reviewers are penalizing detectably-AI-written CVs, avoiding that register becomes a hard requirement, not a nicety.
5. **Folding in research.** Company research produces context. How does it actually change output, concretely, rather than vaguely "informing tone"? If it can't change anything concrete, that says something about whether the research is worth running at all.
6. **Fixed vs generated.** What's stable across every CV (name, contact, education, dates) and what's regenerated per job? Facts must not drift between applications — the same job must not have two different date ranges across two CVs.
7. **Review.** Does the user see and approve the selection before rendering? Where's the checkpoint, and how does it avoid becoming a wall of text to approve?
8. **Determinism.** Same profile plus same ad, run twice — should it produce the same CV? Probably not exactly, but wild variation would be alarming.

## What the answer must produce

The tailoring algorithm described concretely enough to implement, plus a worked example: a real profile fragment plus a real ad fragment, and the bullets that come out — showing what got selected, what got cut, and how each was rephrased.
