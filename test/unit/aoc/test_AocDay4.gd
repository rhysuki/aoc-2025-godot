extends GutTest

class TestMap:
	extends GutTest


	var solution := AocDay4.new()
	var test_map := ["...", ".@.", "..."]
	var params := [
		Util.get_lines(solution.load_input(4)),
		Util.get_lines(solution.load_input(4, AocSolution.PuzzleInputType.EXAMPLE)),
		[".@."],
		[
			"....",
			".@@.",
			".@@.",
			"....",
		],
	]


	func test_map_dimensions(lines = use_parameters(params)):
		var map = solution.Map.new(lines)
		assert_gt(map.size(), 0)
		assert_eq(map.size(), lines.size())


	func test_get_cell():
		var map = solution.Map.new(test_map)
		print(map._cells)
		assert_eq(map.is_cell_occupied(0, 0), false)
		assert_eq(map.is_cell_occupied(-1, -1), false)
		assert_eq(map.is_cell_occupied(999, 999), false)
		assert_eq(map.is_cell_occupied(2, 1), false)
		assert_eq(map.is_cell_occupied(1, 1), true)


	func test_get_neighboring_cells():
		var map = solution.Map.new(test_map)
		var neighbors := map.get_neighboring_cells(1, 1)
		assert_eq(neighbors, [false, false, false, false, true, false, false, false, false])
		assert_eq(neighbors.count(false), 8)
