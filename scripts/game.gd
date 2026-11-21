extends Node2D


@export var line_scene: PackedScene
var current_line = null
var point_gap = 20.0

function _input(event):
	if event is InputEventMouseButton:
		if event.button_index == Mouse_button_left and event.pressed:
			current_line = line_scene.instantiate()
			add_child(current_line)
			current_line.add_point(get_global_mouse_position())
			
			
