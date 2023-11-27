#set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#show par: set block(spacing: 0.55em)
#show heading: set block(above: 1.4em, below: 1em)

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

$ "dU" = T "ds" - P d tilde(V) $

In an isentropic process, ds = 0 $J/("mol" K)$.
Therefore:

$ "dU" =  - P d tilde(V) $

Now, how can we relate the temperature of the gas to its energy?
(note: need to introduce concept of calculus)

$ "dU"(T,tilde(V)) = ( (diff U)/(diff T) )_tilde(V) "dT" + ( (diff U)/(diff tilde(V)) )_T d tilde(V) $

We define $c_v =( (diff U)/(diff T) )_tilde(V) $. This is a measurable 
property called the constant volume heat capacity.

$ "dU"(T,tilde(V)) = c_tilde(V) "dT" + ( (diff U)/(diff tilde(V)) )_T d tilde(V) $

Now, we want to eliminate $U$ from the right hand side, and make it 
in terms of temperature, pressure and volume only. By doing so, 
we can calculate the change in internal energy based on the 
temperature. These are things we can measure. How do we do so?

For this, we can reintroduce our first and second law to provide us 
additional equations to find U in terms of T and tilde(V).

(in progress)
$ "dU" = T "ds" - P d tilde(V) $
we can compare this with:
$ "dU" = ( (diff U)/(diff s) )_tilde(V) "ds" - ( (diff U)/(diff tilde(V)) )_s  d tilde(V) $



#bibliography("../library.bib", 
style: "chicago-author-date")

