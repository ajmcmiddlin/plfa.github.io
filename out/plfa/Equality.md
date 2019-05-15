---
src       : src/plfa/Equality.lagda
title     : "Equality: Equality and equational reasoning"
layout    : page
prev      : /Relations/
permalink : /Equality/
next      : /Isomorphism/
---

<pre class="Agda">{% raw %}<a id="171" class="Keyword">module</a> <a id="178" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}" class="Module">plfa.Equality</a> <a id="192" class="Keyword">where</a>{% endraw %}</pre>

Much of our reasoning has involved equality.  Given two terms `M`
and `N`, both of type `A`, we write `M ≡ N` to assert that `M` and `N`
are interchangeable.  So far we have treated equality as a primitive,
here we show how to define it as an inductive datatype.


## Imports

This chapter has no imports.  Every chapter in this book, and nearly
every module in the Agda standard library, imports equality.
Since we define equality here, any import would create a conflict.


## Equality

We declare equality as follows:
<pre class="Agda">{% raw %}<a id="744" class="Keyword">data</a> <a id="_≡_"></a><a id="749" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">_≡_</a> <a id="753" class="Symbol">{</a><a id="754" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#754" class="Bound">A</a> <a id="756" class="Symbol">:</a> <a id="758" class="PrimitiveType">Set</a><a id="761" class="Symbol">}</a> <a id="763" class="Symbol">(</a><a id="764" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#764" class="Bound">x</a> <a id="766" class="Symbol">:</a> <a id="768" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#754" class="Bound">A</a><a id="769" class="Symbol">)</a> <a id="771" class="Symbol">:</a> <a id="773" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#754" class="Bound">A</a> <a id="775" class="Symbol">→</a> <a id="777" class="PrimitiveType">Set</a> <a id="781" class="Keyword">where</a>
  <a id="_≡_.refl"></a><a id="789" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a> <a id="794" class="Symbol">:</a> <a id="796" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#764" class="Bound">x</a> <a id="798" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="800" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#764" class="Bound">x</a>{% endraw %}</pre>
In other words, for any type `A` and for any `x` of type `A`, the
constructor `refl` provides evidence that `x ≡ x`. Hence, every value
is equal to itself, and we have no other way of showing values
equal.  The definition features an asymmetry, in that the
first argument to `_≡_` is given by the parameter `x : A`, while the
second is given by an index in `A → Set`.  This follows our policy
of using parameters wherever possible.  The first argument to `_≡_`
can be a parameter because it doesn't vary, while the second must be
an index, so it can be required to be equal to the first.

We declare the precedence of equality as follows:
<pre class="Agda">{% raw %}<a id="1465" class="Keyword">infix</a> <a id="1471" class="Number">4</a> <a id="1473" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">_≡_</a>{% endraw %}</pre>
We set the precedence of `_≡_` at level 4, the same as `_≤_`,
which means it binds less tightly than any arithmetic operator.
It associates neither to left nor right; writing `x ≡ y ≡ z`
is illegal.


## Equality is an equivalence relation

An equivalence relation is one which is reflexive, symmetric, and transitive.
Reflexivity is built-in to the definition of equality, via the
constructor `refl`.  It is straightforward to show symmetry:
<pre class="Agda">{% raw %}<a id="sym"></a><a id="1944" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#1944" class="Function">sym</a> <a id="1948" class="Symbol">:</a> <a id="1950" class="Symbol">∀</a> <a id="1952" class="Symbol">{</a><a id="1953" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#1953" class="Bound">A</a> <a id="1955" class="Symbol">:</a> <a id="1957" class="PrimitiveType">Set</a><a id="1960" class="Symbol">}</a> <a id="1962" class="Symbol">{</a><a id="1963" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#1963" class="Bound">x</a> <a id="1965" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#1965" class="Bound">y</a> <a id="1967" class="Symbol">:</a> <a id="1969" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#1953" class="Bound">A</a><a id="1970" class="Symbol">}</a>
  <a id="1974" class="Symbol">→</a> <a id="1976" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#1963" class="Bound">x</a> <a id="1978" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="1980" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#1965" class="Bound">y</a>
    <a id="1986" class="Comment">-----</a>
  <a id="1994" class="Symbol">→</a> <a id="1996" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#1965" class="Bound">y</a> <a id="1998" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="2000" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#1963" class="Bound">x</a>
<a id="2002" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#1944" class="Function">sym</a> <a id="2006" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a> <a id="2011" class="Symbol">=</a> <a id="2013" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>{% endraw %}</pre>
How does this proof work? The argument to `sym` has type `x ≡ y`, but
on the left-hand side of the equation the argument has been
instantiated to the pattern `refl`, which requires that `x` and `y`
are the same.  Hence, for the right-hand side of the equation we need
a term of type `x ≡ x`, and `refl` will do.

It is instructive to develop `sym` interactively.  To start, we supply
a variable for the argument on the left, and a hole for the body on
the right:

    sym : ∀ {A : Set} {x y : A}
      → x ≡ y
        -----
      → y ≡ x
    sym e = {! !}

If we go into the hole and type `C-c C-,` then Agda reports:

    Goal: .y ≡ .x
    ————————————————————————————————————————————————————————————
    e  : .x ≡ .y
    .y : .A
    .x : .A
    .A : Set

If in the hole we type `C-c C-c e` then Agda will instantiate `e` to
all possible constructors, with one equation for each. There is only
one possible constructor:

    sym : ∀ {A : Set} {x y : A}
      → x ≡ y
        -----
      → y ≡ x
    sym refl = {! !}

If we go into the hole again and type `C-c C-,` then Agda now reports:

     Goal: .x ≡ .x
     ————————————————————————————————————————————————————————————
     .x : .A
     .A : Set

This is the key step---Agda has worked out that `x` and `y` must be
the same to match the pattern `refl`!

Finally, if we go back into the hole and type `C-c C-r` it will
instantiate the hole with the one constructor that yields a value of
the expected type:

    sym : ∀ {A : Set} {x y : A}
      → x ≡ y
        -----
      → y ≡ x
    sym refl = refl

This completes the definition as given above.

Transitivity is equally straightforward:
<pre class="Agda">{% raw %}<a id="trans"></a><a id="3688" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3688" class="Function">trans</a> <a id="3694" class="Symbol">:</a> <a id="3696" class="Symbol">∀</a> <a id="3698" class="Symbol">{</a><a id="3699" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3699" class="Bound">A</a> <a id="3701" class="Symbol">:</a> <a id="3703" class="PrimitiveType">Set</a><a id="3706" class="Symbol">}</a> <a id="3708" class="Symbol">{</a><a id="3709" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3709" class="Bound">x</a> <a id="3711" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3711" class="Bound">y</a> <a id="3713" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3713" class="Bound">z</a> <a id="3715" class="Symbol">:</a> <a id="3717" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3699" class="Bound">A</a><a id="3718" class="Symbol">}</a>
  <a id="3722" class="Symbol">→</a> <a id="3724" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3709" class="Bound">x</a> <a id="3726" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="3728" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3711" class="Bound">y</a>
  <a id="3732" class="Symbol">→</a> <a id="3734" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3711" class="Bound">y</a> <a id="3736" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="3738" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3713" class="Bound">z</a>
    <a id="3744" class="Comment">-----</a>
  <a id="3752" class="Symbol">→</a> <a id="3754" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3709" class="Bound">x</a> <a id="3756" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="3758" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3713" class="Bound">z</a>
<a id="3760" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3688" class="Function">trans</a> <a id="3766" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a> <a id="3771" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>  <a id="3777" class="Symbol">=</a>  <a id="3780" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>{% endraw %}</pre>
Again, a useful exercise is to carry out an interactive development,
checking how Agda's knowledge changes as each of the two arguments is
instantiated.

## Congruence and substitution {#cong}

