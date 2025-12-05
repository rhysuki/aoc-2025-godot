extends GutTest


class TestToDigitArray:
	extends GutTest


	var solution: AocDay3Clean

	var params = [
		["1", [1]],
		["1237", [1, 2, 3, 7]],
		["998", [9, 9, 8]],
	]


	func before_all():
		solution = AocDay3Clean.new()


	func test_to_digit_array(p = use_parameters(params)):
		assert_eq_deep(solution.to_digit_array(p[0]), p[1])


class TestFindBiggestSequentialDigits:
	extends GutTest

	var solution: AocDay3Clean

	var params = [
		["987654321111111", [9, 8]],
		["811111111111119", [8, 9]],
		["234234234234278", [7, 8]],
		["818181911112111", [9, 2]],
	]


	func before_all():
		solution = AocDay3Clean.new()


	func test_to_digit_array(p = use_parameters(params)):
		var arr := solution.to_digit_array(p[0])
		assert_eq_deep(solution.find_biggest_sequential_digits(arr), p[1])
