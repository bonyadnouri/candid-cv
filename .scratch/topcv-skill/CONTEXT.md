# candid-cv

The domain of generating a job-specific, honestly-optimized CV from durable knowledge about a candidate. This vocabulary was started while charting [the map](./map.md) and should be sharpened as tickets resolve.

*(Named 2026-08-05; the working title was `topcv`. See the map for why it changed.)*

## Language

**Candidate Profile**:
The durable, job-independent record of everything known about the candidate — an Identity Block plus Entries holding Profile Atoms. Owned by the candidate, outlives any single application.
_Avoid_: résumé data, user data, master CV

**Identity Block**:
The non-selectable part of the Candidate Profile — name, contact, links, spoken languages, and market-conditional facts like date of birth and photo — rendered as-is rather than tailored.
_Avoid_: personal details, header, contact block

**Entry**:
One span of the career within the Candidate Profile — a role, project, degree, certification, or volunteer position — holding the skeleton facts (title, organization, dates) that render verbatim, plus its Profile Atoms.
_Avoid_: position, experience item, section

**Profile Atom**:
A single independently-selectable fact within an Entry — one achievement, one responsibility, one competence — held as raw prose plus tags for what it demonstrates, optionally the candidate's verbatim words and an evidence pointer. Numbers and uncertainty live in the wording of the fact itself, and a skill may appear on a CV only if atoms demonstrate it.
_Avoid_: bullet, entry, item

**Competence Atom**:
A Profile Atom recording sustained everyday use of a tool or practice rather than a discrete achievement — created when the candidate claims a skill with no story attached, so every claimed skill stays evidence-backed.
_Avoid_: skill entry, proficiency

**Profile Home**:
The `~/.candid-cv/` directory that owns all candidate PII — the Candidate Profile and every generated output. The structural privacy boundary: PII-bearing writes never land anywhere else.
_Avoid_: data directory, plugin data, storage

**Job Ad**:
The specific posting a CV is being generated against. Distinct from the Employer, which it may or may not name.
_Avoid_: job description, JD, listing, posting

**Employer**:
The organization the candidate would actually work for. Deliberately distinct from whoever *posted* the Job Ad, which may be a staffing agency.
_Avoid_: company, client

**Staffing Agency**:
A recruiter or agency that posts a Job Ad on an Employer's behalf, usually without naming them. Detecting one matters because researching the agency produces confidently wrong context.
_Avoid_: recruiter, headhunter, intermediary

**Ingestion**:
Seeding a Candidate Profile from material the candidate already has — an existing CV, a LinkedIn export, a GitHub profile — extracting facts while deliberately discarding the source's framing.
_Avoid_: import, parsing, onboarding

**Interview**:
The conversational session that fills gaps Ingestion left in the Candidate Profile. Not to be confused with a job interview.
_Avoid_: grilling, questionnaire, intake

**Tailoring**:
Producing the content of one CV by selecting Profile Atoms against a Job Ad and rephrasing them within the Honest Optimization rule.
_Avoid_: optimization, customization, generation

**Honest Optimization**:
The governing constraint: selection and framing may be optimized, facts may not be invented or inflated. Every claim on a generated CV traces to something the candidate supplied. Boundary pending *What exactly does "honest optimization" forbid?*
_Avoid_: honesty policy, truthfulness, no-lying rule

**Market Conventions**:
The data table of CV norms per target market — photo, date of birth, page length, section order, language. Consulted per CV rather than baked into a template.
_Avoid_: locale settings, regional rules, style guide

**Rendering**:
Turning a CV Data File into the final PDF by compiling the shipped Typst template against it. Settled by *Which renderer, and one template or many?* — Typst is the only renderer, and the template is never regenerated.
_Avoid_: compilation, export, building

**CV Data File**:
The JSON document holding one tailored CV's content and nothing else — no markup, no layout. The sole artifact the agent writes at render time; the template reads it. The boundary that makes the Single-Flow Rule enforceable rather than merely instructed.
_Avoid_: template data, CV JSON, payload

**Single-Flow Rule**:
The layout invariant that meaning is carried by text-flow adjacency and typography, never by horizontal position. Nothing is right-aligned or placed in a text-bearing column, because PDF extractors reconstruct reading order from glyph positions and disagree with each other when content is spread horizontally. Anything that must sit apart visually is placed out of flow.
_Avoid_: single-column rule, no-tables rule, ATS-safe layout