Equality satisfies _congruence_.  If two terms are equal,
they remain so after the same function is applied to both:
<pre class="Agda">{% raw %}<a id="cong"></a><a id="4120" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4120" class="Function">cong</a> <a id="4125" class="Symbol">:</a> <a id="4127" class="Symbol">∀</a> <a id="4129" class="Symbol">{</a><a id="4130" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4130" class="Bound">A</a> <a id="4132" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4132" class="Bound">B</a> <a id="4134" class="Symbol">:</a> <a id="4136" class="PrimitiveType">Set</a><a id="4139" class="Symbol">}</a> <a id="4141" class="Symbol">(</a><a id="4142" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4142" class="Bound">f</a> <a id="4144" class="Symbol">:</a> <a id="4146" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4130" class="Bound">A</a> <a id="4148" class="Symbol">→</a> <a id="4150" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4132" class="Bound">B</a><a id="4151" class="Symbol">)</a> <a id="4153" class="Symbol">{</a><a id="4154" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4154" class="Bound">x</a> <a id="4156" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4156" class="Bound">y</a> <a id="4158" class="Symbol">:</a> <a id="4160" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4130" class="Bound">A</a><a id="4161" class="Symbol">}</a>
  <a id="4165" class="Symbol">→</a> <a id="4167" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4154" class="Bound">x</a> <a id="4169" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="4171" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4156" class="Bound">y</a>
    <a id="4177" class="Comment">---------</a>
  <a id="4189" class="Symbol">→</a> <a id="4191" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4142" class="Bound">f</a> <a id="4193" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4154" class="Bound">x</a> <a id="4195" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="4197" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4142" class="Bound">f</a> <a id="4199" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4156" class="Bound">y</a>
<a id="4201" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4120" class="Function">cong</a> <a id="4206" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4206" class="Bound">f</a> <a id="4208" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>  <a id="4214" class="Symbol">=</a>  <a id="4217" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>{% endraw %}</pre>

Congruence of functions with two arguments is similar:
<pre class="Agda">{% raw %}<a id="cong₂"></a><a id="4302" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4302" class="Function">cong₂</a> <a id="4308" class="Symbol">:</a> <a id="4310" class="Symbol">∀</a> <a id="4312" class="Symbol">{</a><a id="4313" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4313" class="Bound">A</a> <a id="4315" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4315" class="Bound">B</a> <a id="4317" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4317" class="Bound">C</a> <a id="4319" class="Symbol">:</a> <a id="4321" class="PrimitiveType">Set</a><a id="4324" class="Symbol">}</a> <a id="4326" class="Symbol">(</a><a id="4327" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4327" class="Bound">f</a> <a id="4329" class="Symbol">:</a> <a id="4331" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4313" class="Bound">A</a> <a id="4333" class="Symbol">→</a> <a id="4335" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4315" class="Bound">B</a> <a id="4337" class="Symbol">→</a> <a id="4339" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4317" class="Bound">C</a><a id="4340" class="Symbol">)</a> <a id="4342" class="Symbol">{</a><a id="4343" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4343" class="Bound">u</a> <a id="4345" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4345" class="Bound">x</a> <a id="4347" class="Symbol">:</a> <a id="4349" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4313" class="Bound">A</a><a id="4350" class="Symbol">}</a> <a id="4352" class="Symbol">{</a><a id="4353" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4353" class="Bound">v</a> <a id="4355" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4355" class="Bound">y</a> <a id="4357" class="Symbol">:</a> <a id="4359" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4315" class="Bound">B</a><a id="4360" class="Symbol">}</a>
  <a id="4364" class="Symbol">→</a> <a id="4366" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4343" class="Bound">u</a> <a id="4368" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="4370" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4345" class="Bound">x</a>
  <a id="4374" class="Symbol">→</a> <a id="4376" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4353" class="Bound">v</a> <a id="4378" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="4380" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4355" class="Bound">y</a>
    <a id="4386" class="Comment">-------------</a>
  <a id="4402" class="Symbol">→</a> <a id="4404" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4327" class="Bound">f</a> <a id="4406" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4343" class="Bound">u</a> <a id="4408" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4353" class="Bound">v</a> <a id="4410" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="4412" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4327" class="Bound">f</a> <a id="4414" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4345" class="Bound">x</a> <a id="4416" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4355" class="Bound">y</a>
<a id="4418" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4302" class="Function">cong₂</a> <a id="4424" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4424" class="Bound">f</a> <a id="4426" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a> <a id="4431" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>  <a id="4437" class="Symbol">=</a>  <a id="4440" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>{% endraw %}</pre>

Equality is also a congruence in the function position of an application.
If two functions are equal, then applying them to the same term
yields equal terms:
<pre class="Agda">{% raw %}<a id="cong-app"></a><a id="4628" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4628" class="Function">cong-app</a> <a id="4637" class="Symbol">:</a> <a id="4639" class="Symbol">∀</a> <a id="4641" class="Symbol">{</a><a id="4642" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4642" class="Bound">A</a> <a id="4644" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4644" class="Bound">B</a> <a id="4646" class="Symbol">:</a> <a id="4648" class="PrimitiveType">Set</a><a id="4651" class="Symbol">}</a> <a id="4653" class="Symbol">{</a><a id="4654" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4654" class="Bound">f</a> <a id="4656" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4656" class="Bound">g</a> <a id="4658" class="Symbol">:</a> <a id="4660" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4642" class="Bound">A</a> <a id="4662" class="Symbol">→</a> <a id="4664" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4644" class="Bound">B</a><a id="4665" class="Symbol">}</a>
  <a id="4669" class="Symbol">→</a> <a id="4671" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4654" class="Bound">f</a> <a id="4673" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="4675" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4656" class="Bound">g</a>
    <a id="4681" class="Comment">---------------------</a>
  <a id="4705" class="Symbol">→</a> <a id="4707" class="Symbol">∀</a> <a id="4709" class="Symbol">(</a><a id="4710" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4710" class="Bound">x</a> <a id="4712" class="Symbol">:</a> <a id="4714" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4642" class="Bound">A</a><a id="4715" class="Symbol">)</a> <a id="4717" class="Symbol">→</a> <a id="4719" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4654" class="Bound">f</a> <a id="4721" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4710" class="Bound">x</a> <a id="4723" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="4725" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4656" class="Bound">g</a> <a id="4727" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4710" class="Bound">x</a>
<a id="4729" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4628" class="Function">cong-app</a> <a id="4738" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a> <a id="4743" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4743" class="Bound">x</a> <a id="4745" class="Symbol">=</a> <a id="4747" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>{% endraw %}</pre>

Equality also satisfies *substitution*.
If two values are equal and a predicate holds of the first then it also holds of the second:
<pre class="Agda">{% raw %}<a id="subst"></a><a id="4910" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4910" class="Function">subst</a> <a id="4916" class="Symbol">:</a> <a id="4918" class="Symbol">∀</a> <a id="4920" class="Symbol">{</a><a id="4921" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4921" class="Bound">A</a> <a id="4923" class="Symbol">:</a> <a id="4925" class="PrimitiveType">Set</a><a id="4928" class="Symbol">}</a> <a id="4930" class="Symbol">{</a><a id="4931" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4931" class="Bound">x</a> <a id="4933" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4933" class="Bound">y</a> <a id="4935" class="Symbol">:</a> <a id="4937" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4921" class="Bound">A</a><a id="4938" class="Symbol">}</a> <a id="4940" class="Symbol">(</a><a id="4941" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4941" class="Bound">P</a> <a id="4943" class="Symbol">:</a> <a id="4945" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4921" class="Bound">A</a> <a id="4947" class="Symbol">→</a> <a id="4949" class="PrimitiveType">Set</a><a id="4952" class="Symbol">)</a>
  <a id="4956" class="Symbol">→</a> <a id="4958" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4931" class="Bound">x</a> <a id="4960" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="4962" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4933" class="Bound">y</a>
    <a id="4968" class="Comment">---------</a>
  <a id="4980" class="Symbol">→</a> <a id="4982" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4941" class="Bound">P</a> <a id="4984" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4931" class="Bound">x</a> <a id="4986" class="Symbol">→</a> <a id="4988" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4941" class="Bound">P</a> <a id="4990" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4933" class="Bound">y</a>
<a id="4992" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4910" class="Function">subst</a> <a id="4998" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4998" class="Bound">P</a> <a id="5000" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a> <a id="5005" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5005" class="Bound">px</a> <a id="5008" class="Symbol">=</a> <a id="5010" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5005" class="Bound">px</a>{% endraw %}</pre>


## Chains of equations

Here we show how to support reasoning with chains of equations, as
used throughout the book.  We package the declarations into a module,
named `≡-Reasoning`, to match the format used in Agda's standard
library:
<pre class="Agda">{% raw %}<a id="5274" class="Keyword">module</a> <a id="≡-Reasoning"></a><a id="5281" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5281" class="Module">≡-Reasoning</a> <a id="5293" class="Symbol">{</a><a id="5294" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5294" class="Bound">A</a> <a id="5296" class="Symbol">:</a> <a id="5298" class="PrimitiveType">Set</a><a id="5301" class="Symbol">}</a> <a id="5303" class="Keyword">where</a>

  <a id="5312" class="Keyword">infix</a>  <a id="5319" class="Number">1</a> <a id="5321" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5369" class="Function Operator">begin_</a>
  <a id="5330" class="Keyword">infixr</a> <a id="5337" class="Number">2</a> <a id="5339" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5449" class="Function Operator">_≡⟨⟩_</a> <a id="5345" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">_≡⟨_⟩_</a>
  <a id="5354" class="Keyword">infix</a>  <a id="5361" class="Number">3</a> <a id="5363" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5649" class="Function Operator">_∎</a>

  <a id="≡-Reasoning.begin_"></a><a id="5369" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5369" class="Function Operator">begin_</a> <a id="5376" class="Symbol">:</a> <a id="5378" class="Symbol">∀</a> <a id="5380" class="Symbol">{</a><a id="5381" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5381" class="Bound">x</a> <a id="5383" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5383" class="Bound">y</a> <a id="5385" class="Symbol">:</a> <a id="5387" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5294" class="Bound">A</a><a id="5388" class="Symbol">}</a>
    <a id="5394" class="Symbol">→</a> <a id="5396" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5381" class="Bound">x</a> <a id="5398" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="5400" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5383" class="Bound">y</a>
      <a id="5408" class="Comment">-----</a>
    <a id="5418" class="Symbol">→</a> <a id="5420" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5381" class="Bound">x</a> <a id="5422" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="5424" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5383" class="Bound">y</a>
  <a id="5428" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5369" class="Function Operator">begin</a> <a id="5434" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5434" class="Bound">x≡y</a>  <a id="5439" class="Symbol">=</a>  <a id="5442" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5434" class="Bound">x≡y</a>

  <a id="≡-Reasoning._≡⟨⟩_"></a><a id="5449" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5449" class="Function Operator">_≡⟨⟩_</a> <a id="5455" class="Symbol">:</a> <a id="5457" class="Symbol">∀</a> <a id="5459" class="Symbol">(</a><a id="5460" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5460" class="Bound">x</a> <a id="5462" class="Symbol">:</a> <a id="5464" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5294" class="Bound">A</a><a id="5465" class="Symbol">)</a> <a id="5467" class="Symbol">{</a><a id="5468" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5468" class="Bound">y</a> <a id="5470" class="Symbol">:</a> <a id="5472" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5294" class="Bound">A</a><a id="5473" class="Symbol">}</a>
    <a id="5479" class="Symbol">→</a> <a id="5481" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5460" class="Bound">x</a> <a id="5483" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="5485" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5468" class="Bound">y</a>
      <a id="5493" class="Comment">-----</a>
    <a id="5503" class="Symbol">→</a> <a id="5505" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5460" class="Bound">x</a> <a id="5507" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="5509" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5468" class="Bound">y</a>
  <a id="5513" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5513" class="Bound">x</a> <a id="5515" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5449" class="Function Operator">≡⟨⟩</a> <a id="5519" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5519" class="Bound">x≡y</a>  <a id="5524" class="Symbol">=</a>  <a id="5527" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5519" class="Bound">x≡y</a>

  <a id="≡-Reasoning._≡⟨_⟩_"></a><a id="5534" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">_≡⟨_⟩_</a> <a id="5541" class="Symbol">:</a> <a id="5543" class="Symbol">∀</a> <a id="5545" class="Symbol">(</a><a id="5546" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5546" class="Bound">x</a> <a id="5548" class="Symbol">:</a> <a id="5550" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5294" class="Bound">A</a><a id="5551" class="Symbol">)</a> <a id="5553" class="Symbol">{</a><a id="5554" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5554" class="Bound">y</a> <a id="5556" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5556" class="Bound">z</a> <a id="5558" class="Symbol">:</a> <a id="5560" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5294" class="Bound">A</a><a id="5561" class="Symbol">}</a>
    <a id="5567" class="Symbol">→</a> <a id="5569" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5546" class="Bound">x</a> <a id="5571" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="5573" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5554" class="Bound">y</a>
    <a id="5579" class="Symbol">→</a> <a id="5581" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5554" class="Bound">y</a> <a id="5583" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="5585" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5556" class="Bound">z</a>
      <a id="5593" class="Comment">-----</a>
    <a id="5603" class="Symbol">→</a> <a id="5605" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5546" class="Bound">x</a> <a id="5607" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="5609" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5556" class="Bound">z</a>
  <a id="5613" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5613" class="Bound">x</a> <a id="5615" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">≡⟨</a> <a id="5618" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5618" class="Bound">x≡y</a> <a id="5622" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">⟩</a> <a id="5624" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5624" class="Bound">y≡z</a>  <a id="5629" class="Symbol">=</a>  <a id="5632" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#3688" class="Function">trans</a> <a id="5638" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5618" class="Bound">x≡y</a> <a id="5642" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5624" class="Bound">y≡z</a>

  <a id="≡-Reasoning._∎"></a><a id="5649" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5649" class="Function Operator">_∎</a> <a id="5652" class="Symbol">:</a> <a id="5654" class="Symbol">∀</a> <a id="5656" class="Symbol">(</a><a id="5657" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5657" class="Bound">x</a> <a id="5659" class="Symbol">:</a> <a id="5661" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5294" class="Bound">A</a><a id="5662" class="Symbol">)</a>
      <a id="5670" class="Comment">-----</a>
    <a id="5680" class="Symbol">→</a> <a id="5682" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5657" class="Bound">x</a> <a id="5684" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="5686" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5657" class="Bound">x</a>
  <a id="5690" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5690" class="Bound">x</a> <a id="5692" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5649" class="Function Operator">∎</a>  <a id="5695" class="Symbol">=</a>  <a id="5698" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>

