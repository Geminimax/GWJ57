extends KinematicBody2D

var move_speed = 120
var total_mp = 100
var current_mp = 100 #total_mp
var mp_regen_rate = 0

onready var spell_holder = $CanvasLayer/SpellHolder
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_movement()
	handle_mp(delta)
	handle_spell(delta)
	$CanvasLayer/Label.text = String(current_mp)
	
func handle_spell(delta):
	if(Input.is_action_pressed("cast_spell")):
		cast_spell(delta)
	if(Input.is_action_just_released("cast_spell")):
		stop_casting_current_spell()

func stop_casting_current_spell():
	var spell = spell_holder.get_selected_spell()
	spell.stop_casting()
func cast_spell(delta):
	print("Cast spell")
	var spell = spell_holder.get_selected_spell()
	if(current_mp > spell.mana_cost):
		if (spell.cast(self, get_global_mouse_position(), delta)):
			current_mp -= spell.mana_cost

func handle_mp(delta):	
	if(current_mp < total_mp):
	   add_mp(mp_regen_rate * delta)

func add_mp(amount):
	current_mp += amount
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
	if(direction == Vector2.ZERO):
		#$AnimatedSprite.play("idle")
		pass
	else:
		$AnimatedSprite.play("walk")
	move_and_slide(direction * move_speed)
