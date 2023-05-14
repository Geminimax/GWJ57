extends "res://node/Spell/Spell.gd"

func cast_at_position(source, target, delta= 0):
	var direction = source.global_position.direction_to(target)
	$Weapon.fire(direction, source.global_position)