<a id="5704" class="Keyword">open</a> <a id="5709" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5281" class="Module">≡-Reasoning</a>{% endraw %}</pre>
This is our first use of a nested module. It consists of the keyword
`module` followed by the module name and any parameters, explicit or
implicit, the keyword `where`, and the contents of the module indented.
Modules may contain any sort of declaration, including other nested modules.
Nested modules are similar to the top-level modules that constitute
each chapter of this book, save that the body of a top-level module
need not be indented.  Opening the module makes all of the definitions
available in the current environment.

As an example, let's look at a proof of transitivity
as a chain of equations:
<pre class="Agda">{% raw %}<a id="trans′"></a><a id="6356" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6356" class="Function">trans′</a> <a id="6363" class="Symbol">:</a> <a id="6365" class="Symbol">∀</a> <a id="6367" class="Symbol">{</a><a id="6368" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6368" class="Bound">A</a> <a id="6370" class="Symbol">:</a> <a id="6372" class="PrimitiveType">Set</a><a id="6375" class="Symbol">}</a> <a id="6377" class="Symbol">{</a><a id="6378" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6378" class="Bound">x</a> <a id="6380" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6380" class="Bound">y</a> <a id="6382" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6382" class="Bound">z</a> <a id="6384" class="Symbol">:</a> <a id="6386" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6368" class="Bound">A</a><a id="6387" class="Symbol">}</a>
  <a id="6391" class="Symbol">→</a> <a id="6393" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6378" class="Bound">x</a> <a id="6395" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="6397" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6380" class="Bound">y</a>
  <a id="6401" class="Symbol">→</a> <a id="6403" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6380" class="Bound">y</a> <a id="6405" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="6407" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6382" class="Bound">z</a>
    <a id="6413" class="Comment">-----</a>
  <a id="6421" class="Symbol">→</a> <a id="6423" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6378" class="Bound">x</a> <a id="6425" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="6427" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6382" class="Bound">z</a>
