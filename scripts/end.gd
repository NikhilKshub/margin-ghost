extends Node2D

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().change_scene_to_file("res://scenes/level_1.tscn")
