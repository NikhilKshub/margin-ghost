extends Node2D


@export var line_scene: PackedScene
var current_line = null
var point_gap = 20.0

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			current_line = line_scene.instantiate()
			current_line.add_to_group("lines")
			add_child(current_line)
			current_line.add_point(get_global_mouse_position())
			
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			current_line = null
			
	if event is InputEventMouseMotion and current_line != null:
		var last_point = current_line.get_point_position(current_line.get_point_count() - 1)
		var mouse_position = get_global_mouse_position()
		
		if last_point.distance_to(mouse_position) >= point_gap:
			current_line.add_point(mouse_position)
