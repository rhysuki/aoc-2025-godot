class_name AocDay6 extends AocSolution


func solve() -> int:
	var result := 0
	var lines = get_lines(6)
	var values := lines.map(get_values)
	var collected := collect_values(values)

	var streak := []

	for item in collected:
		if item == "*":
			result += streak.map(Util.to_int).reduce(Util.mult)
			streak.clear()
		elif item == "+":
			result += streak.map(Util.to_int).reduce(Util.sum)
			streak.clear()
		else:
			streak.append(item)


	return result


func get_values(line: String) -> Array:
	return Array(line.strip_edges().split(" ")) \
		.filter(is_not_empty)


func is_not_empty(s: String):
	return not s.is_empty()


func collect_values(values: Array) -> Array:
	var result := []
	var line_length: int = values[0].size()

	for i in line_length:
		for j in values.size():
			result.append(values[j][i])

	return result