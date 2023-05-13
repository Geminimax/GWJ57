extends "res://node/Enemy/Enemy.gd"

onready hp = $HP

func _process(delta):
	hp.damage(delta)
	
