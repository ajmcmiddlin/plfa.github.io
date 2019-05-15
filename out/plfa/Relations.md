---
src       : src/plfa/Relations.lagda
title     : "Relations: Inductive definition of relations"
layout    : page
prev      : /Induction/
permalink : /Relations/
next      : /Equality/
---

<pre class="Agda">{% raw %}<a id="170" class="Keyword">module</a> <a id="177" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}" class="Module">plfa.Relations</a> <a id="192" class="Keyword">where</a>{% endraw %}</pre>

After having defined operations such as addition and multiplication,
the next step is to define relations, such as _less than or equal_.

## Imports

<pre class="Agda">{% raw %}<a id="373" class="Keyword">import</a> <a id="380" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html" class="Module">Relation.Binary.PropositionalEquality</a> <a id="418" class="Symbol">as</a> <a id="421" class="Module">Eq</a>
<a id="424" class="Keyword">open</a> <a id="429" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html" class="Module">Eq</a> <a id="432" class="Keyword">using</a> <a id="438" class="Symbol">(</a><a id="439" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#83" class="Datatype Operator">_≡_</a><a id="442" class="Symbol">;</a> <a id="444" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#140" class="InductiveConstructor">refl</a><a id="448" class="Symbol">;</a> <a id="450" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1170" class="Function">cong</a><a id="454" class="Symbol">)</a>
<a id="456" class="Keyword">open</a> <a id="461" class="Keyword">import</a> <a id="468" href="https://agda.github.io/agda-stdlib/Data.Nat.html" class="Module">Data.Nat</a> <a id="477" class="Keyword">using</a> <a id="483" class="Symbol">(</a><a id="484" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="485" class="Symbol">;</a> <a id="487" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a><a id="491" class="Symbol">;</a> <a id="493" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a><a id="496" class="Symbol">;</a> <a id="498" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#230" class="Primitive Operator">_+_</a><a id="501" class="Symbol">)</a>
<a id="503" class="Keyword">open</a> <a id="508" class="Keyword">import</a> <a id="515" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html" class="Module">Data.Nat.Properties</a> <a id="535" class="Keyword">using</a> <a id="541" class="Symbol">(</a><a id="542" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#9708" class="Function">+-comm</a><a id="548" class="Symbol">)</a>{% endraw %}</pre>


## Defining relations

The relation _less than or equal_ has an infinite number of
instances.  Here are a few of them:

    0 ≤ 0     0 ≤ 1     0 ≤ 2     0 ≤ 3     ...
              1 ≤ 1     1 ≤ 2     1 ≤ 3     ...
                        2 ≤ 2     2 ≤ 3     ...
                                  3 ≤ 3     ...
                                            ...

And yet, we can write a finite definition that encompasses
all of these instances in just a few lines.  Here is the
definition as a pair of inference rules:

    z≤n --------
        zero ≤ n

        m ≤ n
    s≤s -------------
        suc m ≤ suc n

And here is the definition in Agda:
<pre class="Agda">{% raw %}<a id="1225" class="Keyword">data</a> <a id="_≤_"></a><a id="1230" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">_≤_</a> <a id="1234" class="Symbol">:</a> <a id="1236" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a> <a id="1238" class="Symbol">→</a> <a id="1240" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a> <a id="1242" class="Symbol">→</a> <a id="1244" class="PrimitiveType">Set</a> <a id="1248" class="Keyword">where</a>

  <a id="_≤_.z≤n"></a><a id="1257" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a> <a id="1261" class="Symbol">:</a> <a id="1263" class="Symbol">∀</a> <a id="1265" class="Symbol">{</a><a id="1266" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1266" class="Bound">n</a> <a id="1268" class="Symbol">:</a> <a id="1270" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="1271" class="Symbol">}</a>
      <a id="1279" class="Comment">--------</a>
    <a id="1292" class="Symbol">→</a> <a id="1294" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a> <a id="1299" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="1301" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1266" class="Bound">n</a>

  <a id="_≤_.s≤s"></a><a id="1306" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="1310" class="Symbol">:</a> <a id="1312" class="Symbol">∀</a> <a id="1314" class="Symbol">{</a><a id="1315" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1315" class="Bound">m</a> <a id="1317" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1317" class="Bound">n</a> <a id="1319" class="Symbol">:</a> <a id="1321" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="1322" class="Symbol">}</a>
    <a id="1328" class="Symbol">→</a> <a id="1330" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1315" class="Bound">m</a> <a id="1332" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="1334" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1317" class="Bound">n</a>
      <a id="1342" class="Comment">-------------</a>
    <a id="1360" class="Symbol">→</a> <a id="1362" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="1366" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1315" class="Bound">m</a> <a id="1368" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="1370" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="1374" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1317" class="Bound">n</a>{% endraw %}</pre>
Here `z≤n` and `s≤s` (with no spaces) are constructor names, while
`zero ≤ n`, and `m ≤ n` and `suc m ≤ suc n` (with spaces) are types.
This is our first use of an _indexed_ datatype, where the type `m ≤ n`
is indexed by two naturals, `m` and `n`.  In Agda any line beginning
with two or more dashes is a comment, and here we have exploited that
convention to write our Agda code in a form that resembles the
corresponding inference rules, a trick we will use often from now on.

Both definitions above tell us the same two things:

* _Base case_: for all naturals `n`, the proposition `zero ≤ n` holds.
* _Inductive case_: for all naturals `m` and `n`, if the proposition
  `m ≤ n` holds, then the proposition `suc m ≤ suc n` holds.

In fact, they each give us a bit more detail:

* _Base case_: for all naturals `n`, the constructor `z≤n`
  produces evidence that `zero ≤ n` holds.
* _Inductive case_: for all naturals `m` and `n`, the constructor
  `s≤s` takes evidence that `m ≤ n` holds into evidence that
  `suc m ≤ suc n` holds.

For example, here in inference rule notation is the proof that
`2 ≤ 4`:

      z≤n -----
          0 ≤ 2
     s≤s -------
          1 ≤ 3
    s≤s ---------
          2 ≤ 4

And here is the corresponding Agda proof:
<pre class="Agda">{% raw %}<a id="2652" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#2652" class="Function">_</a> <a id="2654" class="Symbol">:</a> <a id="2656" class="Number">2</a> <a id="2658" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="2660" class="Number">4</a>
<a id="2662" class="Symbol">_</a> <a id="2664" class="Symbol">=</a> <a id="2666" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="2670" class="Symbol">(</a><a id="2671" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="2675" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a><a id="2678" class="Symbol">)</a>{% endraw %}</pre>




## Implicit arguments

This is our first use of implicit arguments.  In the definition of
inequality, the two lines defining the constructors use `∀`, very
similar to our use of `∀` in propositions such as:

    +-comm : ∀ (m n : ℕ) → m + n ≡ n + m

However, here the declarations are surrounded by curly braces `{ }`
rather than parentheses `( )`.  This means that the arguments are
_implicit_ and need not be written explicitly; instead, they are
_inferred_ by Agda's typechecker. Thus, we write `+-comm m n` for the
proof that `m + n ≡ n + m`, but `z≤n` for the proof that `zero ≤ n`,
leaving `n` implicit.  Similarly, if `m≤n` is evidence that `m ≤ n`,
we write `s≤s m≤n` for evidence that `suc m ≤ suc n`, leaving both `m`
and `n` implicit.

If we wish, it is possible to provide implicit arguments explicitly by
writing the arguments inside curly braces.  For instance, here is the
Agda proof that `2 ≤ 4` repeated, with the implicit arguments made
explicit:
<pre class="Agda">{% raw %}<a id="3673" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#3673" class="Function">_</a> <a id="3675" class="Symbol">:</a> <a id="3677" class="Number">2</a> <a id="3679" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="3681" class="Number">4</a>
<a id="3683" class="Symbol">_</a> <a id="3685" class="Symbol">=</a> <a id="3687" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="3691" class="Symbol">{</a><a id="3692" class="Number">1</a><a id="3693" class="Symbol">}</a> <a id="3695" class="Symbol">{</a><a id="3696" class="Number">3</a><a id="3697" class="Symbol">}</a> <a id="3699" class="Symbol">(</a><a id="3700" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="3704" class="Symbol">{</a><a id="3705" class="Number">0</a><a id="3706" class="Symbol">}</a> <a id="3708" class="Symbol">{</a><a id="3709" class="Number">2</a><a id="3710" class="Symbol">}</a> <a id="3712" class="Symbol">(</a><a id="3713" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a> <a id="3717" class="Symbol">{</a><a id="3718" class="Number">2</a><a id="3719" class="Symbol">}))</a>{% endraw %}</pre>
One may also identify implicit arguments by name:
<pre class="Agda">{% raw %}<a id="3797" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#3797" class="Function">_</a> <a id="3799" class="Symbol">:</a> <a id="3801" class="Number">2</a> <a id="3803" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="3805" class="Number">4</a>
<a id="3807" class="Symbol">_</a> <a id="3809" class="Symbol">=</a> <a id="3811" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="3815" class="Symbol">{</a><a id="3816" class="Argument">m</a> <a id="3818" class="Symbol">=</a> <a id="3820" class="Number">1</a><a id="3821" class="Symbol">}</a> <a id="3823" class="Symbol">{</a><a id="3824" class="Argument">n</a> <a id="3826" class="Symbol">=</a> <a id="3828" class="Number">3</a><a id="3829" class="Symbol">}</a> <a id="3831" class="Symbol">(</a><a id="3832" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="3836" class="Symbol">{</a><a id="3837" class="Argument">m</a> <a id="3839" class="Symbol">=</a> <a id="3841" class="Number">0</a><a id="3842" class="Symbol">}</a> <a id="3844" class="Symbol">{</a><a id="3845" class="Argument">n</a> <a id="3847" class="Symbol">=</a> <a id="3849" class="Number">2</a><a id="3850" class="Symbol">}</a> <a id="3852" class="Symbol">(</a><a id="3853" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a> <a id="3857" class="Symbol">{</a><a id="3858" class="Argument">n</a> <a id="3860" class="Symbol">=</a> <a id="3862" class="Number">2</a><a id="3863" class="Symbol">}))</a>{% endraw %}</pre>
In the latter format, you may only supply some implicit arguments:
<pre class="Agda">{% raw %}<a id="3958" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#3958" class="Function">_</a> <a id="3960" class="Symbol">:</a> <a id="3962" class="Number">2</a> <a id="3964" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="3966" class="Number">4</a>
<a id="3968" class="Symbol">_</a> <a id="3970" class="Symbol">=</a> <a id="3972" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="3976" class="Symbol">{</a><a id="3977" class="Argument">n</a> <a id="3979" class="Symbol">=</a> <a id="3981" class="Number">3</a><a id="3982" class="Symbol">}</a> <a id="3984" class="Symbol">(</a><a id="3985" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="3989" class="Symbol">{</a><a id="3990" class="Argument">n</a> <a id="3992" class="Symbol">=</a> <a id="3994" class="Number">2</a><a id="3995" class="Symbol">}</a> <a id="3997" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a><a id="4000" class="Symbol">)</a>{% endraw %}</pre>
It is not permitted to swap implicit arguments, even when named.


## Precedence

We declare the precedence for comparison as follows:
<pre class="Agda">{% raw %}<a id="4161" class="Keyword">infix</a> <a id="4167" class="Number">4</a> <a id="4169" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">_≤_</a>{% endraw %}</pre>
We set the precedence of `_≤_` at level 4, so it binds less tightly
than `_+_` at level 6 and hence `1 + 2 ≤ 3` parses as `(1 + 2) ≤ 3`.
We write `infix` to indicate that the operator does not associate to
either the left or right, as it makes no sense to parse `1 ≤ 2 ≤ 3` as
either `(1 ≤ 2) ≤ 3` or `1 ≤ (2 ≤ 3)`.


## Decidability

Given two numbers, it is straightforward to compute whether or not the
first is less than or equal to the second.  We don't give the code for
doing so here, but will return to this point in
Chapter [Decidable]({{ site.baseurl }}{% link out/plfa/Decidable.md%}).


## Inversion

In our defintions, we go from smaller things to larger things.
For instance, form `m ≤ n` we can conclude `suc m ≤ suc n`,
where `suc m` is bigger than `m` (that is, the former contains
the latter), and `suc n` is bigger than `n`. But sometimes we
want to go from bigger things to smaller things.

There is only one way to prove that `suc m ≤ suc n`, for any `m`
and `n`.  This lets us invert our previous rule.
<pre class="Agda">{% raw %}<a id="inv-s≤s"></a><a id="5187" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5187" class="Function">inv-s≤s</a> <a id="5195" class="Symbol">:</a> <a id="5197" class="Symbol">∀</a> <a id="5199" class="Symbol">{</a><a id="5200" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5200" class="Bound">m</a> <a id="5202" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5202" class="Bound">n</a> <a id="5204" class="Symbol">:</a> <a id="5206" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="5207" class="Symbol">}</a>
  <a id="5211" class="Symbol">→</a> <a id="5213" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="5217" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5200" class="Bound">m</a> <a id="5219" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="5221" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="5225" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5202" class="Bound">n</a>
    <a id="5231" class="Comment">-------------</a>
  <a id="5247" class="Symbol">→</a> <a id="5249" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5200" class="Bound">m</a> <a id="5251" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="5253" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5202" class="Bound">n</a>
<a id="5255" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5187" class="Function">inv-s≤s</a> <a id="5263" class="Symbol">(</a><a id="5264" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="5268" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5268" class="Bound">m≤n</a><a id="5271" class="Symbol">)</a> <a id="5273" class="Symbol">=</a> <a id="5275" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5268" class="Bound">m≤n</a>{% endraw %}</pre>
Not every rule is invertible; indeed, the rule for `z≤n` has
no non-implicit hypotheses, so there is nothing to invert.
But often inversions of this kind hold.

