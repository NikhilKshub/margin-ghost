extends Area2D

@export var target: Node

var used = false


func _on_area_entered(area: Area2D):
	if area.name == "Hitbox" and not used:
		used = true
		target.drop()
