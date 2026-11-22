extends Node2D


@export var line_scene: PackedScene
@export var land_y = 540.0
@export var fall_time = 0.5
@export var half_width = 60.0

func drop():
	var tween = create_tween()
	tween.tween_property(self, "position:y", land_y, fall_time).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	await tween.finished
	break_lines()

func break_lines():
	for dot in get_tree().get_nodes_in_group("dots"):
		if abs(dot.global_position.x - global_position.x) <= half_width:
			dot.queue_free()
	for line in get_tree().get_nodes_in_group("lines"):
		var first = -1
		var last = -1
		for i in range(line.get_point_count()):
			var point = line.to_global(line.get_point_position(i))
			if abs(point.x - global_position.x) <= half_width:
				if first == -1:
					first = i
				last = i
		if first == -1:
			continue
		if last < line.get_point_count() - 1:
			var piece = line_scene.instantiate()
			piece.transform = line.transform
			piece.add_to_group("lines")
			line.get_parent().add_child(piece)
			for i in range(last + 1, line.get_point_count()):
				piece.add_point(line.get_point_position(i))
		while line.get_point_count() > first:
			line.remove_point(line.get_point_count() - 1)
