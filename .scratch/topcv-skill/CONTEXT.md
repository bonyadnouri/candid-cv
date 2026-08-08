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
A single independently-selectable fact within an Entry — one achievement, one responsibility, one competence — held as raw prose plus tags for what it demonstrates, optionally the candidate's verbatim words and an evidence pointer. Numbers and uncertainty live in the wording of the fact itself, and a skill may appear on a CV only if atoms demonstrate it. Mutable in place by Amendment, and identified by a slug that stays stable across it, so a CV already generated is never retroactively invalidated.
_Avoid_: bullet, entry, item

**Competence Atom**:
A Profile Atom recording sustained everyday use of a tool or practice rather than a discrete achievement — created when the candidate claims a skill with no story attached, so every claimed skill stays evidence-backed.
_Avoid_: skill entry, proficiency

**Profile Home**:
The `~/.candid-cv/` directory that owns all candidate PII — the Candidate Profile and every generated output. The structural privacy boundary: PII-bearing writes never land anywhere else. Its `entries/` directory is exactly the load set, so archiving an Entry is moving its file out; nothing is ever dropped from loading on the skill's initiative.
_Avoid_: data directory, plugin data, storage

**No-Ratchet Boundary**:
The read/write contract that keeps generated CVs out of the Candidate Profile by construction rather than by rule: the skill that writes the profile cannot read where CVs are written, and the skill that writes CVs reaches the profile only through Elicitation. Makes three otherwise-instructional guarantees structural — a generated CV can never be re-ingested, a Marked Override's quarantine cannot leak, and a fight already fought is genuinely re-fought next time rather than helpfully remembered. Does not catch the human path, where a candidate internalizes their own CV's framing and offers it back as memory; that is named as a limitation rather than defended, because catching it would mean interrogating a candidate about their own recollection.
_Avoid_: profile isolation, write barrier, no-feedback rule

**Job Ad**:
The specific posting a CV is being generated against. Distinct from the Employer, which it may or may not name.
_Avoid_: job description, JD, listing, posting

**Parked Job Ad**:
A Job Ad held across the first-run handoff — saved when a candidate asks for a CV before a Candidate Profile exists, so building the profile costs them the ad rather than losing it. Offered back once the profile is built, as a fresh round of Tailoring rather than a continuation.
_Avoid_: pending job, queued ad, saved request

**Employer**:
The organization the candidate would actually work for. Deliberately distinct from whoever *posted* the Job Ad, which may be a staffing agency.
_Avoid_: company, client

**Staffing Agency**:
A recruiter or agency that posts a Job Ad on an Employer's behalf, usually without naming them. Detecting one matters because researching the agency produces confidently wrong context.
_Avoid_: recruiter, headhunter, intermediary

**Ingestion**:
Seeding a Candidate Profile from material the candidate supplies, through either of two channels — a **Document** (an existing CV, a LinkedIn export, a GitHub profile), whose facts are kept and whose framing is deliberately discarded, or a **Memo**. Document ingestion is date-rich and voice-poor; a Memo is the inverse, so the channels complement rather than replace each other. A CV this skill generated is never re-ingested.
_Avoid_: import, parsing, onboarding

**Memo**:
An unstructured monologue — spoken or typed — in which the candidate rambles about their work for as long as they like, which the skill structures into Entries and Profile Atoms. Cannot carry the framing problem a Document does, because it is already the candidate's own words, and so is the natural source of `quote` fields. Dictation reliably corrupts the highest-value tokens (tool names, proper nouns, figures), which the Structural Pass repairs by asking, never by proposing.
_Avoid_: ramble, brain dump, monologue, transcript

**Interview**:
The session that fills gaps Ingestion left in the Candidate Profile — a Memo, then a Structural Pass, then candidate-driven depth with no completion target. Re-entered rather than repeated: there is no separate update mode, so returning after a year and resuming an interrupted session are the same path, with the returning Memo anchored on the profile's own newest date rather than on when the file was last touched. Not to be confused with a job interview.
_Avoid_: grilling, questionnaire, intake, update session

**Mirror Rule**:
The constraint on question cards: a card may only offer options the candidate already supplied — in a Memo, an ingested Document, or an earlier answer — never options the skill invented. Navigation and meta questions are exempt, because their answers never become facts. The reason is that a card cannot distinguish a true maximum from an agreeable one, so an invented option laundered into a Profile Atom would satisfy provenance while recording the skill's suggestion as the candidate's memory. The card-shaped counterpart of Elicitation discipline.
_Avoid_: multiple choice policy, no-cards rule, question UI rule

