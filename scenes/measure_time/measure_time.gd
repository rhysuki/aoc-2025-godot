class_name MeasureTime extends Node


var _start_time


func start() -> void:
	_start_time = Time.get_ticks_usec()


func finish() -> void:
	var delta = Time.get_ticks_usec() - _start_time
	print("time taken: %sms (about %.2f seconds)" % [delta / 1000.0, delta / 1000.0 / 1000.0])


func measure_function(fn: Callable) -> void:
	start()
	fn.call()
	finish()