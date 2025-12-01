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
	_measure.start()
	var current_day: AocSolution = _solutions.back()
	print("result: %s" % current_day.solve())
	_measure.finish()