<a id="6429" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6356" class="Function">trans′</a> <a id="6436" class="Symbol">{</a><a id="6437" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6437" class="Bound">A</a><a id="6438" class="Symbol">}</a> <a id="6440" class="Symbol">{</a><a id="6441" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6441" class="Bound">x</a><a id="6442" class="Symbol">}</a> <a id="6444" class="Symbol">{</a><a id="6445" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6445" class="Bound">y</a><a id="6446" class="Symbol">}</a> <a id="6448" class="Symbol">{</a><a id="6449" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6449" class="Bound">z</a><a id="6450" class="Symbol">}</a> <a id="6452" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6452" class="Bound">x≡y</a> <a id="6456" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6456" class="Bound">y≡z</a> <a id="6460" class="Symbol">=</a>
  <a id="6464" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5369" class="Function Operator">begin</a>
    <a id="6474" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6441" class="Bound">x</a>
  <a id="6478" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">≡⟨</a> <a id="6481" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6452" class="Bound">x≡y</a> <a id="6485" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">⟩</a>
    <a id="6491" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6445" class="Bound">y</a>
  <a id="6495" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">≡⟨</a> <a id="6498" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6456" class="Bound">y≡z</a> <a id="6502" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">⟩</a>
    <a id="6508" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#6449" class="Bound">z</a>
  <a id="6512" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5649" class="Function Operator">∎</a>{% endraw %}</pre>
According to the fixity declarations, the body parses as follows:

    begin (x ≡⟨ x≡y ⟩ (y ≡⟨ y≡z ⟩ (z ∎)))

The application of `begin` is purely cosmetic, as it simply returns
its argument.  That argument consists of `_≡⟨_⟩_` applied to `x`,
`x≡y`, and `y ≡⟨ y≡z ⟩ (z ∎)`.  The first argument is a term, `x`,
while the second and third arguments are both proofs of equations, in
particular proofs of `x ≡ y` and `y ≡ z` respectively, which are
combined by `trans` in the body of `_≡⟨_⟩_` to yield a proof of `x ≡
z`.  The proof of `y ≡ z` consists of `_≡⟨_⟩_` applied to `y`, `y≡z`,
and `z ∎`.  The first argument is a term, `y`, while the second and
third arguments are both proofs of equations, in particular proofs of
`y ≡ z` and `z ≡ z` respectively, which are combined by `trans` in the
body of `_≡⟨_⟩_` to yield a proof of `y ≡ z`.  Finally, the proof of
`z ≡ z` consists of `_∎` applied to the term `z`, which yields `refl`.
After simplification, the body is equivalent to the term:

    trans x≡y (trans y≡z refl)

We could replace any use of a chain of equations by a chain of
applications of `trans`; the result would be more compact but harder
to read.  The trick behind `∎` means that a chain of equalities
simplifies to a chain of applications of `trans` that ends in `trans e
refl`, where `e` is a term that proves some equality, even though `e`
alone would do.


## Chains of equations, another example

As a second example of chains of equations, we repeat the proof that addition
is commutative.  We first repeat the definitions of naturals and addition.
We cannot import them because (as noted at the beginning of this chapter)
it would cause a conflict:
<pre class="Agda">{% raw %}<a id="8213" class="Keyword">data</a> <a id="ℕ"></a><a id="8218" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a> <a id="8220" class="Symbol">:</a> <a id="8222" class="PrimitiveType">Set</a> <a id="8226" class="Keyword">where</a>
  <a id="ℕ.zero"></a><a id="8234" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8234" class="InductiveConstructor">zero</a> <a id="8239" class="Symbol">:</a> <a id="8241" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a>
  <a id="ℕ.suc"></a><a id="8245" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a>  <a id="8250" class="Symbol">:</a> <a id="8252" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a> <a id="8254" class="Symbol">→</a> <a id="8256" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a>

<a id="_+_"></a><a id="8259" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">_+_</a> <a id="8263" class="Symbol">:</a> <a id="8265" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a> <a id="8267" class="Symbol">→</a> <a id="8269" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a> <a id="8271" class="Symbol">→</a> <a id="8273" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a>
<a id="8275" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8234" class="InductiveConstructor">zero</a>    <a id="8283" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="8285" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8285" class="Bound">n</a>  <a id="8288" class="Symbol">=</a>  <a id="8291" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8285" class="Bound">n</a>
<a id="8293" class="Symbol">(</a><a id="8294" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="8298" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8298" class="Bound">m</a><a id="8299" class="Symbol">)</a> <a id="8301" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="8303" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8303" class="Bound">n</a>  <a id="8306" class="Symbol">=</a>  <a id="8309" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="8313" class="Symbol">(</a><a id="8314" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8298" class="Bound">m</a> <a id="8316" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="8318" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8303" class="Bound">n</a><a id="8319" class="Symbol">)</a>{% endraw %}</pre>

To save space we postulate (rather than prove in full) two lemmas:
<pre class="Agda">{% raw %}<a id="8413" class="Keyword">postulate</a>
  <a id="+-identity"></a><a id="8425" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8425" class="Postulate">+-identity</a> <a id="8436" class="Symbol">:</a> <a id="8438" class="Symbol">∀</a> <a id="8440" class="Symbol">(</a><a id="8441" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8441" class="Bound">m</a> <a id="8443" class="Symbol">:</a> <a id="8445" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a><a id="8446" class="Symbol">)</a> <a id="8448" class="Symbol">→</a> <a id="8450" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8441" class="Bound">m</a> <a id="8452" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="8454" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8234" class="InductiveConstructor">zero</a> <a id="8459" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="8461" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8441" class="Bound">m</a>
  <a id="+-suc"></a><a id="8465" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8465" class="Postulate">+-suc</a> <a id="8471" class="Symbol">:</a> <a id="8473" class="Symbol">∀</a> <a id="8475" class="Symbol">(</a><a id="8476" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8476" class="Bound">m</a> <a id="8478" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8478" class="Bound">n</a> <a id="8480" class="Symbol">:</a> <a id="8482" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a><a id="8483" class="Symbol">)</a> <a id="8485" class="Symbol">→</a> <a id="8487" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8476" class="Bound">m</a> <a id="8489" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="8491" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="8495" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8478" class="Bound">n</a> <a id="8497" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="8499" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="8503" class="Symbol">(</a><a id="8504" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8476" class="Bound">m</a> <a id="8506" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="8508" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8478" class="Bound">n</a><a id="8509" class="Symbol">)</a>{% endraw %}</pre>
This is our first use of a _postulate_.  A postulate specifies a
signature for an identifier but no definition.  Here we postulate
something proved earlier to save space.  Postulates must be used with
caution.  If we postulate something false then we could use Agda to
prove anything whatsoever.

We then repeat the proof of commutativity:
<pre class="Agda">{% raw %}<a id="+-comm"></a><a id="8875" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8875" class="Function">+-comm</a> <a id="8882" class="Symbol">:</a> <a id="8884" class="Symbol">∀</a> <a id="8886" class="Symbol">(</a><a id="8887" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8887" class="Bound">m</a> <a id="8889" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8889" class="Bound">n</a> <a id="8891" class="Symbol">:</a> <a id="8893" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a><a id="8894" class="Symbol">)</a> <a id="8896" class="Symbol">→</a> <a id="8898" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8887" class="Bound">m</a> <a id="8900" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="8902" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8889" class="Bound">n</a> <a id="8904" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="8906" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8889" class="Bound">n</a> <a id="8908" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="8910" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8887" class="Bound">m</a>
<a id="8912" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8875" class="Function">+-comm</a> <a id="8919" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8919" class="Bound">m</a> <a id="8921" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8234" class="InductiveConstructor">zero</a> <a id="8926" class="Symbol">=</a>
  <a id="8930" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5369" class="Function Operator">begin</a>
    <a id="8940" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8919" class="Bound">m</a> <a id="8942" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="8944" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8234" class="InductiveConstructor">zero</a>
  <a id="8951" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">≡⟨</a> <a id="8954" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8425" class="Postulate">+-identity</a> <a id="8965" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8919" class="Bound">m</a> <a id="8967" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">⟩</a>
    <a id="8973" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8919" class="Bound">m</a>
  <a id="8977" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5449" class="Function Operator">≡⟨⟩</a>
    <a id="8985" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8234" class="InductiveConstructor">zero</a> <a id="8990" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="8992" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8919" class="Bound">m</a>
  <a id="8996" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5649" class="Function Operator">∎</a>
<a id="8998" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8875" class="Function">+-comm</a> <a id="9005" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9005" class="Bound">m</a> <a id="9007" class="Symbol">(</a><a id="9008" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="9012" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9012" class="Bound">n</a><a id="9013" class="Symbol">)</a> <a id="9015" class="Symbol">=</a>
  <a id="9019" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5369" class="Function Operator">begin</a>
    <a id="9029" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9005" class="Bound">m</a> <a id="9031" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="9033" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="9037" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9012" class="Bound">n</a>
  <a id="9041" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">≡⟨</a> <a id="9044" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8465" class="Postulate">+-suc</a> <a id="9050" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9005" class="Bound">m</a> <a id="9052" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9012" class="Bound">n</a> <a id="9054" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">⟩</a>
    <a id="9060" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="9064" class="Symbol">(</a><a id="9065" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9005" class="Bound">m</a> <a id="9067" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="9069" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9012" class="Bound">n</a><a id="9070" class="Symbol">)</a>
  <a id="9074" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">≡⟨</a> <a id="9077" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4120" class="Function">cong</a> <a id="9082" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="9086" class="Symbol">(</a><a id="9087" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8875" class="Function">+-comm</a> <a id="9094" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9005" class="Bound">m</a> <a id="9096" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9012" class="Bound">n</a><a id="9097" class="Symbol">)</a> <a id="9099" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5534" class="Function Operator">⟩</a>
    <a id="9105" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="9109" class="Symbol">(</a><a id="9110" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9012" class="Bound">n</a> <a id="9112" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="9114" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9005" class="Bound">m</a><a id="9115" class="Symbol">)</a>
  <a id="9119" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5449" class="Function Operator">≡⟨⟩</a>
    <a id="9127" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="9131" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9012" class="Bound">n</a> <a id="9133" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="9135" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#9005" class="Bound">m</a>
  <a id="9139" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#5649" class="Function Operator">∎</a>{% endraw %}</pre>
The reasoning here is similar to that in the
preceding section.  We use
`_≡⟨⟩_` when no justification is required.
One can think of `_≡⟨⟩_` as equivalent to `_≡⟨ refl ⟩_`.

Agda always treats a term as equivalent to its
simplified term.  The reason that one can write

      suc (n + m)
    ≡⟨⟩
      suc n + m

is because Agda treats both terms as the same.
This also means that one could instead interchange
the lines and write

      suc n + m
    ≡⟨⟩
      suc (n + m)

and Agda would not object. Agda only checks that the terms separated
by `≡⟨⟩` have the same simplified form; it's up to us to write them in
an order that will make sense to the reader.


#### Exercise `≤-Reasoning` (stretch)

The proof of monotonicity from
Chapter [Relations]({{ site.baseurl }}{% link out/plfa/Relations.md%})
can be written in a more readable form by using an analogue of our
notation for `≡-Reasoning`.  Define `≤-Reasoning` analogously, and use
it to write out an alternative proof that addition is monotonic with
regard to inequality.  Rewrite all of `+-monoˡ-≤`, `+-monoʳ-≤`, and `+-mono-≤`.

<pre class="Agda">{% raw %}<a id="10220" class="Comment">-- Your code goes here</a>{% endraw %}</pre>



## Rewriting

Consider a property of natural numbers, such as being even.
We repeat the earlier definition:
<pre class="Agda">{% raw %}<a id="10378" class="Keyword">data</a> <a id="even"></a><a id="10383" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="10388" class="Symbol">:</a> <a id="10390" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a> <a id="10392" class="Symbol">→</a> <a id="10394" class="PrimitiveType">Set</a>
<a id="10398" class="Keyword">data</a> <a id="odd"></a><a id="10403" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10403" class="Datatype">odd</a>  <a id="10408" class="Symbol">:</a> <a id="10410" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a> <a id="10412" class="Symbol">→</a> <a id="10414" class="PrimitiveType">Set</a>

<a id="10419" class="Keyword">data</a> <a id="10424" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="10429" class="Keyword">where</a>

  <a id="even.even-zero"></a><a id="10438" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10438" class="InductiveConstructor">even-zero</a> <a id="10448" class="Symbol">:</a> <a id="10450" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="10455" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8234" class="InductiveConstructor">zero</a>

  <a id="even.even-suc"></a><a id="10463" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10463" class="InductiveConstructor">even-suc</a> <a id="10472" class="Symbol">:</a> <a id="10474" class="Symbol">∀</a> <a id="10476" class="Symbol">{</a><a id="10477" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10477" class="Bound">n</a> <a id="10479" class="Symbol">:</a> <a id="10481" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a><a id="10482" class="Symbol">}</a>
    <a id="10488" class="Symbol">→</a> <a id="10490" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10403" class="Datatype">odd</a> <a id="10494" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10477" class="Bound">n</a>
      <a id="10502" class="Comment">------------</a>
    <a id="10519" class="Symbol">→</a> <a id="10521" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="10526" class="Symbol">(</a><a id="10527" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="10531" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10477" class="Bound">n</a><a id="10532" class="Symbol">)</a>

<a id="10535" class="Keyword">data</a> <a id="10540" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10403" class="Datatype">odd</a> <a id="10544" class="Keyword">where</a>
  <a id="odd.odd-suc"></a><a id="10552" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10552" class="InductiveConstructor">odd-suc</a> <a id="10560" class="Symbol">:</a> <a id="10562" class="Symbol">∀</a> <a id="10564" class="Symbol">{</a><a id="10565" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10565" class="Bound">n</a> <a id="10567" class="Symbol">:</a> <a id="10569" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a><a id="10570" class="Symbol">}</a>
    <a id="10576" class="Symbol">→</a> <a id="10578" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="10583" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10565" class="Bound">n</a>
      <a id="10591" class="Comment">-----------</a>
    <a id="10607" class="Symbol">→</a> <a id="10609" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10403" class="Datatype">odd</a> <a id="10613" class="Symbol">(</a><a id="10614" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="10618" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10565" class="Bound">n</a><a id="10619" class="Symbol">)</a>{% endraw %}</pre>
In the previous section, we proved addition is commutative.  Given
evidence that `even (m + n)` holds, we ought also to be able to take
that as evidence that `even (n + m)` holds.

Agda includes special notation to support just this kind of reasoning,
the `rewrite` notation we encountered earlier.
To enable this notation, we use pragmas to tell Agda which type
corresponds to equality:
<pre class="Agda">{% raw %}<a id="11033" class="Symbol">{-#</a> <a id="11037" class="Keyword">BUILTIN</a> EQUALITY <a id="11054" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">_≡_</a> <a id="11058" class="Symbol">#-}</a>{% endraw %}</pre>

We can then prove the desired property as follows:
<pre class="Agda">{% raw %}<a id="even-comm"></a><a id="11138" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11138" class="Function">even-comm</a> <a id="11148" class="Symbol">:</a> <a id="11150" class="Symbol">∀</a> <a id="11152" class="Symbol">(</a><a id="11153" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11153" class="Bound">m</a> <a id="11155" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11155" class="Bound">n</a> <a id="11157" class="Symbol">:</a> <a id="11159" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a><a id="11160" class="Symbol">)</a>
  <a id="11164" class="Symbol">→</a> <a id="11166" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="11171" class="Symbol">(</a><a id="11172" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11153" class="Bound">m</a> <a id="11174" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="11176" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11155" class="Bound">n</a><a id="11177" class="Symbol">)</a>
    <a id="11183" class="Comment">------------</a>
  <a id="11198" class="Symbol">→</a> <a id="11200" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="11205" class="Symbol">(</a><a id="11206" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11155" class="Bound">n</a> <a id="11208" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="11210" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11153" class="Bound">m</a><a id="11211" class="Symbol">)</a>
<a id="11213" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11138" class="Function">even-comm</a> <a id="11223" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11223" class="Bound">m</a> <a id="11225" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11225" class="Bound">n</a> <a id="11227" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11227" class="Bound">ev</a>  <a id="11231" class="Keyword">rewrite</a> <a id="11239" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8875" class="Function">+-comm</a> <a id="11246" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11225" class="Bound">n</a> <a id="11248" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11223" class="Bound">m</a>  <a id="11251" class="Symbol">=</a>  <a id="11254" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#11227" class="Bound">ev</a>{% endraw %}</pre>
Here `ev` ranges over evidence that `even (m + n)` holds, and we show
that it also provides evidence that `even (n + m)` holds.  In
general, the keyword `rewrite` is followed by evidence of an
equality, and that equality is used to rewrite the type of the
goal and of any variable in scope.

It is instructive to develop `even-comm` interactively.  To start, we
supply variables for the arguments on the left, and a hole for the
body on the right:

    even-comm : ∀ (m n : ℕ)
      → even (m + n)
        ------------
      → even (n + m)
    even-comm m n ev = {! !}

If we go into the hole and type `C-c C-,` then Agda reports:

    Goal: even (n + m)
    ————————————————————————————————————————————————————————————
    ev : even (m + n)
    n  : ℕ
    m  : ℕ

Now we add the rewrite:

    even-comm : ∀ (m n : ℕ)
      → even (m + n)
        ------------
      → even (n + m)
    even-comm m n ev rewrite +-comm n m = {! !}

If we go into the hole again and type `C-c C-,` then Agda now reports:

    Goal: even (m + n)
    ————————————————————————————————————————————————————————————
    ev : even (m + n)
    n  : ℕ
    m  : ℕ

The arguments have been swapped in the goal.  Now it is trivial to see
that `ev` satisfies the goal, and typing `C-c C-a` in the hole causes
it to be filled with `ev`.  The command `C-c C-a` performs an
automated search, including checking whether a variable in scope has
the same type as the goal.


## Multiple rewrites

One may perform multiple rewrites, each separated by a vertical bar.  For instance,
here is a second proof that addition is commutative, relying on rewrites rather
than chains of equalities:
<pre class="Agda">{% raw %}<a id="+-comm′"></a><a id="12930" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12930" class="Function">+-comm′</a> <a id="12938" class="Symbol">:</a> <a id="12940" class="Symbol">∀</a> <a id="12942" class="Symbol">(</a><a id="12943" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12943" class="Bound">m</a> <a id="12945" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12945" class="Bound">n</a> <a id="12947" class="Symbol">:</a> <a id="12949" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a><a id="12950" class="Symbol">)</a> <a id="12952" class="Symbol">→</a> <a id="12954" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12943" class="Bound">m</a> <a id="12956" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="12958" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12945" class="Bound">n</a> <a id="12960" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="12962" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12945" class="Bound">n</a> <a id="12964" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="12966" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12943" class="Bound">m</a>
<a id="12968" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12930" class="Function">+-comm′</a> <a id="12976" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8234" class="InductiveConstructor">zero</a>    <a id="12984" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12984" class="Bound">n</a>  <a id="12987" class="Keyword">rewrite</a> <a id="12995" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8425" class="Postulate">+-identity</a> <a id="13006" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12984" class="Bound">n</a>             <a id="13020" class="Symbol">=</a>  <a id="13023" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>
<a id="13028" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12930" class="Function">+-comm′</a> <a id="13036" class="Symbol">(</a><a id="13037" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8245" class="InductiveConstructor">suc</a> <a id="13041" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13041" class="Bound">m</a><a id="13042" class="Symbol">)</a> <a id="13044" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13044" class="Bound">n</a>  <a id="13047" class="Keyword">rewrite</a> <a id="13055" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8465" class="Postulate">+-suc</a> <a id="13061" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13044" class="Bound">n</a> <a id="13063" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13041" class="Bound">m</a> <a id="13065" class="Symbol">|</a> <a id="13067" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#12930" class="Function">+-comm′</a> <a id="13075" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13041" class="Bound">m</a> <a id="13077" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13044" class="Bound">n</a>  <a id="13080" class="Symbol">=</a>  <a id="13083" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>{% endraw %}</pre>
This is far more compact.  Among other things, whereas the previous
proof required `cong suc (+-comm m n)` as the justification to invoke
the inductive hypothesis, here it is sufficient to rewrite with
`+-comm m n`, as rewriting automatically takes congruence into
account.  Although proofs with rewriting are shorter, proofs as chains
of equalities are easier to follow, and we will stick with the latter
when feasible.


## Rewriting expanded

The `rewrite` notation is in fact shorthand for an appropriate use of `with`
abstraction:
<pre class="Agda">{% raw %}<a id="even-comm′"></a><a id="13648" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13648" class="Function">even-comm′</a> <a id="13659" class="Symbol">:</a> <a id="13661" class="Symbol">∀</a> <a id="13663" class="Symbol">(</a><a id="13664" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13664" class="Bound">m</a> <a id="13666" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13666" class="Bound">n</a> <a id="13668" class="Symbol">:</a> <a id="13670" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a><a id="13671" class="Symbol">)</a>
  <a id="13675" class="Symbol">→</a> <a id="13677" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="13682" class="Symbol">(</a><a id="13683" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13664" class="Bound">m</a> <a id="13685" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="13687" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13666" class="Bound">n</a><a id="13688" class="Symbol">)</a>
    <a id="13694" class="Comment">------------</a>
  <a id="13709" class="Symbol">→</a> <a id="13711" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="13716" class="Symbol">(</a><a id="13717" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13666" class="Bound">n</a> <a id="13719" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="13721" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13664" class="Bound">m</a><a id="13722" class="Symbol">)</a>
<a id="13724" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13648" class="Function">even-comm′</a> <a id="13735" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13735" class="Bound">m</a> <a id="13737" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13737" class="Bound">n</a> <a id="13739" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13739" class="Bound">ev</a> <a id="13742" class="Keyword">with</a>   <a id="13749" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13735" class="Bound">m</a> <a id="13751" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="13753" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13737" class="Bound">n</a>  <a id="13756" class="Symbol">|</a> <a id="13758" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8875" class="Function">+-comm</a> <a id="13765" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13735" class="Bound">m</a> <a id="13767" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#13737" class="Bound">n</a>
<a id="13769" class="Symbol">...</a>                  <a id="13790" class="Symbol">|</a> <a id="13792" class="DottedPattern Symbol">.(</a><a id="13794" class="DottedPattern Bound">n</a> <a id="13796" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="DottedPattern Function Operator">+</a> <a id="13798" class="DottedPattern Bound">m</a><a id="13799" class="DottedPattern Symbol">)</a> <a id="13801" class="Symbol">|</a> <a id="13803" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>       <a id="13814" class="Symbol">=</a> <a id="13816" class="Bound">ev</a>{% endraw %}</pre>
In general, one can follow `with` by any number of expressions,
separated by bars, where each following equation has the same number
of patterns.  We often write expressions and the corresponding
patterns so they line up in columns, as above. Here the first column
asserts that `m + n` and `n + m` are identical, and the second column
justifies that assertion with evidence of the appropriate equality.
Note also the use of the _dot pattern_, `.(n + m)`.  A dot pattern
consists of a dot followed by an expression, and is used when other
information forces the value matched to be equal to the value of the
expression in the dot pattern.  In this case, the identification of
`m + n` and `n + m` is justified by the subsequent matching of
`+-comm m n` against `refl`.  One might think that the first clause is
redundant as the information is inherent in the second clause, but in
fact Agda is rather picky on this point: omitting the first clause or
reversing the order of the clauses will cause Agda to report an error.
(Try it and see!)

In this case, we can avoid rewrite by simply applying the substitution
function defined earlier:
<pre class="Agda">{% raw %}<a id="even-comm″"></a><a id="14979" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#14979" class="Function">even-comm″</a> <a id="14990" class="Symbol">:</a> <a id="14992" class="Symbol">∀</a> <a id="14994" class="Symbol">(</a><a id="14995" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#14995" class="Bound">m</a> <a id="14997" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#14997" class="Bound">n</a> <a id="14999" class="Symbol">:</a> <a id="15001" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8218" class="Datatype">ℕ</a><a id="15002" class="Symbol">)</a>
  <a id="15006" class="Symbol">→</a> <a id="15008" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="15013" class="Symbol">(</a><a id="15014" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#14995" class="Bound">m</a> <a id="15016" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="15018" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#14997" class="Bound">n</a><a id="15019" class="Symbol">)</a>
    <a id="15025" class="Comment">------------</a>
  <a id="15040" class="Symbol">→</a> <a id="15042" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="15047" class="Symbol">(</a><a id="15048" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#14997" class="Bound">n</a> <a id="15050" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8259" class="Function Operator">+</a> <a id="15052" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#14995" class="Bound">m</a><a id="15053" class="Symbol">)</a>
<a id="15055" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#14979" class="Function">even-comm″</a> <a id="15066" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#15066" class="Bound">m</a> <a id="15068" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#15068" class="Bound">n</a>  <a id="15071" class="Symbol">=</a>  <a id="15074" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4910" class="Function">subst</a> <a id="15080" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#10383" class="Datatype">even</a> <a id="15085" class="Symbol">(</a><a id="15086" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#8875" class="Function">+-comm</a> <a id="15093" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#15066" class="Bound">m</a> <a id="15095" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#15068" class="Bound">n</a><a id="15096" class="Symbol">)</a>{% endraw %}</pre>
Nonetheless, rewrite is a vital part of the Agda toolkit.  We will use
it sparingly, but it is occasionally essential.


## Leibniz equality

The form of asserting equality that we have used is due to Martin
Löf, and was published in 1975.  An older form is due to Leibniz, and
was published in 1686.  Leibniz asserted the _identity of
indiscernibles_: two objects are equal if and only if they satisfy the
same properties. This principle sometimes goes by the name Leibniz'
Law, and is closely related to Spock's Law, "A difference that makes
no difference is no difference".  Here we define Leibniz equality,
and show that two terms satisfy Leibniz equality if and only if they
satisfy Martin Löf equality.

Leibniz equality is usually formalised to state that `x ≐ y` holds if
every property `P` that holds of `x` also holds of `y`.  Perhaps
surprisingly, this definition is sufficient to also ensure the
converse, that every property `P` that holds of `y` also holds of `x`.

Let `x` and `y` be objects of type `A`. We say that `x ≐ y` holds if
for every predicate `P` over type `A` we have that `P x` implies `P y`:
<pre class="Agda">{% raw %}<a id="_≐_"></a><a id="16243" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16243" class="Function Operator">_≐_</a> <a id="16247" class="Symbol">:</a> <a id="16249" class="Symbol">∀</a> <a id="16251" class="Symbol">{</a><a id="16252" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16252" class="Bound">A</a> <a id="16254" class="Symbol">:</a> <a id="16256" class="PrimitiveType">Set</a><a id="16259" class="Symbol">}</a> <a id="16261" class="Symbol">(</a><a id="16262" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16262" class="Bound">x</a> <a id="16264" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16264" class="Bound">y</a> <a id="16266" class="Symbol">:</a> <a id="16268" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16252" class="Bound">A</a><a id="16269" class="Symbol">)</a> <a id="16271" class="Symbol">→</a> <a id="16273" class="PrimitiveType">Set₁</a>
<a id="16278" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16243" class="Function Operator">_≐_</a> <a id="16282" class="Symbol">{</a><a id="16283" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16283" class="Bound">A</a><a id="16284" class="Symbol">}</a> <a id="16286" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16286" class="Bound">x</a> <a id="16288" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16288" class="Bound">y</a> <a id="16290" class="Symbol">=</a> <a id="16292" class="Symbol">∀</a> <a id="16294" class="Symbol">(</a><a id="16295" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16295" class="Bound">P</a> <a id="16297" class="Symbol">:</a> <a id="16299" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16283" class="Bound">A</a> <a id="16301" class="Symbol">→</a> <a id="16303" class="PrimitiveType">Set</a><a id="16306" class="Symbol">)</a> <a id="16308" class="Symbol">→</a> <a id="16310" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16295" class="Bound">P</a> <a id="16312" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16286" class="Bound">x</a> <a id="16314" class="Symbol">→</a> <a id="16316" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16295" class="Bound">P</a> <a id="16318" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16288" class="Bound">y</a>{% endraw %}</pre>
We cannot write the left-hand side of the equation as `x ≐ y`,
and instead we write `_≐_ {A} x y` to provide access to the implicit
parameter `A` which appears on the right-hand side.

This is our first use of _levels_.  We cannot assign `Set` the type
`Set`, since this would lead to contradictions such as Russell's
Paradox and Girard's Paradox.  Instead, there is a hierarchy of types,
where `Set : Set₁`, `Set₁ : Set₂`, and so on.  In fact, `Set` itself
is just an abbreviation for `Set₀`.  Since the equation defining `_≐_`
mentions `Set` on the right-hand side, the corresponding signature
must use `Set₁`.  We say a bit more about levels below.

Leibniz equality is reflexive and transitive,
where the first follows by a variant of the identity function
and the second by a variant of function composition:
<pre class="Agda">{% raw %}<a id="refl-≐"></a><a id="17158" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17158" class="Function">refl-≐</a> <a id="17165" class="Symbol">:</a> <a id="17167" class="Symbol">∀</a> <a id="17169" class="Symbol">{</a><a id="17170" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17170" class="Bound">A</a> <a id="17172" class="Symbol">:</a> <a id="17174" class="PrimitiveType">Set</a><a id="17177" class="Symbol">}</a> <a id="17179" class="Symbol">{</a><a id="17180" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17180" class="Bound">x</a> <a id="17182" class="Symbol">:</a> <a id="17184" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17170" class="Bound">A</a><a id="17185" class="Symbol">}</a>
  <a id="17189" class="Symbol">→</a> <a id="17191" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17180" class="Bound">x</a> <a id="17193" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16243" class="Function Operator">≐</a> <a id="17195" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17180" class="Bound">x</a>
<a id="17197" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17158" class="Function">refl-≐</a> <a id="17204" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17204" class="Bound">P</a> <a id="17206" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17206" class="Bound">Px</a>  <a id="17210" class="Symbol">=</a>  <a id="17213" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17206" class="Bound">Px</a>

<a id="trans-≐"></a><a id="17217" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17217" class="Function">trans-≐</a> <a id="17225" class="Symbol">:</a> <a id="17227" class="Symbol">∀</a> <a id="17229" class="Symbol">{</a><a id="17230" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17230" class="Bound">A</a> <a id="17232" class="Symbol">:</a> <a id="17234" class="PrimitiveType">Set</a><a id="17237" class="Symbol">}</a> <a id="17239" class="Symbol">{</a><a id="17240" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17240" class="Bound">x</a> <a id="17242" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17242" class="Bound">y</a> <a id="17244" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17244" class="Bound">z</a> <a id="17246" class="Symbol">:</a> <a id="17248" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17230" class="Bound">A</a><a id="17249" class="Symbol">}</a>
  <a id="17253" class="Symbol">→</a> <a id="17255" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17240" class="Bound">x</a> <a id="17257" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16243" class="Function Operator">≐</a> <a id="17259" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17242" class="Bound">y</a>
  <a id="17263" class="Symbol">→</a> <a id="17265" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17242" class="Bound">y</a> <a id="17267" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16243" class="Function Operator">≐</a> <a id="17269" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17244" class="Bound">z</a>
    <a id="17275" class="Comment">-----</a>
  <a id="17283" class="Symbol">→</a> <a id="17285" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17240" class="Bound">x</a> <a id="17287" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16243" class="Function Operator">≐</a> <a id="17289" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17244" class="Bound">z</a>
<a id="17291" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17217" class="Function">trans-≐</a> <a id="17299" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17299" class="Bound">x≐y</a> <a id="17303" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17303" class="Bound">y≐z</a> <a id="17307" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17307" class="Bound">P</a> <a id="17309" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17309" class="Bound">Px</a>  <a id="17313" class="Symbol">=</a>  <a id="17316" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17303" class="Bound">y≐z</a> <a id="17320" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17307" class="Bound">P</a> <a id="17322" class="Symbol">(</a><a id="17323" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17299" class="Bound">x≐y</a> <a id="17327" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17307" class="Bound">P</a> <a id="17329" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17309" class="Bound">Px</a><a id="17331" class="Symbol">)</a>{% endraw %}</pre>

