#set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#show par: set block(spacing: 0.55em)
#show heading: set block(above: 1.4em, below: 1em)

// equation numbering
#set math.equation(numbering: "(1)")

= Motivation for Studying Thermodynamics

Why on earth do we spend so much time studying thermodynamics? Well,
engineers are employed to make money and to save money. We want to produce 
a product as safely and as efficiently as possible. For the mechanical 
or aerospace engineer, the product could be an engine which ultimately 
converts heat energy into kinetic energy, be it of use in turbine for 
electricity or thrust generation. For the chemical engineer, the final 
product could be a purified chemical or mixture of chemicals such as 
diesel or kerosene. 

The question then is how much do I need to spend?

Most of the time, these expenditures relate directly to fuel costs 
and maintenance costs. Thermodynamics helps to answer how much energy 
we need for a certain process, be it of use in an engine, refrigeration,
or even distillation. These seemingly different processes are governed by 
the same laws. At first of course, we do find these laws quite abstract 
and difficult to apply to our situation of interest. Therefore, it is 
much better to study these laws in context of an example.

The most convenient example is that used in history. (write later)

= Zeroth law of thermodynamics

Law of equilibrium.

= First law of thermodynamics

Law of conservation of energy.

= Second law of thermodynamics

Law of entropy.

= Third law of thermodynamics

Basically entropy at 0K is 0 $J/K$.


= Statistics in the Study of Thermodynamics

Thermodynamics came about historically in the context of engines. We ask the 
question here, how much kinetic energy can I get given a unit of heat?
This would then determine the amount of coal I need to burn. In today's 
context, this would not only determine profits, but how environmentally 
friendly an engine is.

Where do we start? The first instinct is to use the first law. If I supply 
one joule of heat into an engine, the most ideal case if we only consider 
the first law, is that one joule of kinetic energy comes out. If only this 
were truly the case. Unfortunately, this is not because of statistics.


We know a lot of energy is contained in heat. Sensible heat manifests itself 
as kinetic energy of the molecules or atoms. This microscopic kinetic energy 
could in theory be converted into macroscopic kinetic energy. 
Statistically, however, this never happens because the atoms 
and molecules have a tendency to have their movement become more 
random over time. If I trap 100 gas atoms in a tiny box, and I have 
50 of them stationary and 50 of them moving in the same direction and then 
allow them to bang into each other after some time, their movement on 
average becomes randomised. Assuming they don't lose their kinetic energy,
they will have the same total energy as before, but the energy becomes 
so disordered in terms of directions. What are the chances that the gas 
atoms order themselves back to uniform movement without external 
intervention? Zero. This is essentially the second law. Statistics at 
the microscopic level manifests itself as the second law, and that 
is why thermodynamics is so closely intertwined with statistics. In fact,
several books are written on this very topic @Hill1986. For most engineering 
courses in chemical and mechanical engineering, we need not confuse ourselves 
further with excessive statistics. You can if you are interested, but we 
do not need to. We merely trust the statisticians that they have done their 
job right, and move onto the thermodynamics work.


= Back to Engines
So, assuming the statistics are right, let's move back to the topic 
of engines.
For an engine, to extract kinetic energy from the heat energy or the 
microscopic kinetic energy, we need all the gas atoms or molecules 
to essentially push in the same direction at the same time until 
they hopefully exhaust all their heat energy. Again, statistically, that 
cannot happen. How then can we trick the molecules to move in the same 
direction statistically speaking?

We look back to nature. In nature, a body of high temperature transmits 
heat to a body of lower temperature. The heat does not flow back on average 
from a body of low temperature to that of a high temperature again due 
to statistics. This is a manifestation of the second law. Heat flows from 
a higher temperature body to a lower temperature body. Without external 
intervention, this is an irreversible change. However, since 
a body of high temperature transmits its kinetic energy to a body of lower 
temperature, we see a statistical average of a molecule's kinetic energy 
moving in the same direction, that is from a hotter body to colder body.
Perhaps we can tap some of this energy to power our engine as the 
heat energy traverses from a high temperature body to a lower temperature 
body. In my visualisation, I think of this as flow from a body of water 
with higher potential energy going into a body of water with lower 
potential energy. We cannot extract all the kinetic energy from the 
water into a turbine, otherwise there is no flow of water. My take on this 
is that, likewise some of the kinetic energy is required to "push"
the kinetic energy from a higher temperature to that of a lower temperature.
So we cannot extract all of the heat energy.

