extends Node2D

export (int) var damage_amount
var direction : Vector2 = Vector2.UP
var speed : float = 100 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += direction * speed * delta



func _on_CollisionArea_area_entered(area):
	queue_free()
