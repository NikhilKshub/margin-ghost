extends Node2D

var jump_range = 160.0
var is_hopping = false
var hop_time = 0.5
var hop_height =210.0
@onready var sprite = $Sprite2D
@onready var start_y = sprite.position.y
var current_dot = null
var is_falling = false

func _input(event):
	if event.is_action_pressed("ui_right") and not is_hopping:
		hop(1)
	if event.is_action_pressed("ui_left") and not is_hopping:
		hop(-1)

func find_spot(direction):
	var best_spot = null
	var best_dot = null
	var best_distance = jump_range
	for dot in get_tree().get_nodes_in_group("dots"):
		var spot = dot.global_position
		if(spot.x - position.x) * direction > 0 and position.distance_to(spot) < best_distance:
			best_spot = spot
			best_dot = dot
			best_distance = position.distance_to(spot)
	return best_dot
	
func hop(direction):
	var dot = find_spot(direction)
	if dot == null:
		return 
	is_hopping = true
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true
	sprite.play("jump")
	var tween = create_tween()
	tween.tween_property(self, "global_position", dot.global_position, hop_time)
	current_dot = dot
	var lift = create_tween()
	lift.tween_property(sprite, "position:y", start_y - hop_height, hop_time / 2).set_trans(Tween.TRANS_SINE)
	lift.tween_property(sprite, "position:y", start_y, hop_time / 2).set_trans(Tween.TRANS_SINE)
	await tween.finished
	sprite.play("idle")
	is_hopping = false
	

func _process(delta):
	if current_dot != null and not is_hopping and not is_falling and not is_instance_valid(current_dot):
		fall()
		
func fall():
	is_falling = true
	is_hopping = true
	var tween = create_tween()
	tween.tween_property(self, "position:y", position.y + 800, 0.7).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	await tween.finished
	get_tree().reload_current_scene()
