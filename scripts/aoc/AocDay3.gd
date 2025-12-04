class_name AocDay3 extends AocSolution


func solve() -> int:
	var result := 0
	var lines := get_lines(3)

	for line in lines:
		var numbers := Array(line.split()) \
			.map(func(s): return int(s))

		var biggest_leading_number_index := 0

		for i in numbers.size() - 1:
			if numbers[i] > numbers[biggest_leading_number_index]:
				biggest_leading_number_index = i

		var biggest_second_number_index := biggest_leading_number_index + 1


		for i in range(biggest_leading_number_index + 1, numbers.size()):
			if numbers[i] > numbers[biggest_second_number_index]:
				biggest_second_number_index = i

		var joltage := int(
			str(numbers[biggest_leading_number_index]) \
			+ str(numbers[biggest_second_number_index])
		)

		result += joltage

	return result