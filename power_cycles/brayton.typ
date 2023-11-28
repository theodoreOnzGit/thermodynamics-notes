#set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#show par: set block(spacing: 0.55em)
#show heading: set block(above: 1.4em, below: 1em)

// numered equation 
// https://stackoverflow.com/questions/76039071/numbered-equations-with-typst
// credit to honkbug
#let numbered_eq(content) = math.equation(
    block: true,
    numbering: "(1)",
    content,
)

// cetz, need 
// https://github.com/johannes-wolf/cetz
//
// cargo install just 
// git clone https://github.com/johannes-wolf/cetz
// cd cetz 
// just install
//
// it is typst's equivalent of tikz
#import "@preview/cetz:0.1.2"

= Brayton Cycle 


== Comparison with Carnot Cycle
Brayton Cycle is less ideal compared to Carnot Cycle.


The Carnot Cycle consists of four stages:
+ Isothermal Heat Addition at $T_H$
+ adiabatic isentropic expansion from $T_H$ to $T_C$
+ Isothermal Heat Removal at $T_C$
+ adiabatic isentropic compression from $T_C$ to $T_H$



In contrast, the Brayton Cycle Consists of the following four 
stages (I probably need to check the pressures and temperature 
labelling) @Cengel2011:
+ Isobaric Heat Addition at $P_1$
+ adiabatic isentropic expansion from $T_1$ to $T_2$
+ Isobaric Heat Removal at $P_2$
+ adiabatic isentropic compression from $T_3$ to $T_4$

The adiabatic processes are quite pretty much identical 
to the Carnot Cycle as they are isentropic ideal processes. The main 
difference is that heat addition is isobaric rather than isothermal.

=== Isothermal Heat Addition in Carnot Cycle

For isothermal processes:

#numbered_eq(
  $P_1 tilde(V)_1 = P_2 tilde(V)_2 $
)

For this: 

$ "dU"  = T "ds" - P d tilde(V) $ 

For ideal gas, 

$ "dU" = c_tilde(V) "dT" $

Since the process is isothermal, dU = 0 J/mol.

$ 0  = T "ds" - P d tilde(V) $ 

In isothermal heat addition, PV = constant.


$ 0  = T "ds" - (R T)/tilde(V) d tilde(V) $ 

For non zero T, 
$ 0  = "ds" - (R)/tilde(V) d tilde(V) $ 
$ s_2 - s_1 = R ln (tilde(V)_2/tilde(V)_1) $

$ Delta s_(1 arrow.r 2) = R ln (tilde(V)_2/tilde(V)_1) $

This is idealised heat addition

=== Isobaric Heat Addition in Brayton Cycle

Now for the Brayon cycle, we have Isobaric heat addition.

Now we start with ideal gas analysis because it is easier.

$ "dU" = c_tilde(V) "dT" $

In isobaric case, we expect a temperature rise, so dU $eq.not$ 0 J/mol.

$ "dU"  = T "ds" - P d tilde(V) $ 

= Appendix 

== Example cetz plots

=== Function Type

#cetz.canvas({
  import cetz.plot
  plot.plot(size: (3,2), x-tick-step: 180, y-tick-step: 1,
  x-unit: $degree$, y-max: .5, {
    plot.add(domain: (0, 360), x => calc.sin(x * 1deg))
    plot.add(domain: (0, 360), x => calc.cos(x * 1deg),
samples: 10, mark: "x", style: (mark: (stroke: blue)))
})
})

Syntax:
```typst
#cetz.canvas({
  import cetz.plot
  plot.plot(size: (3,2), x-tick-step: 180, y-tick-step: 1,
  x-unit: $degree$, y-max: .5, {
    plot.add(domain: (0, 360), x => calc.sin(x * 1deg))
    plot.add(domain: (0, 360), x => calc.cos(x * 1deg),
samples: 10, mark: "x", style: (mark: (stroke: blue)))
})
})
```


=== Data Type

Allows for arrays of data. Unsure about reading csv files yet...
#cetz.canvas({
  import cetz.plot
  plot.plot(size: (3,2), x-tick-step: 180, y-tick-step: 1,
  x-unit: $degree$, y-max: .5, {
    plot.add(domain: (0, 360), x => calc.sin(x * 1deg))
    plot.add(domain: (0, 360), ((0,0), (180,0.5), (360,-1)),
samples: 10, mark: "x", style: (mark: (stroke: blue)))
})
})

```typst
#cetz.canvas({
  import cetz.plot
  plot.plot(size: (3,2), x-tick-step: 180, y-tick-step: 1,
  x-unit: $degree$, y-max: .5, {
    plot.add(domain: (0, 360), x => calc.sin(x * 1deg))
    plot.add(domain: (0, 360), ((0,0), (180,0.5), (360,-1)),
samples: 10, mark: "x", style: (mark: (stroke: blue)))
})
})
```

#bibliography("../library.bib", 
style: "chicago-author-date")
