package test

import "core:fmt"
import "core:sys/windows"
import "core:time"
print :: fmt.println

main :: proc() {

	windows.SetConsoleOutputCP(windows.CODEPAGE.UTF8)
	start: time.Time = time.now()

	print(findClosest([]int{1, 2, 4, 5}, 3))
	print(findClosest([]int{1, -2, 4, 5}, 3))
	print(findClosest([]int{2, 4, 6, 8, 10}, 9))

	elapsed: time.Duration = time.since(start)
	print("Odin took:", elapsed)
	// OUTPUT:
	// 2
	// 4
	// 8
	// Odin took: 111.4µs
}

findClosest :: proc(l: []int, n: int) -> int {
	// guard clause ------------------------------
	if len(l) == 0 {
		panic(">>> Received empty list. The list must contain at least one value.")
	}
	// -------------------------------------------

	smallest_difference := abs(n - l[0])
	res := l[0]
	for val in l {
		if abs(n - val) < smallest_difference {
			smallest_difference = abs(n - val)
			res = val
		}
	}

	return res
}
