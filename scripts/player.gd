extends Node2D

var jump_range = 120.0
var is_hopping = false

func _input(event):
	if event.is_action_pressed("ui_right") and not is_hopping:
		hop(1)
	if event.is_action_pressed("ui_left") and not is_hopping:
		hop(-1)

func find_spot(direction):
	var best_spot = null
	var best_distance = jump_range
	for line in get_tree().get_nodes_in_group("lines"):
		for i in range(line.get_point_count()):
			var spot = line.get_point_position(i)
			if(spot.x - position.x) * direction > 0 and position.distance_to(spot) < best_distance:
				best_spot = spot
				best_distance = position.distance_to(spot)
	return best_spot
	
