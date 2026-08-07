# What does the market conventions table contain, and how does the skill pick a market?

Type: grilling
Status: open
Blocked by: —

<!-- Graduated from the map's fog 2026-08-05 by the renderer decision (ticket 11), which
     made the table's consumers fully known. It no longer waits on the profile format. -->

## Question

**Market-agnostic by design** is a standing constraint: CV conventions are a data table the skill consults per application, not norms baked into a template. [Ticket 02](./02-market-conventions.md) produced the *content* — US, UK, DE/AT/CH, wider EU, sourced and marked for confidence. Nobody has decided the table's **shape**, where it lives, or how a market gets chosen.

The renderer decision fixed the consumer side, so the columns are now largely dictated rather than open:

| Consumer | What it needs from the table |
|---|---|
| Page setup | paper size (A4 vs Letter) |
| Header | photo policy (harmful / expected / neutral), DOB (include / omit), address granularity |
| Sections | which sections are expected, what they are **called**, and what **order** they run in |
| Language | the language the CV is written in, which is a separate question from the market |
| Length | page target, and whether it is advisory (the default) or a **hard cap** for this market |

Settle:

1. **Schema.** What is a row, exactly — and which values are enums the template switches on versus free text the agent reads? Section order is the interesting one: an ordered list of section keys per market, or a default order with per-market overrides?
2. **Where it lives.** A file the skill ships (`assets/conventions.json`? YAML? a Markdown table an agent reads?). Note the format choice is not purely aesthetic — a JSON table is consumed by `cv.typ` directly, a Markdown one is consumed by the agent's judgement.
3. **How the market is picked.** From the Job Ad's location? The Employer's HQ? Asked? These differ more often than they look — a Berlin office of a US company, a remote EU role posted by a UK agency. What is the tie-breaker, and does the candidate get to override it per application?
4. **Language versus market.** Applying in Germany in English is common in tech and rare elsewhere. What actually governs it — the language the ad is written in, the employer, or the candidate's choice? Ticket 02 asked this; make it a rule.
5. **The unknown-market default.** What happens for a market with no row — Poland, Brazil, Japan? Fall back to a neutral default, refuse, or ask? Note Japan (rirekisho) is a genuinely different document, closer to the academic case that was just ruled out of scope.
6. **Confidence handling.** Ticket 02 flagged its DACH row as SEO-tier while US/UK/EU are primary-sourced. Does the table carry that confidence, and does the skill say anything different when acting on a weak row?

## What the answer must produce

The concrete schema with two or three markets filled in as worked examples, the storage location and format, the market-selection rule including the override path, and the unknown-market behaviour.

## Feeds

The renderer consumes this directly — see [Which renderer, and one template or many?](./11-renderer-and-templates.md) §7 (photo policy is gated on it) and §9 (section order). *How does tailoring choose and rephrase?* consumes the length target and section expectations.
