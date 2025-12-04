extends Node2D


@onready var _measure: MeasureTime = $MeasureTime
var _solutions: Array[AocSolution] = [
	AocDay1.new(self),
]


func _ready() -> void:
	_solve()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("confirm"):
		_solve()


func _solve() -> void:
	var current_day: AocSolution = _solutions.back()

	print("--- part 1 ---")
	_measure.measure_function(func(): print_result(current_day.solve()))
	print("--- part 2 ---")
	_measure.measure_function(func(): print_result(current_day.solve_part_2()))


func print_result(result: int) -> void:
	if result == AocSolution.NOT_IMPLEMENTED:
		print("(not implemented)")
		return

	print("result: " + str(result))
