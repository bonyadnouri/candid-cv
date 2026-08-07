# What exactly does "honest optimization" forbid?

Type: grilling
Status: open
Blocked by: —

## Question

"We optimize but we don't lie" is the philosophical core of the skill, and as stated it is unenforceable. An agent under pressure to make a candidate look good will drift, and every individual drift will look defensible. This ticket turns the principle into a rule an agent can actually apply — and, ideally, one that can be *checked*.

Work out:

1. **The taxonomy.** Draw the line through concrete cases. Clearly fine: reordering, dropping irrelevant material, choosing the ad's vocabulary over the candidate's for the same underlying thing. Clearly not: inventing a technology, inflating a number, claiming a title never held. **The interesting cases are in between** — and that's the real work here:
   - Candidate says "I helped with the migration"; ad wants migration ownership. How much can "helped with" become "contributed to" become "drove"?
   - Candidate used a technology once for a weekend. Does it go in the skills list?
   - Candidate remembers "we cut load times a lot" but has no number. Can it be quantified? Estimated? Must it stay qualitative?
   - Team achievement rendered in the first person singular — where's the line?
   - The ad's exact keyword describes something the candidate did under a different name. Adopting their word is arguably just translation. When does translation become claiming?
2. **Evidence linking.** Should every generated bullet carry a pointer back to the profile fact it rests on? That would make the honesty rule *mechanically checkable* and make the whole thing auditable — at the cost of a heavier profile schema. Decide, and note the coupling to *Where does the Candidate Profile live, and what shape is it?*
3. **Who verifies.** Does the user review claims before rendering? A separate verification pass? A final honesty check by a fresh agent that hasn't been marinating in "make this candidate look great"?
4. **The gap case.** The user's own example: an engineer who can't build APIs applying to a job wanting APIs. The rule is *don't hold it against them, find other real evidence to surface* — but that needs teeth. When does the skill tell the user plainly that they're not a fit, versus quietly optimizing around it? Does it ever refuse?
5. **Escalation.** What does the skill do when the user *asks* it to overstate?

6. **🚩 Hidden keyword injection — decide this one explicitly.** The research turned up a real, popular Typst CV package ([`brilliant-cv`](https://typst.app/universe/package/brilliant-cv/)) that ships **optional invisible keyword text aimed at automated screeners**, marked as a PDF artifact so screen readers skip it. Its own authors default it off, noting some systems detect and penalize it.

   This is the sharpest possible test of the honesty rule, because it is *not* a lie about the candidate — every injected keyword might be perfectly true. What makes it deceptive is that **the document says something to the machine it does not say to the person**. A rule framed only as "don't state false facts" would permit it; a rule framed as "the CV a human reads and the CV a parser reads must be the same document" forbids it.

   That distinction is worth building the whole rule around, and the answer should state the prohibition explicitly rather than leaving it implied — precisely because a well-regarded template makes it a one-line option.

   Related and worth deciding alongside: white text on white background, zero-point font, keyword stuffing in metadata, and stuffing the skills section with technologies touched once. Note that the ATS research found keyword auto-rejection is largely a myth anyway — so these tricks buy little even before the ethics.

Consult *What do human reviewers actually reward on a CV?* if it has landed — its findings on how reviewers detect inflation inform where the line belongs.

## What the answer must produce

A rule concrete enough to sit in the skill's instructions and be followed by an agent that has never seen this conversation. Worked examples of the borderline cases beat abstract principles.
