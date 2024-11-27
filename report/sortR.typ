#set heading(numbering: "1.")

= Specification

Given an array $A$ of $n = 4^k$ (for some $k in NN$) elements, sort it as follows:

- If $n lt.eq 4$, sort $A$ with insertion sort and finish.

- Sort the first $(3n)/4$ elements recursively.

- Sort the last $(3n)/4$ elements recursively.

- Sort the first $(3n)/4$ elements recursively.

= Proof

The algorithm deals with three-quarter-portions of $A$.
We first prove that each such portion is sorted correctly (see @portion).
Then, we prove that by sorting each portion in the specified order,
the array is sorted (see @total).

== Each portion is sorted <portion>

The proof is by induction.

Define $P(k):$ an array of size $4^k$ or $3 dot.op 4^k$ is sorted correctly.
The base case is for $k = 0$, i.e. $n = 1$ or $n = 3$.
As $n lt.eq 4$, the correctness follows from the correctness of insertion sort.

Assume that $P(k)$ holds for $k = p$. Then, for $k = p + 1$, each portion
is of length
$ (3n)/4 = (3 dot.op 4^(p + 1)) / 4 = 3 dot.op 4^p "," $
and is sorted correctly according to the inductive hypothesis.

The proof follows from the principle of induction.

== The array is sorted <total>

Let $A_i$ be the _i_:th quarter-portion of $A$ with length $n/4$,
and $a_i$ the set of the _i_:th smallest $n/4$ elements.

Consider an element $x in A$. Initially, it might be in any $A_i$.
Note that once $x$ has been placed in the correct portion, it will never
be moved to another one.

- If $x in a_1$ or $x in a_2$, the second sort ensures it is not in $A_4$,
  and as such it is placed in the correct portion in the third sort.

- If $x in a_3$ or $x in a_4$, the first sort ensures it is not in $A_1$,
  and as such it is placed in the correct portion in the second sort.

= Complexity

Let $T(n)$ be the time complexity.
For the base case, $T(n) = O(1)$ as $n$ is a bounded constant.
In the general case, we sort a portion of size $(3n)/4$ a total of $3$
times, for a total cost of $3 dot.op T((3n)/4)$.
@total shows that no extra work is needed.

This gives us the recurrence equation

$ T(n) = cases(
    O(1)                      &"if" n lt.eq 4 ",",
    3 dot.op T((3n)/4) + O(1) &"otherwise."
) $

By the master theorem, this solves to

$ T(n) = Theta(n^(log_(4/3) 3)) approx Theta(n^3.82). $
