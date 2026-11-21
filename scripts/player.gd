extends Node2D

var jump_range = 120.0
var is_hopping = false

func _input(event):
	if event.is_action_pressed("ui_right") and not is_hopping:
		hop(1)
	if event.is_action_pressed("ui_left") and not is_hopping:
		hop(-1)