Another example of inversion is showing that there is
only one way a number can be less than or equal to zero.
<pre class="Agda">{% raw %}<a id="inv-z≤n"></a><a id="5575" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5575" class="Function">inv-z≤n</a> <a id="5583" class="Symbol">:</a> <a id="5585" class="Symbol">∀</a> <a id="5587" class="Symbol">{</a><a id="5588" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5588" class="Bound">m</a> <a id="5590" class="Symbol">:</a> <a id="5592" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="5593" class="Symbol">}</a>
  <a id="5597" class="Symbol">→</a> <a id="5599" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5588" class="Bound">m</a> <a id="5601" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="5603" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>
    <a id="5612" class="Comment">--------</a>
  <a id="5623" class="Symbol">→</a> <a id="5625" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5588" class="Bound">m</a> <a id="5627" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#83" class="Datatype Operator">≡</a> <a id="5629" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>
<a id="5634" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#5575" class="Function">inv-z≤n</a> <a id="5642" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a> <a id="5646" class="Symbol">=</a> <a id="5648" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#140" class="InductiveConstructor">refl</a>{% endraw %}</pre>

## Properties of ordering relations

Relations pop up all the time, and mathematicians have agreed
on names for some of the most common properties.

* _Reflexive_. For all `n`, the relation `n ≤ n` holds.
* _Transitive_. For all `m`, `n`, and `p`, if `m ≤ n` and
`n ≤ p` hold, then `m ≤ p` holds.
* _Anti-symmetric_. For all `m` and `n`, if both `m ≤ n` and
`n ≤ m` hold, then `m ≡ n` holds.
* _Total_. For all `m` and `n`, either `m ≤ n` or `n ≤ m`
holds.

The relation `_≤_` satisfies all four of these properties.

There are also names for some combinations of these properties.

* _Preorder_. Any relation that is reflexive and transitive.
* _Partial order_. Any preorder that is also anti-symmetric.
* _Total order_. Any partial order that is also total.

If you ever bump into a relation at a party, you now know how
to make small talk, by asking it whether it is reflexive, transitive,
anti-symmetric, and total. Or instead you might ask whether it is a
preorder, partial order, or total order.

Less frivolously, if you ever bump into a relation while reading a
technical paper, this gives you a way to orient yourself, by checking
whether or not it is a preorder, partial order, or total order.  A
careful author will often call out these properties---or their
lack---for instance by saying that a newly introduced relation is a
partial order but not a total order.


#### Exercise `orderings` {#orderings}

Give an example of a preorder that is not a partial order.

<pre class="Agda">{% raw %}<a id="7155" class="Comment">-- Your code goes here</a>{% endraw %}</pre>

Give an example of a partial order that is not a total order.

<pre class="Agda">{% raw %}<a id="7266" class="Comment">-- Your code goes here</a>{% endraw %}</pre>

## Reflexivity

The first property to prove about comparison is that it is reflexive:
for any natural `n`, the relation `n ≤ n` holds.  We follow the
convention in the standard library and make the argument implicit,
as that will make it easier to invoke reflexivity:
<pre class="Agda">{% raw %}<a id="≤-refl"></a><a id="7582" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#7582" class="Function">≤-refl</a> <a id="7589" class="Symbol">:</a> <a id="7591" class="Symbol">∀</a> <a id="7593" class="Symbol">{</a><a id="7594" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#7594" class="Bound">n</a> <a id="7596" class="Symbol">:</a> <a id="7598" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="7599" class="Symbol">}</a>
    <a id="7605" class="Comment">-----</a>
  <a id="7613" class="Symbol">→</a> <a id="7615" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#7594" class="Bound">n</a> <a id="7617" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="7619" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#7594" class="Bound">n</a>
<a id="7621" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#7582" class="Function">≤-refl</a> <a id="7628" class="Symbol">{</a><a id="7629" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a><a id="7633" class="Symbol">}</a> <a id="7635" class="Symbol">=</a> <a id="7637" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>
<a id="7641" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#7582" class="Function">≤-refl</a> <a id="7648" class="Symbol">{</a><a id="7649" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="7653" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#7653" class="Bound">n</a><a id="7654" class="Symbol">}</a> <a id="7656" class="Symbol">=</a> <a id="7658" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="7662" class="Symbol">(</a><a id="7663" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#7582" class="Function">≤-refl</a> <a id="7670" class="Symbol">{</a><a id="7671" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#7653" class="Bound">n</a><a id="7672" class="Symbol">})</a>{% endraw %}</pre>
The proof is a straightforward induction on the implicit argument `n`.
In the base case, `zero ≤ zero` holds by `z≤n`.  In the inductive
case, the inductive hypothesis `≤-refl {n}` gives us a proof of `n ≤
n`, and applying `s≤s` to that yields a proof of `suc n ≤ suc n`.

