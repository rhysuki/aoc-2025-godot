extends GutTest

class TestAocDay6:
	extends GutTest

	var solution: AocDay6


	func before_all():
		solution = AocDay6.new()


	func test_solve():
		assert_eq(AocDay6.new().solve(), 4693419406682)