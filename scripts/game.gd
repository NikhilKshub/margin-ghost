extends Node2D


@export var line_scene: PackedScene
@export var dot_scene: PackedScene
var current_line = null
var point_gap = 100.0
@onready var player = $Player
@onready var entry_gate = $EntryGate

func _ready():
	player.position = entry_gate.position

func add_spot(spot):
	current_line.add_point(spot)
	var dot = dot_scene.instantiate()
	dot.position = spot
	current_line.add_child(dot)

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			current_line = line_scene.instantiate()
			current_line.add_to_group("lines")
			add_child(current_line)
			add_spot(get_global_mouse_position())
			
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			current_line = null
			
	if event is InputEventMouseMotion and current_line != null:
		var last_point = current_line.get_point_position(current_line.get_point_count() - 1)
		var mouse_position = get_global_mouse_position()
		
		while last_point.distance_to(mouse_position) >= point_gap:
			var next = last_point + last_point.direction_to(mouse_position) * point_gap
			add_spot(next)
			last_point = next