**Structural Pass**:
The one mandatory batch of questions after a Memo, covering only render-blocking facts — dates per Entry, Entry boundaries, dictation-corrupted proper nouns, whether a degree completed. Roughly two minutes. Everything after it is the candidate's to drive.
_Avoid_: onboarding questions, required fields, intake form

**Renderability Floor**:
The single threshold the Interview recognises: an Identity Block, plus at least one Entry with dates and one Profile Atom, is enough to generate a CV. Stated once, plainly, after which the skill never pushes for more. Deliberately not a completeness measure — a career has no 100%, so no coverage target or progress bar is offered.
_Avoid_: completeness, coverage, profile score

**Elicitation**:
A single open question asked mid-flow — during Tailoring or verification — that mints a new Profile Atom instead of guessing: asking for a number, a role's real scope, a missing competence. Open means never proposing the answer, so the atom records the candidate's memory rather than the agent's anchor; the answer lands in the profile before any CV cites it.
_Avoid_: follow-up question, clarification, probing

**Amendment**:
Changing a fact the Candidate Profile already holds, in place and without history — the counterpart to Elicitation, which adds facts rather than revising them. A Profile Atom's prose changes only when the candidate addresses it directly, never on the skill's inference and never in wording the skill proposed; an Entry's skeleton facts may also be set from what the candidate's own words entail, with any residual ambiguity falling to the Structural Pass. Amended prose re-stamps the atom's source to the interview and takes the candidate's words as its quote, so an ingested atom stops reading as a gap the moment it is corrected. Deletion is Amendment's limit case: permitted on explicit instruction, never suggested.
_Avoid_: edit, revision, correction, update

**Tailoring**:
Producing the content of one CV by decomposing the Job Ad into a Requirements Sheet, selecting Profile Atoms against it, and rephrasing them within the Honest Optimization rule.
_Avoid_: optimization, customization, generation

**Requirements Sheet**:
The decomposed demand model of one Job Ad — requirements marked core or peripheral with the ad's own labels authoritative, plus vocabulary targets, and source-attributed research amendments. The only channel through which company research reaches Tailoring; it never touches atoms, bullets, or voice.
_Avoid_: keyword list, ad analysis, job spec

**Candidate Register**:
The per-candidate voice profile derived from Profile Atoms' quotes and the candidate's own prose — vocabulary ceiling, directness, rhythm — that all generated CV prose is drafted inside. The test: could the candidate say the sentence aloud in an interview. Quotes calibrate it; they are never pasted.
_Avoid_: tone, style guide, house style

**Editor's Note**:
The compact report accompanying each rendered CV — selection highlights, justified exclusions of the candidate's real material, and any carried overrides. Never a fit verdict, and never a repeat of the gap question.
_Avoid_: rationale dump, gap report, change summary

**Honest Optimization**:
The governing constraint: selection and framing may be optimized, facts may not be invented or inflated. Every claim on a generated CV must be supported by its linked Profile Atoms at the claim's strongest natural reading — or carry a Marked Override — and the rendered document says the same thing to every reader, human or machine. On a too-weak atom the only moves are weakening the claim, Elicitation, or a Marked Override. Boundary settled by *What exactly does "honest optimization" forbid?*
_Avoid_: honesty policy, truthfulness, no-lying rule

**Marked Override**:
A claim the candidate insisted on that its linked Profile Atoms don't support, rendered after a single warning and recorded in the CV Data File with no atom links and an explicit user-insisted marker. Quarantined from the Candidate Profile: it lives and dies with its one CV and is reported, never blocked, by verification. Same-document mechanics — hidden text and kin — can never be overridden.
_Avoid_: exception, waiver, consent flag

**Market Conventions**:
The data table of CV norms per target market — photo, date of birth, page length, section order, language. Consulted per CV rather than baked into a template.
_Avoid_: locale settings, regional rules, style guide

**Rendering**:
Turning a CV Data File into the final PDF by compiling the shipped Typst template against it. Settled by *Which renderer, and one template or many?* — Typst is the only renderer, and the template is never regenerated.
_Avoid_: compilation, export, building

**CV Data File**:
The JSON document holding one tailored CV's content and nothing else — no markup, no layout — plus per-claim provenance (Profile Atom ids, any Marked Override) that the template never renders. The sole artifact the agent writes at render time; the template reads it. The boundary that makes the Single-Flow Rule enforceable rather than merely instructed.
_Avoid_: template data, CV JSON, payload

**Single-Flow Rule**:
The layout invariant that meaning is carried by text-flow adjacency and typography, never by horizontal position. Nothing is right-aligned or placed in a text-bearing column, because PDF extractors reconstruct reading order from glyph positions and disagree with each other when content is spread horizontally. Anything that must sit apart visually is placed out of flow.
_Avoid_: single-column rule, no-tables rule, ATS-safe layout
