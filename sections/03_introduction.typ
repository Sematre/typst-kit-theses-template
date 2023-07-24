= Introduction
This is the themplate for Bachelor's and Master's theses at SDQ.
For more information on the formatting of theses at SDQ, please refer to
#link("https://sdq.kastel.kit.edu/wiki/Ausarbeitungshinweise") or to your advisor.

== Pacing and indentation
To separate parts of text in Typst, please use two line breaks in your source code.
They will then be set with correct indentation.
Do _not_ use:
- ```typ #parbreak()```
- ```typ #v()```

or other commands to manually insert spaces, since they break the layout of this template.

== Example: Citation
A citation: @becker2008a

== Example: Figures
A reference: The SDQ logo is displayed in @sdqlogo.
(Use ```typ @``` for easy referencing.)

#figure(
  image("/assets/logo-sdq.svg", width: 4cm),
  caption: "SDQ logo"
) <sdqlogo>

== Example: Tables
Typst offers nicely typeset tables, as in @atable.

#figure(
  table(
    columns: 2,
    [abc], [def],
    [ghi], [jkl],
    [123], [456],
    [789], [0AB]
  ),
  caption: "A table"
) <atable>

== Example: Formula
$
f(x) = ohm(g(x)) (x arrow infinity)
arrow.l.r.double
limsup_(x arrow infinity) |f(x) / g(x)| > 0
$