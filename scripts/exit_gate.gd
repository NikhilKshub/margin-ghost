extends Area2D

@export var next_level: PackedScene

var used = false

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox" and not used:
		used = true
		var player = area.get_parent()
		while player.is_hopping:
			await get_tree().process_frame
		player.is_hopping = true
		player.sprite.play("starryidle")
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_packed(next_level)