It is a good exercise to prove reflexivity interactively in Emacs,
using holes and the `C-c C-c`, `C-c C-,`, and `C-c C-r` commands.


## Transitivity

The second property to prove about comparison is that it is
transitive: for any naturals `m`, `n`, and `p`, if `m ≤ n` and `n ≤ p`
hold, then `m ≤ p` holds.  Again, `m`, `n`, and `p` are implicit:
<pre class="Agda">{% raw %}<a id="≤-trans"></a><a id="8321" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8321" class="Function">≤-trans</a> <a id="8329" class="Symbol">:</a> <a id="8331" class="Symbol">∀</a> <a id="8333" class="Symbol">{</a><a id="8334" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8334" class="Bound">m</a> <a id="8336" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8336" class="Bound">n</a> <a id="8338" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8338" class="Bound">p</a> <a id="8340" class="Symbol">:</a> <a id="8342" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="8343" class="Symbol">}</a>
  <a id="8347" class="Symbol">→</a> <a id="8349" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8334" class="Bound">m</a> <a id="8351" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="8353" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8336" class="Bound">n</a>
  <a id="8357" class="Symbol">→</a> <a id="8359" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8336" class="Bound">n</a> <a id="8361" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="8363" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8338" class="Bound">p</a>
    <a id="8369" class="Comment">-----</a>
  <a id="8377" class="Symbol">→</a> <a id="8379" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8334" class="Bound">m</a> <a id="8381" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="8383" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8338" class="Bound">p</a>
<a id="8385" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8321" class="Function">≤-trans</a> <a id="8393" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>       <a id="8403" class="Symbol">_</a>          <a id="8414" class="Symbol">=</a>  <a id="8417" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>
<a id="8421" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8321" class="Function">≤-trans</a> <a id="8429" class="Symbol">(</a><a id="8430" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="8434" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8434" class="Bound">m≤n</a><a id="8437" class="Symbol">)</a> <a id="8439" class="Symbol">(</a><a id="8440" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="8444" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8444" class="Bound">n≤p</a><a id="8447" class="Symbol">)</a>  <a id="8450" class="Symbol">=</a>  <a id="8453" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="8457" class="Symbol">(</a><a id="8458" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8321" class="Function">≤-trans</a> <a id="8466" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8434" class="Bound">m≤n</a> <a id="8470" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8444" class="Bound">n≤p</a><a id="8473" class="Symbol">)</a>{% endraw %}</pre>
Here the proof is by induction on the _evidence_ that `m ≤ n`.  In the
base case, the first inequality holds by `z≤n` and must show `zero ≤
p`, which follows immediately by `z≤n`.  In this case, the fact that
`n ≤ p` is irrelevant, and we write `_` as the pattern to indicate
that the corresponding evidence is unused.

In the inductive case, the first inequality holds by `s≤s m≤n`
and the second inequality by `s≤s n≤p`, and so we are given
`suc m ≤ suc n` and `suc n ≤ suc p`, and must show `suc m ≤ suc p`.
The inductive hypothesis `≤-trans m≤n n≤p` establishes
that `m ≤ p`, and our goal follows by applying `s≤s`.

The case `≤-trans (s≤s m≤n) z≤n` cannot arise, since the first
inequality implies the middle value is `suc n` while the second
inequality implies that it is `zero`.  Agda can determine that such a
case cannot arise, and does not require (or permit) it to be listed.

Alternatively, we could make the implicit parameters explicit:
<pre class="Agda">{% raw %}<a id="≤-trans′"></a><a id="9450" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9450" class="Function">≤-trans′</a> <a id="9459" class="Symbol">:</a> <a id="9461" class="Symbol">∀</a> <a id="9463" class="Symbol">(</a><a id="9464" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9464" class="Bound">m</a> <a id="9466" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9466" class="Bound">n</a> <a id="9468" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9468" class="Bound">p</a> <a id="9470" class="Symbol">:</a> <a id="9472" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="9473" class="Symbol">)</a>
  <a id="9477" class="Symbol">→</a> <a id="9479" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9464" class="Bound">m</a> <a id="9481" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="9483" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9466" class="Bound">n</a>
  <a id="9487" class="Symbol">→</a> <a id="9489" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9466" class="Bound">n</a> <a id="9491" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="9493" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9468" class="Bound">p</a>
    <a id="9499" class="Comment">-----</a>
  <a id="9507" class="Symbol">→</a> <a id="9509" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9464" class="Bound">m</a> <a id="9511" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="9513" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9468" class="Bound">p</a>
<a id="9515" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9450" class="Function">≤-trans′</a> <a id="9524" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>    <a id="9532" class="Symbol">_</a>       <a id="9540" class="Symbol">_</a>       <a id="9548" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>       <a id="9558" class="Symbol">_</a>          <a id="9569" class="Symbol">=</a>  <a id="9572" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>
<a id="9576" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9450" class="Function">≤-trans′</a> <a id="9585" class="Symbol">(</a><a id="9586" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="9590" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9590" class="Bound">m</a><a id="9591" class="Symbol">)</a> <a id="9593" class="Symbol">(</a><a id="9594" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="9598" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9598" class="Bound">n</a><a id="9599" class="Symbol">)</a> <a id="9601" class="Symbol">(</a><a id="9602" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="9606" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9606" class="Bound">p</a><a id="9607" class="Symbol">)</a> <a id="9609" class="Symbol">(</a><a id="9610" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="9614" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9614" class="Bound">m≤n</a><a id="9617" class="Symbol">)</a> <a id="9619" class="Symbol">(</a><a id="9620" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="9624" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9624" class="Bound">n≤p</a><a id="9627" class="Symbol">)</a>  <a id="9630" class="Symbol">=</a>  <a id="9633" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="9637" class="Symbol">(</a><a id="9638" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9450" class="Function">≤-trans′</a> <a id="9647" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9590" class="Bound">m</a> <a id="9649" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9598" class="Bound">n</a> <a id="9651" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9606" class="Bound">p</a> <a id="9653" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9614" class="Bound">m≤n</a> <a id="9657" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#9624" class="Bound">n≤p</a><a id="9660" class="Symbol">)</a>{% endraw %}</pre>
One might argue that this is clearer or one might argue that the extra
length obscures the essence of the proof.  We will usually opt for
shorter proofs.

The technique of induction on evidence that a property holds (e.g.,
inducting on evidence that `m ≤ n`)---rather than induction on 
values of which the property holds (e.g., inducting on `m`)---will turn
out to be immensely valuable, and one that we use often.

Again, it is a good exercise to prove transitivity interactively in Emacs,
using holes and the `C-c C-c`, `C-c C-,`, and `C-c C-r` commands.


## Anti-symmetry

The third property to prove about comparison is that it is
antisymmetric: for all naturals `m` and `n`, if both `m ≤ n` and `n ≤
m` hold, then `m ≡ n` holds:
<pre class="Agda">{% raw %}<a id="≤-antisym"></a><a id="10422" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10422" class="Function">≤-antisym</a> <a id="10432" class="Symbol">:</a> <a id="10434" class="Symbol">∀</a> <a id="10436" class="Symbol">{</a><a id="10437" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10437" class="Bound">m</a> <a id="10439" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10439" class="Bound">n</a> <a id="10441" class="Symbol">:</a> <a id="10443" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="10444" class="Symbol">}</a>
  <a id="10448" class="Symbol">→</a> <a id="10450" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10437" class="Bound">m</a> <a id="10452" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="10454" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10439" class="Bound">n</a>
  <a id="10458" class="Symbol">→</a> <a id="10460" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10439" class="Bound">n</a> <a id="10462" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="10464" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10437" class="Bound">m</a>
    <a id="10470" class="Comment">-----</a>
  <a id="10478" class="Symbol">→</a> <a id="10480" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10437" class="Bound">m</a> <a id="10482" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#83" class="Datatype Operator">≡</a> <a id="10484" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10439" class="Bound">n</a>
