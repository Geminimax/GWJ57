extends "res://node/Enemy/Enemy.gd"

var depletion = 80

func _process(delta):
	hp.damage(delta * depletion)
