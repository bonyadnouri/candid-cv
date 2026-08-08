# Market conventions — closing the gaps the schema named

Ticket: [#20 Close the market-conventions research gaps the schema now names](https://github.com/bonyadnouri/candid-cv/issues/20)

Companion to [market-conventions.md](./market-conventions.md), which this document
**supersedes on every point it touches** and leaves untouched elsewhere. That pass
ran out of WebSearch budget partway through and said so; this one had budget.

Status: **COMPLETE.** Five parallel primary-source passes (AT/CH · DE personal
data · FR · length & summary · markets different in kind).

Legend, unchanged from the earlier pass, and used the same way:
**primary** = statute text, a regulator or ombuds body, a national public
employment service, an official career-guidance portal, a government department's
own published template, or a study with disclosed methodology and sample size ·
**secondary** = a named credible non-official source · **none** = SEO career
content, CV-builder marketing, unattributed statistics.

The governing rule for this pass, from the ticket: **do not lower a caveat
without a primary source.** A `tier: none` caveat that honestly says "we guessed"
is worth more than a confident value from a listicle. Several findings below are
therefore *negative* — a named institution checked and found silent — and those
are recorded as findings, not as failures.

---

## 0. Headline: the DACH row was wrong in a way copying concealed

Ticket 02 was candid that *"DACH here is really Germany"*, and ticket 14 shipped
AT and CH as literal copies of DE under a `_row` caveat saying so. That caveat was
honest about **provenance** but understated the **error**: Austria and Switzerland
do not merely lack their own research, they disagree with Germany on the values
that were copied.

| | DE | AT | CH |
|---|---|---|---|
| photo | permitted, tradition holds | **expected** — national PES says so outright | **expected** — "usuellement exigée" |
| legal basis for the photo position | AGG | **no photo provision in the GlBG at all** | **no counterpart statute exists** |
| address | full street | full postal | full street |
| signature + place/date on the CV | **yes, rendered** | if not already in the cover letter | **never — "weder datiert noch unterschrieben"** |
| CV-specific extra fields | — | — | **residence permit; Heimatort** |
| default language | de | de | **not derivable at market level** |

Three of those cells are not "unresearched" — they are **actively wrong today**,
and the one that matters most is the Swiss signature rule, because a copied German
row renders a signature block on a document Swiss guidance says is never signed.

---

## 1. Austria — separated from Germany

**Photo → `expected`.** The AMS (Arbeitsmarktservice, Austria's national public
employment service; page footer *"aktualisiert am: 13. Mai 2026"*) answers the
question directly under *"Muss mein Lebenslauf ein Foto enthalten?"*:

> „Laut Gleichbehandlungsgesetz darf kein Arbeitgeber auf ein Foto in den
> Bewerbungsunterlagen bestehen. **Es empfiehlt sich jedoch ein Bewerbungsfoto in
> den Lebenslauf aufzunehmen, da dieses in Österreich als Standard gilt und daher
> von den Personalverantwortlichen erwartet wird.**"

*(No employer may insist on a photo. However it is advisable to include one, since
it counts as the standard in Austria and is therefore expected by hiring
managers.)* — **primary**,
<https://www.ams.at/arbeitsuchende/richtig-bewerben/ansprechender-lebenslauf>

Corroborated on the AMS Bewerbungsmappe page (*"aktualisiert am: 19. Dezember
2025"*), which is internally consistent: not mandatory, but standard.

**The legal reasoning in the copied row does not survive, and this changes the
caveat rather than the value.** The Gleichbehandlungsgesetz (GlBG, BGBl. I Nr.
66/2004) consolidated text was downloaded from RIS in full and searched:
**zero occurrences of "Lichtbild", "Foto" or "Bewerbungsfoto".** Its operative
provisions — §9 and §23 (non-discriminatory job advertisements), §§10/24 (fines)
— regulate the **advertisement**, not the applicant's documents. So AMS's *"Laut
Gleichbehandlungsgesetz…"* is the employment service's interpretation of a general
prohibition, not quotable statutory text.

→ Ship as *"the national employment service states X"*, never *"the law says X"*.
The AGG rationale currently carried in the AT row is simply inapplicable: the AGG
is German federal law and governs nothing in Austria.

**The equality regulator is aware of photos and declines to advise against them.**
The Gleichbehandlungsanwaltschaft (statutory equality ombuds office) *Empfehlung —
Ihr Recht auf diskriminierungsfreie Personalauswahl* (dated 2011) notes:

> „Studien belegen, dass Merkmale wie Alter, Familienstand, durchgehende
> Berufstätigkeit, **aber auch Bewerbungsfotos** je nach Geschlecht und sonstigen
> Merkmalen des Bewerbers oder der Bewerberin unterschiedlich bewertet werden."

citing ILO (2011), Kaas & Manger (IZA DP 4741, 2010) and Weichselbaumer (2003) —
**and stops there.** It issues no instruction to applicants about photos, and its
current prevention page is silent on them. **primary**. Austria's regulator has
not revisited this in ~15 years and never took Germany's anonymised-application
turn. That is the honest caveat to attach to `photo: expected`: the value rests on
employment-service guidance, while the equality body flags photos as a documented
bias vector without advising against them.

**Personal data → `optional`, same value as Germany, different authority.** AMS:

> „Persönliche Daten wie Geburtsdatum, Geburtsort, Familienstand und
> Staatsangehörigkeit **können** im Lebenslauf angegeben werden, **müssen aber
> nicht.** Es ist Ihre persönliche Entscheidung, wie viel Sie offenlegen möchten."

**primary.** Explicitly excluded: religion, political affiliation, union
membership, health, sexual orientation. If the table records *why* a value holds,
the reason must change here even though the value does not.

**Address → full postal.** AMS asks for *"Postanschrift"*. No Austrian source
recommends city-only. **primary**

**Length → 2 pages, advisory.** AMS states it three ways on pages updated May 2026
and December 2025: *"Ein Lebenslauf sollte ein bis maximal zwei A4-Seiten
ausmachen"*; imperatively *"verfassen Sie nicht mehr als zwei A4-Seiten"*; and as
a document spec *"Lebenslauf (Pflicht, max. 2 Seiten)"*. **primary.** See §5 for
why this is the strongest length evidence in the set and still does not earn
`length_rule: hard`.

**Not different in kind.** The Austrian Lebenslauf is a standard reverse-
chronological CV. The **Bewerbungsmappe** is a compilation convention, with two
AT-specific *optional sibling documents* rather than CV variants: the **Deckblatt**
(which carries the photo — and AMS says its content is then removed from the CV:
*"Die Informationen am Deckblatt werden aus dem Lebenslauf entfernt"*) and the
**Profilblatt**.

*Bonus, not a CV fact:* GlBG §§9(2)/23(2) oblige Austrian job ads to state the
collective-agreement minimum salary, enforced by fines. Austrian ads therefore
near-always carry a salary figure — a reliable AT-detection heuristic for
[ticket 10](https://github.com/bonyadnouri/candid-cv/issues/10)'s intake.

---

## 2. Switzerland — the row that was wrongest

**Photo → `expected`.** Strongest wording of any source in this pass, from the
Canton of Vaud's official career-guidance office (OCOSP), adults' edition,
February 2023:

> « **Photo de bonne qualité (usuellement exigée).** Une expression avenante et
> souriante est un plus. »

*(Good-quality photo (usually required).)* — **primary**

BIZ Kanton Bern (official cantonal career-guidance office, adults' 26-page
edition) lists *"aktuelles, professionelles Foto"* among the *"Merkmale eines
«guten» Lebenslaufs"*, under the heading *"Foto: der erste Eindruck zählt"*.
**primary.** The national portal berufsberatung.ch / orientation.ch instructs it
as well — *"Verwende ein aktuelles Farbfoto mit neutralem Hintergrund… Verwende
kein Selfie"* — though that page is written in the informal *du/tu* form for
apprenticeship seekers, so it is weaker for an adult professional audience.

Federal guidance is softer: SECO / arbeit.swiss lists *"Persönliche Daten,
**gegebenenfalls** mit Bewerbungsfoto"* — optional. **primary**

**There is no Swiss anti-discrimination statute for this to collide with.** The
Gleichstellungsgesetz (GlG, SR 151.1) consolidated text was downloaded and
searched: **zero occurrences of "Foto"/"Photo"/"Lichtbild"**, and Art. 3 covers
**sex only**. Switzerland has no general private-sector anti-discrimination
statute covering age, ethnicity, religion or disability — **the AGG has no Swiss
counterpart at all.** The EBG page is silent on application photos. Private hiring
runs on *Vertragsfreiheit*, bounded case-by-case by ZGB Art. 28 and OR Art. 328.
**primary.** So the German row's entire legal framing is inapplicable twice over.

**Personal data — Switzerland has fields the German row cannot express.**
BIZ Bern's worked CV template prints, beside the photo:

> ```
> TT.MM.JJJJ (Geburtsdatum)                          ((FOTO))
> Nationalität, Ausweis B, C etc. (evtl. «in der Schweiz seit JJJJ»)
> Zivilstand, Kinder (evtl. Geburtsjahr, Hinweis Kinderbetreuung)
> Führerausweiskategorien B, C etc. (falls nötig)
> ```

- **Residence permit** (*Ausweis / permis B, C*) — expected for non-Swiss
  nationals. **No German or Austrian counterpart.**
- **Heimatort** (place of origin) — expected for Swiss nationals. Also no DE/AT
  counterpart. berufsberatung.ch: *"Wenn du einen Heimatort in der Schweiz hast,
  gibst du diesen an, ansonsten deinen Geburtsort."*
- Date of birth, nationality: expected. Address: full street.
- **Marital status is region-dependent** — BIZ Bern's template prints
  *"Zivilstand, Kinder"*; Vaud omits *état civil* entirely and asks for *"année de
  naissance et âge"* rather than a full date. The divergence runs along the
  language border.

All **primary**.

**⚠️ Swiss CVs are neither signed nor dated.** BIZ Bern, explicitly:

> „Zum Schluss: **In der Schweiz wird der Lebenslauf weder datiert noch
> unterschrieben.**"

**primary.** This is a direct contradiction of the German convention (§3), and it
is the single most consequential copied-row error: a CH row inheriting German
behaviour would render a signature block on a document Swiss guidance says is
never signed. Any signature feature must be market-gated.

**Length → advisory.** Three official sources, three numbers, and the spread
correlates with the language border: SECO/arbeit.swiss (federal) *"nicht mehr als
drei Seiten"*; BIZ Bern *"2-3 A4-Seiten"*; Vaud OCOSP *"1 à 2 pages A4"*. All
**primary**, mutually inconsistent — which is itself the finding.

### 2a. Swiss language — `default_language: "de"` is indefensible

The constitutional position is unambiguous. Bundesverfassung (SR 101) **Art. 4**:
*"Die Landessprachen sind Deutsch, Französisch, Italienisch und Rätoromanisch."*
**Art. 70(2)**: *"**Die Kantone bestimmen ihre Amtssprachen.**"* **primary**

The decisive methodological finding is from the Bundesamt für Statistik,
*Sprachgebiete der Schweiz* (2017; newer edition based on 2015–2019 structural
surveys):

> „**Die Sprachgebiete der Schweiz sind auf der Ebene des Bundes nicht
> verfassungsmässig festgelegt.** […] hat sich das BFS in der Vergangenheit immer
> auf die Mehrheitsverhältnisse gemäss den Volkszählungsergebnissen auf
> Gemeindestufe gestützt."

> „**Die kleinste geografische Einheit ist die Gemeinde.** […] Die Festlegung der
> Zugehörigkeit zu einem Sprachgebiet einer Gemeinde geht vom relativen
> Mehrheitsprinzip aus."

**primary.** There is no legally binding federal definition of the language
regions; BFS assigns them by relative majority **at municipality level**, and
publishes a complete per-municipality appendix keyed by BFS municipality number.

**Canton-level mapping cannot work**, and the BFS tables show exactly why:

| Municipality | BFS region | % German | % French |
|---|---|---|---|
| Biel/Bienne (BE) | **D** | 53.2 | 40.2 |
| Fribourg (FR) | **F** | 21.4 | 69.4 |
| Murten (FR) | **D** | 80.9 | 17.7 |
| Moutier (BE) | **F** | 6.8 | 86.2 |
| Sion (VS) | **F** | 6.9 | 83.6 |

Fribourg and Murten sit in the **same canton** on opposite sides of the line, and
Biel/Bienne — officially bilingual — is assigned to the German region on a 53/40
split, so a forced default is wrong for ~40% of that labour market. Bern, Fribourg
and Valais are bilingual cantons; Graubünden is trilingual (*"Am komplexesten ist
die Situation wohl in Graubünden"*).

**And no official Swiss source says which language to apply in.** Checked and
found silent: berufsberatung.ch, laufbahn.berufsberatung.ch, SECO/arbeit.swiss,
BIZ Bern (full 26 pages), Vaud OCOSP (full guide). The widely-repeated rule *"write
in the language of the job advertisement"* appears **only in commercial
career-advice content — tier `none`.** It should not be shipped as sourced, even
though the table independently arrives at the same behaviour for its own reasons.

**Recommended fix, and it needs no new schema:** set CH `default_language: null`
with a caveat carrying `action: "ask"`. Ticket 14 §7's ladder is *candidate
override → the ad's own original language → `market.default_language`*, and
`default_language` is already specified as nullable. A null therefore lets the ad's
language decide — which is right in the overwhelming majority of Swiss cases — and
falls through to asking when the ad cannot settle it, instead of silently writing
German to Lausanne. The BFS municipality dataset is recorded here as the escape
hatch if a default is ever wanted; it is deliberately **not** shipped, because a
2,000-row municipality table is a large cost to resolve a question the ad's own
language already answers.

**Not different in kind.** The Swiss CV is a normal Western CV. The
**Bewerbungsdossier** is an attachment-bundling convention: SECO specifies
Bewerbungsschreiben + Lebenslauf + Arbeitszeugnisse/Diplome + Referenzen *"in einer
PDF-Datei zusammengestellt"*. The *Arbeitszeugnis* is not a CV feature but a
**statutory entitlement** — OR (SR 220) Art. 330a: *"Der Arbeitnehmer kann jederzeit
vom Arbeitgeber ein Zeugnis verlangen…"* — which is why every Swiss applicant has a
paper trail to attach. **primary.** This is the same document plus attachments, not
a different document; it touches an attachment-manifest concern, not the CV
generator's document model.

---

## 3. Germany — the personal-data gaps ticket 02 left open

Method note, because it is what makes this section primary rather than folkloric:
the Bundesagentur für Arbeit's own `.docx` templates were downloaded and
`word/document.xml` parsed; its PDFs were read as text and as rendered pages. These
are field lists read off the federal employment agency's own documents.

**One structural finding governs the section, and the BA says it on the record**
(Bewerbungskompass p. 58): *"**Da Unternehmen unterschiedliche Auswahlverfahren
nutzen, werden bewusst beide Varianten dargestellt.**"* Three BA audiences disagree
and must not be conflated — `meinBERUF` (youth, national), the adult jobseeker
pages (national), and the Bewerbungskompass/Merkblatt (adult, but **regional** —
Agentur für Arbeit Ahlen-Münster). For several fields the honest answer is a
bimodal distribution rather than a value.

### What the BA's own templates contain

All **primary**:

| field | klassisch `.docx` | modern `.docx` | Musterlebenslauf | Merkblatt (2018, adult) |
|---|---|---|---|---|
| Geburtsdatum | ✅ | ✅ | ✅ | ✅ |
| Geburtsort | ✅ | ✅ | ✅ | ✅ |
| Anschrift | ✅ **"Straße Hausnummer, Postleitzahl Ort"** | ✅ | ✅ | ✅ **"Straße Hausnummer / PLZ Ort"** |
| Familienstand | ❌ | ❌ | ❌ | ✅ |
| Staatsangehörigkeit | ❌ | ❌ | ❌ | ✅ |
| Foto | ❌ | ❌ | ✅ box, *"wenn du willst"* | ✅ |
| Ort/Datum | ✅ | ✅ | ✅ | ✅ |
| Unterschrift | ✅ | ✅ | ✅ rendered | ✅ *"handschriftlich"* |
| Kurzprofil | ❌ | ❌ | ❌ | ❌ |

**`address: "city"` is wrong for Germany → `full`.** This is the
highest-confidence correction in the German cluster. Every BA template and every
sample carries a full street address, and the template field is literally defined
as *"Anschrift — Straße Hausnummer, Postleitzahl Ort"*. Samples: *"Waldweg 25,
54321 Beispielstadt"*, *"Musterstr. 16, 12345 Musterstadt"*, *"Schäferstr. 5, 68159
Mannheim"*.

Data-minimisation pressure is weaker than the earlier pass assumed. The LfDI
Baden-Württemberg (state DPA) treats the Anschrift as **necessary**, not excessive:
*"Name, **Anschrift**, Telefonnummer und E-Mail-Adresse sind für den Arbeitgeber
**erforderlich**…"*. The one line supporting city-only — *"Es reicht aus, wenn der
Bewerber beim Arbeitgeber eine Kontaktmöglichkeit angibt"* — concerns the
sufficiency of *a contact channel*, not street-level granularity being improper.
**No German primary source recommends city-only.** The current value was the
conservative guess the caveat admitted to, and it is wrong.

**`dob: "optional"` stands, and the caveat is now sourced rather than empty.**
"Customary, never required" is the accurate phrasing. meinBERUF files it under
*"Das muss in den Lebenslauf rein"*; all four templates carry it; all ten sample
CVs in the May 2026 Bewerbungskompass carry one. **Do not upgrade to `expected`**:
that same 2026 document's structural prose lists only *"Name und Anschrift,
Telefonnummern, E-Mail-Adresse"* under *"Persönliche Daten ganz oben"* — the drift
away is visible but incomplete.

The nearest case law cuts **against** the intuition that a DOB is legally risky:
**BAG, 15.12.2016 – 8 AZR 418/15** rejected the argument that an online form's
DOB request was an *Indiz* under § 22 AGG, reasoning that the field was
non-mandatory and that there is no *Erfahrungssatz* that asking age signals
interest only in younger staff. **primary.** The AGG (§§ 1, 7, 11) binds
**employer conduct** — job advertisements and selection — and says nothing about
the applicant's own document. The same is true of the LfDI's list of questions an
employer *may not ask*: it constrains the employer, not the candidate volunteering.

**Familienstand → discouraged; Staatsangehörigkeit → optional.** The May 2026
Bewerbungskompass carries a section headed *"**Die Streichliste – Was gehört NICHT
mehr hinein?**"* naming *"Familie: Angaben zu Kindern oder Familienstand"*.
The LfDI is blunter: *"Fragen zu den Familienverhältnissen eines Bewerbers (z.B.
**Familienstand**, alleinerziehend, Zahl und Namen der Kinder) sind **grundsätzlich
unzulässig**."* meinBERUF files both as *"freiwillig"*. Against that, the 2018
adult template has all three as labelled fields, and in the May 2026 samples
Staatsangehörigkeit appears in 5 of 10 and Familienstand in 4 of 10. These are
legacy fields in **active retirement**, and the direction of travel is unusually
clean. **primary** throughout.

**Ort, Datum, Unterschrift — a rendered element the schema does not model.**
National adult guidance: *"Bewerben Sie sich per Brief, **unterschreiben Sie den
Lebenslauf** mit komplettem Vor- und Nachnamen"*, and for digital applications
*"fügen Sie Ihre **gescannte Unterschrift** in das Dokument ein"*. The
Bewerbungskompass makes it structural element 8: *"**Der Schluss — Ort, Datum und
Unterschrift nicht vergessen**"*. All four templates render it; eleven such lines
appear across the samples. A layout constraint rides along: the Lebenslauf's date
must match the cover letter's. Counterweight, from meinBERUF: *"Es ist nicht
unbedingt notwendig, den Lebenslauf zu unterschreiben."* **primary.**

→ See §7: this is a **schema extension**, not a value fill, and is flagged rather
than decided. Note it is market-conditional in the sharpest possible way —
expected in Germany, conditional in Austria, and **forbidden in Switzerland**.

**`summary: optional` stands, with the reasoning replaced.** The caveat currently
says the Lebenslauf tradition "was not researched on this point". It has been now,
and a primary source *recommends* a summary — the regional Bewerbungskompass:

> „**2. Kurzprofil (empfohlen):** Das Kurzprofil steht direkt am Anfang des
> Lebenslaufs. Es hilft dem Unternehmen, Sie schnell einzuordnen. […] Formulieren
> Sie klar und ohne Ich-Form."

with the design rationale *"In einigen Mustern wird zudem ein Kurzprofil **anstelle
ausführlicher persönlicher Angaben** verwendet"* — a substitute for the personal-
data block, not an addition to it. 5 of 10 samples carry one. Against: neither
national Word template has a profile section, and the national **1x1 der
Bewerbungsunterlagen** (2025) places the *"Kurzprofil (3-6 Stichpunkte)"* on the
**optional Deckblatt**, with the Lebenslauf spec carrying no summary section at
all. So Germany's official position is that the summary belongs on a *separate
sheet*. Value unchanged; evidence now real.

⚠️ **Terminology trap:** the BA's national adult page uses *"Kurzprofil"* to mean a
**short-form application** (*"Eine Kurzbewerbung oder Kurzprofil ist vor allem bei
Initiativbewerbungen […] üblich"*), not a summary paragraph. Do not merge the two
senses.

**Length → 2 pages, advisory.** The national adult page states *"Er sollte
höchstens 2 DIN-A4-Seiten umfassen"* and the 2025 *1x1 der Bewerbungsunterlagen*
gives *"grds. max. 2 Seiten"* (*grds.* = *grundsätzlich*, in principle) — both
**primary**. Two BA voices contradict a hard reading: the 2018 Merkblatt states the
opposite principle outright — *"**Je länger das Arbeitsleben bereits andauert,
desto länger ist der Lebenslauf**"* — and the May 2026 Bewerbungskompass, the most
current adult source, sets **no CV page cap at all**, capping only the whole
application at ~10 pages.

---

## 4. France — a row can ship, and the photo cell is now the best-sourced in it

Ticket 02 concluded: *"France's photo norm is genuinely contested in the sources
found, with zero primary sources located on either side… Do not encode a
France-specific photo rule from this research pass."*

**That conclusion is now superseded, and the reason is instructive.** A primary
source exists and has since 2016. The earlier pass almost certainly searched the
Défenseur des droits' *2019* décision-cadre on *apparence physique* (n° 2019-205)
— the obvious candidate, which on inspection says nothing about CV photographs.
The CV-photo recommendation is in the **2016** décision-cadre. Wrong document
searched, not an absent source.

**Défenseur des droits, Décision-cadre MLD n° 2016-058 du 12 février 2016**,
*relative à la prise en compte de l'apparence physique dans l'emploi* — **primary**,
downloaded and read in full. In the operative recommendations to employers:

> « — de ne pas exiger des candidats qu'ils fournissent une photographie en réponse
> aux offres d'emploi et **de ne pas écarter un CV qui ne comporterait pas de
> photographie sur ce seul motif** ; »

*(— not to require candidates to supply a photograph, and not to reject a CV that
does not carry a photograph on that ground alone.)*

And §54, the only primary statement located anywhere in this pass that speaks to
the **candidate's own** decision rather than the employer's request:

> « la photographie, **volontairement communiquée par le futur recruté** ou
> sollicitée par l'employeur, peut placer les candidats dans une situation
> susceptible de générer un comportement discriminatoire en raison de leur
> apparence. »

§58 permits an exception only where appearance is *"une exigence professionnelle
essentielle et déterminante"* (presentation professions).

Read carefully, *"do not reject a photo-less CV on that ground alone"* is an
acknowledgement by France's constitutional rights ombudsman that photo-less CVs
**were being** rejected — simultaneously the strongest evidence that the photo was
a de facto expectation and the strongest statement that it must not be treated as
one.

Corroborating, **primary**: the DDD's *Guide « Pour un recrutement sans
discrimination »* (3 July 2019) — *"**exiger par exemple une photo sur un CV ne
peut être qu'exceptionnel**"*; and **France Travail** — *"**La photo : elle n'est
pas obligatoire, c'est donc à vous de décider !**"*

The sharpest institutional signal is a contrast France Travail draws itself, about
the *British* CV: *« il n'est pas d'usage d'inclure une photo, **la législation
britannique sur la non-discrimination étant stricte** »*. The French public
employment service explains the absent UK photo by *British* law and offers no
equivalent statement about France — i.e. it treats the photo as a live permitted
option at home and as not-done in Britain.

**The legal frame, and a distinction worth preserving.** Code du travail **L1221-6**
(**primary**, legifrance) requires that information requested of a candidate *« ne
peuvent avoir comme finalité que d'apprécier sa capacité à occuper l'emploi proposé
ou ses aptitudes professionnelles »* and must bear *« un lien direct et nécessaire
avec l'emploi »*. No French institution states the syllogism "therefore a photo is
unlawful", and it should not be constructed on their behalf: **L1221-6 constrains
what the employer may ask for, not what the candidate may volunteer.** The
institutions reaching the operative conclusion get there via the
non-discrimination route of **L1132-1**, whose prohibited grounds include
*apparence physique, âge, situation de famille, lieu de résidence*.

**The anonymous-CV episode, with three corrections to the received account:**

1. L1221-7 was cut back by **Loi n° 2015-994 du 17 août 2015 (loi Rebsamen),
   art. 48** — **not** the 2016 Loi Travail. **primary**, from Legifrance's own
   modification history.
2. **L1221-7 still exists**, reduced to one permissive sentence: *« Les
   informations […] **peuvent** être examinées dans des conditions préservant son
   anonymat. »* The 2006 obligation on firms of 50+ and the *décret en Conseil
   d'État* clause are both gone. ⚠️ `code.travail.gouv.fr` still serves the stale
   pre-2015 two-sentence version — **Legifrance is authoritative**, a caution worth
   generalising: the ministry's restatement site is not reliable for currency.
3. Conseil d'État **n° 345253 (9 July 2014)** enjoined the Prime Minister to issue
   the implementing decree; **n° 387014 (4 November 2015)** then declined to impose
   a penalty payment because the obligation had been repealed. **primary**

**The single most useful document in the French cluster** is the randomised
evaluation: Behaghel, Crépon & Le Barbanchon, *Unintended Effects of Anonymous
Resumes*, IZA DP No. 8517 (2014), published in *AEJ: Applied Economics* 7(3),
1–27 (2015) — a field experiment with Pôle emploi, Nov 2009–Nov 2010, across 8
départements. **primary, disclosed methodology.** Its treatment description is a
method-disclosed record of what a French CV's top block actually contained:

> "Anonymization consisted in erasing the top part of the resume: **name, address,
> gender, nationality, ID picture, age, marital status and number of children.**"

Findings: anonymisation left overall interview and hire counts unchanged, imposed
no measurable cost on firms, and **widened** the minority interview gap by 10.7
percentage points. Two things follow. First, "French CVs carry a photo" is not
listicle folklore — it is documented. Second, and worth holding onto if this row
is ever contested: **France ran the experiment at scale and stripping identity
backfired.** Note also that the DDD's 2019 guide still recommends anonymisation as
a debiasing technique without citing the evaluation, so the two French primary
sources are not fully consistent with each other; anyone citing *"France recommends
anonymised CVs"* without the RCT is quoting the weaker half.

**Other France values**, all **primary** unless marked:

| field | value | source |
|---|---|---|
| `document_noun` | **CV** (abbreviated in ordinary usage; spelled out once in formal legal prose only) | France Travail, DDD, ministerial reply |
| `photo` | permitted, **default off** | DDD 2016-058 · DDD 2019 guide · France Travail |
| `page_target` | **1** | France Travail ×2: *"en France, le CV doit en général tenir sur 1 page"* |
| `dob` | **omit** | L1132-1 (*âge*) + DDD strip-list |
| `address` | **city / contact only** | see below |
| marital status, children, nationality | omit | L1132-1 · DDD · CNIL Fiche 18 (nationality is contract-stage) |
| `summary` | the ***accroche*** — objective + key skills | France Travail |
| `default_language` | fr — **inferred, not primary** | see below |

The address finding is unusually direct for a CV question. A ministerial reply to
Assemblée nationale written question **n° 2636** states that *« la prévention des
discriminations liées au domicile des candidats a conduit Pôle emploi à ne pas
mentionner l'adresse du domicile des candidats sur leur profil en ligne »* — the
public employment service strips the home address as a deliberate
anti-discrimination measure, and *lieu de résidence* is a prohibited ground under
L1132-1. **primary.** (Internal tension worth noting: France Travail's own CV page
still says *« à côté de vos coordonnées (nom, adresse, mail…) »*.)

**Terminology correction:** the top-of-CV convention is an ***accroche*** — *«
commencez par rédiger une petite accroche pour présenter synthétiquement vos
objectifs professionnels ou vos compétences clés »*, with the worked example
*"Objectif : négociateur immobilier. Compétences : 12 ans d'expérience…"* — **not**
a bare job title. France Travail does not use the word *titre*.

**Language is inferred, and is labelled as such.** No official source addresses the
language of a *CV*. The adjacent fact is Code du travail **L5331-4**, which
prohibits publishing a job advertisement *« comportant un texte rédigé en langue
étrangère »* for services performed in France — that constrains the **employer's
ad**, not the candidate's CV. Combined with France Travail treating the English CV
as a separate export-oriented artifact (*« Le CV en anglais n'est pas une simple
traduction du CV français »*), `fr` is a defensible default — but it is an
inference and the caveat must say so.

**⚠️ Do not ship any French photo-prevalence percentage.** Circulating figures
("55% of French cadres include a photo", "Apec 2024: photos help in 30% of cases")
were traced individually and **every one lands on CV-builder marketing**, not on
APEC. APEC's own *Pratiques de recrutement des cadres 2023* was downloaded and
contains **zero** occurrences of "photo". These figures are laundered through
APEC's name. **Nobody in France has measured how many CVs carry a photo.**

---

## 5. Does any market have a genuinely hard length cap?

**Yes — exactly one, and it is not a country.**

**USAJOBS / US federal: 2 pages, system-enforced since 27 September 2025.**
**primary**, from OPM's own published rules and confirmed live on the USAJOBS Help
Center during this pass:

- OPM **Merit Hiring Plan** (29 May 2025), p. 12: *"This Merit Hiring Plan will
  prohibit the current longform Federal resume structure. Instead, there will be a
  2-page limit on resume length."*
- OPM **Agency Guidance on the Two-Page Limit**: *"Starting September 27, 2025,
  USAJOBS will restrict all resumes to two pages."* Scope is *"all competitive
  service and excepted service announcements under Title 5"*. And the sentence that
  makes it hard rather than advisory: *"**If the only resume received by an
  applicant is longer than two pages, the applicant is ineligible for further
  consideration.**"*
- USAJOBS Help Center, live: *"**USAJOBS will not allow you to upload or build
  resumes longer than two pages.**"*
- Authority: EO 14170 (2025) and EO 13932 (2020).

This **reverses** the long-standing assumption that the US federal resume is
*longer* than a private-sector one. As of September 2025 it is shorter, and
mandatory.

**Everything else is advisory.** Adjudicating the two candidates the passes
disagreed on:

- **Austria's AMS 2-page limit is the strongest *guidance* in the set** — stated
  three ways, imperatively, on pages updated within the last year — **and still
  does not earn `length_rule: hard`.** The map's standing constraint is that real
  evidence is never removed to satisfy a page norm, and a hard cap is the one thing
  that would force cutting a candidate's true material. That price is only worth
  paying where non-compliance is *fatal to the application*. AMS guidance is not
  enforced by any system; USAJOBS blocks the upload. **Enforcement, not source
  strength, is what earns `hard`** — and that distinction should be written into
  the column's definition, because "Austria states it three times" is otherwise a
  perfectly good argument for the wrong answer.
- **EU institutions / EPSO impose no page cap because there is no CV document** —
  the CV is a structured online form. **primary.**
- **ERC (4 pages) and MSCA are grant applications, a different document.** Recorded
  because they are the caps a search surfaces first. Also: the widely-repeated
  "MSCA 2-page CV" is **wrong** — automatic enforcement applies to Part B-1, the
  proposal, while the researcher's CV sits in Part B2, *"(no overall page limit
  applied)"*, at an *"indicative length: 5 pages"*.
- **UK Civil Service:** *"**aim for** your CV to be 1-2 pages"* — advisory phrasing;
  the enforced word limits there attach to personal statements and behaviour
  examples, which are separate documents.
- **Germany:** *"grds. max. 2 Seiten"* — guidance, and contradicted by two other BA
  voices (§3).

**Survey-grade evidence on length preference does not exist**, and one negative is
strong enough to be worth recording as a finding in its own right: the **CIPD
*Resourcing and Talent Planning* 2024 survey (n = 1,016)** was retrieved and read,
and **contains no item on CV length, page count, or summary sections at all**. The
UK body that runs the annual survey-grade recruitment survey does not measure this.
NACE returned HTTP 403 on both target documents, so the most promising US lead is
**untested rather than refuted**. SHRM: no instrument located. ResumeGo (n=482,
7,712 résumés) points *opposite* to the one-page norm but is run by a résumé-writing
service on its own market. Blackburn-Brockman & Belanger (2001), *Journal of
Business Communication* 38(1) 29–45, is peer-reviewed and on-point but was blocked
by a Cloudflare interstitial — the best unretrieved lead in this pass.

---

## 6. The summary column — and the "6 seconds" figure, finally traced

**No market earns `discouraged`.** Nothing official anywhere advises against a
summary.

**No survey-grade or experimental evidence that a summary is rewarded exists in any
market.** This appears to be a genuine hole in the literature rather than a search
failure. Randazzo (2020), *Business and Professional Communication Quarterly*
83(4) 409–433, is the nearest peer-reviewed work (63 students, 20 advisors, 24
employers) and does not isolate summary sections or length.

**The "6 seconds" figure is vendor marketing, and the trail is now closed.** It
originates in TheLadders' own 2012 eye-tracking study — n = 30 recruiters over 10
weeks, reported via Forbes — updated by Ladders to 7.4 seconds in 2018 with the
participant count undisclosed. Ladders is a job board; this is its PR. ERE's
critique is blunt: *"the Ladders 2018 report does not specify the types of positions
or lengths of resumes… It also doesn't state how many recruiters were in the study."*
Tier **none**.

The important second-order point: **the same Ladders release is plausibly a major
origin of the circulating "put a summary at the top" advice** (it claims top-
performing résumés shared *"a detailed overview or mission statement, primarily
located at the top of the first page"*). So it cannot be used as evidence *for* the
summary column — it is closer to the reason the question feels settled when it
isn't.

**Official guidance, however, genuinely does differ by market** — all **primary**,
all fetched:

| market | official position |
|---|---|
| **UK** | National Careers Service lists an **"introduction"** among the sections a CV *"should include"* — *"a few short lines that sum up who you are and what you hope to do"* |
| **FR** | France Travail **instructs** the *accroche* |
| **DE** | The Bundesagentur puts the *"Kurzprofil (3-6 Stichpunkte)"* on the **optional Deckblatt**; the Lebenslauf spec has no summary section — i.e. on a separate sheet, not in the CV |
| **US** | CareerOneStop (US DOL) calls it optional and **stage-conditional**: *"**Skip the Summary section if you don't have much experience (3 years or less), or your work experience shows a clear, consistent progression.**"* |
| **US federal** | OPM's prescribed content list contains no summary, profile or objective |

**Recommendation: keep `optional` everywhere, and replace the caveat.** The
distinction that matters is what the column *means*, and the evidence cannot settle
it:

- if `expected` means *official guidance treats it as a standard section*, **UK and
  FR both earn it**;
- if `expected` means *recruiters reward it*, **nothing earns it anywhere**.

That is a definitional choice, not a research finding — see §7. What changes today
regardless is the caveat's content: it currently says the question was never
researched. It has been now, in five markets, and the honest note is that **no
outcome evidence exists in any market while official guidance diverges sharply
between them**. A table declining to rule *after looking* is a different artifact
from one declining to rule because nobody looked.

The one concrete, primary, *stage-conditional* rule located — CareerOneStop's "skip
below ~3 years' experience or with clean progression" — fits the table's existing
`career_stage` axis exactly, and is recorded here for whoever implements the
summary decision.

⚠️ **Do not attribute a "1–2 pages" recommendation to CareerOneStop or the US DOL.**
It appears only in a search-engine summary and on no reachable CareerOneStop page.

---

## 6a. The heading strings nobody had ever sourced

Not in the ticket's list, and found while shipping the France row. The table's
**heading strings are resolved by the renderer, not the agent** (ticket 14 §1), so
a wrong string ships wrong forever and is never caught by review — nobody reviews
a heading. The German strings had been written by English-speaking sessions and
never checked against a German source.

**Three of the eight German strings were wrong.** Counts are occurrences as a
rendered section heading across the Bundesagentur's four templates and the ten
sample CVs in its May 2026 guide. **primary** throughout.

| key | was | attested | verdict |
|---|---|---|---|
| profile | Profil | „Mein Profil" ×2, „Profil" ×1, „PROFIL" ×1 | keep |
| experience | Berufserfahrung | ×10 | keep |
| education | **Ausbildung** | **×0** — the BA splits „Schulbildung" ×10, „Berufsausbildung" ×9, „Studium" ×1 | **changed → „Ausbildung und Studium"** |
| skills | **Kompetenzen** | „Kenntnisse" ×3 vs „Kompetenzen" ×1; the 2026 guidance heads the section „6. Kenntnisse" | **changed → „Kenntnisse"** |
| certifications | **Zertifikate** | **×0 as a heading** — a bullet inside Kenntnisse, and an attachment category | **changed → „Weiterbildungen"** |
| languages | Sprachen | heading ×1, sub-label ×6 | keep |
| publications | Publikationen | **×0** in 60 pages | **unsourced** |
| portfolio | Portfolio | **×0** | **unsourced** |

`education` is the instructive one. „Ausbildung" appears as a standalone heading
**zero times** in the BA's corpus, and in that corpus it consistently denotes the
*vocational* track — so a university graduate's degree filed under „Ausbildung"
reads wrong. The BA never merges education into one section at all: it renders
„Schulbildung" and „Berufsausbildung" separately, adding „Studium" for graduates.
Its own 2026 prose hedges as *"5. Ausbildung **oder** Studium"*. The shipped string
„Ausbildung und Studium" is a **documented normalisation** of that prose (*und* for
*oder*), chosen because one key must serve — not an attested string, and marked as
such here.

`publications` and `portfolio` are honestly unsourced: zero occurrences in a
60-page corpus whose audience is non-academic (the samples are Pflegefachkraft,
Verkäuferin, Kfz-Mechatroniker). „Publikationen" is very likely right; there is no
BA evidence for it, so it is not dressed up as a finding. A German university
career service would be the right source and was not surveyed.

**French headings — 5 of 8 sourced.** The best source is **ONISEP** (the public
establishment under the education ministries), which gives the strings as an
explicit list and warns against alternatives — about as close to "use these exact
strings" as a French institution gets:

> « Structurez votre CV avec des **titres de sections classiques** : "Expérience
> professionnelle", "Formations", "Compétences", "Langues". **Évitez les titres
> créatifs comme "Mon parcours" ou "Ce que je sais faire"**. »

**primary**, corroborated for `experience` by France Travail and the Europass FR
template. Two deliberate rejections of the translator's instinct: `education` ships
the attested plural **« Formations »**, not « Formation »; and Europass's
« Éducation et formation » and « Compétences linguistiques » are **not** used —
they are EU-harmonised labels built for cross-border comparability, and ONISEP,
writing for French candidates, says « Formations » and « Langues ». Using the
Europass string would be precisely the failure mode the table exists to prevent.

**`profile` in French is genuinely unlabelled**, and this is a positive finding
rather than a gap. France Travail describes an *accroche* at the top of the
document and ONISEP *"un résumé professionnel de 2 à 3 lignes en haut de votre
CV"*; neither presents a string to print. The top of a French CV is *titre* plus
**unlabelled** accroche — two distinct elements. Implemented in the worked example
as an empty heading string, measured below.

`certifications` (« Certifications ») is **unsourced** — ONISEP lists certifications
as *content* under no heading, and Europass folds them into
`ÉDUCATION ET FORMATION`. `portfolio` is evidenced **not to be a section**: ONISEP
says *"illustrez les projets menés **via un lien vers un portfolio**"* — a link
inside an experience entry.

**Two French findings that touch already-shipped cells**, flagged because they come
from a public body and cut against §4:

- **ONISEP softens the length cell**: *"Il ne faut pas dépasser 2 pages… Un CV sur
  2 pages est envisageable à condition d'avoir un certain nombre d'expériences."*
  One page remains the default; the ceiling is two.
- **ONISEP is more permissive on the photo than the Défenseur des droits**: *"Il
  faut mettre une photo si elle est demandée dans l'annonce ou selon la nature du
  poste. Par exemple, pour un poste commercial, il est bien d'en mettre une."* A
  French public body suggesting a photo for commercial roles sits in tension with
  the ombudsman recommending employers not request one. It does not change the
  `neutral` / default-off call — ONISEP frames the photo as conditional, not
  expected — but it is the counter-source, and better surfaced here than
  discovered by a reviewer.

**One permanent dead end recorded so nobody re-tasks it:** `cadres.apec.fr` is
**NXDOMAIN**, not a transient failure; APEC consolidated onto `www.apec.fr`.

---

## 6b. Further `unsupported` markets — Japan verified, Korea examined and declined

**The boundary test**, sharpened: a market belongs on `unsupported` when the
reader's expected document is **a fixed form the candidate fills in rather than a
document they write**, or is organised on different pillars. Carrying a photo, a
date of birth or a marital status does **not** qualify — those are row values the
table already models, and treating them as different-in-kind would put half of
continental Europe on the list.

**Japan survives verification, and is now primary-sourced rather than asserted.**
The JIS form was withdrawn: 令和2年7月 (July 2020), 日本規格協会 removed the
rirekisho 様式例 from the JIS commentary. MHLW then issued its own — the
**厚生労働省履歴書様式例** (April 2021) — and its stated changes are that
性別 (sex) becomes an optional free-text field, and four fields are **removed
outright**: 通勤時間 (commute time), 扶養家族数 (dependants), 配偶者 (spouse),
配偶者の扶養義務 (spousal support obligation). **primary**, MHLW PDF downloaded and
extracted: <https://kouseisaiyou.mhlw.go.jp/assets/pdf/methods/04.pdf>

Decisively for the entry, **the form is still a form, and the photo is still
physically affixed.** The 2021 様式例 retains a 写真をはる位置 ("position to affix
the photo") box, with instructions 「本人単身胸から上」 (subject alone, chest up)
and 「裏面のりづけ」 (glue the reverse). A document with a glue-the-photo-here box
is not a variant of a Typst-rendered CV. The `unsupported` entry stands; only its
sourcing improves, and the note should now cite MHLW's form rather than JIS, which
no longer exists.

**South Korea was examined closely and is deliberately NOT added** — the most
interesting result in this section, because the law moved the document *toward* a
Western CV rather than away.

**채용절차의 공정화에 관한 법률 (Act on Fair Hiring Procedures) Article 4-3**,
*출신지역 등 개인정보 요구 금지*, in force **17 July 2019**, prohibits an employer
from requiring on the application: 용모·키·체중 등의 신체적 조건 (appearance,
height, weight), 출신지역 (birthplace), 혼인여부 (marital status), 재산 (wealth),
and the 학력·직업·재산 of parents and siblings — with a fine of up to ₩5m. It binds
**구인자 (the employer)**, not the candidate, and applies to private employers with
30+ employees. That list is almost exactly the set of fields that made the
traditional 이력서 distinctive.

Two things stop this becoming an `unsupported` entry, and they pull opposite ways:

- Korea's Ministry of Employment and Labor manual (12 July 2019) preserves
  **ID-style photographs for identity verification**, so the photo has not gone.
- The companion **자기소개서** (self-introduction essay) persists alongside the
  이력서, which is genuinely a second document rather than a CV section.

But no primary source establishes that Korean domestic hiring *requires* a fixed
form the way MHLW's rirekisho does — the Korean standard form is recommended, not
mandated, and the 2019 Act pushes toward free-form. **Korea is therefore a variant
with unusual personal-data norms plus a companion document, not a different
document in kind.** Recorded here rather than shipped, with the reasoning, so the
next pass does not have to re-derive it.

**Everything else in this section is unestablished, not cleared.** China, India,
Brazil, the Gulf states, the Nordics, Poland, Spain and Italy were not reached at
primary-source depth in this pass. They take the `default` row, which says plainly
that no researched row exists — which is the correct behaviour for a market nobody
has researched, and is why the absence is tolerable.

**`unsupported` therefore ships unchanged at one entry: JP.** That is now a
researched conclusion rather than an unexamined default.

---

## 7. Findings that are design changes, not content — flagged, not decided

Three findings would change decided behaviour or extend the schema. Per the
ticket's own instruction, they are recorded rather than resolved:

1. **Signature / place-and-date is a rendered element with no column.** Expected in
   Germany, conditional in Austria (*"falls Ort, Datum und Unterschrift nicht
   bereits im Anschreiben angeführt wurden"*), and **forbidden in Switzerland**. A
   copied German row therefore renders a signature block on a Swiss CV. This needs
   a new market-keyed field and a template change — ticket 14 fixed the schema, so
   it is not this ticket's to add.
2. **`length_rule: hard` has a real user, but it is not a market.** USAJOBS is a
   *hiring system* within a market whose general row is advisory. The `unsupported`
   and `markets` maps are both keyed by country, so US-federal cannot be expressed
   without either a new axis or a synthetic market code. Note this is the same
   shape of problem as §5's Swiss language question and is worth deciding once.
3. **The `summary` column's definition is unstated.** `expected | optional |
   discouraged` was shipped without saying whether it describes *guidance* or
   *outcomes*, and the answer flips UK and FR between two values. Definition first,
   then the value.
4. **The frozen section-key set does not fit German practice.** Ticket 11 §9 fixed
   a closed set of section keys. German convention splits `education` into
   *Schulbildung* / *Berufsausbildung* / *Studium* as separate rendered sections,
   and has no `certifications` section at all (Zertifikate are a row inside
   Kenntnisse). One key per concept forces a normalisation in the string — which is
   what shipped — rather than in the schema. Two further rows recur in every German
   sample with no key to hold them: **Mobilität** (driving licence, 7 of 10
   samples) and **EDV** (IT skills, 6 of 10).
5. **Unlabelled sections were not a modelled possibility.** The French *accroche*
   is sourced as having no heading, and the schema assumed every section has one.
   The worked example implements this as an empty heading string and it measures
   clean, but whether "empty string means unlabelled" is the right encoding — as
   against a nullable heading or a per-section flag — is a schema call.

---

## 8. Measured, not assumed

Every change above was compiled and extracted rather than reasoned about, to the
same standard tickets 11 and 14 set. typst 0.15.1; poppler, pypdf and
pdfminer.six.

| case | paper | DOB rendered | headings / order |
|---|---|---|---|
| DE, German ad | A4 | yes | Profil › Berufserfahrung › **Ausbildung und Studium** › **Kenntnisse** |
| DE, English ad | A4 | yes | Profile › Experience › Education › Skills |
| US, early career | us-letter | no | Profile › Education › Experience › Skills |
| PL (no row → default) | A4 | no | Profile › Experience › Education › Skills |
| **FR, French ad** | **A4** | **no** | *(unlabelled accroche)* › **Expérience professionnelle › Formations › Compétences › Langues** |

`poppler == pypdf == pdfminer` on **all five** outputs. The FR case extracts to 15
lines against the others' 16 — exactly the missing profile heading, which is the
finding rendering correctly rather than a discrepancy. Accented characters survive,
`Role · Employer · dates` stays paired, and the **Single-Flow Rule is intact**.

The France row also exercises two cells no previous case did: `dob: "omit"` on a
market whose language is not English, and a language row whose `document_noun`
differs from its market's — neither of which had a test.

## Gaps that remain, and what was checked to establish them

Recorded so the spec inherits no silent confidence:

- **No Swiss source of any kind states which language to apply in.** Checked:
  berufsberatung.ch, laufbahn.berufsberatung.ch, SECO/arbeit.swiss, BIZ Bern (26
  pages), Vaud OCOSP. All silent.
- **No adult-audience CV page exists on Switzerland's national portal.** Every
  reachable berufsberatung.ch CV-detail page is apprenticeship-audience; the Swiss
  adult evidence here is cantonal (Bern, Vaud). Both are official public bodies, so
  primary — but the qualification belongs in the caveat.
- **SECO/arbeit.swiss's own application brochures** (`BBL_Bewerben_de.pdf`, the
  Bewerbungsdossier PDF) returned HTTP 404 / an HTML shell. Retrieving them would
  likely settle the Swiss photo and page-count questions at federal level.
- **Nobody has measured photo prevalence in France or Austria.** The Austrian
  karriere.at LinkedIn poll (n=1,004) publishes a sample size but has no defensible
  sampling frame or date; the frequently-quoted "Stepstone Austria eye-tracking
  study" (1.8 seconds, 42%) exists **only in search snippets** with no locatable
  publication. Both tier `none`.
- **Nothing from the Gleichbehandlungsanwaltschaft since 2011** on application
  documents.
- **No survey with disclosed methodology on German employer expectations** for DOB,
  Familienstand, Staatsangehörigkeit or Kurzprofil. No source supports a quantified
  claim like *"X% of German CVs include a date of birth."*
- **No court decision anywhere on what an applicant should include.** All German
  and French case law found addresses employer conduct.
- **NACE** (HTTP 403) and **Blackburn-Brockman & Belanger 2001** (Cloudflare) are
  the two retrievable-with-access leads that would most improve §5.
- **`cadres.apec.fr`** failed DNS resolution; it hosts a page titled *"Ma photo sur
  mon CV, est-ce bien utile"*.
- The **LfDI Baden-Württemberg** guidance relied on in §3 is *Stand April 2020*,
  predating **ECJ C-34/21 (30 March 2023)**, which held § 26(1) s.1 BDSG
  incompatible with the Art. 88 GDPR opening clause. Its substantive conclusions
  are widely treated as surviving; its stated legal basis is unsettled.

### ⚠️ One fabricated source, recorded so it is not rediscovered

Search results surface a claim that the Bundesarbeitsgericht awarded €120,000 for
algorithmic age discrimination on **27 March 2026 (Az. 8 AZR 74/25)**, framed as a
landmark ATS ruling. **It is fabricated.** The court's own URL for that docket
returns HTTP 404, and the sole source is a blog post published **1 April 2026**
with no satire disclaimer. It is exactly the shape of thing this project's
sourcing discipline exists to catch, and it is recorded here because a future pass
will otherwise find it again.
