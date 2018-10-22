extends StateBase

enum transitions {
	OnClicked,
	OnTimeUp
}

export(NodePath) var tween
export(NodePath) var colorRect
export(Color) var tint
export(float, 0, 10) var duration
export(float) var exitTime : float = 3

var color_rect : ColorRect = null
var tween_node : Tween = null

func _process(delta):
	if stateTime > exitTime:
		invoke_transition(OnTimeUp, [color_rect.color])

func on_start(exit_args = []):
	tween_node = get_parent().get_node(tween) as Tween
	color_rect = get_parent().get_node(colorRect) as ColorRect
	
	# Default color from which tween is gonna interpolate
	var from_color = Color.black
	
	# If previous state invoked transition with color argument, use that color
	if exit_args.size() > 0:
		if exit_args[0] is Color:
			from_color = exit_args[0]
	
	tween_node.stop_all()
	tween_node.interpolate_property(color_rect, "color", from_color, tint, 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween_node.start()
	
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			invoke_transition(OnClicked, [color_rect.color])