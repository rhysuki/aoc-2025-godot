class_name AocSolution


static var input_path := "res://scripts/aoc/input"

const NOT_IMPLEMENTED := -999

var parent: Node


func _init(p: Node) -> void:
	self.parent = p


func solve() -> int:
	return NOT_IMPLEMENTED


func solve_part_2() -> int:
	return NOT_IMPLEMENTED


func load_input(day: int) -> String:
	var path := "%s/day_%d.txt" % [input_path, day]
	return FileAccess.open(path, FileAccess.READ).get_as_text()


func get_lines(day: int) -> PackedStringArray:
	return load_input(day).split("\n")