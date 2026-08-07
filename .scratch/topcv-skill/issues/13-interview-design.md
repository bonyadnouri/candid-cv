# What does the gap-filling interview feel like?

Type: prototype
Status: open
Blocked by: 09

## Question

The user named this as the part they care about most: *"a long interview with the candidate that should definitely use the questioning UI"*, admiring how `grill-me` bombards the user with AskUserQuestion cards. But `grill-me` interrogates a *plan* the user is holding in their head right now. This interviews a *career* — years of half-remembered detail, across possibly a hundred questions. That is a very different experience, and enthusiasm at question 5 is exhaustion at question 50.

**Prototype it before specifying it.** Mock the question flow against a plausible profile schema and actually run it on the user — that's the only way to find out whether it's energizing or gruelling.

Explore:

1. **Question generation.** Where do questions come from — a fixed bank, generated from gaps in the profile schema, or generated from what the ingested CV left vague?
2. **The multiple-choice problem.** AskUserQuestion is great for decisions with known options. But *"tell me about the migration you led"* has no options — and the richest profile material is exactly the open-ended kind. Where does the card UI genuinely help (dates, scale, seniority, tech, market, role family) and where does it flatten the answer into a preset the user didn't mean? Find the split.
3. **Batching.** The grilling discipline says one question at a time. AskUserQuestion allows four. What's the right rhythm over a long session?
4. **Ordering and depth.** Breadth-first across the career then drill in, or complete one role at a time? What triggers a follow-up — how does the interviewer notice that an answer was thin and push?
5. **Stopping.** How does it know it's done? Fixed count, coverage of the schema, diminishing returns, or the user calling it? Can it be resumed across sessions — and if so, what does *that* demand of the profile format?
6. **Ingestion first.** Given the standing constraint that an existing CV seeds the profile: what does ingestion actually extract, and how does the interview then target only the gaps? Critically — **how do we avoid inheriting the old CV's weak phrasing?** A CV full of "responsible for cross-functional stakeholder alignment" would poison a profile that's supposed to hold raw facts. Does ingestion extract facts and deliberately discard the framing?
7. **Effort honesty.** How long does this actually take, and does the skill say so up front? A skill that promises 10 minutes and takes 90 is a skill people abandon halfway.

## What the answer must produce

A working prototype of the flow (per `/prototype`), run on the user, plus the resulting design: question strategy, UI split between card and free-text, batching rhythm, stopping rule, resumability, and the ingestion-without-poisoning approach.