We can, however, calculate an upper limit for how much energy we can 
extract. The theoretical maximum I suppose, is that we take some of this 
gas at a high temperature $T_H$, and extract as much energy from it until 
it reaches the temperature of the cold lower temperature body $T_C$. How 
can we extract this energy? We let the gas expand. By doing so, the gas 
does work on its surroundings. We assume here that no heat is added or 
taken away from the gas, and that no extra entropy (or extra randomness
of the microscopic kinetic energy) is generated. 

How can we quantify this amount of energy produced? For simplicity, we use 
simpler formulas to try and calculate this upper bound. We have our beloved 
ideal gas equation @Cengel2011:

$ P tilde(V) = R T $

Where P is pressure, $tilde(V)$ is molar volume, $R$ is the molar gas 
constant and T is absolute thermodynamic temperature. For mechanical 
engineers, it is common to use $overline(V)$ where volume is measured per 
unit mass instead of per unit mole. I start with a chemical engineer's 
perspective, therefore I use moles instead of mass even though historically
speaking, thermodynamics was developed in the context of mechanical engineering 
and engines.

Now, the process we described here is an adiabatic and isentropic process,
adiabatic as in no heat exchanged with surroundings and isentropic as 
in "iso-entropy-ic" or same entropy. This means no entropy generation 
in this closed system. This is also known as reversible. What can we use 
to describe this process? 

We can use the first law 

$ Delta U = Q + W $

W is total work done on the system, and Q is total heat input into 
the system. $Delta U$ is the change of internal energy of the system.

The is also used:

$ Delta S = integral (delta Q)/T "dT" $ 

In differential form:
$ "dS"  = integral (delta Q)/T "dT" $ 

S is entropy.
If we consider a per mole basis,

$ "ds"  = (delta q)/T "dT" $ 

If we combine the first and second law (todo: improve explanation):

$ "du" = T "ds" - P d tilde(V) $

In an isentropic process, ds = 0 $J/("mol" K)$.
Therefore:

$ "du" =  - P d tilde(V) $

Now, how can we relate the temperature of the gas to its energy?
(note: need to introduce concept of calculus)

$ "du"(T,tilde(V)) = ( (diff u)/(diff T) )_tilde(V) "dT" + ( (diff u)/(diff tilde(V)) )_T d tilde(V) $

We define $c_v =( (diff u)/(diff T) )_tilde(V) $. This is a measurable 
property called the constant volume heat capacity.

$ "du"(T,tilde(V)) = c_tilde(V) "dT" 
+ ( (diff u)/(diff tilde(V)) )_T d tilde(V) $<eqn:du-cv-dt>

Now, we want to eliminate $u$ from the right hand side, and make it 
in terms of temperature, pressure and volume only. By doing so, 
we can calculate the change in internal energy based on the 
temperature. These are things we can measure. How do we do so?

For this, we can reintroduce our first and second law to provide us 
additional equations to find u in terms of T and tilde(V).

(in progress)
$ "du" = T "ds" - P d tilde(V) $<eqn:du-tds-pdv>

To do so, we need to find $u(T, tilde(V))$ using the first and second 
law combination. And to do that, we need to eliminate $"ds"$. Since 
we want $u(T, tilde(V))$, we need $S(T, tilde(V))$ to fully eliminate S 
and find the right hand side of @eqn:du-tds-pdv.

$ "ds"(T,tilde(V)) =  ( (diff s)/(diff T) )_tilde(V) "dT" 
+ ( (diff s)/(diff tilde(V)) )_T d tilde(V) $<ds-t-v>

Okay, so we have $S(T, tilde(V))$, but we now have partial derivatives 
of s we need to get rid of. How shall we do so? Let's substitute 
@ds-t-v into @eqn:du-tds-pdv first, perhaps we can get some clarity.

