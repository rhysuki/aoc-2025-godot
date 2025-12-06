class_name AocDay5 extends AocSolution


func solve() -> int:
	var result := 0
	var lines := get_lines(5)
	var ranges := []
	var ids := []
	var fresh := []

	for line: String in lines:
		if line.contains("-"):
			ranges.append(new_fresh_range(line))
		else:
			ids.append(int(line))

	for id in ids:
		for fresh_range in ranges:
			if is_in_range(id, fresh_range[0], fresh_range[1]):
				if not id in fresh:
					result += 1
					fresh.append(id)

	return result


func is_in_range(num: int, range_start: int, range_end: int) -> bool:
	var scaled_num = num - range_start
	return scaled_num <= (range_end - range_start) \
		and scaled_num >= 0


func new_fresh_range(s: String) -> Array:
	var ranges_str = s.split("-")
	return [int(ranges_str[0]), int(ranges_str[1])]


func solve_part_2() -> int:
	return 0
