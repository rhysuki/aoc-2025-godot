extends GutTest

class TestAocDay5:
	extends GutTest

	var solution: AocDay5

	func before_all():
		solution = AocDay5.new()

	func test_solve():
		assert_eq(AocDay5.new().solve(), 3)


	func test_range():
		assert_eq(solution.is_in_range(1, 0, 3), true)
		assert_eq(solution.is_in_range(1, 1, 1), true)
		assert_eq(solution.is_in_range(1, 0, 3), true)
		assert_eq(solution.is_in_range(1, 2, 3), false)
		assert_eq(solution.is_in_range(10, 5, 9), false)


	func test_new_fresh_range():
		assert_eq(solution.new_fresh_range("111-323"), [111, 323])
		assert_eq(solution.new_fresh_range("23347-999999999"), [23347, 999999999])
		assert_eq(solution.new_fresh_range("1-1"), [1, 1])
