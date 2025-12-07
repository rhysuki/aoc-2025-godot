extends Node2D


@onready var _measure: MeasureTime = $MeasureTime
@onready var _label: RichTextLabel = $RichTextLabel
var _solutions: Array[AocSolution] = [
	AocDay1.new(),
	AocDay2.new(),
	AocDay3.new(),
	AocDay4.new(),
	AocDay5.new(),
	AocDay6.new(),
]


func _ready() -> void:
	_solutions.back().printed.connect(print_to_label)
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


func print_to_label(text: String) -> void:
	_label.text += "\n" + text
	print(text)