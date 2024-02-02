class_name drag_handle extends ColorRect

@export var parent : Control
var hovering := false
var dragging := false
var offset := Vector2.ZERO

func _input(event):
	if(hovering):
		if(event is InputEventMouseButton):
			if(event.pressed):
				dragging = true
				offset = event.position - parent.position
			else:
				dragging = false

	if(dragging && event is InputEventMouseMotion):
		var new_position = event.position - offset
		var maximum = Vector2(DisplayServer.window_get_size()) - parent.size * parent.scale
		new_position = new_position.clamp(Vector2.ZERO, maximum)
		parent.position = new_position

func _mouse_enter():
	hovering = true

func _mouse_exit():
	hovering = false
