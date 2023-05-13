extends "res://node/Enemy/Enemy.gd"

var move_speed = 200
var fart_rate = 1

func _process(delta):
	handle_movement()
	
	
func handle_movement():
	var direction = Vector2()
	
	if(Input.is_action_pressed("ui_up")):
		direction += Vector2.UP
	if(Input.is_action_pressed("ui_down")):
		direction += Vector2.DOWN	
	if(Input.is_action_pressed("ui_left")):
		direction += Vector2.LEFT
	if(Input.is_action_pressed("ui_right")):
		direction += Vector2.RIGHT
		
	direction = direction.normalized()
	
	move_and_slide(direction * move_speed)

func fart(position):
	pass
