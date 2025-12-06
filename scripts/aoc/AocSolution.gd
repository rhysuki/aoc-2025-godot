class_name AocSolution


enum PuzzleInputType {
	NORMAL,
	EXAMPLE,
}

const NOT_IMPLEMENTED := -999

static var input_path := "res://scripts/aoc/input"


static func load_input(day: int, type: PuzzleInputType = PuzzleInputType.NORMAL) -> String:
	var path: String

	if type == PuzzleInputType.NORMAL:
		path = "%s/day_%d.txt" % [input_path, day]
	else:
		path = "%s/day_%d_example.txt" % [input_path, day]

	return FileAccess.open(path, FileAccess.READ).get_as_text()


static func get_lines(day: int, type = 0) -> Array:
	return Util.get_lines(load_input(day, type))

func solve() -> int:
	return NOT_IMPLEMENTED


func solve_part_2() -> int:
	return NOT_IMPLEMENTED
