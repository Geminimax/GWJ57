extends Node
class_name HP

signal died

export (int) var total = 100
var current = total

func damage(amount):
	current -= amount
	
	if (current <= 0):
		emit_signal("died")
		
		
func heal(amount):
	current += amount
	
	if (current > total):
		current = total