<a id="10486" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10422" class="Function">≤-antisym</a> <a id="10496" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>       <a id="10506" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>        <a id="10517" class="Symbol">=</a>  <a id="10520" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#140" class="InductiveConstructor">refl</a>
<a id="10525" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10422" class="Function">≤-antisym</a> <a id="10535" class="Symbol">(</a><a id="10536" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="10540" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10540" class="Bound">m≤n</a><a id="10543" class="Symbol">)</a> <a id="10545" class="Symbol">(</a><a id="10546" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="10550" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10550" class="Bound">n≤m</a><a id="10553" class="Symbol">)</a>  <a id="10556" class="Symbol">=</a>  <a id="10559" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1170" class="Function">cong</a> <a id="10564" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="10568" class="Symbol">(</a><a id="10569" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10422" class="Function">≤-antisym</a> <a id="10579" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10540" class="Bound">m≤n</a> <a id="10583" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#10550" class="Bound">n≤m</a><a id="10586" class="Symbol">)</a>{% endraw %}</pre>
Again, the proof is by induction over the evidence that `m ≤ n`
and `n ≤ m` hold.

In the base case, both inequalities hold by `z≤n`, and so we are given
`zero ≤ zero` and `zero ≤ zero` and must show `zero ≡ zero`, which
follows by reflexivity.  (Reflexivity of equality, that is, not
reflexivity of inequality.)

In the inductive case, the first inequality holds by `s≤s m≤n` and the
second inequality holds by `s≤s n≤m`, and so we are given `suc m ≤ suc n`
and `suc n ≤ suc m` and must show `suc m ≡ suc n`.  The inductive
hypothesis `≤-antisym m≤n n≤m` establishes that `m ≡ n`, and our goal
follows by congruence.

#### Exercise `≤-antisym-cases` {#leq-antisym-cases} 

The above proof omits cases where one argument is `z≤n` and one
argument is `s≤s`.  Why is it ok to omit them?

<pre class="Agda">{% raw %}<a id="11398" class="Comment">-- Your code goes here</a>{% endraw %}</pre>


## Total

The fourth property to prove about comparison is that it is total:
for any naturals `m` and `n` either `m ≤ n` or `n ≤ m`, or both if
`m` and `n` are equal.

We specify what it means for inequality to be total:
<pre class="Agda">{% raw %}<a id="11668" class="Keyword">data</a> <a id="Total"></a><a id="11673" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11673" class="Datatype">Total</a> <a id="11679" class="Symbol">(</a><a id="11680" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11680" class="Bound">m</a> <a id="11682" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11682" class="Bound">n</a> <a id="11684" class="Symbol">:</a> <a id="11686" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="11687" class="Symbol">)</a> <a id="11689" class="Symbol">:</a> <a id="11691" class="PrimitiveType">Set</a> <a id="11695" class="Keyword">where</a>

  <a id="Total.forward"></a><a id="11704" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11704" class="InductiveConstructor">forward</a> <a id="11712" class="Symbol">:</a>
      <a id="11720" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11680" class="Bound">m</a> <a id="11722" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="11724" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11682" class="Bound">n</a>
      <a id="11732" class="Comment">---------</a>
    <a id="11746" class="Symbol">→</a> <a id="11748" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11673" class="Datatype">Total</a> <a id="11754" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11680" class="Bound">m</a> <a id="11756" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11682" class="Bound">n</a>

  <a id="Total.flipped"></a><a id="11761" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11761" class="InductiveConstructor">flipped</a> <a id="11769" class="Symbol">:</a>
      <a id="11777" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11682" class="Bound">n</a> <a id="11779" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="11781" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11680" class="Bound">m</a>
      <a id="11789" class="Comment">---------</a>
    <a id="11803" class="Symbol">→</a> <a id="11805" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11673" class="Datatype">Total</a> <a id="11811" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11680" class="Bound">m</a> <a id="11813" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11682" class="Bound">n</a>{% endraw %}</pre>
Evidence that `Total m n` holds is either of the form
`forward m≤n` or `flipped n≤m`, where `m≤n` and `n≤m` are
evidence of `m ≤ n` and `n ≤ m` respectively.

(For those familiar with logic, the above definition
could also be written as a disjunction. Disjunctions will
be introduced in Chapter [Connectives]({{ site.baseurl }}{% link out/plfa/Connectives.md%}).)

This is our first use of a datatype with _parameters_,
in this case `m` and `n`.  It is equivalent to the following
indexed datatype:
<pre class="Agda">{% raw %}<a id="12303" class="Keyword">data</a> <a id="Total′"></a><a id="12308" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12308" class="Datatype">Total′</a> <a id="12315" class="Symbol">:</a> <a id="12317" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a> <a id="12319" class="Symbol">→</a> <a id="12321" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a> <a id="12323" class="Symbol">→</a> <a id="12325" class="PrimitiveType">Set</a> <a id="12329" class="Keyword">where</a>

  <a id="Total′.forward′"></a><a id="12338" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12338" class="InductiveConstructor">forward′</a> <a id="12347" class="Symbol">:</a> <a id="12349" class="Symbol">∀</a> <a id="12351" class="Symbol">{</a><a id="12352" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12352" class="Bound">m</a> <a id="12354" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12354" class="Bound">n</a> <a id="12356" class="Symbol">:</a> <a id="12358" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="12359" class="Symbol">}</a>
    <a id="12365" class="Symbol">→</a> <a id="12367" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12352" class="Bound">m</a> <a id="12369" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="12371" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12354" class="Bound">n</a>
      <a id="12379" class="Comment">----------</a>
    <a id="12394" class="Symbol">→</a> <a id="12396" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12308" class="Datatype">Total′</a> <a id="12403" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12352" class="Bound">m</a> <a id="12405" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12354" class="Bound">n</a>

  <a id="Total′.flipped′"></a><a id="12410" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12410" class="InductiveConstructor">flipped′</a> <a id="12419" class="Symbol">:</a> <a id="12421" class="Symbol">∀</a> <a id="12423" class="Symbol">{</a><a id="12424" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12424" class="Bound">m</a> <a id="12426" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12426" class="Bound">n</a> <a id="12428" class="Symbol">:</a> <a id="12430" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="12431" class="Symbol">}</a>
    <a id="12437" class="Symbol">→</a> <a id="12439" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12426" class="Bound">n</a> <a id="12441" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="12443" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12424" class="Bound">m</a>
      <a id="12451" class="Comment">----------</a>
    <a id="12466" class="Symbol">→</a> <a id="12468" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12308" class="Datatype">Total′</a> <a id="12475" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12424" class="Bound">m</a> <a id="12477" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#12426" class="Bound">n</a>{% endraw %}</pre>
Each parameter of the type translates as an implicit parameter of each
constructor.  Unlike an indexed datatype, where the indexes can vary
(as in `zero ≤ n` and `suc m ≤ suc n`), in a parameterised datatype
the parameters must always be the same (as in `Total m n`).
Parameterised declarations are shorter, easier to read, and
occasionally aid Agda's termination checker, so we will use them in
preference to indexed types when possible.

With that preliminary out of the way, we specify and prove totality:
<pre class="Agda">{% raw %}<a id="≤-total"></a><a id="13012" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13012" class="Function">≤-total</a> <a id="13020" class="Symbol">:</a> <a id="13022" class="Symbol">∀</a> <a id="13024" class="Symbol">(</a><a id="13025" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13025" class="Bound">m</a> <a id="13027" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13027" class="Bound">n</a> <a id="13029" class="Symbol">:</a> <a id="13031" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="13032" class="Symbol">)</a> <a id="13034" class="Symbol">→</a> <a id="13036" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11673" class="Datatype">Total</a> <a id="13042" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13025" class="Bound">m</a> <a id="13044" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13027" class="Bound">n</a>
<a id="13046" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13012" class="Function">≤-total</a> <a id="13054" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>    <a id="13062" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13062" class="Bound">n</a>                         <a id="13088" class="Symbol">=</a>  <a id="13091" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11704" class="InductiveConstructor">forward</a> <a id="13099" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>
<a id="13103" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13012" class="Function">≤-total</a> <a id="13111" class="Symbol">(</a><a id="13112" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="13116" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13116" class="Bound">m</a><a id="13117" class="Symbol">)</a> <a id="13119" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>                      <a id="13145" class="Symbol">=</a>  <a id="13148" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11761" class="InductiveConstructor">flipped</a> <a id="13156" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>
<a id="13160" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13012" class="Function">≤-total</a> <a id="13168" class="Symbol">(</a><a id="13169" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="13173" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13173" class="Bound">m</a><a id="13174" class="Symbol">)</a> <a id="13176" class="Symbol">(</a><a id="13177" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="13181" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13181" class="Bound">n</a><a id="13182" class="Symbol">)</a> <a id="13184" class="Keyword">with</a> <a id="13189" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13012" class="Function">≤-total</a> <a id="13197" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13173" class="Bound">m</a> <a id="13199" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13181" class="Bound">n</a>
<a id="13201" class="Symbol">...</a>                        <a id="13228" class="Symbol">|</a> <a id="13230" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11704" class="InductiveConstructor">forward</a> <a id="13238" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13238" class="Bound">m≤n</a>  <a id="13243" class="Symbol">=</a>  <a id="13246" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11704" class="InductiveConstructor">forward</a> <a id="13254" class="Symbol">(</a><a id="13255" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="13259" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13238" class="Bound">m≤n</a><a id="13262" class="Symbol">)</a>
<a id="13264" class="Symbol">...</a>                        <a id="13291" class="Symbol">|</a> <a id="13293" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11761" class="InductiveConstructor">flipped</a> <a id="13301" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13301" class="Bound">n≤m</a>  <a id="13306" class="Symbol">=</a>  <a id="13309" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11761" class="InductiveConstructor">flipped</a> <a id="13317" class="Symbol">(</a><a id="13318" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="13322" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#13301" class="Bound">n≤m</a><a id="13325" class="Symbol">)</a>{% endraw %}</pre>
In this case the proof is by induction over both the first
and second arguments.  We perform a case analysis:

