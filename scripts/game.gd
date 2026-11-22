extends Node2D


@export var line_scene: PackedScene
@export var dot_scene: PackedScene
var current_line = null
var point_gap = 100.0
var line_step = 5.0
var last_dot = Vector2.ZERO
@onready var player = $Player
@onready var entry_gate = $EntryGate

func _ready():
	player.position = entry_gate.position

func add_line_point(spot):
	current_line.add_point(spot)

func add_dot(spot):
	var dot = dot_scene.instantiate()
	dot.position = spot
	current_line.add_child(dot)
	dot.add_to_group("dots")
	last_dot = spot

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			current_line = line_scene.instantiate()
			current_line.add_to_group("lines")
			add_child(current_line)
			var spot = get_global_mouse_position()
			add_line_point(spot)
			add_dot(spot)
			
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			current_line = null
			
	if event is InputEventMouseMotion and current_line != null:
		var last_point = current_line.get_point_position(current_line.get_point_count() - 1)
		var mouse_position = get_global_mouse_position()
		while last_point.distance_to(mouse_position) >= line_step:
			var next = last_point + last_point.direction_to(mouse_position) * line_step
			add_line_point(next)
			last_point = next
			if last_dot.distance_to(next) >= point_gap:
				add_dot(next)