$ "du" = T [( (diff s)/(diff T) )_tilde(V) "dT" 
+ ( (diff s)/(diff tilde(V)) )_T d tilde(V)] - P d tilde(V) $

$ "du" =  T( (diff s)/(diff T) )_tilde(V) "dT" 
+ [T( (diff s)/(diff tilde(V)) )_T  - P ] d tilde(V) $<eqn:du-t-s-p-v>

Now, let's compare @eqn:du-t-s-p-v to @eqn:du-cv-dt, we see that we don't 
really need to worry about $( (diff s)/(diff tilde(V)) )_T$ because if 
we compare the dT terms:

$ c_tilde(V) = T ( (diff s)/(diff T) )_tilde(V) $

This leaves us with

$ "du" =  c_tilde(V) "dT" + 
[T( (diff s)/(diff tilde(V)) )_T  - P ] d tilde(V) $

However, we find ourselves with yet another problem:
$( (diff s)/(diff tilde(V)) )_T$. Are we back at square one? Thankfully,
there are ways around this. We just need to use some calculus.

== The Maxwell Relations (First and Third)

Thermodynamics has a set of partial derivatives known as the Maxwell 
relation which can help us solve this problem. These are not to be confused 
with the Maxwell equations for electromagnetic waves, but it's the same 
guy: James Clerk Maxwell. He's just really smart.

Now, the Maxwell relations are based on Schawrz's theorem (according 
to Wikipedia, but also you can see this @Camargo2020). It basically 
says that for any function based on two variables, say M 
@Cengel2011 :

$ ( (diff M)/(diff x) )_y = ( (diff M)/(diff y) )_x $

Now, based on our first and second law of thermodynamics:

$ "du" = T "ds" - P d tilde(V) $
$ "du"(S,tilde(V)) = ( (diff u)/(diff s) )_tilde(V) "ds" 
+  ( (diff u)/(diff tilde(V)) )_s d tilde(V) $

So, when comparing coefficients: 

$ T = ( (diff u)/(diff s) )_tilde(V) $<eqn:T-u-s>
$ -P = ( (diff u)/(diff tilde(V)) )_s $<eqn:P-u-v>

If we differentiate @eqn:T-u-s by $d tilde(V)$ and 
@eqn:P-u-v by ds,

$  ((diff T)/(diff tilde(V)))_s =  
[(diff )/(diff tilde(V)) ( (diff u)/(diff s) )_tilde(V) ]_s $

$ -((diff P)/(diff s))_tilde(V) 
= [(diff )/(diff s) ( (diff u)/(diff tilde(V)) )_s ]_tilde(V)  $

By Schawrz's theorem, the order of partial derivatives doesn't matter.
So:

$ -((diff P)/(diff s))_tilde(V) 
=  ((diff T)/(diff tilde(V)))_s $<eqn:maxwell-thermo-1>

@eqn:maxwell-thermo-1 is the first of four Maxwell relations. These 
are meant to help us zap away those pesky confusing derivatives. 
@eqn:maxwell-thermo-1 is not quite helpful for our situation, so we'll 
need something else. We need a term where entropy is on the right hand 
side, and not a derivative. To do so, let us combine two things.
First @eqn:du-tds-pdv:

$ "du" = T "ds" - P d tilde(V) $

And secondly, we define helmholtz free energy:

$ a equiv u - T s $<eqn:helmholtz-definition>

When we take derivatives, we find s on the right hand side:

$ "da" equiv "du" - T "ds" - s "dT" $

Looks like $"du" - T "ds"$ pops up, and that is simply $-P d tilde(V)$.
We substitute this in to get:


$ "da" = - s "dT" - P d tilde(V) $<eqn:da-sdt-pdv>

In @eqn:da-sdt-pdv, we do have s on the right hand side. Thankfully, if 
we apply Schawrz's rule in a similar manner, we can find out:

$  -((diff s)/(diff tilde(V)))_T =  
[(diff )/(diff tilde(V)) ( (diff a)/(diff T) )_tilde(V) ]_T $

