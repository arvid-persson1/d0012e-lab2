from dataclasses import dataclass
from math import inf, isclose
from random import uniform
from sys import stderr

K = 8
MIN = -10
MAX = 10
ITERATIONS = 10000


# Well-known algorithm to test correctness.
def maxSubKadane(arr: list[float]) -> float:
    res = -inf
    curr = 0

    for x in arr:
        curr = max(x, curr + x)
        res = max(res, curr)

    return res


@dataclass
class MaxSubResult:
    max: float
    prefix: float
    suffix: float
    total: float


# The algorithm could be reduced to a single function definition
# by calling the helper function directly, but this would expose
# the ugly implementation details (`MaxSubResult`).
def maxSubRec(arr: list[float]) -> float:
    assert all(x != 0 for x in arr)

    return _maxSubRec(arr).max


def _maxSubRec(arr: list[float]) -> MaxSubResult:
    n = len(arr)

    assert n > 0

    if n == 1:
        res = arr[0]
        return MaxSubResult(res, res, res, res)

    # This verifies that n is a power of 2.
    assert n & (n - 1) == 0

    mid = n // 2
    leftRes = _maxSubRec(arr[:mid])
    rightRes = _maxSubRec(arr[mid:])

    maxSum = max(
        leftRes.max,
        rightRes.max,
        leftRes.suffix + rightRes.prefix,
    )
    prefix = max(leftRes.prefix, leftRes.total + rightRes.prefix)
    suffix = max(rightRes.suffix, rightRes.total + leftRes.suffix)
    total = leftRes.total + rightRes.total

    return MaxSubResult(maxSum, prefix, suffix, total)


def main():
    for _ in range(ITERATIONS):
        # We expect this to very rarely create the number 0,
        # and choose not to correct when it does.
        arr = [uniform(MIN, MAX) for _ in range(2**K)]

        ans = maxSubKadane(arr)
        res = maxSubRec(arr)
        if not isclose(ans, res):
            print("Recursive failed!", file=stderr)
            return

    print("Finished successfully.")


if __name__ == "__main__":
    main()
