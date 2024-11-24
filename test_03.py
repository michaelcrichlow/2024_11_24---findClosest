def findClosest(l: list[int], n: int) -> int:
    # guard clause ------------------------------
    if len(l) == 0:
        raise Exception(
            "Received empty list. The list must contain at least one value.")
    # -------------------------------------------

    smallest_difference = abs(n - l[0])
    res = l[0]
    for val in l:
        if abs(n - val) < smallest_difference:
            smallest_difference = abs(n - val)
            res = val

    return res


def main() -> None:
    print(findClosest([1, 2, 3, 4, 5], 3))
    print(findClosest([1, -2, 4, 5], 3))
    print(findClosest([2, 4, 6, 8, 10], 9))


if __name__ == '__main__':
    main()

# findClosest([1, 2, 4, 5], 3) => 2