* _First base case_: If the first argument is `zero` and the
  second argument is `n` then the forward case holds,
  with `z≤n` as evidence that `zero ≤ n`.

* _Second base case_: If the first argument is `suc m` and the
  second argument is `zero` then the flipped case holds, with
  `z≤n` as evidence that `zero ≤ suc m`.

* _Inductive case_: If the first argument is `suc m` and the
  second argument is `suc n`, then the inductive hypothesis
  `≤-total m n` establishes one of the following:

  + The forward case of the inductive hypothesis holds with `m≤n` as
    evidence that `m ≤ n`, from which it follows that the forward case of the
    proposition holds with `s≤s m≤n` as evidence that `suc m ≤ suc n`.

  + The flipped case of the inductive hypothesis holds with `n≤m` as
    evidence that `n ≤ m`, from which it follows that the flipped case of the
    proposition holds with `s≤s n≤m` as evidence that `suc n ≤ suc m`.

This is our first use of the `with` clause in Agda.  The keyword
`with` is followed by an expression and one or more subsequent lines.
Each line begins with an ellipsis (`...`) and a vertical bar (`|`),
followed by a pattern to be matched against the expression
and the right-hand side of the equation.

Every use of `with` is equivalent to defining a helper function.  For
example, the definition above is equivalent to the following:
<pre class="Agda">{% raw %}<a id="≤-total′"></a><a id="14833" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14833" class="Function">≤-total′</a> <a id="14842" class="Symbol">:</a> <a id="14844" class="Symbol">∀</a> <a id="14846" class="Symbol">(</a><a id="14847" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14847" class="Bound">m</a> <a id="14849" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14849" class="Bound">n</a> <a id="14851" class="Symbol">:</a> <a id="14853" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="14854" class="Symbol">)</a> <a id="14856" class="Symbol">→</a> <a id="14858" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11673" class="Datatype">Total</a> <a id="14864" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14847" class="Bound">m</a> <a id="14866" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14849" class="Bound">n</a>
<a id="14868" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14833" class="Function">≤-total′</a> <a id="14877" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>    <a id="14885" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14885" class="Bound">n</a>        <a id="14894" class="Symbol">=</a>  <a id="14897" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11704" class="InductiveConstructor">forward</a> <a id="14905" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>
<a id="14909" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14833" class="Function">≤-total′</a> <a id="14918" class="Symbol">(</a><a id="14919" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="14923" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14923" class="Bound">m</a><a id="14924" class="Symbol">)</a> <a id="14926" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>     <a id="14935" class="Symbol">=</a>  <a id="14938" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11761" class="InductiveConstructor">flipped</a> <a id="14946" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>
<a id="14950" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14833" class="Function">≤-total′</a> <a id="14959" class="Symbol">(</a><a id="14960" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="14964" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14964" class="Bound">m</a><a id="14965" class="Symbol">)</a> <a id="14967" class="Symbol">(</a><a id="14968" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="14972" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14972" class="Bound">n</a><a id="14973" class="Symbol">)</a>  <a id="14976" class="Symbol">=</a>  <a id="14979" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15011" class="Function">helper</a> <a id="14986" class="Symbol">(</a><a id="14987" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14833" class="Function">≤-total′</a> <a id="14996" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14964" class="Bound">m</a> <a id="14998" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14972" class="Bound">n</a><a id="14999" class="Symbol">)</a>
  <a id="15003" class="Keyword">where</a>
  <a id="15011" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15011" class="Function">helper</a> <a id="15018" class="Symbol">:</a> <a id="15020" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11673" class="Datatype">Total</a> <a id="15026" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14964" class="Bound">m</a> <a id="15028" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14972" class="Bound">n</a> <a id="15030" class="Symbol">→</a> <a id="15032" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11673" class="Datatype">Total</a> <a id="15038" class="Symbol">(</a><a id="15039" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="15043" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14964" class="Bound">m</a><a id="15044" class="Symbol">)</a> <a id="15046" class="Symbol">(</a><a id="15047" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="15051" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#14972" class="Bound">n</a><a id="15052" class="Symbol">)</a>
  <a id="15056" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15011" class="Function">helper</a> <a id="15063" class="Symbol">(</a><a id="15064" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11704" class="InductiveConstructor">forward</a> <a id="15072" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15072" class="Bound">m≤n</a><a id="15075" class="Symbol">)</a>  <a id="15078" class="Symbol">=</a>  <a id="15081" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11704" class="InductiveConstructor">forward</a> <a id="15089" class="Symbol">(</a><a id="15090" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="15094" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15072" class="Bound">m≤n</a><a id="15097" class="Symbol">)</a>
  <a id="15101" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15011" class="Function">helper</a> <a id="15108" class="Symbol">(</a><a id="15109" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11761" class="InductiveConstructor">flipped</a> <a id="15117" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15117" class="Bound">n≤m</a><a id="15120" class="Symbol">)</a>  <a id="15123" class="Symbol">=</a>  <a id="15126" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11761" class="InductiveConstructor">flipped</a> <a id="15134" class="Symbol">(</a><a id="15135" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="15139" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15117" class="Bound">n≤m</a><a id="15142" class="Symbol">)</a>{% endraw %}</pre>
This is also our first use of a `where` clause in Agda.  The keyword `where` is
followed by one or more definitions, which must be indented.  Any variables
bound on the left-hand side of the preceding equation (in this case, `m` and
`n`) are in scope within the nested definition, and any identifiers bound in the
nested definition (in this case, `helper`) are in scope in the right-hand side
of the preceding equation.

If both arguments are equal, then both cases hold and we could return evidence
of either.  In the code above we return the forward case, but there is a
variant that returns the flipped case:
<pre class="Agda">{% raw %}<a id="≤-total″"></a><a id="15780" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15780" class="Function">≤-total″</a> <a id="15789" class="Symbol">:</a> <a id="15791" class="Symbol">∀</a> <a id="15793" class="Symbol">(</a><a id="15794" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15794" class="Bound">m</a> <a id="15796" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15796" class="Bound">n</a> <a id="15798" class="Symbol">:</a> <a id="15800" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="15801" class="Symbol">)</a> <a id="15803" class="Symbol">→</a> <a id="15805" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11673" class="Datatype">Total</a> <a id="15811" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15794" class="Bound">m</a> <a id="15813" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15796" class="Bound">n</a>
<a id="15815" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15780" class="Function">≤-total″</a> <a id="15824" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15824" class="Bound">m</a>       <a id="15832" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>                      <a id="15858" class="Symbol">=</a>  <a id="15861" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11761" class="InductiveConstructor">flipped</a> <a id="15869" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>
<a id="15873" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15780" class="Function">≤-total″</a> <a id="15882" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>    <a id="15890" class="Symbol">(</a><a id="15891" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="15895" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15895" class="Bound">n</a><a id="15896" class="Symbol">)</a>                   <a id="15916" class="Symbol">=</a>  <a id="15919" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11704" class="InductiveConstructor">forward</a> <a id="15927" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1257" class="InductiveConstructor">z≤n</a>
<a id="15931" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15780" class="Function">≤-total″</a> <a id="15940" class="Symbol">(</a><a id="15941" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="15945" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15945" class="Bound">m</a><a id="15946" class="Symbol">)</a> <a id="15948" class="Symbol">(</a><a id="15949" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="15953" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15953" class="Bound">n</a><a id="15954" class="Symbol">)</a> <a id="15956" class="Keyword">with</a> <a id="15961" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15780" class="Function">≤-total″</a> <a id="15970" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15945" class="Bound">m</a> <a id="15972" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#15953" class="Bound">n</a>
<a id="15974" class="Symbol">...</a>                        <a id="16001" class="Symbol">|</a> <a id="16003" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11704" class="InductiveConstructor">forward</a> <a id="16011" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16011" class="Bound">m≤n</a>   <a id="16017" class="Symbol">=</a>  <a id="16020" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11704" class="InductiveConstructor">forward</a> <a id="16028" class="Symbol">(</a><a id="16029" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="16033" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16011" class="Bound">m≤n</a><a id="16036" class="Symbol">)</a>
<a id="16038" class="Symbol">...</a>                        <a id="16065" class="Symbol">|</a> <a id="16067" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11761" class="InductiveConstructor">flipped</a> <a id="16075" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16075" class="Bound">n≤m</a>   <a id="16081" class="Symbol">=</a>  <a id="16084" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#11761" class="InductiveConstructor">flipped</a> <a id="16092" class="Symbol">(</a><a id="16093" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="16097" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16075" class="Bound">n≤m</a><a id="16100" class="Symbol">)</a>{% endraw %}</pre>
It differs from the original code in that it pattern
matches on the second argument before the first argument.


## Monotonicity

If one bumps into both an operator and an ordering at a party, one may ask if
the operator is _monotonic_ with regard to the ordering.  For example, addition
is monotonic with regard to inequality, meaning:

    ∀ {m n p q : ℕ} → m ≤ n → p ≤ q → m + p ≤ n + q

The proof is straightforward using the techniques we have learned, and is best
broken into three parts. First, we deal with the special case of showing
addition is monotonic on the right:
<pre class="Agda">{% raw %}<a id="+-monoʳ-≤"></a><a id="16705" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16705" class="Function">+-monoʳ-≤</a> <a id="16715" class="Symbol">:</a> <a id="16717" class="Symbol">∀</a> <a id="16719" class="Symbol">(</a><a id="16720" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16720" class="Bound">n</a> <a id="16722" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16722" class="Bound">p</a> <a id="16724" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16724" class="Bound">q</a> <a id="16726" class="Symbol">:</a> <a id="16728" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="16729" class="Symbol">)</a>
  <a id="16733" class="Symbol">→</a> <a id="16735" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16722" class="Bound">p</a> <a id="16737" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="16739" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16724" class="Bound">q</a>
    <a id="16745" class="Comment">-------------</a>
  <a id="16761" class="Symbol">→</a> <a id="16763" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16720" class="Bound">n</a> <a id="16765" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#230" class="Primitive Operator">+</a> <a id="16767" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16722" class="Bound">p</a> <a id="16769" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="16771" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16720" class="Bound">n</a> <a id="16773" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#230" class="Primitive Operator">+</a> <a id="16775" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16724" class="Bound">q</a>
<a id="16777" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16705" class="Function">+-monoʳ-≤</a> <a id="16787" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>    <a id="16795" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16795" class="Bound">p</a> <a id="16797" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16797" class="Bound">q</a> <a id="16799" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16799" class="Bound">p≤q</a>  <a id="16804" class="Symbol">=</a>  <a id="16807" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16799" class="Bound">p≤q</a>
<a id="16811" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16705" class="Function">+-monoʳ-≤</a> <a id="16821" class="Symbol">(</a><a id="16822" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="16826" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16826" class="Bound">n</a><a id="16827" class="Symbol">)</a> <a id="16829" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16829" class="Bound">p</a> <a id="16831" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16831" class="Bound">q</a> <a id="16833" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16833" class="Bound">p≤q</a>  <a id="16838" class="Symbol">=</a>  <a id="16841" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1306" class="InductiveConstructor">s≤s</a> <a id="16845" class="Symbol">(</a><a id="16846" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16705" class="Function">+-monoʳ-≤</a> <a id="16856" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16826" class="Bound">n</a> <a id="16858" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16829" class="Bound">p</a> <a id="16860" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16831" class="Bound">q</a> <a id="16862" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16833" class="Bound">p≤q</a><a id="16865" class="Symbol">)</a>{% endraw %}</pre>
The proof is by induction on the first argument.

* _Base case_: The first argument is `zero` in which case
  `zero + p ≤ zero + q` simplifies to `p ≤ q`, the evidence
  for which is given by the argument `p≤q`.

* _Inductive case_: The first argument is `suc n`, in which case
  `suc n + p ≤ suc n + q` simplifies to `suc (n + p) ≤ suc (n + q)`.
  The inductive hypothesis `+-monoʳ-≤ n p q p≤q` establishes that
  `n + p ≤ n + q`, and our goal follows by applying `s≤s`.

Second, we deal with the special case of showing addition is
monotonic on the left. This follows from the previous
result and the commutativity of addition:
<pre class="Agda">{% raw %}<a id="+-monoˡ-≤"></a><a id="17521" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17521" class="Function">+-monoˡ-≤</a> <a id="17531" class="Symbol">:</a> <a id="17533" class="Symbol">∀</a> <a id="17535" class="Symbol">(</a><a id="17536" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17536" class="Bound">m</a> <a id="17538" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17538" class="Bound">n</a> <a id="17540" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17540" class="Bound">p</a> <a id="17542" class="Symbol">:</a> <a id="17544" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="17545" class="Symbol">)</a>
  <a id="17549" class="Symbol">→</a> <a id="17551" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17536" class="Bound">m</a> <a id="17553" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="17555" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17538" class="Bound">n</a>
    <a id="17561" class="Comment">-------------</a>
  <a id="17577" class="Symbol">→</a> <a id="17579" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17536" class="Bound">m</a> <a id="17581" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#230" class="Primitive Operator">+</a> <a id="17583" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17540" class="Bound">p</a> <a id="17585" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="17587" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17538" class="Bound">n</a> <a id="17589" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#230" class="Primitive Operator">+</a> <a id="17591" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17540" class="Bound">p</a>
