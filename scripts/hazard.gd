extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		get_tree().reload_current_scene()
