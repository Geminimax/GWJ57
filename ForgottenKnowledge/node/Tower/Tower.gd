extends KinematicBody2D

onready var hp = $HP

signal tower_died

func _on_Area2D_area_entered(area):
	var parent = area.get_parent()
	
	if (parent.is_in_group("enemy")):
		take_damage(parent.damage)

func take_damage(amount):
	hp.damage(amount)

func _on_HP_died():
	emit_signal("tower_died")
