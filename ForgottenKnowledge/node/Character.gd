extends KinematicBody2D

var move_speed = 500
var total_mp = 100
var current_mp = 0 #total_mp
var mp_regen_rate = 10

onready var spell_holder = $CanvasLayer/SpellHolder
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_movement()
	handle_mp(delta)
	handle_spell()
	
	
func handle_spell():
	if(Input.is_action_pressed("cast_spell")):
		cast_spell()
	

func cast_spell():
	var spell = spell_holder.get_selected_spell()
	if(current_mp > spell.mana_cost):
		current_mp -= spell.mana_cost
		spell.cast(self, get_global_mouse_position())

func handle_mp(delta):	
	if(current_mp < total_mp):
		current_mp += delta * mp_regen_rate
		if(current_mp > total_mp):
			current_mp = total_mp

	
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
