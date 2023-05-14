extends KinematicBody2D

onready var hp: HP = $HP

export (int) var speed = 20

func take_damage(amount):
	hp.damage(amount)

func _on_Area2D_area_entered(area):
	var parent = area.get_parent()
	
	if (parent.is_in_group("projectile")): 
		take_damage(parent.damage_amount)


func _on_HP_died():
	queue_free()
