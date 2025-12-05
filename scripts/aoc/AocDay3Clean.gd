class_name AocDay3Clean extends AocSolution


func solve() -> int:
	return Array(get_lines(3)) \
		.map(get_joltage) \
		.reduce(Util.sum, 0)


func get_joltage(line: String) -> int:
	var digits := find_biggest_sequential_digits(to_digit_array(line))
	return concatenate_digits(digits[0], digits[1])


func to_digit_array(input_string: String) -> Array:
	return Array(input_string.split()).map(to_int)


func to_int(s: String) -> int:
	return int(s)


func concatenate_digits(tens: int, ones: int) -> int:
	return tens * 10 + ones


func find_max_value_index(numbers: Array) -> int:
	return numbers.find(numbers.reduce(max))


func find_biggest_sequential_digits(numbers: Array) -> Array:
	var tens_digit_index = find_max_value_index(numbers.slice(0, -1))
	var index_after_tens = tens_digit_index + 1
	var ones_digit_index = index_after_tens + find_max_value_index(numbers.slice(index_after_tens))
	return [numbers[tens_digit_index], numbers[ones_digit_index]]
