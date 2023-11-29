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

How does $T_H$ and $T_C$ come into play? It is evident that during 
the isobaric heating and cooling, $T_H gt.eq T_"gas"$ during heating 
and $T_C lt.eq T_"gas"$ during cooling. During isobaric heating, we 
could theoretically increase temperature with by subjecting the 
gas to several thermal reservoirs, each with increasing temperatures.
This would be the most reversible way to add heat. Unfortunately,
this would be too slow and cumbersome, and you would still need a 
thermal reservoir at $T_H$ to bring the gas in the Brayton cycle up 
to $T_H$. In Brayton cycles, if we fix $T_H$ and $T_C$, only then can 
we compare it to the Carnot cycle. With this, we only consider 
heat addition from the thermal 
reservoir at $T_H$, not from an infinite series of thermal reservoirs 
to ensure reversible heating.

Under these assumptions, let's relate $eta$ to $T_H$, $T_C$ and $r_p$.
We start with:

$ eta = 1 -  (T_3-T_4)/ (T_2-T_1) $

$T_4$ is the temperature of the compressor inlet, which should be 
right after the gas has expanded and cooled. Thus, $T_4 = T_C$.
In the same note, we have $T_2 = T_H$ as state 2 represents the 
state of the gas after isobaric heating.

$ eta = 1 -  (T_3-T_C)/ (T_H-T_1) $

Now, due to the adiabatic isentropic compression process,


$ T_3/T_2 = (P_3/P_1)^((k-1)/k) $
$ T_4/T_1 = (P_3/P_1)^((k-1)/k) $

If we use $T_C$ and $T_H$:

$ T_3/T_H = (1/r_p)^((k-1)/k) $
$ T_3 = T_H (1/r_p)^((k-1)/k) $
$ T_C/T_1 = (1/r_p)^((k-1)/k) $
$ T_1 = (r_p)^((k-1)/k) T_C $

$ eta = 1 -  (T_H (1/r_p)^((k-1)/k)-T_C)/ (T_H-(r_p)^((k-1)/k) T_C) $

$ eta = 1 -  (T_H -T_C (r_p)^((k-1)/k))/ (T_H (r_p)^((k-1)/k) 
-(r_p)^((k-1)/k)(r_p)^((k-1)/k) T_C) $


Therefore, if we constrain $T_H$ and $T_C$:


#numbered_eq(
$ eta = 1 -  (T_H -T_C (r_p)^((k-1)/k))/ (T_H (r_p)^((k-1)/k) 
-(r_p)^((2k-2)/k) T_C) $)

Now, given $r_p$ and $k$, we should be able to compare this efficiency to 
the thermal Carnot efficiency. To determine what the maximum Brayton 
cycle efficiency is, we need to differentiate this expression with 
respect to $r_p$. Of course, that would be a pain. I'd rather differentiate
this with respect to $r_p^((k-1)/k)$. 

Let

$ zeta = r_p^((k-1)/k)  $

$ eta = 1 -  (T_H -T_C zeta)/ (T_H zeta - zeta^2 T_C) $
$ eta = 1 -  (T_H -T_C zeta)/ (T_H zeta - zeta^2 T_C) $

Using the quotient rule and knowing of course, 
differentiating 1 results in 0:

$ (diff eta)/(diff zeta) = -[ (T_H zeta - zeta^2 T_C)(-T_C) - 
(T_H -T_C zeta)(T_H - 2 zeta T_C)]/ (T_H zeta - zeta^2 T_C)^2  $

Let's tidy up the minus signs:

$ (diff eta)/(diff zeta) = [ (T_H zeta - zeta^2 T_C)(T_C) + 
(T_H -T_C zeta)(T_H - 2 zeta T_C)]/ (T_H zeta - zeta^2 T_C)^2  $

$ (diff eta)/(diff zeta) = [ (T_H T_C zeta - zeta^2 T_C^2) + 
(T_H -T_C zeta)(T_H - 2 zeta T_C)]/ (T_H zeta - zeta^2 T_C)^2  $

$ (diff eta)/(diff zeta) = [ (T_H T_C zeta - zeta^2 T_C^2) + 
(T_H^2 + 2 zeta^2 T_C^2 - 2 zeta T_C T_H - zeta T_C T_H)]
/ (T_H zeta - zeta^2 T_C)^2  $

