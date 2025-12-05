class_name AocSolution


static var input_path := "res://scripts/aoc/input"

const NOT_IMPLEMENTED := -999


func solve() -> int:
	return NOT_IMPLEMENTED


func solve_part_2() -> int:
	return NOT_IMPLEMENTED


func load_input(day: int) -> String:
	var path := "%s/day_%d.txt" % [input_path, day]
	return FileAccess.open(path, FileAccess.READ).get_as_text()
