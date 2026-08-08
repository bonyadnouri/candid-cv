# conventions-poc — worked example for ticket 14

**Not the shipped table.** This proves the ticket-14 schema resolves inside `cv.typ`
and that the market × language split works without combinatorial rows. The
implementing effort writes the real `assets/conventions.json`.

Extends [`../typst-poc/`](../typst-poc) (ticket 11) and keeps the Single-Flow Rule intact.

## Run it

```sh
cp cv-data.de.json cv-data.json && typst compile --ignore-system-fonts cv.typ out.pdf
```

Five `cv-data.*.json` files cover the cases that matter. Measured on typst 0.15.1:

| data file | market | language | stage | paper | DOB rendered | headings / order |
|---|---|---|---|---|---|---|
| `cv-data.de.json` | DE | de | established | A4 | yes | Profil › Berufserfahrung › Ausbildung und Studium › Kenntnisse |
| `cv-data.de-en.json` | DE | **en** | established | A4 | yes | **Profile › Experience › Education › Skills** |
| `cv-data.us.json` | US | en | **early_career** | **us-letter** | **no** | Profile › **Education › Experience** › Skills |
| `cv-data.pl.json` | PL *(no row)* | en | established | A4 | **no** | Profile › Experience › Education › Skills |
| `cv-data.fr.json` | **FR** | **fr** | established | A4 | **no** | *(unlabelled)* › **Expérience professionnelle › Formations › Compétences › Langues** |

`cv-data.de-en.json` is the one that matters for the two-axis design: German paper,
English headings, and no `DE-en` row anywhere in the table.

`cv-data.fr.json` was added by [ticket 20](https://github.com/bonyadnouri/candid-cv/issues/20)
and exercises two cells nothing else did — `dob: "omit"` on a non-English market,
and an unlabelled section.

`poppler == pypdf == pdfminer` on every output; `Role · Employer · dates` stays
paired and umlauts and accents survive, so the schema change costs nothing at the
text layer. The FR case extracts to 15 lines where the others give 16 — that is
the absent profile heading, i.e. the finding rendering correctly.

## Unlabelled sections

An **empty heading string means the section renders with no heading.** This is a
sourced behaviour, not a convenience: French guidance (ONISEP, France Travail)
describes the top-of-CV *accroche* as a block with no heading of its own, so
`headings.fr.profile` is `""`. Whether the empty string is the right *encoding* —
as against a nullable heading or a per-section flag — is left to the implementing
effort; see ticket 20's design flags.

## The German heading strings were wrong

Ticket 20 corrected three of eight against the Bundesagentur für Arbeit's own
templates: `education` „Ausbildung" → **„Ausbildung und Studium"** (the BA renders
„Schulbildung" and „Berufsausbildung" separately, and „Ausbildung" alone denotes
the vocational track), `skills` „Kompetenzen" → **„Kenntnisse"**, `certifications`
„Zertifikate" → **„Weiterbildungen"** (the BA has no certifications section;
Zertifikate are a row inside Kenntnisse). `publications` and `portfolio` remain
**unsourced** — zero occurrences in the BA's non-academic corpus.

## The document noun

`document_noun` is filename-bearing (ticket 19) and never rendered, so it isn't
exercised by the compile. It resolves the same way section order does — the
language supplies a default, a market overrides it:

```
m.at("document_noun", default: headings[lang].document_noun)
```

| market + language | noun |
|---|---|
| US + en | **Resume** *(the only market override)* |
| UK + en | CV |
| DE + de | Lebenslauf |
| DE + en | **CV** — an English CV for a German employer is not a Lebenslauf |
| PL + en *(default row)* | CV |

## Two constraints measured here, not assumed

1. **`conventions.json` must sit beside `cv.typ`.** Typst rejects
   `json("../elsewhere/conventions.json")` with `path would escape the project root`
   unless `--root` widens the sandbox. Sibling placement keeps the root narrow.
2. **`paper` uses Typst's own paper identifiers** — `us-letter`, not `letter`.
   Typst rejects anything else with an enum error, so the renderer validates the
   column for free.
