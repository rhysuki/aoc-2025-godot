class_name State
# A State to be extended and used with StateMachine.


var _context
var _state_machine: StateMachine


func set_context(state_machine: StateMachine, context):
	_state_machine = state_machine
	_context = context


func enter():
	pass


func exit():
	pass


func process(_delta: float):
	pass


func physics_process(_delta: float):
	pass


func draw():
	pass
