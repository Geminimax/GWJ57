extends "res://node/Enemy/Enemy.gd"

export (NodePath) var target

var fart = load("res://node/Enemy/FartCloud/Fart.tscn")

var move_speed = 200
var fart_rate = .4
var time_elapsed = 0
var velocity = Vector2.ZERO

onready var pathfinder = $Pathfinder

func _ready():
	pathfinder.set_target(get_node(target))

func _process(delta):
	handle_movement(delta)
	
	time_elapsed += delta
	if (time_elapsed >= fart_rate):
		time_elapsed = 0
		fart(position)

	
	
func handle_movement(delta):
	var direction = pathfinder.get_target_direction()

	var desired_velocity = direction * speed
	var steering = (desired_velocity - velocity) * delta * 4.0
	velocity += steering
	
	velocity = move_and_slide(velocity)

func fart(position):
	var fart_instance = fart.instance()
	get_tree().root.add_child(fart_instance)
	fart_instance.global_position = position
	fart_instance.z_index = -1
