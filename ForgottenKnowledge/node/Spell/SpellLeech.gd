extends "res://node/Spell/Spell.gd"
var leech_rate = 100

func _ready():
	$BeamEffect.visible = false
	
func cast_at_target(source, target, delta = 0):
	if(target == null):
		return
	source.add_mp(leech_rate * delta)
	$BeamEffect.global_position = source.global_position
	$BeamEffect.update_beam(source.global_position, target.global_position)
	$BeamEffect.visible = true

func on_stop_casting():
	$BeamEffect.visible = false
