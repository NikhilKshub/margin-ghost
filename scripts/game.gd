extends Node2D


@export var line_scene: PackedScene
var current_line = null
var point_gap = 20.0

function _input(event):
	if event is InputEventMouseButton:
		if event.button_index == Mouse_button_left and event.pressed:
			