<a id="17593" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17521" class="Function">+-monoˡ-≤</a> <a id="17603" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17603" class="Bound">m</a> <a id="17605" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17605" class="Bound">n</a> <a id="17607" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17607" class="Bound">p</a> <a id="17609" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17609" class="Bound">m≤n</a>  <a id="17614" class="Keyword">rewrite</a> <a id="17622" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#9708" class="Function">+-comm</a> <a id="17629" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17603" class="Bound">m</a> <a id="17631" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17607" class="Bound">p</a> <a id="17633" class="Symbol">|</a> <a id="17635" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#9708" class="Function">+-comm</a> <a id="17642" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17605" class="Bound">n</a> <a id="17644" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17607" class="Bound">p</a>  <a id="17647" class="Symbol">=</a> <a id="17649" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16705" class="Function">+-monoʳ-≤</a> <a id="17659" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17607" class="Bound">p</a> <a id="17661" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17603" class="Bound">m</a> <a id="17663" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17605" class="Bound">n</a> <a id="17665" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17609" class="Bound">m≤n</a>{% endraw %}</pre>
Rewriting by `+-comm m p` and `+-comm n p` converts `m + p ≤ n + p` into
`p + m ≤ p + n`, which is proved by invoking `+-monoʳ-≤ p m n m≤n`.

Third, we combine the two previous results:
<pre class="Agda">{% raw %}<a id="+-mono-≤"></a><a id="17879" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17879" class="Function">+-mono-≤</a> <a id="17888" class="Symbol">:</a> <a id="17890" class="Symbol">∀</a> <a id="17892" class="Symbol">(</a><a id="17893" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17893" class="Bound">m</a> <a id="17895" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17895" class="Bound">n</a> <a id="17897" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17897" class="Bound">p</a> <a id="17899" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17899" class="Bound">q</a> <a id="17901" class="Symbol">:</a> <a id="17903" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="17904" class="Symbol">)</a>
  <a id="17908" class="Symbol">→</a> <a id="17910" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17893" class="Bound">m</a> <a id="17912" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="17914" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17895" class="Bound">n</a>
  <a id="17918" class="Symbol">→</a> <a id="17920" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17897" class="Bound">p</a> <a id="17922" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="17924" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17899" class="Bound">q</a>
    <a id="17930" class="Comment">-------------</a>
  <a id="17946" class="Symbol">→</a> <a id="17948" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17893" class="Bound">m</a> <a id="17950" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#230" class="Primitive Operator">+</a> <a id="17952" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17897" class="Bound">p</a> <a id="17954" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#1230" class="Datatype Operator">≤</a> <a id="17956" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17895" class="Bound">n</a> <a id="17958" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#230" class="Primitive Operator">+</a> <a id="17960" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17899" class="Bound">q</a>
<a id="17962" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17879" class="Function">+-mono-≤</a> <a id="17971" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17971" class="Bound">m</a> <a id="17973" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17973" class="Bound">n</a> <a id="17975" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17975" class="Bound">p</a> <a id="17977" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17977" class="Bound">q</a> <a id="17979" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17979" class="Bound">m≤n</a> <a id="17983" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17983" class="Bound">p≤q</a>  <a id="17988" class="Symbol">=</a>  <a id="17991" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#8321" class="Function">≤-trans</a> <a id="17999" class="Symbol">(</a><a id="18000" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17521" class="Function">+-monoˡ-≤</a> <a id="18010" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17971" class="Bound">m</a> <a id="18012" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17973" class="Bound">n</a> <a id="18014" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17975" class="Bound">p</a> <a id="18016" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17979" class="Bound">m≤n</a><a id="18019" class="Symbol">)</a> <a id="18021" class="Symbol">(</a><a id="18022" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#16705" class="Function">+-monoʳ-≤</a> <a id="18032" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17973" class="Bound">n</a> <a id="18034" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17975" class="Bound">p</a> <a id="18036" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17977" class="Bound">q</a> <a id="18038" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#17983" class="Bound">p≤q</a><a id="18041" class="Symbol">)</a>{% endraw %}</pre>
Invoking `+-monoˡ-≤ m n p m≤n` proves `m + p ≤ n + p` and invoking
`+-monoʳ-≤ n p q p≤q` proves `n + p ≤ n + q`, and combining these with
transitivity proves `m + p ≤ n + q`, as was to be shown.


#### Exercise `*-mono-≤` (stretch)

Show that multiplication is monotonic with regard to inequality.

<pre class="Agda">{% raw %}<a id="18366" class="Comment">-- Your code goes here</a>{% endraw %}</pre>


## Strict inequality {#strict-inequality}

