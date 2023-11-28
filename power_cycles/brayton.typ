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

$ "du"  = T "ds" - P d tilde(V) $ 

For ideal gas, 

$ "du" = c_tilde(V) "dT" $

Since the process is isothermal, du = 0 J/mol.

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

$ "du" = c_tilde(V) "dT" $

In isobaric case, we expect a temperature rise, so du $eq.not$ 0 J/mol.

Therefore, the internal energy relation becomes inconvenient to use.

$ "du"  = T "ds" - P d tilde(V) $ 

However, we can use enthalpy equation because it is more convenient to 
use.

$ "dh"  = T "ds" + tilde(V) "dP" $ 

Since dP = 0 Pa, then:

$ "dh"  = T "ds" $ 

At a constant pressure, 

$ c_P "dT"  = T "ds" $ 

$ s_2 - s_1 = c_P ln(T_2/T_1) $
$ Delta s_(1 arrow.r 2) = c_P ln(T_2/T_1) $

How does this compare with the entropy change for the isothermal process?

Take $T = (P tilde(V))/R $:

$ Delta s_(1 arrow.r 2) = c_P ln([(P_2 tilde(V)_2)/R]/[(P_1 tilde(V)_1)/R]) $

In an isobaric process, $T_1$ = $T_2$

$ Delta s_(1 arrow.r 2) = c_P ln(tilde(V)_2/tilde(V)_1) $

Now, we can use the heat capacity ratio k 

$ k equiv c_P/c_tilde(V) $
and for ideal gas 

$ c_P = R + c_tilde(V) $

And we get:
$ Delta s_(1 arrow.r 2",isobaric") = [R + c_tilde(V)] ln(tilde(V)_2/tilde(V)_1) $

Whereas for the isothermal case:
$ Delta s_(1 arrow.r 2",isothermal") = R ln(tilde(V)_2/tilde(V)_1) $

From this, we can see from this direct comparison that for an ideal gas,
the entropy change increases for an isobaric process compared to an 
isothermal process. This excludes any entropy generation when heat leaves 
a higher temperature thermal reservoir to a lower temperature gas.
For a monoatomic gas, $c_tilde(V) = 3/2 R$, so the entropy received 
by the gas during isobaric heating is about 2.5 times that of that 
received during isothermal heating for the same heating process. Of course,
some of that energy is used to increase gas temperature rather than 
to just expand its volume.

Of course, isobaric heat addition is a more realistic process than isothermal 
heating, and much more suited for gas turbines. Do note that this does not 
include irreversibilities due to frictional losses in the cycle. We 
just changed the way in which we add and extract heat.

== Brayton Cycle Efficiency

How does the Brayton Cycle compare to the Carnot Cycle?

The Carnot Efficiency is:

#numbered_eq(
  $ eta_"Carnot" = 1 - T_C/T_H $
  )

Remember that in General, for any heat engine's power cycle:


$ eta = 1 - Q_"out"/Q_"in" $


Let us consider the Brayton Cycle.

Firstly, what is the heat added and what is the heat removed?

The heat added $Q_"in"$ is determined in the isobaric process.

In this process,

$ "dh" = c_P "dT" $

For isobaric processes:
$ "dh" = T "ds" $

The enthalpy change is equal to the heat addition.

Therefore, for ideal gas with approximately constant heat capacity,
$ h_2 - h_1 = c_P (T_2-T_1) $

$ Q_"in" = c_P (T_2-T_1) $

From state 2 to state 3, we have isentropic adiabatic expansion.



From state 3 to state 4, for $Q_"out"$, we have isobaric heat removal.
Obviously, $T_4 eq.lt T_3$ since it's a cooling process.

$ Q_"in,isobaric cooling" = c_P (T_4-T_3) lt 0 $


$ Q_"out" = -c_P (T_4-T_3) $

Therefore, the heat removed is:
$ Q_"out" = c_P (T_3-T_4) gt 0 $

The efficiency therefore is:

$ eta = 1 - [c_P (T_3-T_4)]/[c_P (T_2-T_1)] $

For ideal gases with somewhat constant $c_P$:

$ eta = 1 -  (T_3-T_4)/ (T_2-T_1) $

Now, this is not too helpful since we have four different temperatures.
However, these temperatures are once again constrained by their entropy,
in that between state 2 to 3, there is isentropic adiabatic expansion.
Now, the adiabatic expansion process governs the relationship between 
temperature and volume as well as temperature and pressure. 

We shall use pressure relations since the heat addition and removal process 
is isobaric. And this makes our life much easier.

For isobaric heat addition, from state 1 to state 2:

$ P_1 = P_2 $

For isobaric heat removal from state 3 to state 4:

$ P_3 = P_4 $

For isentropic adiabatic expansion from state 2 to state 3:

$ T_3/T_2 = (P_3/P_2)^((k-1)/k) $

From state 4 to state 1, we have adiabatic isentropic compression:

$ T_4/T_1 = (P_4/P_1)^((k-1)/k) $

This gives us equations with which to constrain our Brayton Cycle.
Based on this, let us eliminate $P_2$ and $P_4$:


$ T_3/T_2 = (P_3/P_1)^((k-1)/k) $
$ T_4/T_1 = (P_3/P_1)^((k-1)/k) $

So, 

$ T_3/T_2 = T_4/T_1 $

Equivalently, 
$ T_3/T_4 = T_2/T_1 $

Let's substitute that into our efficiency equation:

$ eta = 1 -  (T_3-T_4)/ (T_2-T_1) $
$ eta = 1 -  T_4/T_1 (T_3/T_4-1)/ (T_2/T_1-1) $

In terms of temperatures, we get:

$ eta = 1 -  T_4/T_1 $

What is $T_4$? Remember, state 4 is after the expansion process
and the isobaric cooling process. This is also the temperature at 
the compressor inlet. And then for $T_1$, it is 
the state after isentropic compression.
This is the temperature at the isentropic compressor outlet. Now,
these temperatures ratios do not depend solely on the temperatures of 
the thermal reservoirs, but more directly on how much work the
compressor does on the gas. 

$ eta = 1 -  T_4/T_1 $
$ T_4/T_1 = (P_3/P_1)^((k-1)/k) $

$ eta = 1 -  (P_3/P_1)^((k-1)/k) $

Since the heat is added and removed in two isobaric processes, the 
low pressure process at $P_3$ and high pressure process at $P_1$, or 
equivalently, $P_3 = P_"low"$ and $P_1 = P_"high"$

$ eta = 1 -  (P_"low"/P_"high")^((k-1)/k) $

The efficiency is determined solely by the compressor ratio 
$r_p = P_"high"/P_"low"$ @Cengel2011.

$ eta_"brayton" = 1 -  1/r_p^((k-1)/k) $

How does this compare to the Carnot cycle? After all, the Brayton Cycle 
is a heat engine, and would therefore be limited by Carnot efficiency. It 
is difficult to compare the efficiencies directly because we can adjust 
the compressor ratio $r_p$. One might wonder if we can increase $r_p$
indefinitely to obtain maximum efficiency. 

Of course, that would be impossible because if we increase $r_p$, we 
also increase the compressor outlet temperature. Once compressor outlet 
temperatures increase, you would also need a higher temperature at 
the thermal reservoir in order to pump heat into the compressed gas.
Hence, the Brayton cycle is still limited by $T_H$ and $T_C$.

$ T_"compressor inlet"/T_"compressor outlet" = 
(P_"compressor inlet"/P_"compressor outlet")^((k-1)/k) $

TBD

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
