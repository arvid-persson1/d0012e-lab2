#set heading(numbering: "1.")

= Specification

Given $A$ of $n = 2^k$ (for some $k in ZZ^+$) non-zero real numbers, determine
a maximal value $M$ such that $M$ is the sum of some subsequence of $A$.

Note: The assignment does not specify whether to consider 0, the sum of an empty
subsequence, to be a valid value for $M$, which would be the case if $A$ consists
solely of negative values. The choice has been made to exclude this possibility.

= Overview

Given the input $A = [a_0, a_1, dots.h a_(n-1)]$, do the following:

- Recursively find $M$ for the two halves of $A$. For a 1-length split $A = [a]$,
  the only possibility is $M(A) = a$.

- Combine the splits $(L, R)$ pairwise. $M$ is the largest of the following:

    - $M(L)$, i.e. the maximum value of the left split.

    - $M(R)$, i.e. the maximum value of the right split.

    - $M(A_m)$ for any subsequence $A_m$ that crosses the midpoint.

= Implementation

For each recursive step, given $A$, determine a 4-tuple $T = (M, p, s, t)$ where
$p = M(A_l)$ for any subsequence $A_l$ that includes the first element (the prefix sum),
$s$ is defined analogously for the last element (the suffix sum),
and $t$ is the total sum of $A$.

For $A = [a]$, $T$ is trivially $(a, a, a, a)$.
In other cases, we split $A$ into $(L, R)$ and determine the values of $T$ as follows:

$
M(A) &= "max"(M(L), M(R), s(L) + p(R)) "," \
p(A) &= "max"(p(L), t(L) + p(R)) "," \
s(A) &= "max"(s(R), t(R) + s(L)) "," \
t(A) &= t(L) + t(R).
$

The result is $M(T)$.

= Complexity

Let $T(n)$ be the time complexity.
For the base case, $T(n) = O(1)$ as $n = 1$.
In the general case, we consider two portions, each half the size of the input,
for a total cost of $2 dot.op T(n/2)$.

This gives us the recurrence equation

$ T(n) = cases(
    O(1)                   &"if" n = 1 ",",
    2 dot.op T(n/2) + O(1) &"otherwise."
) $

By the master theorem, this solves to

$ T(n) = Theta(n^(log_(2) 2)) = Theta(n). $