Symmetry is less obvious.  We have to show that if `P x` implies `P y`
for all predicates `P`, then the implication holds the other way round
as well:
<pre class="Agda">{% raw %}<a id="sym-≐"></a><a id="17509" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17509" class="Function">sym-≐</a> <a id="17515" class="Symbol">:</a> <a id="17517" class="Symbol">∀</a> <a id="17519" class="Symbol">{</a><a id="17520" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17520" class="Bound">A</a> <a id="17522" class="Symbol">:</a> <a id="17524" class="PrimitiveType">Set</a><a id="17527" class="Symbol">}</a> <a id="17529" class="Symbol">{</a><a id="17530" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17530" class="Bound">x</a> <a id="17532" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17532" class="Bound">y</a> <a id="17534" class="Symbol">:</a> <a id="17536" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17520" class="Bound">A</a><a id="17537" class="Symbol">}</a>
  <a id="17541" class="Symbol">→</a> <a id="17543" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17530" class="Bound">x</a> <a id="17545" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16243" class="Function Operator">≐</a> <a id="17547" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17532" class="Bound">y</a>
    <a id="17553" class="Comment">-----</a>
  <a id="17561" class="Symbol">→</a> <a id="17563" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17532" class="Bound">y</a> <a id="17565" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16243" class="Function Operator">≐</a> <a id="17567" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17530" class="Bound">x</a>
<a id="17569" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17509" class="Function">sym-≐</a> <a id="17575" class="Symbol">{</a><a id="17576" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17576" class="Bound">A</a><a id="17577" class="Symbol">}</a> <a id="17579" class="Symbol">{</a><a id="17580" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17580" class="Bound">x</a><a id="17581" class="Symbol">}</a> <a id="17583" class="Symbol">{</a><a id="17584" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17584" class="Bound">y</a><a id="17585" class="Symbol">}</a> <a id="17587" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17587" class="Bound">x≐y</a> <a id="17591" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17591" class="Bound">P</a>  <a id="17594" class="Symbol">=</a>  <a id="17597" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17679" class="Function">Qy</a>
  <a id="17602" class="Keyword">where</a>
    <a id="17612" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17612" class="Function">Q</a> <a id="17614" class="Symbol">:</a> <a id="17616" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17576" class="Bound">A</a> <a id="17618" class="Symbol">→</a> <a id="17620" class="PrimitiveType">Set</a>
    <a id="17628" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17612" class="Function">Q</a> <a id="17630" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17630" class="Bound">z</a> <a id="17632" class="Symbol">=</a> <a id="17634" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17591" class="Bound">P</a> <a id="17636" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17630" class="Bound">z</a> <a id="17638" class="Symbol">→</a> <a id="17640" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17591" class="Bound">P</a> <a id="17642" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17580" class="Bound">x</a>
    <a id="17648" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17648" class="Function">Qx</a> <a id="17651" class="Symbol">:</a> <a id="17653" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17612" class="Function">Q</a> <a id="17655" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17580" class="Bound">x</a>
    <a id="17661" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17648" class="Function">Qx</a> <a id="17664" class="Symbol">=</a> <a id="17666" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17158" class="Function">refl-≐</a> <a id="17673" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17591" class="Bound">P</a>
    <a id="17679" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17679" class="Function">Qy</a> <a id="17682" class="Symbol">:</a> <a id="17684" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17612" class="Function">Q</a> <a id="17686" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17584" class="Bound">y</a>
    <a id="17692" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17679" class="Function">Qy</a> <a id="17695" class="Symbol">=</a> <a id="17697" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17587" class="Bound">x≐y</a> <a id="17701" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17612" class="Function">Q</a> <a id="17703" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#17648" class="Function">Qx</a>{% endraw %}</pre>

