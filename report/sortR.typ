#set heading(numbering: "1.")

= Specification

Given an array $A$ of $n = 4^k$ (for some $k in NN$) elements, sort it as follows:

- If $n lt.eq 4$, sort $A$ with insertion sort and finish.

- Sort the first $(3n)/4$ elements recursively.

- Sort the last $(3n)/4$ elements recursively.

- Sort the first $(3n)/4$ elements recursively.

= Proof

The algorithm deals with three-quarter-portions of $A$.
We first prove that each such portion is sorted correctly.
Then, we prove that by sorting each portion in the specified order,
the array is sorted.

== Each portion is sorted

The proof is by induction.

Define $P(k):$ an array of size $4^k$ or $3 dot.op 4^k$ is sorted correctly.
The base case is for $k = 0$, i.e. $n = 1$ or $n = 3$.
As $n lt.eq 4$, the correctness follows from the correctness of insertion sort.

Assume that $P(k)$ holds for $k = p$. Then, for $k = p + 1$, each portion
is of length
$ (3n)/4 = (3 dot.op 4^(p + 1)) / 4 = 3 dot.op 4^p "," $
and is sorted correctly according to the inductive hypothesis.

The proof follows from the principle of induction.

/* The proof is by strong induction. Let $P(k)$ be the statement "an array of
length $4^k$, and $3 dot.op 4^(k-1)$ if $k > 0$, is sorted".

The base cases are for $k = 0$ and $k = 1$.
$P(0)$ states that an array of length $n = 1$ is sorted, which follows trivially.
$P(1)$ states that an array of length $n lt.eq 4$ is sorted, which follows from
the correctness of insertion sort. */

/* As $n/4 in ZZ$, each element of $A$ belongs to exactly one quarter of the array.
Each step concerns three subsequent quarters of the array. The following is
a proof that each such portion is sorted correctly.

The proof is by induction.

The base case is for $k = 0 <=> n = r$. As $r lt.eq 4$,
the portion is sorted using insertion sort and the correctness follows.

Assume the statement holds for $k = p$.

For $k = p + 1$, */

== The array is sorted

Let $A_i$ be the _i_:th quarter-portion of $A$ with length $n/4$,
and $a_i$ the set of the _i_:th smallest $n/4$ elements.

Consider an element $x in A$. Initially, it might be in any $A_i$.
// For $x$ to end up in the correct portion, that portion must be
// included in the final sort where $x$ is included.
Note that once $x$ has been placed in the correct portion, it will never
be moved to another one.

- If $x in a_1$ or $x in a_2$, the second sort ensures it is not in $A_4$,
  and as such it is placed in the correct portion in the third sort.

- If $x in a_3$ or $x in a_4$, the first sort ensures it is not in $A_1$,
  and as such it is placed in the correct portion in the second sort.

/* Let $A_i$ be the _i_:th quarter-portion of $A$ with length $n/4$,
and $a_i$ the set of the _i_:th smallest $n/4$ elements.

Initially, each $a_i$ is potentially spread out among all $A_i$.
For each partial sort, each $a_i$ will 

- After the first sort, $a_1$ is only in $A_1$ and $A_4$,
  and $a_4$ is onl */

= Complexity
