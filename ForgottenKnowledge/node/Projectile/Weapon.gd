extends Node2D


var firing_angle = 25
export (PackedScene) var bullet

func fire(direction, spawn_position = global_position):
	var bullet_instance = bullet.instance()
	bullet_instance.direction = direction
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = spawn_position