We can define strict inequality similarly to inequality:
<pre class="Agda">{% raw %}<a id="18515" class="Keyword">infix</a> <a id="18521" class="Number">4</a> <a id="18523" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18533" class="Datatype Operator">_&lt;_</a>

<a id="18528" class="Keyword">data</a> <a id="_&lt;_"></a><a id="18533" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18533" class="Datatype Operator">_&lt;_</a> <a id="18537" class="Symbol">:</a> <a id="18539" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a> <a id="18541" class="Symbol">→</a> <a id="18543" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a> <a id="18545" class="Symbol">→</a> <a id="18547" class="PrimitiveType">Set</a> <a id="18551" class="Keyword">where</a>

  <a id="_&lt;_.z&lt;s"></a><a id="18560" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18560" class="InductiveConstructor">z&lt;s</a> <a id="18564" class="Symbol">:</a> <a id="18566" class="Symbol">∀</a> <a id="18568" class="Symbol">{</a><a id="18569" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18569" class="Bound">n</a> <a id="18571" class="Symbol">:</a> <a id="18573" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="18574" class="Symbol">}</a>
      <a id="18582" class="Comment">------------</a>
    <a id="18599" class="Symbol">→</a> <a id="18601" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a> <a id="18606" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18533" class="Datatype Operator">&lt;</a> <a id="18608" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="18612" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18569" class="Bound">n</a>

  <a id="_&lt;_.s&lt;s"></a><a id="18617" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18617" class="InductiveConstructor">s&lt;s</a> <a id="18621" class="Symbol">:</a> <a id="18623" class="Symbol">∀</a> <a id="18625" class="Symbol">{</a><a id="18626" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18626" class="Bound">m</a> <a id="18628" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18628" class="Bound">n</a> <a id="18630" class="Symbol">:</a> <a id="18632" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="18633" class="Symbol">}</a>
    <a id="18639" class="Symbol">→</a> <a id="18641" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18626" class="Bound">m</a> <a id="18643" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18533" class="Datatype Operator">&lt;</a> <a id="18645" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18628" class="Bound">n</a>
      <a id="18653" class="Comment">-------------</a>
    <a id="18671" class="Symbol">→</a> <a id="18673" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="18677" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18626" class="Bound">m</a> <a id="18679" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18533" class="Datatype Operator">&lt;</a> <a id="18681" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="18685" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#18628" class="Bound">n</a>{% endraw %}</pre>
The key difference is that zero is less than the successor of an
arbitrary number, but is not less than zero.

Clearly, strict inequality is not reflexive. However it is
_irreflexive_ in that `n < n` never holds for any value of `n`.
Like inequality, strict inequality is transitive.
Strict inequality is not total, but satisfies the closely related property of
_trichotomy_: for any `m` and `n`, exactly one of `m < n`, `m ≡ n`, or `m > n`
holds (where we define `m > n` to hold exactly when `n < m`).
It is also monotonic with regards to addition and multiplication.

Most of the above are considered in exercises below.  Irreflexivity
requires negation, as does the fact that the three cases in
trichotomy are mutually exclusive, so those points are deferred to
Chapter [Negation]({{ site.baseurl }}{% link out/plfa/Negation.md%}).

It is straightforward to show that `suc m ≤ n` implies `m < n`,
and conversely.  One can then give an alternative derivation of the
properties of strict inequality, such as transitivity, by
exploiting the corresponding properties of inequality.

#### Exercise `<-trans` (recommended) {#less-trans}

Show that strict inequality is transitive.

<pre class="Agda">{% raw %}<a id="19855" class="Comment">-- Your code goes here</a>{% endraw %}</pre>

#### Exercise `trichotomy` {#trichotomy}

Show that strict inequality satisfies a weak version of trichotomy, in
the sense that for any `m` and `n` that one of the following holds:
  * `m < n`,
  * `m ≡ n`, or
  * `m > n`.

Define `m > n` to be the same as `n < m`.
You will need a suitable data declaration,
similar to that used for totality.
(We will show that the three cases are exclusive after we introduce
[negation]({{ site.baseurl }}{% link out/plfa/Negation.md%}).)

<pre class="Agda">{% raw %}<a id="20344" class="Comment">-- Your code goes here</a>{% endraw %}</pre>

#### Exercise `+-mono-<` {#plus-mono-less}

Show that addition is monotonic with respect to strict inequality.
As with inequality, some additional definitions may be required.

<pre class="Agda">{% raw %}<a id="20569" class="Comment">-- Your code goes here</a>{% endraw %}</pre>

#### Exercise `≤-iff-<` (recommended) {#leq-iff-less}

Show that `suc m ≤ n` implies `m < n`, and conversely.

<pre class="Agda">{% raw %}<a id="20728" class="Comment">-- Your code goes here</a>{% endraw %}</pre>

#### Exercise `<-trans-revisited` {#less-trans-revisited}

Give an alternative proof that strict inequality is transitive,
using the relation between strict inequality and inequality and
the fact that inequality is transitive.

<pre class="Agda">{% raw %}<a id="21004" class="Comment">-- Your code goes here</a>{% endraw %}</pre>


## Even and odd

As a further example, let's specify even and odd numbers.  Inequality
and strict inequality are _binary relations_, while even and odd are
_unary relations_, sometimes called _predicates_:
<pre class="Agda">{% raw %}<a id="21259" class="Keyword">data</a> <a id="even"></a><a id="21264" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21264" class="Datatype">even</a> <a id="21269" class="Symbol">:</a> <a id="21271" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a> <a id="21273" class="Symbol">→</a> <a id="21275" class="PrimitiveType">Set</a>
<a id="21279" class="Keyword">data</a> <a id="odd"></a><a id="21284" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21284" class="Datatype">odd</a>  <a id="21289" class="Symbol">:</a> <a id="21291" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a> <a id="21293" class="Symbol">→</a> <a id="21295" class="PrimitiveType">Set</a>

<a id="21300" class="Keyword">data</a> <a id="21305" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21264" class="Datatype">even</a> <a id="21310" class="Keyword">where</a>

  <a id="even.zero"></a><a id="21319" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21319" class="InductiveConstructor">zero</a> <a id="21324" class="Symbol">:</a>
      <a id="21332" class="Comment">---------</a>
      <a id="21348" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21264" class="Datatype">even</a> <a id="21353" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a>

  <a id="even.suc"></a><a id="21361" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21361" class="InductiveConstructor">suc</a>  <a id="21366" class="Symbol">:</a> <a id="21368" class="Symbol">∀</a> <a id="21370" class="Symbol">{</a><a id="21371" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21371" class="Bound">n</a> <a id="21373" class="Symbol">:</a> <a id="21375" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="21376" class="Symbol">}</a>
    <a id="21382" class="Symbol">→</a> <a id="21384" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21284" class="Datatype">odd</a> <a id="21388" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21371" class="Bound">n</a>
      <a id="21396" class="Comment">------------</a>
    <a id="21413" class="Symbol">→</a> <a id="21415" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21264" class="Datatype">even</a> <a id="21420" class="Symbol">(</a><a id="21421" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="21425" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21371" class="Bound">n</a><a id="21426" class="Symbol">)</a>

<a id="21429" class="Keyword">data</a> <a id="21434" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21284" class="Datatype">odd</a> <a id="21438" class="Keyword">where</a>

  <a id="odd.suc"></a><a id="21447" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21447" class="InductiveConstructor">suc</a>   <a id="21453" class="Symbol">:</a> <a id="21455" class="Symbol">∀</a> <a id="21457" class="Symbol">{</a><a id="21458" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21458" class="Bound">n</a> <a id="21460" class="Symbol">:</a> <a id="21462" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="21463" class="Symbol">}</a>
    <a id="21469" class="Symbol">→</a> <a id="21471" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21264" class="Datatype">even</a> <a id="21476" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21458" class="Bound">n</a>
      <a id="21484" class="Comment">-----------</a>
    <a id="21500" class="Symbol">→</a> <a id="21502" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21284" class="Datatype">odd</a> <a id="21506" class="Symbol">(</a><a id="21507" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a> <a id="21511" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21458" class="Bound">n</a><a id="21512" class="Symbol">)</a>{% endraw %}</pre>
A number is even if it is zero or the successor of an odd number,
and odd if it is the successor of an even number.

This is our first use of a mutually recursive datatype declaration.
Since each identifier must be defined before it is used, we first
declare the indexed types `even` and `odd` (omitting the `where`
keyword and the declarations of the constructors) and then
declare the constructors (omitting the signatures `ℕ → Set`
which were given earlier).

This is also our first use of _overloaded_ constructors,
that is, using the same name for constructors of different types.
Here `suc` means one of three constructors:

    suc : ℕ → ℕ

    suc : ∀ {n : ℕ}
      → odd n
        ------------
      → even (suc n)

    suc : ∀ {n : ℕ}
      → even n
        -----------
      → odd (suc n)

Similarly, `zero` refers to one of two constructors. Due to how it
does type inference, Agda does not allow overloading of defined names,
but does allow overloading of constructors.  It is recommended that
one restrict overloading to related meanings, as we have done here,
but it is not required.

