extends "res://node/Enemy/Enemy.gd"

var depletion = 50

func _process(delta):
	hp.damage(delta * depletion)