$ -((diff P)/(diff T))_tilde(V) 
= [(diff )/(diff T) ( (diff a)/(diff tilde(V)) )_T ]_tilde(V)  $

Since the order of derivatives doesn't matter, we find Maxwell's third 
relation:

$ ((diff s)/(diff tilde(V)))_T 
= ((diff P)/(diff T))_tilde(V) $<eqn:maxwell-thermo-3>

@eqn:maxwell-thermo-3 is Maxwell's third relation. The second and fourth 
relation is something we won't touch just yet, until it is something we 
really need. @eqn:maxwell-thermo-3 is just what we need for now to get 
rid of the s on the right hand side.

== Back to the Adibatic Isentropic Expansion Process

Let's substitute @eqn:maxwell-thermo-3 back in:

$ "du" =  c_tilde(V) "dT" + 
[T( (diff s)/(diff tilde(V)) )_T  - P ] d tilde(V) $

So we obtain:

$ "du" =  c_tilde(V) "dT" + 
[T( (diff P)/(diff T) )_tilde(V)  - P ] d tilde(V) $<eqn:du-p-v-t>

Great, now we have an expression for internal energy purely in terms 
of measurable properties (P, $tilde(V)$, T and $c_tilde(V)$). Note 
that the whole point of doing the calculus is for us to get usable forms 
of equations we can use to relate internal energy (and other properties) 
to measurable properties. It's a little bit like solving a complex puzzle, 
but we have achieved our goal for now. With this, we can calculate 
how much work we can extract by letting our gas expand from a hot gas to 
a colder gas.

In adiabatic isentropic expansion, we get:

$ "du" = - P d tilde(V) $

And regardless of the process, we have:

$ "du" =  c_tilde(V) "dT" + 
[T( (diff P)/(diff T) )_tilde(V)  - P ] d tilde(V) $

Now, for a start, we can calculate this for an ideal gas.

$ P tilde(V) = R T $
$ P  = (R T)/(tilde(V)) $
$ ( (diff P)/(diff T) )_tilde(V)  = (R)/(tilde(V)) $

$ "du" =  c_tilde(V) "dT" + [ T R/tilde(V)  - P ] d tilde(V) $

For an ideal gas, $[ T R/tilde(V)  - P ] = 0$. Therefore,


$ "du" =  c_tilde(V) "dT" $

Now, for isentropic adiabatic expansion, we can compare:

$ "du" =  c_tilde(V) "dT" $
$ "du" = - P d tilde(V) $

$  c_tilde(V) "dT" = - P d tilde(V) $

We eliminate P from the equation:

$  c_tilde(V) "dT" = - (R T)/(tilde(V)) d tilde(V) $
$  c_tilde(V)/T "dT" = - R /(tilde(V)) d tilde(V) $


Therefore, if we integrate between two states:

$  c_tilde(V) ln (T_2/T_1) = - R ln (tilde(V)_2/tilde(V)_1) $

Now, this is quite an important piece ofr the puzzle. Given two 
temperatures, we can calculate the volume ratios between the two of them.
This assumes of course, that we know the specific volume at the first state 
as well. How much work is done then when expanding the gas?

$ Delta u = integral_(T_1)^(T_2) c_tilde(V) "dT" $

For a monoatomic ideal gas, $c_tilde(V)$ is usually constant 
at $3/2 R$ @Zannoni1999 again due to statistics of microscopic 
kinetic energy interactions. In general, however, we cannot take ideal 
gas heat capacities to be constant. So do note that this does not always 
apply.

So, for adiabatic expansion of an ideal gas from a $T_H$ to $T_c$:
$ Delta u = - P d tilde(V) = integral_(T_H)^(T_C) c_tilde(V) "dT" $

For a monoatomic ideal gas:
$ Delta u = - P d tilde(V) = 3/2 R (T_H - T_C) $

Now, note that this work only extracts part of the energy of the gas 
and converts it into work. This is ultimately due to statistics that 
manifests itself as the second law. How then can we find out the efficiency
of this heat engine? What percentage of the heat added goes to work?

To understand this, we need to consider the Carnot Engine and Carnot Cycle.
This is the ideal heat engine, with zero entropy generation.


