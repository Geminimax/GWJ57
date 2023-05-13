extends "res://node/Enemy/Enemy.gd"

var fart = load("res://node/Enemy/FartCloud/Fart.tscn")

var move_speed = 200
var fart_rate = .4
var time_elapsed = 0


func _process(delta):
	handle_movement()
	
	time_elapsed += delta
	if (time_elapsed >= fart_rate):
		time_elapsed = 0
		fart(position)

	
	
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
	var fart_instance = fart.instance()
	get_tree().root.add_child(fart_instance)
	fart_instance.global_position = position
	fart_instance.z_index = -1
