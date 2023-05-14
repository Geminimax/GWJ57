extends Node2D
enum CAST_TYPE {CAST_AT_POSITION, CAST_AT_TARGET}
export (CAST_TYPE) var cast_type
export (int, LAYERS_2D_PHYSICS) var target_mask
export (Texture) var spell_img
export (String) var spell_name
export (String) var spell_description
export (int) var mana_cost = 1
export (float) var cooldown = 0.3

var curr_cooldown = 0

func _process(delta):
	curr_cooldown -= delta

func get_current_cooldown():
	return curr_cooldown

func cast(source,target,delta = 0):
	if (curr_cooldown > 0):
		return false
	print("casting")
	if(cast_type == CAST_TYPE.CAST_AT_POSITION):
		print("casting at position")
		cast_at_position(source, target, delta)
	elif(cast_type == CAST_TYPE.CAST_AT_TARGET):
		print("casting at target")
		var target_node = get_target(target)
		cast_at_target(source, target, delta)
		
	curr_cooldown = cooldown
	return true

func get_target(target):
	var space = get_world_2d().direct_space_state
	# Get the mouse's position
	var mousePos = get_global_mouse_position()
	# Check if there is a collision at the mouse position
	var col = space.intersect_point(mousePos, 1, [], target_mask, false, true )
	if !col.empty():
		return col[0].collider.get_parent()
	
func cast_at_position(source, target, delta = 0):
	pass

func cast_at_target(source, target, delta = 0):
	pass