= Carnot Engine and Carnot Cycle

For any engine, we measure efficiency $eta$ using the ratio of 
net work out divided by the heat input @Cengel2011:

$ eta = W_"net out"/Q_"in" $

Of course, part of the energy cannot be used for work, and needs 
to be rejected as waste heat $Q_"out"$:
$ eta = (Q_"in"-Q_"out")/Q_"in" $

$ eta = 1 - Q_"out"/Q_"in" $

To determine engine efficiency, we need to consider this ratio and 
$Q_"out"$ and $Q_"in"$. To find that out, we need a mental model of 
how an ideal heat engine would work. This engine is the Carnot Engine.
It is based on the assumption that every process is reversible and that 
there is no entropy generation.

Now, 

TBC

We should get 

$ eta_"max,Carnot" = 1 - T_C/T_H $

= Isentropic Relations

In textbooks, we have relations for isentropic processes of ideal 
gas with approximately constant heat capacity:
$  c_tilde(V) ln (T_2/T_1) = - R ln (tilde(V)_2/tilde(V)_1) $
$ ln (T_2/T_1)^(c_tilde(V)) =  ln (tilde(V)_2/tilde(V)_1)^(- R) $
$  (T_2/T_1)^(c_tilde(V)) =   (tilde(V)_2/tilde(V)_1)^(- R) $

$  (T_2/T_1) =   (tilde(V)_2/tilde(V)_1)^(- R/c_tilde(V)) $
$  (T_2/T_1) =   (tilde(V)_1/tilde(V)_2)^( R/c_tilde(V)) $

Now, we often have the heat capacity ratio, denoted as k or $gamma$.
For $c_p$, we use enthalpy relations involving the first and second law.

$ h equiv u + P tilde(V) $

$ "dh" equiv "du" + P d tilde(V) + tilde(V) "dP" $

$ "dh" equiv T"ds" - P d tilde(V) + P d tilde(V) + tilde(V) "dP" $

$ "dh" equiv T"ds" + tilde(V) "dP" $



$ "dh"(T,P) = ( (diff h)/(diff T) )_P "dT" + ( (diff h)/(diff P) )_T d P $

$  c_p equiv ( (diff h)/(diff T) )_P $

$ "dh"(T,P) = c_P "dT" + ( (diff h)/(diff P) )_T d P $

Again, let's use the first and second law and some calculus to get rid of 
$( (diff h)/(diff P) )_T$.

$ "dh" equiv T"ds" + tilde(V) "dP" $

We get rid of $T"ds"$ using an expression of $s(P,T)$:

$ "ds" (P,T) = ( (diff s)/(diff T) )_P "dT" + ( (diff s)/(diff P) )_T "dP" $

Substituting back into the Tds relation for dh:

$ "dh" = T[( (diff s)/(diff T) )_P "dT" + 
( (diff s)/(diff P) )_T "dP" ] + tilde(V) "dP" $

$ "dh" = T( (diff s)/(diff T) )_P "dT" + 
[T ( (diff s)/(diff P) )_T + tilde(V) ]  "dP" $

Comparing coefficients, 

$ c_p =  T( (diff s)/(diff T) )_P $

$ "dh" = c_P "dT" + 
[T ( (diff s)/(diff P) )_T + tilde(V) ]  "dP" $

Now, we can use Maxwell's relations to get rid of $( (diff s)/(diff P) )_T$.

$ g equiv h - T s $
$ "dG" = "dh" - T "ds" - s "dT" $
$ "dG" = tilde(V) "dP" - s "dT" $

From this, the Maxwell relations are @Cengel2011:

$ ( (diff s)/(diff P) )_T = ( (diff tilde(V))/(diff T) )_P $


$ "dh" = c_P "dT" + 
[T ( (diff tilde(V))/(diff T) )_P + tilde(V) ]  "dP" $

For ideal gas, we obtain:

$ tilde(V) = (R T)/P $

Hence, for ideal gas:
$ "dh" = c_P "dT" + [T R/P + tilde(V) ]  "dP" $
$ "dh" = c_P "dT" $



#bibliography("../library.bib", 
style: "chicago-author-date")

