extends Node2D

export (int) var loop_size = 12
export (float) var offset_speed = 100
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	#update_beam($Position2D.global_position, $Position2D2.global_position)
	pass
func update_beam(source : Vector2 ,target : Vector2):
	var size = source.distance_to(target)
	$Sprite.region_rect.size.x = size
	rotation = target.angle_to_point(source)

func _process(delta):
	$Sprite.region_rect.position.x += delta * offset_speed
	$Sprite.region_rect.position.x = fmod($Sprite.region_rect.position.x,loop_size)
