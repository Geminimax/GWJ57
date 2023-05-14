extends Node

onready var navigation = $NavigationAgent2D
onready var timer = $Timer

var target_node

func _ready():
#	update_pathfinding()
	timer.connect("timeout", self, "update_pathfinding")
	
func get_target_direction():
	return get_parent().global_position.direction_to(target_node.global_position)

func update_pathfinding():
	navigation.set_target_location(target_node.global_position)

func set_target(target):
	target_node = target

