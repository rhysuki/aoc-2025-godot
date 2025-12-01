class_name StateMachine
## An implementation of a Finite State Machine.
## Use extensions of State with this.


var _context
var _current_state: State = State.new()


func _init(context, initial_state: State = _current_state):
	_context = context
	change_state(initial_state)


func process(delta: float):
	_current_state.process(delta)


func physics_process(delta: float):
	_current_state.physics_process(delta)


func draw():
	_current_state.draw()


func change_state(state: State):
	if (_current_state):
		_current_state.exit()

	_current_state = state
	_current_state.set_context(self, _context)
	_current_state.enter()


func _draw():
	_current_state.draw()
