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


// common bindings for derivatives
#let mol = "mol"
#let dT = "dT"
#let dtildev = "d"+ $tilde(V)$
#let du = "du"
#let ds = "ds"
#let Tds = "Tds"
#let PdV = "Pd"+$tilde(V)$
#let RT = "RT"
#let partial(y,x) = {
  $(diff #y)/(diff #x)$
  }

#let cv = $c_tilde(V)$

#let v1 = $tilde(V)_1$
#let v2 = $tilde(V)_2$



= Rankine Cycle 

The Rankine cycle is essentially the Brayton cycle but 
with phase change.

Consider 4 states 

And note of course, that my states will be slightly 
different from textbooks. 

Let's say you have a liquid, the liquid is at some 
constant pressure. This is state 1. 


Here are its steps:
1. Constant Pressure Heat Addition (Boiler)
2. Constant Entropy Adiabatic Expansion (Turbine)
3. Constant Pressure Heat Removal (Condenser)
4. Constant Entropy Adiabatic Compression (Pump)

= Analysis 


== Saturated Steam Cycle

Recall that for any cycle:

#let eta_generic = $ eta = 1 - Q_"out"/Q_"in" $

#eta_generic

#let p_boiler = $P_"boiler"$
For the Rankine Cycle, we boil the liquid at constant 
pressure until all the liquid is vaporised. Due to the phase 
change however, the process remains essentially isothermal.
This happens at $T_H$ and #p_boiler.

#let latent_heat = $h_"fg"$
#let rankine_boiling_energy_eqn = $ Q_"in" = h_v - h_l $
#rankine_boiling_energy_eqn

#rankine_boiling_energy_eqn

$ Q_"in" = #latent_heat (T_H, P_H) $

This is the heat of vaporisation or latent heat. Of course, given 
a vapour liquid equilibrium, the thermodynamic state is controlled by 
the vapour quality and $T_H$. Therefore, latent heat is only a function 
of one thermodynamic variable.

$ Q_"in" = #latent_heat (T_H) $
Or, in terms of pressure, we can also write:
$ Q_"in" = #latent_heat (P_H) $

#let p_condenser = $P_"condenser"$
#let quality_condenser = $x_"condenser"$

Now, the vapour is pushed through the turbine 
isentropically. This partially condenses some of the vapour 
in the turbine until it reaches the cool temperature 
$T_C$ and pressure #p_condenser. Let the quality of steam 
or vapour entering the condenser be #quality_condenser.


$ Q_"out" = #quality_condenser (h_v (T_C, P_C) - h_l (T_C,P_C)) $
$ Q_"out" = #quality_condenser (h_v (T_C, "sat") - h_l (T_C,"sat")) $
$ Q_"out" = #quality_condenser #latent_heat (T_C) $

Now
$ Q_"out" = #quality_condenser #latent_heat (T_C) $
In terms of pressure:
$ Q_"out" = #quality_condenser #latent_heat (P_C) $

Thus, we would have saturated liquid at $P_C$. The saturated liquid 
gets isentropically pressurised in a pump to bring it to the boiler pressure.


$ du = Tds  - PdV $

Under isentropic conditions:

$ du = - PdV $
Now, water is usually regarded as incompressible. We can usually neglect 
the work done by the pump #PdV when compared to heat added #Tds.
In this case, however, #PdV is the only term, so we have to calculate 
it out for water.

#let dP = "dP"
#let dT = "dT"
#let tildev = $tilde(V)$


$ dtildev = (partial(tildev,P))_T dP + (partial(tildev,T))_P dT $

Both of these partial derivatives are measureable properties.

$ dtildev/tildev = 1/tildev (partial(tildev,P))_T + 1/tildev (partial(tildev,T))_P dT $

#let isothermalcompressibility = $-1/tildev (partial(tildev,P))_T$
#let isobaricthermalexp = $1/tildev (partial(tildev,T))_P$

Isothermal compressibility is denoted $kappa_T = isothermalcompressibility $
@Guan2022 and isobaric thermal expansivity or coefficient of thermal 
expansion is denoted $alpha_P = isobaricthermalexp $.


$ dtildev = -tildev (isothermalcompressibility) dP + tildev isobaricthermalexp dT $
$ dtildev = -tildev kappa_T dP + tildev alpha_P dT $


Now, we can write the volume change equation as:
$ du = - P [(partial(tildev,P))_T dP + (partial(tildev,T))_P dT]  $
$ du = - P [-tildev kappa_T dP + tildev alpha_P dT]  $
$ du = - P tildev [-kappa_T dP + alpha_P dT]  $

Now, for water, or liquids in general, we can assume that:

$ c_P approx cv $

And therefore:

$ cv dT = - P tildev [-kappa_T dP + alpha_P dT]  $
$ [cv - P tildev alpha_P] dT =  P tildev kappa_T dP   $

Now, we can choose one to ignore... can we? I would speculate that 
$cv >> P tildev alpha_P$. But we still need to check this.

We can estimate that:

#let joulepermolekelvin = $J/("mol "K)$
#let jouleperkgkelvin = $J/("kg "K)$

$ c_p ("per unit mass") = 4184 jouleperkgkelvin $

== Superheat Steam Cycle

When the original Rankine cycle was developed, turbines were not good 
enough to tolerate much condensation in the turbine. This is because 
condensation in the turbines caused erosion @Cengel2011. This is because 
flow in steam turbines can have high velocities, at times it can be 
in the transonic @Wroblewski2009 or almost as fast as the speed of sound.
With more modern designs, some degree of condensation is tolerable. Though 
generally speaking, a good rule of thumb is to ensure #quality_condenser to 
be 0.90 @Cengel2011.
So, we want to limit the degree to which condensation takes place.

Thus, turbine longevity does place a constraint on #quality_condenser.
If we set #quality_condenser to 1, then we need to superheat our vapour.
This would allow us to have no condensation in the turbine.
Thus, in in our condenser, we adjust $Q_"out"$


$ Q_"out" = #latent_heat (P_C) $

And $Q_"in"$ shall be determined by:

$ Q_"in" = #latent_heat (P_H) + #latent_heat (P_C) $

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
