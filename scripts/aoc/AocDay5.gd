class_name AocDay5 extends AocSolution


func solve() -> int:
	var lines := get_lines(5)
	return count_fresh_ids(get_ids(lines), get_fresh_ranges(lines))


func count_fresh_ids(ids, fresh_ranges):
	return get_fresh_ids(ids, fresh_ranges).size()


func get_fresh_ranges(lines: Array) -> Array:
	return lines.filter(func(l: String): return l.contains("-")) \
		.map(new_fresh_range)


func get_ids(lines: Array) -> Array:
	return lines.filter(func(l: String): return not l.contains("-")) \
		.map(Util.to_int)


func get_fresh_ids(ids: Array, fresh_ranges: Array) -> Array:
	var result := []

	for fresh_range in fresh_ranges:
		result += ids.filter(func(id): return is_in_range(id, fresh_range[0], fresh_range[1]))

	return remove_duplicates(result)


func remove_duplicates(arr: Array) -> Array:
	var result := []

	for element in arr:
		if not element in result:
			result.append(element)

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
