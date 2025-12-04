class_name AocDay2 extends AocSolution


func solve() -> int:
	var ranges := load_input(2).strip_edges().split(",")
	var result := 0

	for num_range in ranges:
		var start := int(num_range.split("-")[0])
		var end := int(num_range.split("-")[1])

		for i in range(start, end + 1):
			var s := str(i)

			if s.length() % 2 != 0:
				continue

			if s.substr(0, s.length() / 2) == s.substr(s.length() / 2):
				result += i

	return result