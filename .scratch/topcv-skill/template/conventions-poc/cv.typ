// SPIKE — proves the ticket-14 conventions schema resolves inside cv.typ.
// Extends the ticket-11 proof-of-concept; keeps the Single-Flow Rule intact.

#let d    = json("cv-data.json")
#let conv = json("conventions.json")

// ── Resolution, exactly as specified ──────────────────────────────────────
#let m     = conv.markets.at(d.market, default: conv.default)
#let h     = conv.headings.at(d.language)
#let order = m.at("orders", default: conv.orders).at(d.career_stage)
#let ptgt  = m.page_target.at(d.career_stage)

#let tight = 1.0
#set page(paper: m.paper, margin: 1.8cm * tight)
#set text(font: "Libertinus Serif", size: 10pt, lang: d.language)
#set par(leading: 0.65em * tight, justify: false)
#show heading.where(level: 2): it => [
  #v(0.8em * tight)#smallcaps(it.body)#v(-0.4em)#line(length: 100%, stroke: 0.5pt)
]
// An empty heading string means the section renders UNLABELLED — sourced, not a
// convenience: French guidance describes the top-of-CV accroche as a block with
// no heading of its own (ONISEP, France Travail). Single-Flow is unaffected.
#let section(title, body) = if title == "" [
  #v(0.4em)#body
] else [== #title
#body]

// ── Header — photo and DOB are GATED BY THE TABLE, not by the agent ───────
#let show_photo = m.photo == "expected" and d.at("photo", default: none) != none
#if show_photo { place(top + right, image(d.photo, width: 3cm)) }

#align(center)[
  #text(size: 20pt, weight: "bold")[#d.name] \
  #text(size: 11pt)[#d.headline] \
  #d.contact.join(" | ")#if m.dob != "omit" and d.at("dob", default: none) != none [ | #d.dob]
]
#v(0.5em)

// ── Sections rendered in the resolved order ──────────────────────────────
#for key in order {
  if key == "profile" and d.at("profile", default: none) != none {
    section(h.profile)[#d.profile]
  } else if key == "experience" {
    section(h.experience)[
      #for job in d.experience [
        #text(weight: "bold")[#job.role] · #job.employer · #emph[#job.dates]
        #if job.bullets.len() > 0 {
          list(..job.bullets, marker: [–], spacing: 0.5em * tight, indent: 0.6em)
        }
        #v(0.35em * tight)
      ]
    ]
  } else if key == "education" {
    section(h.education)[
      #for e in d.education [
        #text(weight: "bold")[#e.qualification] · #e.institution · #emph[#e.dates] \
      ]
    ]
  } else if key == "skills" {
    section(h.skills)[
      #for s in d.skills [#text(weight: "bold")[#s.label] — #s.values.join(" | ") \ ]
    ]
  } else if key == "additional" {
    for extra in d.at("additional", default: ()) { section(extra.title)[#extra.items.join(" | ")] }
  } else if d.at(key, default: ()).len() > 0 {
    // certifications / languages / publications / portfolio — uniform shape
    section(h.at(key))[#d.at(key).join(" | ")]
  }
}

// Page target is advisory: recorded, never enforced. length_rule == "hard"
// would gate a cap here; no shipped row uses it.
#let _unused = (ptgt, m.length_rule)