Given `x ≐ y`, a specific `P`, we have to construct a proof that `P y`
implies `P x`.  To do so, we instantiate the equality with a predicate
`Q` such that `Q z` holds if `P z` implies `P x`.  The property `Q x`
is trivial by reflexivity, and hence `Q y` follows from `x ≐ y`.  But
`Q y` is exactly a proof of what we require, that `P y` implies `P x`.

We now show that Martin Löf equality implies
Leibniz equality, and vice versa.  In the forward direction, if we know
`x ≡ y` we need for any `P` to take evidence of `P x` to evidence of `P y`,
which is easy since equality of `x` and `y` implies that any proof
of `P x` is also a proof of `P y`:
<pre class="Agda">{% raw %}<a id="≡-implies-≐"></a><a id="18380" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18380" class="Function">≡-implies-≐</a> <a id="18392" class="Symbol">:</a> <a id="18394" class="Symbol">∀</a> <a id="18396" class="Symbol">{</a><a id="18397" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18397" class="Bound">A</a> <a id="18399" class="Symbol">:</a> <a id="18401" class="PrimitiveType">Set</a><a id="18404" class="Symbol">}</a> <a id="18406" class="Symbol">{</a><a id="18407" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18407" class="Bound">x</a> <a id="18409" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18409" class="Bound">y</a> <a id="18411" class="Symbol">:</a> <a id="18413" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18397" class="Bound">A</a><a id="18414" class="Symbol">}</a>
  <a id="18418" class="Symbol">→</a> <a id="18420" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18407" class="Bound">x</a> <a id="18422" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="18424" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18409" class="Bound">y</a>
    <a id="18430" class="Comment">-----</a>
  <a id="18438" class="Symbol">→</a> <a id="18440" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18407" class="Bound">x</a> <a id="18442" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16243" class="Function Operator">≐</a> <a id="18444" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18409" class="Bound">y</a>
<a id="18446" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18380" class="Function">≡-implies-≐</a> <a id="18458" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18458" class="Bound">x≡y</a> <a id="18462" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18462" class="Bound">P</a>  <a id="18465" class="Symbol">=</a>  <a id="18468" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#4910" class="Function">subst</a> <a id="18474" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18462" class="Bound">P</a> <a id="18476" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18458" class="Bound">x≡y</a>{% endraw %}</pre>
This direction follows from substitution, which we showed earlier.

In the reverse direction, given that for any `P` we can take a proof of `P x`
to a proof of `P y` we need to show `x ≡ y`:
<pre class="Agda">{% raw %}<a id="≐-implies-≡"></a><a id="18695" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18695" class="Function">≐-implies-≡</a> <a id="18707" class="Symbol">:</a> <a id="18709" class="Symbol">∀</a> <a id="18711" class="Symbol">{</a><a id="18712" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18712" class="Bound">A</a> <a id="18714" class="Symbol">:</a> <a id="18716" class="PrimitiveType">Set</a><a id="18719" class="Symbol">}</a> <a id="18721" class="Symbol">{</a><a id="18722" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18722" class="Bound">x</a> <a id="18724" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18724" class="Bound">y</a> <a id="18726" class="Symbol">:</a> <a id="18728" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18712" class="Bound">A</a><a id="18729" class="Symbol">}</a>
  <a id="18733" class="Symbol">→</a> <a id="18735" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18722" class="Bound">x</a> <a id="18737" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#16243" class="Function Operator">≐</a> <a id="18739" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18724" class="Bound">y</a>
    <a id="18745" class="Comment">-----</a>
  <a id="18753" class="Symbol">→</a> <a id="18755" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18722" class="Bound">x</a> <a id="18757" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="18759" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18724" class="Bound">y</a>
<a id="18761" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18695" class="Function">≐-implies-≡</a> <a id="18773" class="Symbol">{</a><a id="18774" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18774" class="Bound">A</a><a id="18775" class="Symbol">}</a> <a id="18777" class="Symbol">{</a><a id="18778" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18778" class="Bound">x</a><a id="18779" class="Symbol">}</a> <a id="18781" class="Symbol">{</a><a id="18782" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18782" class="Bound">y</a><a id="18783" class="Symbol">}</a> <a id="18785" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18785" class="Bound">x≐y</a>  <a id="18790" class="Symbol">=</a>  <a id="18793" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18867" class="Function">Qy</a>
  <a id="18798" class="Keyword">where</a>
    <a id="18808" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18808" class="Function">Q</a> <a id="18810" class="Symbol">:</a> <a id="18812" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18774" class="Bound">A</a> <a id="18814" class="Symbol">→</a> <a id="18816" class="PrimitiveType">Set</a>
    <a id="18824" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18808" class="Function">Q</a> <a id="18826" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18826" class="Bound">z</a> <a id="18828" class="Symbol">=</a> <a id="18830" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18778" class="Bound">x</a> <a id="18832" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#749" class="Datatype Operator">≡</a> <a id="18834" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18826" class="Bound">z</a>
    <a id="18840" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18840" class="Function">Qx</a> <a id="18843" class="Symbol">:</a> <a id="18845" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18808" class="Function">Q</a> <a id="18847" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18778" class="Bound">x</a>
    <a id="18853" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18840" class="Function">Qx</a> <a id="18856" class="Symbol">=</a> <a id="18858" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#789" class="InductiveConstructor">refl</a>
    <a id="18867" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18867" class="Function">Qy</a> <a id="18870" class="Symbol">:</a> <a id="18872" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18808" class="Function">Q</a> <a id="18874" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18782" class="Bound">y</a>
    <a id="18880" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18867" class="Function">Qy</a> <a id="18883" class="Symbol">=</a> <a id="18885" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18785" class="Bound">x≐y</a> <a id="18889" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18808" class="Function">Q</a> <a id="18891" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#18840" class="Function">Qx</a>{% endraw %}</pre>
