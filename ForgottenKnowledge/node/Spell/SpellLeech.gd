extends "res://node/Spell/Spell.gd"
var leech_rate = 100
func cast_at_target(source, target, delta = 0):
	source.add_mp(leech_rate * delta)
