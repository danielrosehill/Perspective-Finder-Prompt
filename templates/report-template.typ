// Perspective Finder — Report Template
// Usage: #import "templates/report-template.typ": report
// #show: report.with(title: "Report Title", date: "2026-03-04", scope: "Scope description")

#let report(title: "", date: "", scope: "", body) = {
  set document(title: title)
  set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm), numbering: "1")
  set text(font: ("Linux Libertine", "Liberation Serif", "DejaVu Serif"), size: 11pt)
  set heading(numbering: "1.1")
  set par(justify: true, leading: 0.65em)

  // Title page
  page(numbering: none)[
    #align(center + horizon)[
      #block(width: 80%)[
        #text(size: 28pt, weight: "bold")[#title]
        #v(1.5em)
        #line(length: 40%, stroke: 0.5pt + gray)
        #v(1em)
        #text(size: 14pt, fill: luma(100))[Perspective Finder Report]
        #v(0.5em)
        #text(size: 12pt)[#date]
        #v(0.5em)
        #if scope != "" [
          #text(size: 11pt, style: "italic", fill: luma(120))[Scope: #scope]
        ]
      ]
    ]
  ]

  // Table of contents
  page(numbering: none)[
    #outline(depth: 2, indent: 1.5em)
  ]

  body
}

// Helper: embed a figure (for quadrant visualizations)
#let debate-figure(path, caption: "") = {
  figure(
    image(path, width: 80%),
    caption: caption,
  )
}

// Helper: profile entry
#let profile(name: "", bio: "", fit: "", handles: (), work: ()) = {
  heading(level: 3, name)

  [*Brief Bio:* #bio]
  linebreak()
  [*Why They Fit:* #fit]

  [*Social Media & Channels:*]
  for (platform, handle) in handles [
    - *#platform:* #handle
  ]

  if work.len() > 0 [
    [*Notable Work / Key Positions:*]
    for item in work [
      - #item
    ]
  ]
  v(0.5em)
}
