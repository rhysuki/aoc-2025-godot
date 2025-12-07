class_name AocDay6 extends AocSolution


func solve() -> int:
	var values = get_lines(6).map(get_values)
	var collected := collect_values(values)
	return get_solutions(collected).reduce(Util.sum)


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


func get_solutions(sheet: Array) -> Array:
	var result := []
	var equation := []

	for item in sheet:
		if item == "*":
			result.append(reduce_equation(equation, Util.mult))
			equation.clear()
		elif item == "+":
			result.append(reduce_equation(equation, Util.sum))
			equation.clear()
		else:
			equation.append(item)

	return result


func reduce_equation(streak: Array, fn: Callable) -> int:
	return streak.map(Util.to_int).reduce(fn)