The proof is similar to that for symmetry of Leibniz equality. We take
`Q` to be the predicate that holds of `z` if `x ≡ z`. Then `Q x` is
trivial by reflexivity of Martin Löf equality, and hence `Q y`
follows from `x ≐ y`.  But `Q y` is exactly a proof of what we
require, that `x ≡ y`.

(Parts of this section are adapted from *≐≃≡: Leibniz Equality is
Isomorphic to Martin-Löf Identity, Parametrically*, by Andreas Abel,
Jesper Cockx, Dominique Devries, Andreas Nuyts, and Philip Wadler,
draft, 2017.)


## Universe polymorphism {#unipoly}

As we have seen, not every type belongs to `Set`, but instead every
type belongs somewhere in the hierarchy `Set₀`, `Set₁`, `Set₂`, and so on,
where `Set` abbreviates `Set₀`, and `Set₀ : Set₁`, `Set₁ : Set₂`, and so on.
The definition of equality given above is fine if we want to compare two
values of a type that belongs to `Set`, but what if we want to compare
two values of a type that belongs to `Set ℓ` for some arbitrary level `ℓ`?

The answer is _universe polymorphism_, where a definition is made
with respect to an arbitrary level `ℓ`. To make use of levels, we
first import the following:
<pre class="Agda">{% raw %}<a id="20062" class="Keyword">open</a> <a id="20067" class="Keyword">import</a> <a id="20074" href="https://agda.github.io/agda-stdlib/Level.html" class="Module">Level</a> <a id="20080" class="Keyword">using</a> <a id="20086" class="Symbol">(</a><a id="20087" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#408" class="Postulate">Level</a><a id="20092" class="Symbol">;</a> <a id="20094" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#657" class="Primitive Operator">_⊔_</a><a id="20097" class="Symbol">)</a> <a id="20099" class="Keyword">renaming</a> <a id="20108" class="Symbol">(</a><a id="20109" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#611" class="Primitive">zero</a> <a id="20114" class="Symbol">to</a> <a id="20117" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#611" class="Primitive">lzero</a><a id="20122" class="Symbol">;</a> <a id="20124" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#627" class="Primitive">suc</a> <a id="20128" class="Symbol">to</a> <a id="20131" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#627" class="Primitive">lsuc</a><a id="20135" class="Symbol">)</a>{% endraw %}</pre>
We rename constructors `zero` and `suc` to `lzero` and `lsuc` to avoid confusion
between levels and naturals.

Levels are isomorphic to natural numbers, and have similar constructors:

    lzero : Level
    lsuc  : Level → Level

The names `Set₀`, `Set₁`, `Set₂`, and so on, are abbreviations for

    Set lzero
    Set (lsuc lzero)
    Set (lsuc (lsuc lzero))

and so on. There is also an operator

    _⊔_ : Level → Level → Level

that given two levels returns the larger of the two.

Here is the definition of equality, generalised to an arbitrary level:
<pre class="Agda">{% raw %}<a id="20719" class="Keyword">data</a> <a id="_≡′_"></a><a id="20724" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20724" class="Datatype Operator">_≡′_</a> <a id="20729" class="Symbol">{</a><a id="20730" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20730" class="Bound">ℓ</a> <a id="20732" class="Symbol">:</a> <a id="20734" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#408" class="Postulate">Level</a><a id="20739" class="Symbol">}</a> <a id="20741" class="Symbol">{</a><a id="20742" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20742" class="Bound">A</a> <a id="20744" class="Symbol">:</a> <a id="20746" class="PrimitiveType">Set</a> <a id="20750" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20730" class="Bound">ℓ</a><a id="20751" class="Symbol">}</a> <a id="20753" class="Symbol">(</a><a id="20754" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20754" class="Bound">x</a> <a id="20756" class="Symbol">:</a> <a id="20758" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20742" class="Bound">A</a><a id="20759" class="Symbol">)</a> <a id="20761" class="Symbol">:</a> <a id="20763" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20742" class="Bound">A</a> <a id="20765" class="Symbol">→</a> <a id="20767" class="PrimitiveType">Set</a> <a id="20771" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20730" class="Bound">ℓ</a> <a id="20773" class="Keyword">where</a>
  <a id="_≡′_.refl′"></a><a id="20781" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20781" class="InductiveConstructor">refl′</a> <a id="20787" class="Symbol">:</a> <a id="20789" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20754" class="Bound">x</a> <a id="20791" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20724" class="Datatype Operator">≡′</a> <a id="20794" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20754" class="Bound">x</a>{% endraw %}</pre>
Similarly, here is the generalised definition of symmetry:
<pre class="Agda">{% raw %}<a id="sym′"></a><a id="20879" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20879" class="Function">sym′</a> <a id="20884" class="Symbol">:</a> <a id="20886" class="Symbol">∀</a> <a id="20888" class="Symbol">{</a><a id="20889" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20889" class="Bound">ℓ</a> <a id="20891" class="Symbol">:</a> <a id="20893" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#408" class="Postulate">Level</a><a id="20898" class="Symbol">}</a> <a id="20900" class="Symbol">{</a><a id="20901" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20901" class="Bound">A</a> <a id="20903" class="Symbol">:</a> <a id="20905" class="PrimitiveType">Set</a> <a id="20909" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20889" class="Bound">ℓ</a><a id="20910" class="Symbol">}</a> <a id="20912" class="Symbol">{</a><a id="20913" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20913" class="Bound">x</a> <a id="20915" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20915" class="Bound">y</a> <a id="20917" class="Symbol">:</a> <a id="20919" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20901" class="Bound">A</a><a id="20920" class="Symbol">}</a>
  <a id="20924" class="Symbol">→</a> <a id="20926" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20913" class="Bound">x</a> <a id="20928" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20724" class="Datatype Operator">≡′</a> <a id="20931" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20915" class="Bound">y</a>
    <a id="20937" class="Comment">------</a>
  <a id="20946" class="Symbol">→</a> <a id="20948" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20915" class="Bound">y</a> <a id="20950" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20724" class="Datatype Operator">≡′</a> <a id="20953" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20913" class="Bound">x</a>
<a id="20955" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20879" class="Function">sym′</a> <a id="20960" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20781" class="InductiveConstructor">refl′</a> <a id="20966" class="Symbol">=</a> <a id="20968" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#20781" class="InductiveConstructor">refl′</a>{% endraw %}</pre>
For simplicity, we avoid universe polymorphism in the definitions given in
the text, but most definitions in the standard library, including those for
equality, are generalised to arbitrary levels as above.

Here is the generalised definition of Leibniz equality:
<pre class="Agda">{% raw %}<a id="_≐′_"></a><a id="21262" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21262" class="Function Operator">_≐′_</a> <a id="21267" class="Symbol">:</a> <a id="21269" class="Symbol">∀</a> <a id="21271" class="Symbol">{</a><a id="21272" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21272" class="Bound">ℓ</a> <a id="21274" class="Symbol">:</a> <a id="21276" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#408" class="Postulate">Level</a><a id="21281" class="Symbol">}</a> <a id="21283" class="Symbol">{</a><a id="21284" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21284" class="Bound">A</a> <a id="21286" class="Symbol">:</a> <a id="21288" class="PrimitiveType">Set</a> <a id="21292" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21272" class="Bound">ℓ</a><a id="21293" class="Symbol">}</a> <a id="21295" class="Symbol">(</a><a id="21296" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21296" class="Bound">x</a> <a id="21298" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21298" class="Bound">y</a> <a id="21300" class="Symbol">:</a> <a id="21302" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21284" class="Bound">A</a><a id="21303" class="Symbol">)</a> <a id="21305" class="Symbol">→</a> <a id="21307" class="PrimitiveType">Set</a> <a id="21311" class="Symbol">(</a><a id="21312" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#627" class="Primitive">lsuc</a> <a id="21317" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21272" class="Bound">ℓ</a><a id="21318" class="Symbol">)</a>
<a id="21320" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21262" class="Function Operator">_≐′_</a> <a id="21325" class="Symbol">{</a><a id="21326" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21326" class="Bound">ℓ</a><a id="21327" class="Symbol">}</a> <a id="21329" class="Symbol">{</a><a id="21330" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21330" class="Bound">A</a><a id="21331" class="Symbol">}</a> <a id="21333" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21333" class="Bound">x</a> <a id="21335" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21335" class="Bound">y</a> <a id="21337" class="Symbol">=</a> <a id="21339" class="Symbol">∀</a> <a id="21341" class="Symbol">(</a><a id="21342" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21342" class="Bound">P</a> <a id="21344" class="Symbol">:</a> <a id="21346" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21330" class="Bound">A</a> <a id="21348" class="Symbol">→</a> <a id="21350" class="PrimitiveType">Set</a> <a id="21354" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21326" class="Bound">ℓ</a><a id="21355" class="Symbol">)</a> <a id="21357" class="Symbol">→</a> <a id="21359" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21342" class="Bound">P</a> <a id="21361" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21333" class="Bound">x</a> <a id="21363" class="Symbol">→</a> <a id="21365" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21342" class="Bound">P</a> <a id="21367" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Equality.md %}{% raw %}#21335" class="Bound">y</a>{% endraw %}</pre>
Before the signature used `Set₁` as the type of a term that includes
`Set`, whereas here the signature uses `Set (lsuc ℓ)` as the type of a
term that includes `Set ℓ`.

