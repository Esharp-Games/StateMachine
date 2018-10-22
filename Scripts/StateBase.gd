extends Node
class_name StateBase

enum transitions {}

var stateTime : float = 0

# Signals
signal transition_requested(transition_trigger, exit_args)

func _process(delta):
	stateTime += delta

func on_start(exit_args = []):
	pass

func on_stop():
	pass

func invoke_transition(transition_trigger, exit_args = []):
	emit_signal("transition_requested", transition_trigger, exit_args)
