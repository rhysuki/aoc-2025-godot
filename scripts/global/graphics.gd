extends Node2D


var window_scale: int = 1
@onready var _window: Window = get_window()


func _ready():
	set_window_scale(3)


func _process(_delta):
	if Input.is_action_just_pressed("debug_increase_window_size"):
		set_window_scale(window_scale + 1)

	if Input.is_action_just_pressed("debug_decrease_window_size"):
		set_window_scale(window_scale - 1)

	if Input.is_action_just_pressed("debug_quit"):
		get_tree().quit()


func set_window_scale(n: int) -> void:
	window_scale = max(1, n)
	_window.size = (get_viewport_rect().size as Vector2i) * window_scale
	# Center window
	_window.position = (DisplayServer.screen_get_size() / 2) - (_window.size / 2)