Further information on levels can be found in the [Agda Wiki][wiki].

[wiki]: http://wiki.portal.chalmers.se/agda/pmwiki.php?n=ReferenceManual.UniversePolymorphism


## Standard library

Definitions similar to those in this chapter can be found in the
standard library:
<pre class="Agda">{% raw %}<a id="21832" class="Comment">-- import Relation.Binary.PropositionalEquality as Eq</a>
<a id="21886" class="Comment">-- open Eq using (_≡_; refl; trans; sym; cong; cong-app; subst)</a>
<a id="21950" class="Comment">-- open Eq.≡-Reasoning using (begin_; _≡⟨⟩_; _≡⟨_⟩_; _∎)</a>{% endraw %}</pre>
Here the imports are shown as comments rather than code to avoid
collisions, as mentioned in the introduction.


## Unicode

This chapter uses the following unicode:

    ≡  U+2261  IDENTICAL TO (\==, \equiv)
    ⟨  U+27E8  MATHEMATICAL LEFT ANGLE BRACKET (\<)
    ⟩  U+27E9  MATHEMATICAL RIGHT ANGLE BRACKET (\>)
    ∎  U+220E  END OF PROOF (\qed)
    ≐  U+2250  APPROACHES THE LIMIT (\.=)
    ℓ  U+2113  SCRIPT SMALL L (\ell)
    ⊔  U+2294  SQUARE CUP (\lub)
    ₀  U+2080  SUBSCRIPT ZERO (\_0)
    ₁  U+2081  SUBSCRIPT ONE (\_1)
    ₂  U+2082  SUBSCRIPT TWO (\_2)