$ (diff eta)/(diff zeta) = [ (T_H T_C zeta - zeta^2 T_C^2) + 
(T_H^2 + 2 zeta^2 T_C^2 - 3 zeta T_C T_H )]
/ (T_H zeta - zeta^2 T_C)^2  $


$ (diff eta)/(diff zeta) = [ T_H T_C zeta + 
T_H^2 +  zeta^2 T_C^2 - 3 zeta T_C T_H ]
/ (T_H zeta - zeta^2 T_C)^2  $

$ (diff eta)/(diff zeta) = [ T_H^2 +  zeta^2 T_C^2 - 2 zeta T_C T_H ]
/ (T_H zeta - zeta^2 T_C)^2  $

$ (diff eta)/(diff zeta) = [ T_H - zeta T_C ]^2
/[ zeta^2 (T_H  - zeta T_C)^2 ]  $

$ (diff eta)/(diff zeta) = 1 / zeta^2   $
For this solution to be true, we could postulate $zeta arrow.r infinity$.
But that means an infinite compression ratio, which is practically 
impossible. 

Well I should have expected this result either way because:

$ eta_"brayton" = 1 -  1/r_p^((k-1)/k) = 1 - 1/zeta $

Performing a partial derivative here would have yield the same result 
for much less effort (lol). However, this derivative deals with 
$zeta$, not $r_p$. We should still find efficiency with respect to $r_p$:


$ (diff eta)/(diff r_p) = (diff eta)/(diff zeta) (diff zeta)/(diff r_p) $

Since it is not feasible for $(diff eta)/(diff zeta) = 0 $,
then 

$ (diff zeta)/(diff r_p) = 0 $
$ (diff zeta)/(diff r_p) = (diff )/(diff r_p) r_p^((k-1)/k) $
$ (diff zeta)/(diff r_p) = (k-1)/k r_p^((k-1)/k - k/k) $
$ (diff zeta)/(diff r_p) = (k-1)/k r_p^((-1)/k ) $

Set derivative to 0.

$ 0 = (k-1)/k r_p^((-1)/k ) $

$ 0 =  r_p^((-1)/k ) $
$ 0 =  1/r_p^(1/k) $

For a fixed k, we once again require $r_p arrow.r infinity$, which is 
not quite feasible. This is perhaps not a good way to compare efficiency 
of Brayton cycle to Carnot cycle.

Bruh, I don't understand lol... how do i compare brayton cycle to carnot 
cycle? It seems the Brayton cycle efficiency doesn't even depend on 
temperature. However, as expected, the Brayton cycle efficiency 
reaches Carnot efficiency at fixed temperature bounds as $r_p arrow.r infinity$
in literature @Shaw2008.

IDK how to prove it mathematically though.

Okay perhaps this is simpler:

$ eta = 1 -  T_4/T_1 $

State 4 is post isentropic expansion and isobaric cooling. Thus it is 
the coldest temperature $T_C$.

$ eta = 1 -  T_C/T_1 $

Now, let's fit in $T_H$:

$ eta = 1 -  T_C/T_H T_H/T_1 $

It is evident that since $T_H$ is the maximum temperature, 
$T_H gt.eq T_1$. Therefore $T_H/T_1 gt.eq 1$. 
Now, $T_1$ is the compressor exit temperature. It is greater than $T_C$
but likely cooler than $T_H$. The best case scenario for efficiency is 
$T_H = T_1$. But that means there is almost no heat added during the 
isobaric heat addition. In that case, a small amount of heat dh 
is added to the fluid. In that case:


$ eta = 1 -  T_C/T_H  $

We thus arrive back at our Carnot efficiency, assuming we use the thermal 
reservoir at $T_C$ and $T_H$.

Now, how does $T_1$ relate to $T_H$?

$ Q_"in" = c_P (T_H -T_1) $

$ Q_"in"/c_P = T_H -T_1 $
$ T_1 = T_H -Q_"in"/c_P $

Substitute back in:
$ eta = 1 -  T_C/T_H T_H/T_1 $

$ eta = 1 -  T_C/T_H T_H/(T_H -Q_"in"/c_P) $
$ eta = 1 -  T_C/T_H 1/(1 -Q_"in"/[c_P T_H]) $

It is apparent from this expression that Brayton 
cycle efficiency reaches Carnot cycle efficiency as 
$Q_"in" arrow.r 0$.


== Work Ratio

Thus, we use a different performance metric called work ratio.

$ "work ratio" = (W_"turbine" )/(W_"turbine" - W_"compressor") $


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
