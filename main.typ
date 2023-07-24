// ---------------------------------
// | Information about the thesis  |
// ---------------------------------
#let author = "My Name"
#let title  = "Title of the Thesis"

#let thesis_type = "Master's Thesis/Bachelor's Thesis"
#let institute = "KASTEL – Institute of Information Security and Dependability"

#let reviewers = ("Prof. A", "Prof. B")
#let advisors  = ("M.Sc. C", "M.Sc. D")

#let start_time = "xx. Month 20XX"
#let end_time   = "xx. Month 20XX"

// ---------------
// | Page Layout |
// ---------------
#set document(
  author: author,
  title: title
)

#set page(
  paper: "a4",

  binding: left,
  margin: (
    inside: 3.25cm,
    outside: 2.5cm,
  ),
  
  number-align: right,
  numbering: "1",
)

// TODO: Not stable yet...
// #show heading.where(outlined: false): set heading(bookmarked: false)
#show heading: it => {
  set text(font: "Source Sans Pro")
  v(12pt * 3.5, weak: true)
  it
  v(12pt * 2, weak: true)
}

#show heading.where(level: 1): it => {
  pagebreak(to: "odd")
  v(3cm)
  it
}

#set par(justify: true)
#set text(
  font: "Linux Libertine",
  size: 12pt,
  hyphenate: false
)

// --------------
// | Title page |
// --------------
#rect(
  width: 100%,
  height: 100%,
  radius: (
    top-right: 8mm,
    bottom-left: 8mm,
  ),
)[
  #set align(center)
  #set text(size: 14pt)

  #grid(
    columns: 1,
    rows: (6cm, 1fr),
    
    align(horizon, grid(
      columns: (2fr, 1fr, 2fr),
      rows: 1fr,
      
      image("assets/logo-kit.svg", height: 1.8cm),
      [],
      image("assets/logo-sdq.svg", height: 1.8cm)
    )),
    [
      #text(font: "Source Sans Pro", size: 20pt, strong(title))
      
      #thesis_type of
      
      #author
    ], [
      At the KIT Department of Informatics\
      #institute
      
      #v(12pt)
      
      #let cardinalNumberToOrdinalNumber(number) = {
        if 11 <= calc.rem(number, 100) and calc.rem(number, 100) <= 13 {
          str(number) + "th"
        } else {
          str(number) + (
            "th",
            "st",
            "nd",
            "rd",
            "th"
          ).at(calc.min(calc.rem(number, 10), 4))
        }

        /*
        (
          "1": "First",
          "2": "Second",
          "3": "Third",
          "4": "Fourth",
          "5": "Fifth",
          "6": "Sixth",
          "7": "Seventh",
          "8": "Eighth",
          "9": "Ninth",
          "10": "Tenth",
        ).at(str(number))
        */
      }
      
      #block(align(left, grid(
        columns: (auto, auto),
        gutter: 0.65em,
        
        ..reviewers.enumerate().map(item => {
          let index = item.at(0) + 1
          let name  = item.at(1)
          
          ([#cardinalNumberToOrdinalNumber(index) examiner:], [#name])
        }).flatten(),
        
        [], [],
        
        ..advisors.enumerate().map(item => {
          let index = item.at(0) + 1
          let name  = item.at(1)
          
          ([#cardinalNumberToOrdinalNumber(index) advisor:], [#name])
        }).flatten(),
      )))
      
      #v(12pt)
      
      #start_time – #end_time
    ]
  )
]

// -------------------
// | Title back page |
// -------------------
#pagebreak(weak: true)
Karlsruher Institut für Technologie\
Fakultät für Informatik\
Postfach 6980\
76128 Karlsruhe

// ---------------
// | Declaration |
// ---------------
#pagebreak(to: "odd")
#v(1fr)

#rect(
  width: 100%,
  inset: (
    top: 5pt,
    rest: 0pt
  ),
  stroke: (
    top: 1pt
  ),
)[
  /*
  Gemäß Studien- und Prüfungsordnung Bachelor Informatik des KIT,
  § 14 (5) vom 10.05.2022
  */
  
  I declare that I have developed and written the enclosed thesis completely by myself. I have not used any other than the aids that I have mentioned. I have marked all parts of the thesis that I have included from referenced literature, either in their original wording or paraphrasing their contents. I have followed the by-laws to implement scientific integrity at KIT.
]

*PLACE, DATE*

#v(1.5cm)

#grid(
  row-gutter: 1.5mm,
  
  block(width: 8cm, repeat[.]),
  align(center)[
    (#author)
  ]
)

// ----------------
// |   Abstract   |
// ----------------
#include "sections/01_abstract_en.typ"
#include "sections/02_abstract_de.typ"

// ------------------------
// |   Table of Contents  |
// ------------------------
// Headings
#[
  #show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    set text(font: "Source Sans Pro")
    strong(it)
  }

  #heading(outlined: false)[Outline]
  #outline(
    depth: 3,
    indent: auto,
    title: none
  )
]

// Figures
#heading(outlined: false)[List of Figures]
#outline(
  target: figure.where(kind: image),
  title: none,
)

// Tables
#heading(outlined: false)[List of Tables]
#outline(
  target: figure.where(kind: table),
  title: none,
)

// -----------------
// |   Main part   |
// -----------------
#set heading(numbering: "1.")

#include "sections/03_introduction.typ"
#include "sections/04_content.typ"
#include "sections/05_evaluation.typ"
#include "sections/06_conclusion.typ"

// --------------------
// |   Bibliography   |
// --------------------
#bibliography("thesis.bib")

// ----------------
// |   Appendix   |
// ----------------
#show: it => {
  counter(heading).update(0)
  counter("appendices").update(1)
  
  set heading(numbering: "A.1.")
  
  it
}

#include "sections/07_appendix.typ"
