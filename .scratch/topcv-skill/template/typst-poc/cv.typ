// candid-cv — PROOF OF CONCEPT template (ticket 11, 2026-08-05)
//
// NOT the shipped template. This exists to prove the architecture settled on
// ticket 11 compiles and extracts correctly. The implementing effort writes
// the real one.
//
// INVARIANTS this file demonstrates — all measured, see the ticket:
//   1. The agent NEVER writes this file. It writes cv-data.json only.
//   2. SINGLE-FLOW RULE: nothing is ever right-aligned or placed in a layout
//      column that carries text. Right-aligned dates detach from their role on
//      poppler AND pdfminer; grids and tables scramble label/value pairing.
//      Only text-flow adjacency survives all three extractors.
//   3. Embedded fonts only (Libertinus Serif ships inside the typst binary),
//      so line breaks, page count and appearance are identical everywhere.
//   4. A photo, when included at all, is place()d OUT of the text flow so it
//      cannot introduce a text-bearing column.
//   5. `tight` is the single knob for the ragged-tail rule: bounded
//      typographic compression only, never content removal.

#let d = json("cv-data.json")
#let tight = 1.0   // bounded [0.85, 1.0] — lowered only to reclaim a ragged tail

#set page(paper: "a4", margin: 1.8cm * tight)
#set text(font: "Libertinus Serif", size: 10pt, lang: "de")
#set par(leading: 0.65em * tight, justify: false)
#show heading.where(level: 2): it => [
  #v(0.8em * tight)#smallcaps(it.body)#v(-0.4em)#line(length: 100%, stroke: 0.5pt)
]

#let section(title, body) = [
  == #title
  #body
]

// ── Header ────────────────────────────────────────────────────────────────
// Photo (rare, market- and candidate-gated) sits outside the flow entirely.
#if d.at("photo", default: none) != none {
  place(top + right, image(d.photo, width: 3cm))
}
#align(center)[
  #text(size: 20pt, weight: "bold")[#d.name] \
  #text(size: 11pt)[#d.headline] \
  #d.contact.join(" | ")#if d.at("dob", default: none) != none [ | #d.dob]
]
#v(0.5em)

// ── Core sections ─────────────────────────────────────────────────────────
#section(d.headings.profile)[#d.profile]

#section(d.headings.experience)[
  #for job in d.experience [
    #text(weight: "bold")[#job.role] · #job.employer · #emph[#job.dates]
    #if job.bullets.len() > 0 [
      #list(..job.bullets, marker: [–], spacing: 0.5em * tight, indent: 0.6em)
    ]
    #v(0.35em * tight)
  ]
]

#section(d.headings.skills)[
  #for s in d.skills [
    #text(weight: "bold")[#s.label] — #s.values.join(" | ") \
  ]
]

#section(d.headings.education)[
  #for e in d.education [
    #text(weight: "bold")[#e.qualification] · #e.institution · #emph[#e.dates] \
    #if "note" in e [#text(size: 9pt)[#e.note]]
  ]
]

// ── Conditional sections: closed, known set ───────────────────────────────
#if d.at("certifications", default: ()).len() > 0 {
  section("Zertifikate")[#d.certifications.join(" | ")]
}
#if d.at("languages", default: ()).len() > 0 {
  section("Sprachen")[#d.languages.join(" | ")]
}

// ── Escape hatch: anything real life produces ─────────────────────────────
#for extra in d.at("additional", default: ()) {
  section(extra.title)[#extra.items.join(" | ")]
}
