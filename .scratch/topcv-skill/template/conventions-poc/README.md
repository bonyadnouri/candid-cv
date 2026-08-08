# conventions-poc — worked example for ticket 14

**Not the shipped table.** This proves the ticket-14 schema resolves inside `cv.typ`
and that the market × language split works without combinatorial rows. The
implementing effort writes the real `assets/conventions.json`.

Extends [`../typst-poc/`](../typst-poc) (ticket 11) and keeps the Single-Flow Rule intact.

## Run it

```sh
cp cv-data.de.json cv-data.json && typst compile --ignore-system-fonts cv.typ out.pdf
```

Four `cv-data.*.json` files cover the cases that matter. Measured on typst 0.15.1:

| data file | market | language | stage | paper | DOB rendered | headings / order |
|---|---|---|---|---|---|---|
| `cv-data.de.json` | DE | de | established | A4 | yes | Profil › Berufserfahrung › Ausbildung › Kompetenzen |
| `cv-data.de-en.json` | DE | **en** | established | A4 | yes | **Profile › Experience › Education › Skills** |
| `cv-data.us.json` | US | en | **early_career** | **us-letter** | **no** | Profile › **Education › Experience** › Skills |
| `cv-data.pl.json` | PL *(no row)* | en | established | A4 | **no** | Profile › Experience › Education › Skills |

`cv-data.de-en.json` is the one that matters: German paper, English headings, and
no `DE-en` row anywhere in the table.

`poppler == pypdf == pdfminer` on every output; `Role · Employer · dates` stays
paired and umlauts survive, so the schema change costs nothing at the text layer.

## Two constraints measured here, not assumed

1. **`conventions.json` must sit beside `cv.typ`.** Typst rejects
   `json("../elsewhere/conventions.json")` with `path would escape the project root`
   unless `--root` widens the sandbox. Sibling placement keeps the root narrow.
2. **`paper` uses Typst's own paper identifiers** — `us-letter`, not `letter`.
   Typst rejects anything else with an enum error, so the renderer validates the
   column for free.
