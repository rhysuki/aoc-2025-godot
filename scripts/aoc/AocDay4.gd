class_name AocDay4 extends AocSolution


func solve() -> int:
	var lines = get_lines(4, PuzzleInputType.EXAMPLE)
	return Map.new(lines).count_accessible_cells()


func solve_part_2() -> int:
	var result := 0
	var lines = get_lines(4)
	var map = Map.new(lines)

	while true:
		var accessible_cells = map.count_accessible_cells()

		if accessible_cells == 0:
			break

		result += accessible_cells
		map.remove_accessible_cells()

	return result


class Map:
	var _cells := []


	func _init(lines: Array) -> void:
		for line: String in lines:
			var row := []

			for c in line.strip_edges():
				row.append(c == "@")

			_cells.append(row)


	func size() -> int:
		return _cells.size()


	func is_cell_occupied(row: int, column: int) -> bool:
		if row < 0 or row > _cells.size() - 1 \
			or column < 0 or column > _cells[row].size() - 1:
			return false

		return _cells[row][column]


	func get_neighboring_cells(row: int, column: int) -> Array:
		var result := []

		for current_row in range(row - 1, row + 2):
			for current_column in range(column - 1, column + 2):
				result.append(is_cell_occupied(current_row, current_column))

		return result


	func count_neighboring_cells(row: int, column: int) -> int:
		var result := 0

		for current_row in range(row - 1, row + 2):
			for current_column in range(column - 1, column + 2):
				if is_cell_occupied(current_row, current_column):
					result += 1

		return result


	func is_cell_accessible(row: int, column: int) -> bool:
		return is_cell_occupied(row, column) and get_neighboring_cells(row, column).count(true) < 5


	func count_accessible_cells() -> int:
		var result := 0

		for row in _cells.size():
			for column in _cells[row].size():
				if is_cell_accessible(row, column):
					result += 1

		return result

	func remove_accessible_cells():
		var new_cells = _cells.duplicate_deep()

		for row in new_cells.size():
			for column in new_cells[row].size():
				if is_cell_accessible(row, column):
					new_cells[row][column] = false

		_cells = new_cells


	func print_cells():
		for row in _cells.size():
			var s = ""

			for column in _cells[row].size():
				var c = "."

				if is_cell_occupied(row, column):
					c = "x" if is_cell_accessible(row, column) else "@"

				s += c

			print(s)
