---
src       : tspl/PUC-Assignment3.lagda
title     : "PUC-Assignment3: PUC Assignment 3"
layout    : page
permalink : /PUC-Assignment3/
---

<pre class="Agda">{% raw %}<a id="118" class="Keyword">module</a> <a id="125" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}" class="Module">PUC-Assignment3</a> <a id="141" class="Keyword">where</a>{% endraw %}</pre>

## YOUR NAME AND EMAIL GOES HERE

## Introduction

<!-- This assignment is due **4pm Thursday 1 November** (Week 7). -->

You must do _all_ the exercises labelled "(recommended)".

Exercises labelled "(stretch)" are there to provide an extra challenge.
You don't need to do all of these, but should attempt at least a few.

Exercises without a label are optional, and may be done if you want
some extra practice.

<!-- Submit your homework using the "submit" command. -->
Please ensure your files execute correctly under Agda!

## Imports

<pre class="Agda">{% raw %}<a id="712" class="Keyword">import</a> <a id="719" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html" class="Module">Relation.Binary.PropositionalEquality</a> <a id="757" class="Symbol">as</a> <a id="760" class="Module">Eq</a>
<a id="763" class="Keyword">open</a> <a id="768" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html" class="Module">Eq</a> <a id="771" class="Keyword">using</a> <a id="777" class="Symbol">(</a><a id="778" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#83" class="Datatype Operator">_≡_</a><a id="781" class="Symbol">;</a> <a id="783" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Equality.html#140" class="InductiveConstructor">refl</a><a id="787" class="Symbol">;</a> <a id="789" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#1170" class="Function">cong</a><a id="793" class="Symbol">;</a> <a id="795" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.Core.html#838" class="Function">sym</a><a id="798" class="Symbol">)</a>
<a id="800" class="Keyword">open</a> <a id="805" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#3975" class="Module">Eq.≡-Reasoning</a> <a id="820" class="Keyword">using</a> <a id="826" class="Symbol">(</a><a id="827" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#4076" class="Function Operator">begin_</a><a id="833" class="Symbol">;</a> <a id="835" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#4134" class="Function Operator">_≡⟨⟩_</a><a id="840" class="Symbol">;</a> <a id="842" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#4193" class="Function Operator">_≡⟨_⟩_</a><a id="848" class="Symbol">;</a> <a id="850" href="https://agda.github.io/agda-stdlib/Relation.Binary.PropositionalEquality.html#4374" class="Function Operator">_∎</a><a id="852" class="Symbol">)</a>
<a id="854" class="Keyword">open</a> <a id="859" class="Keyword">import</a> <a id="866" href="https://agda.github.io/agda-stdlib/Data.Bool.Base.html" class="Module">Data.Bool.Base</a> <a id="881" class="Keyword">using</a> <a id="887" class="Symbol">(</a><a id="888" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Bool.html#67" class="Datatype">Bool</a><a id="892" class="Symbol">;</a> <a id="894" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Bool.html#92" class="InductiveConstructor">true</a><a id="898" class="Symbol">;</a> <a id="900" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Bool.html#86" class="InductiveConstructor">false</a><a id="905" class="Symbol">;</a> <a id="907" href="https://agda.github.io/agda-stdlib/Data.Bool.Base.html#864" class="Function">T</a><a id="908" class="Symbol">;</a> <a id="910" href="https://agda.github.io/agda-stdlib/Data.Bool.Base.html#1012" class="Function Operator">_∧_</a><a id="913" class="Symbol">;</a> <a id="915" href="https://agda.github.io/agda-stdlib/Data.Bool.Base.html#1070" class="Function Operator">_∨_</a><a id="918" class="Symbol">;</a> <a id="920" href="https://agda.github.io/agda-stdlib/Data.Bool.Base.html#730" class="Function">not</a><a id="923" class="Symbol">)</a>
<a id="925" class="Keyword">open</a> <a id="930" class="Keyword">import</a> <a id="937" href="https://agda.github.io/agda-stdlib/Data.Nat.html" class="Module">Data.Nat</a> <a id="946" class="Keyword">using</a> <a id="952" class="Symbol">(</a><a id="953" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#97" class="Datatype">ℕ</a><a id="954" class="Symbol">;</a> <a id="956" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#115" class="InductiveConstructor">zero</a><a id="960" class="Symbol">;</a> <a id="962" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#128" class="InductiveConstructor">suc</a><a id="965" class="Symbol">;</a> <a id="967" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#230" class="Primitive Operator">_+_</a><a id="970" class="Symbol">;</a> <a id="972" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#433" class="Primitive Operator">_*_</a><a id="975" class="Symbol">;</a> <a id="977" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Nat.html#320" class="Primitive Operator">_∸_</a><a id="980" class="Symbol">;</a> <a id="982" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#845" class="Datatype Operator">_≤_</a><a id="985" class="Symbol">;</a> <a id="987" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#910" class="InductiveConstructor">s≤s</a><a id="990" class="Symbol">;</a> <a id="992" href="https://agda.github.io/agda-stdlib/Data.Nat.Base.html#868" class="InductiveConstructor">z≤n</a><a id="995" class="Symbol">)</a>
<a id="997" class="Keyword">open</a> <a id="1002" class="Keyword">import</a> <a id="1009" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html" class="Module">Data.Nat.Properties</a> <a id="1029" class="Keyword">using</a>
  <a id="1037" class="Symbol">(</a><a id="1038" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#9375" class="Function">+-assoc</a><a id="1045" class="Symbol">;</a> <a id="1047" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#9476" class="Function">+-identityˡ</a><a id="1058" class="Symbol">;</a> <a id="1060" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#9531" class="Function">+-identityʳ</a><a id="1071" class="Symbol">;</a> <a id="1073" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#15493" class="Function">*-assoc</a><a id="1080" class="Symbol">;</a> <a id="1082" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#14397" class="Function">*-identityˡ</a><a id="1093" class="Symbol">;</a> <a id="1095" href="https://agda.github.io/agda-stdlib/Data.Nat.Properties.html#14461" class="Function">*-identityʳ</a><a id="1106" class="Symbol">)</a>
<a id="1108" class="Keyword">open</a> <a id="1113" class="Keyword">import</a> <a id="1120" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html" class="Module">Relation.Nullary</a> <a id="1137" class="Keyword">using</a> <a id="1143" class="Symbol">(</a><a id="1144" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#464" class="Function Operator">¬_</a><a id="1146" class="Symbol">;</a> <a id="1148" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#534" class="Datatype">Dec</a><a id="1151" class="Symbol">;</a> <a id="1153" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#570" class="InductiveConstructor">yes</a><a id="1156" class="Symbol">;</a> <a id="1158" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#597" class="InductiveConstructor">no</a><a id="1160" class="Symbol">)</a>
<a id="1162" class="Keyword">open</a> <a id="1167" class="Keyword">import</a> <a id="1174" href="https://agda.github.io/agda-stdlib/Data.Product.html" class="Module">Data.Product</a> <a id="1187" class="Keyword">using</a> <a id="1193" class="Symbol">(</a><a id="1194" href="https://agda.github.io/agda-stdlib/Data.Product.html#1353" class="Function Operator">_×_</a><a id="1197" class="Symbol">;</a> <a id="1199" href="https://agda.github.io/agda-stdlib/Data.Product.html#881" class="Function">∃</a><a id="1200" class="Symbol">;</a> <a id="1202" href="https://agda.github.io/agda-stdlib/Data.Product.html#942" class="Function">∃-syntax</a><a id="1210" class="Symbol">)</a> <a id="1212" class="Keyword">renaming</a> <a id="1221" class="Symbol">(</a><a id="1222" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Sigma.html#139" class="InductiveConstructor Operator">_,_</a> <a id="1226" class="Symbol">to</a> <a id="1229" href="https://agda.github.io/agda-stdlib/Agda.Builtin.Sigma.html#139" class="InductiveConstructor Operator">⟨_,_⟩</a><a id="1234" class="Symbol">)</a>
<a id="1236" class="Keyword">open</a> <a id="1241" class="Keyword">import</a> <a id="1248" href="https://agda.github.io/agda-stdlib/Data.Empty.html" class="Module">Data.Empty</a> <a id="1259" class="Keyword">using</a> <a id="1265" class="Symbol">(</a><a id="1266" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype">⊥</a><a id="1267" class="Symbol">;</a> <a id="1269" href="https://agda.github.io/agda-stdlib/Data.Empty.html#360" class="Function">⊥-elim</a><a id="1275" class="Symbol">)</a>
<a id="1277" class="Keyword">open</a> <a id="1282" class="Keyword">import</a> <a id="1289" href="https://agda.github.io/agda-stdlib/Function.html" class="Module">Function</a> <a id="1298" class="Keyword">using</a> <a id="1304" class="Symbol">(</a><a id="1305" href="https://agda.github.io/agda-stdlib/Function.html#769" class="Function Operator">_∘_</a><a id="1308" class="Symbol">)</a>
<a id="1310" class="Keyword">open</a> <a id="1315" class="Keyword">import</a> <a id="1322" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html" class="Module">Algebra.Structures</a> <a id="1341" class="Keyword">using</a> <a id="1347" class="Symbol">(</a><a id="1348" href="https://agda.github.io/agda-stdlib/Algebra.Structures.html#1339" class="Record">IsMonoid</a><a id="1356" class="Symbol">)</a>
<a id="1358" class="Keyword">open</a> <a id="1363" class="Keyword">import</a> <a id="1370" href="https://agda.github.io/agda-stdlib/Level.html" class="Module">Level</a> <a id="1376" class="Keyword">using</a> <a id="1382" class="Symbol">(</a><a id="1383" href="https://agda.github.io/agda-stdlib/Agda.Primitive.html#408" class="Postulate">Level</a><a id="1388" class="Symbol">)</a>
<a id="1390" class="Keyword">open</a> <a id="1395" class="Keyword">import</a> <a id="1402" href="https://agda.github.io/agda-stdlib/Relation.Unary.html" class="Module">Relation.Unary</a> <a id="1417" class="Keyword">using</a> <a id="1423" class="Symbol">(</a><a id="1424" href="https://agda.github.io/agda-stdlib/Relation.Unary.html#3313" class="Function">Decidable</a><a id="1433" class="Symbol">)</a>
<a id="1435" class="Keyword">open</a> <a id="1440" class="Keyword">import</a> <a id="1447" href="plfa.Relations.html" class="Module">plfa.Relations</a> <a id="1462" class="Keyword">using</a> <a id="1468" class="Symbol">(</a><a id="1469" href="plfa.Relations.html#18533" class="Datatype Operator">_&lt;_</a><a id="1472" class="Symbol">;</a> <a id="1474" href="plfa.Relations.html#18560" class="InductiveConstructor">z&lt;s</a><a id="1477" class="Symbol">;</a> <a id="1479" href="plfa.Relations.html#18617" class="InductiveConstructor">s&lt;s</a><a id="1482" class="Symbol">)</a>
<a id="1484" class="Keyword">open</a> <a id="1489" class="Keyword">import</a> <a id="1496" href="plfa.Isomorphism.html" class="Module">plfa.Isomorphism</a> <a id="1513" class="Keyword">using</a> <a id="1519" class="Symbol">(</a><a id="1520" href="plfa.Isomorphism.html#4092" class="Record Operator">_≃_</a><a id="1523" class="Symbol">;</a> <a id="1525" href="plfa.Isomorphism.html#6787" class="Function">≃-sym</a><a id="1530" class="Symbol">;</a> <a id="1532" href="plfa.Isomorphism.html#7128" class="Function">≃-trans</a><a id="1539" class="Symbol">;</a> <a id="1541" href="plfa.Isomorphism.html#9009" class="Record Operator">_≲_</a><a id="1544" class="Symbol">;</a> <a id="1546" href="plfa.Isomorphism.html#2736" class="Postulate">extensionality</a><a id="1560" class="Symbol">)</a>
<a id="1562" class="Keyword">open</a> <a id="1567" href="plfa.Isomorphism.html#8228" class="Module">plfa.Isomorphism.≃-Reasoning</a>
<a id="1596" class="Keyword">open</a> <a id="1601" class="Keyword">import</a> <a id="1608" href="plfa.Lists.html" class="Module">plfa.Lists</a> <a id="1619" class="Keyword">using</a> <a id="1625" class="Symbol">(</a><a id="1626" href="plfa.Lists.html#1096" class="Datatype">List</a><a id="1630" class="Symbol">;</a> <a id="1632" href="plfa.Lists.html#1125" class="InductiveConstructor">[]</a><a id="1634" class="Symbol">;</a> <a id="1636" href="plfa.Lists.html#1140" class="InductiveConstructor Operator">_∷_</a><a id="1639" class="Symbol">;</a> <a id="1641" href="plfa.Lists.html#2920" class="Operator">[_]</a><a id="1644" class="Symbol">;</a> <a id="1646" href="plfa.Lists.html#2943" class="Operator">[_,_]</a><a id="1651" class="Symbol">;</a> <a id="1653" href="plfa.Lists.html#2974" class="Operator">[_,_,_]</a><a id="1660" class="Symbol">;</a> <a id="1662" href="plfa.Lists.html#3013" class="Operator">[_,_,_,_]</a><a id="1671" class="Symbol">;</a>
  <a id="1675" href="plfa.Lists.html#3576" class="Function Operator">_++_</a><a id="1679" class="Symbol">;</a> <a id="1681" href="plfa.Lists.html#8543" class="Function">reverse</a><a id="1688" class="Symbol">;</a> <a id="1690" href="plfa.Lists.html#13374" class="Function">map</a><a id="1693" class="Symbol">;</a> <a id="1695" href="plfa.Lists.html#15955" class="Function">foldr</a><a id="1700" class="Symbol">;</a> <a id="1702" href="plfa.Lists.html#16882" class="Function">sum</a><a id="1705" class="Symbol">;</a> <a id="1707" href="plfa.Lists.html#21837" class="Datatype">All</a><a id="1710" class="Symbol">;</a> <a id="1712" href="plfa.Lists.html#23322" class="Datatype">Any</a><a id="1715" class="Symbol">;</a> <a id="1717" href="plfa.Lists.html#23373" class="InductiveConstructor">here</a><a id="1721" class="Symbol">;</a> <a id="1723" href="plfa.Lists.html#23430" class="InductiveConstructor">there</a><a id="1728" class="Symbol">;</a> <a id="1730" href="plfa.Lists.html#23760" class="Function Operator">_∈_</a><a id="1733" class="Symbol">)</a>
<a id="1735" class="Keyword">open</a> <a id="1740" class="Keyword">import</a> <a id="1747" href="plfa.Lambda.html" class="Module">plfa.Lambda</a> <a id="1759" class="Keyword">hiding</a> <a id="1766" class="Symbol">(</a><a id="1767" href="plfa.Lambda.html#7419" class="Function Operator">ƛ′_⇒_</a><a id="1772" class="Symbol">;</a> <a id="1774" href="plfa.Lambda.html#7540" class="Function Operator">case′_[zero⇒_|suc_⇒_]</a><a id="1795" class="Symbol">;</a> <a id="1797" href="plfa.Lambda.html#7754" class="Function Operator">μ′_⇒_</a><a id="1802" class="Symbol">;</a> <a id="1804" href="plfa.Lambda.html#7954" class="Function">plus′</a><a id="1809" class="Symbol">)</a>
<a id="1811" class="Keyword">open</a> <a id="1816" class="Keyword">import</a> <a id="1823" href="plfa.Properties.html" class="Module">plfa.Properties</a> <a id="1839" class="Keyword">hiding</a> <a id="1846" class="Symbol">(</a><a id="1847" href="plfa.Properties.html#12153" class="Postulate">value?</a><a id="1853" class="Symbol">;</a> <a id="1855" href="plfa.Properties.html#42359" class="Postulate">unstuck</a><a id="1862" class="Symbol">;</a> <a id="1864" href="plfa.Properties.html#42575" class="Postulate">preserves</a><a id="1873" class="Symbol">;</a> <a id="1875" href="plfa.Properties.html#42828" class="Postulate">wttdgs</a><a id="1881" class="Symbol">)</a>{% endraw %}</pre>

## Lambda

#### Exercise `mul` (recommended)

Write out the definition of a lambda term that multiplies
two natural numbers.


#### Exercise `primed` (stretch)

We can make examples with lambda terms slightly easier to write
by adding the following definitions.
<pre class="Agda">{% raw %}<a id="ƛ′_⇒_"></a><a id="2170" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2170" class="Function Operator">ƛ′_⇒_</a> <a id="2176" class="Symbol">:</a> <a id="2178" href="plfa.Lambda.html#3783" class="Datatype">Term</a> <a id="2183" class="Symbol">→</a> <a id="2185" href="plfa.Lambda.html#3783" class="Datatype">Term</a> <a id="2190" class="Symbol">→</a> <a id="2192" href="plfa.Lambda.html#3783" class="Datatype">Term</a>
<a id="2197" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2170" class="Function Operator">ƛ′</a> <a id="2200" class="Symbol">(</a><a id="2201" href="plfa.Lambda.html#3802" class="InductiveConstructor Operator">`</a> <a id="2203" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2203" class="Bound">x</a><a id="2204" class="Symbol">)</a> <a id="2206" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2170" class="Function Operator">⇒</a> <a id="2208" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2208" class="Bound">N</a>  <a id="2211" class="Symbol">=</a>  <a id="2214" href="plfa.Lambda.html#3841" class="InductiveConstructor Operator">ƛ</a> <a id="2216" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2203" class="Bound">x</a> <a id="2218" href="plfa.Lambda.html#3841" class="InductiveConstructor Operator">⇒</a> <a id="2220" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2208" class="Bound">N</a>
<a id="2222" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2170" class="CatchallClause Function Operator">ƛ′</a><a id="2224" class="CatchallClause"> </a><a id="2225" class="CatchallClause Symbol">_</a><a id="2226" class="CatchallClause"> </a><a id="2227" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2170" class="CatchallClause Function Operator">⇒</a><a id="2228" class="CatchallClause"> </a><a id="2229" class="CatchallClause Symbol">_</a>      <a id="2236" class="Symbol">=</a>  <a id="2239" href="https://agda.github.io/agda-stdlib/Data.Empty.html#360" class="Function">⊥-elim</a> <a id="2246" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2275" class="Postulate">impossible</a>
  <a id="2259" class="Keyword">where</a> <a id="2265" class="Keyword">postulate</a> <a id="2275" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2275" class="Postulate">impossible</a> <a id="2286" class="Symbol">:</a> <a id="2288" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype">⊥</a>

<a id="case′_[zero⇒_|suc_⇒_]"></a><a id="2291" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">case′_[zero⇒_|suc_⇒_]</a> <a id="2313" class="Symbol">:</a> <a id="2315" href="plfa.Lambda.html#3783" class="Datatype">Term</a> <a id="2320" class="Symbol">→</a> <a id="2322" href="plfa.Lambda.html#3783" class="Datatype">Term</a> <a id="2327" class="Symbol">→</a> <a id="2329" href="plfa.Lambda.html#3783" class="Datatype">Term</a> <a id="2334" class="Symbol">→</a> <a id="2336" href="plfa.Lambda.html#3783" class="Datatype">Term</a> <a id="2341" class="Symbol">→</a> <a id="2343" href="plfa.Lambda.html#3783" class="Datatype">Term</a>
<a id="2348" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">case′</a> <a id="2354" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2354" class="Bound">L</a> <a id="2356" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">[zero⇒</a> <a id="2363" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2363" class="Bound">M</a> <a id="2365" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">|suc</a> <a id="2370" class="Symbol">(</a><a id="2371" href="plfa.Lambda.html#3802" class="InductiveConstructor Operator">`</a> <a id="2373" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2373" class="Bound">x</a><a id="2374" class="Symbol">)</a> <a id="2376" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">⇒</a> <a id="2378" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2378" class="Bound">N</a> <a id="2380" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">]</a>  <a id="2383" class="Symbol">=</a>  <a id="2386" href="plfa.Lambda.html#4010" class="InductiveConstructor Operator">case</a> <a id="2391" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2354" class="Bound">L</a> <a id="2393" href="plfa.Lambda.html#4010" class="InductiveConstructor Operator">[zero⇒</a> <a id="2400" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2363" class="Bound">M</a> <a id="2402" href="plfa.Lambda.html#4010" class="InductiveConstructor Operator">|suc</a> <a id="2407" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2373" class="Bound">x</a> <a id="2409" href="plfa.Lambda.html#4010" class="InductiveConstructor Operator">⇒</a> <a id="2411" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2378" class="Bound">N</a> <a id="2413" href="plfa.Lambda.html#4010" class="InductiveConstructor Operator">]</a>
<a id="2415" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="CatchallClause Function Operator">case′</a><a id="2420" class="CatchallClause"> </a><a id="2421" class="CatchallClause Symbol">_</a><a id="2422" class="CatchallClause"> </a><a id="2423" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="CatchallClause Function Operator">[zero⇒</a><a id="2429" class="CatchallClause"> </a><a id="2430" class="CatchallClause Symbol">_</a><a id="2431" class="CatchallClause"> </a><a id="2432" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="CatchallClause Function Operator">|suc</a><a id="2436" class="CatchallClause"> </a><a id="2437" class="CatchallClause Symbol">_</a><a id="2438" class="CatchallClause"> </a><a id="2439" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="CatchallClause Function Operator">⇒</a><a id="2440" class="CatchallClause"> </a><a id="2441" class="CatchallClause Symbol">_</a><a id="2442" class="CatchallClause"> </a><a id="2443" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="CatchallClause Function Operator">]</a>      <a id="2450" class="Symbol">=</a>  <a id="2453" href="https://agda.github.io/agda-stdlib/Data.Empty.html#360" class="Function">⊥-elim</a> <a id="2460" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2489" class="Postulate">impossible</a>
  <a id="2473" class="Keyword">where</a> <a id="2479" class="Keyword">postulate</a> <a id="2489" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2489" class="Postulate">impossible</a> <a id="2500" class="Symbol">:</a> <a id="2502" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype">⊥</a>

<a id="μ′_⇒_"></a><a id="2505" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2505" class="Function Operator">μ′_⇒_</a> <a id="2511" class="Symbol">:</a> <a id="2513" href="plfa.Lambda.html#3783" class="Datatype">Term</a> <a id="2518" class="Symbol">→</a> <a id="2520" href="plfa.Lambda.html#3783" class="Datatype">Term</a> <a id="2525" class="Symbol">→</a> <a id="2527" href="plfa.Lambda.html#3783" class="Datatype">Term</a>
<a id="2532" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2505" class="Function Operator">μ′</a> <a id="2535" class="Symbol">(</a><a id="2536" href="plfa.Lambda.html#3802" class="InductiveConstructor Operator">`</a> <a id="2538" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2538" class="Bound">x</a><a id="2539" class="Symbol">)</a> <a id="2541" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2505" class="Function Operator">⇒</a> <a id="2543" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2543" class="Bound">N</a>  <a id="2546" class="Symbol">=</a>  <a id="2549" href="plfa.Lambda.html#4070" class="InductiveConstructor Operator">μ</a> <a id="2551" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2538" class="Bound">x</a> <a id="2553" href="plfa.Lambda.html#4070" class="InductiveConstructor Operator">⇒</a> <a id="2555" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2543" class="Bound">N</a>
<a id="2557" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2505" class="CatchallClause Function Operator">μ′</a><a id="2559" class="CatchallClause"> </a><a id="2560" class="CatchallClause Symbol">_</a><a id="2561" class="CatchallClause"> </a><a id="2562" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2505" class="CatchallClause Function Operator">⇒</a><a id="2563" class="CatchallClause"> </a><a id="2564" class="CatchallClause Symbol">_</a>      <a id="2571" class="Symbol">=</a>  <a id="2574" href="https://agda.github.io/agda-stdlib/Data.Empty.html#360" class="Function">⊥-elim</a> <a id="2581" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2610" class="Postulate">impossible</a>
  <a id="2594" class="Keyword">where</a> <a id="2600" class="Keyword">postulate</a> <a id="2610" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2610" class="Postulate">impossible</a> <a id="2621" class="Symbol">:</a> <a id="2623" href="https://agda.github.io/agda-stdlib/Data.Empty.html#243" class="Datatype">⊥</a>{% endraw %}</pre>
The definition of `plus` can now be written as follows.
<pre class="Agda">{% raw %}<a id="plus′"></a><a id="2705" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2705" class="Function">plus′</a> <a id="2711" class="Symbol">:</a> <a id="2713" href="plfa.Lambda.html#3783" class="Datatype">Term</a>
<a id="2718" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2705" class="Function">plus′</a> <a id="2724" class="Symbol">=</a> <a id="2726" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2505" class="Function Operator">μ′</a> <a id="2729" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2836" class="Function">+</a> <a id="2731" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2505" class="Function Operator">⇒</a> <a id="2733" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2170" class="Function Operator">ƛ′</a> <a id="2736" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2850" class="Function">m</a> <a id="2738" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2170" class="Function Operator">⇒</a> <a id="2740" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2170" class="Function Operator">ƛ′</a> <a id="2743" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2864" class="Function">n</a> <a id="2745" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2170" class="Function Operator">⇒</a>
          <a id="2757" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">case′</a> <a id="2763" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2850" class="Function">m</a>
            <a id="2777" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">[zero⇒</a> <a id="2784" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2864" class="Function">n</a>
            <a id="2798" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">|suc</a> <a id="2803" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2850" class="Function">m</a> <a id="2805" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">⇒</a> <a id="2807" href="plfa.Lambda.html#3969" class="InductiveConstructor Operator">`suc</a> <a id="2812" class="Symbol">(</a><a id="2813" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2836" class="Function">+</a> <a id="2815" href="plfa.Lambda.html#3887" class="InductiveConstructor Operator">·</a> <a id="2817" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2850" class="Function">m</a> <a id="2819" href="plfa.Lambda.html#3887" class="InductiveConstructor Operator">·</a> <a id="2821" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2864" class="Function">n</a><a id="2822" class="Symbol">)</a> <a id="2824" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2291" class="Function Operator">]</a>
  <a id="2828" class="Keyword">where</a>
  <a id="2836" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2836" class="Function">+</a>  <a id="2839" class="Symbol">=</a>  <a id="2842" href="plfa.Lambda.html#3802" class="InductiveConstructor Operator">`</a> <a id="2844" class="String">&quot;+&quot;</a>
  <a id="2850" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2850" class="Function">m</a>  <a id="2853" class="Symbol">=</a>  <a id="2856" href="plfa.Lambda.html#3802" class="InductiveConstructor Operator">`</a> <a id="2858" class="String">&quot;m&quot;</a>
  <a id="2864" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#2864" class="Function">n</a>  <a id="2867" class="Symbol">=</a>  <a id="2870" href="plfa.Lambda.html#3802" class="InductiveConstructor Operator">`</a> <a id="2872" class="String">&quot;n&quot;</a>{% endraw %}</pre>
Write out the definition of multiplication in the same style.

#### Exercise `_[_:=_]′` (stretch)

The definition of substitution above has three clauses (`ƛ`, `case`,
and `μ`) that invoke a with clause to deal with bound variables.
Rewrite the definition to factor the common part of these three
clauses into a single function, defined by mutual recursion with
substitution.


#### Exercise `—↠≃—↠′`

Show that the two notions of reflexive and transitive closure
above are isomorphic.


#### Exercise `plus-example`

Write out the reduction sequence demonstrating that one plus one is two.


#### Exercise `mul-type` (recommended)

Using the term `mul` you defined earlier, write out the derivation
showing that it is well-typed.


## Properties


#### Exercise `Progress-≃`

Show that `Progress M` is isomorphic to `Value M ⊎ ∃[ N ](M —→ N)`.


#### Exercise `progress′`

Write out the proof of `progress′` in full, and compare it to the
proof of `progress` above.


#### Exercise `value?`

Combine `progress` and `—→¬V` to write a program that decides
whether a well-typed term is a value.
<pre class="Agda">{% raw %}<a id="3993" class="Keyword">postulate</a>
  <a id="value?"></a><a id="4005" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#4005" class="Postulate">value?</a> <a id="4012" class="Symbol">:</a> <a id="4014" class="Symbol">∀</a> <a id="4016" class="Symbol">{</a><a id="4017" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#4017" class="Bound">A</a> <a id="4019" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#4019" class="Bound">M</a><a id="4020" class="Symbol">}</a> <a id="4022" class="Symbol">→</a> <a id="4024" href="plfa.Lambda.html#30643" class="InductiveConstructor">∅</a> <a id="4026" href="plfa.Lambda.html#32783" class="Datatype Operator">⊢</a> <a id="4028" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#4019" class="Bound">M</a> <a id="4030" href="plfa.Lambda.html#32783" class="Datatype Operator">⦂</a> <a id="4032" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#4017" class="Bound">A</a> <a id="4034" class="Symbol">→</a> <a id="4036" href="https://agda.github.io/agda-stdlib/Relation.Nullary.html#534" class="Datatype">Dec</a> <a id="4040" class="Symbol">(</a><a id="4041" href="plfa.Lambda.html#11669" class="Datatype">Value</a> <a id="4047" href="{% endraw %}{{ site.baseurl }}{% link out/PUC-Assignment3.md %}{% raw %}#4019" class="Bound">M</a><a id="4048" class="Symbol">)</a>{% endraw %}</pre>


#### Exercise `subst′` (stretch)

Rewrite `subst` to work with the modified definition `_[_:=_]′`
from the exercise in the previous chapter.  As before, this
should factor dealing with bound variables into a single function,
defined by mutual recursion with the proof that substitution
preserves types.


#### Exercise `mul-example` (recommended)

Using the evaluator, confirm that two times two is four.


#### Exercise: `progress-preservation`

Without peeking at their statements above, write down the progress
and preservation theorems for the simply typed lambda-calculus.


#### Exercise `subject-expansion`

We say that `M` _reduces_ to `N` if `M —→ N`,
and conversely that `M` _expands_ to `N` if `N —→ M`.
The preservation property is sometimes called _subject reduction_.
Its opposite is _subject expansion_, which holds if
`M —→ N` and `∅ ⊢ N ⦂ A` imply `∅ ⊢ M ⦂ A`.
Find two counter-examples to subject expansion, one
with case expressions and one not involving case expressions.


#### Exercise `stuck`

Give an example of an ill-typed term that does get stuck.


#### Exercise `unstuck` (recommended)

Provide proofs of the three postulates, `unstuck`, `preserves`, and `wttdgs` above.