We show that the sum of two even numbers is even:
<pre class="Agda">{% raw %}<a id="e+e≡e"></a><a id="22688" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22688" class="Function">e+e≡e</a> <a id="22694" class="Symbol">:</a> <a id="22696" class="Symbol">∀</a> <a id="22698" class="Symbol">{</a><a id="22699" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22699" class="Bound">m</a> <a id="22701" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22701" class="Bound">n</a> <a id="22703" class="Symbol">:</a> <a id="22705" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="22706" class="Symbol">}</a>
  <a id="22710" class="Symbol">→</a> <a id="22712" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21264" class="Datatype">even</a> <a id="22717" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22699" class="Bound">m</a>
  <a id="22721" class="Symbol">→</a> <a id="22723" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21264" class="Datatype">even</a> <a id="22728" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22701" class="Bound">n</a>
    <a id="22734" class="Comment">------------</a>
  <a id="22749" class="Symbol">→</a> <a id="22751" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21264" class="Datatype">even</a> <a id="22756" class="Symbol">(</a><a id="22757" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22699" class="Bound">m</a> <a id="22759" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#230" class="Primitive Operator">+</a> <a id="22761" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22701" class="Bound">n</a><a id="22762" class="Symbol">)</a>

<a id="o+e≡o"></a><a id="22765" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22765" class="Function">o+e≡o</a> <a id="22771" class="Symbol">:</a> <a id="22773" class="Symbol">∀</a> <a id="22775" class="Symbol">{</a><a id="22776" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22776" class="Bound">m</a> <a id="22778" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22778" class="Bound">n</a> <a id="22780" class="Symbol">:</a> <a id="22782" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="22783" class="Symbol">}</a>
  <a id="22787" class="Symbol">→</a> <a id="22789" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21284" class="Datatype">odd</a> <a id="22793" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22776" class="Bound">m</a>
  <a id="22797" class="Symbol">→</a> <a id="22799" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21264" class="Datatype">even</a> <a id="22804" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22778" class="Bound">n</a>
    <a id="22810" class="Comment">-----------</a>
  <a id="22824" class="Symbol">→</a> <a id="22826" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21284" class="Datatype">odd</a> <a id="22830" class="Symbol">(</a><a id="22831" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22776" class="Bound">m</a> <a id="22833" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#230" class="Primitive Operator">+</a> <a id="22835" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22778" class="Bound">n</a><a id="22836" class="Symbol">)</a>

<a id="22839" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22688" class="Function">e+e≡e</a> <a id="22845" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21319" class="InductiveConstructor">zero</a>     <a id="22854" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22854" class="Bound">en</a>  <a id="22858" class="Symbol">=</a>  <a id="22861" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22854" class="Bound">en</a>
<a id="22864" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22688" class="Function">e+e≡e</a> <a id="22870" class="Symbol">(</a><a id="22871" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21361" class="InductiveConstructor">suc</a> <a id="22875" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22875" class="Bound">om</a><a id="22877" class="Symbol">)</a> <a id="22879" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22879" class="Bound">en</a>  <a id="22883" class="Symbol">=</a>  <a id="22886" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21361" class="InductiveConstructor">suc</a> <a id="22890" class="Symbol">(</a><a id="22891" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22765" class="Function">o+e≡o</a> <a id="22897" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22875" class="Bound">om</a> <a id="22900" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22879" class="Bound">en</a><a id="22902" class="Symbol">)</a>

<a id="22905" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22765" class="Function">o+e≡o</a> <a id="22911" class="Symbol">(</a><a id="22912" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21447" class="InductiveConstructor">suc</a> <a id="22916" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22916" class="Bound">em</a><a id="22918" class="Symbol">)</a> <a id="22920" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22920" class="Bound">en</a>  <a id="22924" class="Symbol">=</a>  <a id="22927" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#21447" class="InductiveConstructor">suc</a> <a id="22931" class="Symbol">(</a><a id="22932" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22688" class="Function">e+e≡e</a> <a id="22938" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22916" class="Bound">em</a> <a id="22941" href="{% endraw %}{{ site.baseurl }}{% link out/plfa/Relations.md %}{% raw %}#22920" class="Bound">en</a><a id="22943" class="Symbol">)</a>{% endraw %}</pre>
Corresponding to the mutually recursive types, we use two mutually recursive
functions, one to show that the sum of two even numbers is even, and the other
to show that the sum of an odd and an even number is odd.

This is our first use of mutually recursive functions.  Since each identifier
must be defined before it is used, we first give the signatures for both
functions and then the equations that define them.

To show that the sum of two even numbers is even, consider the
evidence that the first number is even. If it is because it is zero,
then the sum is even because the second number is even.  If it is
because it is the successor of an odd number, then the result is even
because it is the successor of the sum of an odd and an even number,
which is odd.

To show that the sum of an odd and even number is odd, consider the
evidence that the first number is odd. If it is because it is the
successor of an even number, then the result is odd because it is the
successor of the sum of two even numbers, which is even.

#### Exercise `o+o≡e` (stretch) {#odd-plus-odd}

Show that the sum of two odd numbers is even.

<pre class="Agda">{% raw %}<a id="24097" class="Comment">-- Your code goes here</a>{% endraw %}</pre>

#### Exercise `Bin-predicates` (stretch) {#Bin-predicates}

Recall that 
Exercise [Bin]({{ site.baseurl }}{% link out/plfa/Naturals.md%}#Bin)
defines a datatype `Bin` of bitstrings representing natural numbers.
Representations are not unique due to leading zeros.
Hence, eleven may be represented by both of the following:

    x1 x1 x0 x1 nil
    x1 x1 x0 x1 x0 x0 nil

Define a predicate

    Can : Bin → Set

over all bitstrings that holds if the bitstring is canonical, meaning
it has no leading zeros; the first representation of eleven above is
canonical, and the second is not.  To define it, you will need an
auxiliary predicate

    One : Bin → Set

that holds only if the bistring has a leading one.  A bitstring is
canonical if it has a leading one (representing a positive number) or
if it consists of a single zero (representing zero).

Show that increment preserves canonical bitstrings:

    Can x
    ------------
    Can (inc x)

Show that converting a natural to a bitstring always yields a
canonical bitstring:

    ----------
    Can (to n)

Show that converting a canonical bitstring to a natural
and back is the identity:

    Can x
    ---------------
    to (from x) ≡ x

(Hint: For each of these, you may first need to prove related
properties of `One`.)

<pre class="Agda">{% raw %}<a id="25391" class="Comment">-- Your code goes here</a>{% endraw %}</pre>

## Standard library

Definitions similar to those in this chapter can be found in the standard library:
<pre class="Agda">{% raw %}<a id="25543" class="Keyword">import</a> <a id="25550" href="https://agda.github.io/agda-stdlib/Data.Nat.html" class="Module">Data.Nat</a> <a id="25559" class="Keyword">using</a> <a id="25565" class="Symbol">(</a><a id="25566" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#845" class="Datatype Operator">_≤_</a><a id="25569" class="Symbol">;</a> <a id="25571" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#868" class="InductiveConstructor">z≤n</a><a id="25574" class="Symbol">;</a> <a id="25576" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#910" class="InductiveConstructor">s≤s</a><a id="25579" class="Symbol">)</a>
<a id="25581" class="Keyword">import</a> <a id="25588" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html" class="Module">Data.Nat.Properties</a> <a id="25608" class="Keyword">using</a> <a id="25614" class="Symbol">(</a><a id="25615" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#2115" class="Function">≤-refl</a><a id="25621" class="Symbol">;</a> <a id="25623" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#2308" class="Function">≤-trans</a><a id="25630" class="Symbol">;</a> <a id="25632" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#2165" class="Function">≤-antisym</a><a id="25641" class="Symbol">;</a> <a id="25643" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#2420" class="Function">≤-total</a><a id="25650" class="Symbol">;</a>
                                  <a id="25686" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#12667" class="Function">+-monoʳ-≤</a><a id="25695" class="Symbol">;</a> <a id="25697" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#12577" class="Function">+-monoˡ-≤</a><a id="25706" class="Symbol">;</a> <a id="25708" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#12421" class="Function">+-mono-≤</a><a id="25716" class="Symbol">)</a>{% endraw %}</pre>
In the standard library, `≤-total` is formalised in terms of
disjunction (which we define in
Chapter [Connectives]({{ site.baseurl }}{% link out/plfa/Connectives.md%})),
and `+-monoʳ-≤`, `+-monoˡ-≤`, `+-mono-≤` are proved differently than here,
and more arguments are implicit.


## Unicode

This chapter uses the following unicode:

    ≤  U+2264  LESS-THAN OR EQUAL TO (\<=, \le)
    ≥  U+2265  GREATER-THAN OR EQUAL TO (\>=, \ge)
    ˡ  U+02E1  MODIFIER LETTER SMALL L (\^l)
    ʳ  U+02B3  MODIFIER LETTER SMALL R (\^r)

The commands `\^l` and `\^r` give access to a variety of superscript
leftward and rightward arrows in addition to superscript letters `l` and `r`.
