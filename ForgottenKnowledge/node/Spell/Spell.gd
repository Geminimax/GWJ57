extends Node2D
class_name Spell
enum CAST_TYPE {CAST_AT_POSITION, CAST_AT_TARGET}
enum CAST_STYLE {CONTINOUS, DISCRETE}
export (CAST_STYLE) var cast_style = CAST_STYLE.CONTINOUS
export (CAST_TYPE) var cast_type
export (int, LAYERS_2D_PHYSICS) var target_mask
export (Texture) var spell_img
export (Texture) var spell_img_small
export (String) var spell_name
export (String) var spell_description
export (int) var mana_cost = 1
export (float) var cooldown = 0.3
var is_casting = false
var curr_cooldown = 0

func _process(delta):
    curr_cooldown -= delta

func get_current_cooldown():
    return curr_cooldown

func cast(source,target,delta = 0):
    is_casting = true
    if (curr_cooldown > 0):
        return false
    if(cast_type == CAST_TYPE.CAST_AT_POSITION):
        cast_at_position(source, target, delta)
    elif(cast_type == CAST_TYPE.CAST_AT_TARGET):
        var target_node = get_target(target)
        if(target_node == null):
            return false
        cast_at_target(source, target_node, delta)
        
    curr_cooldown = cooldown
    return true

func stop_casting():
    if(is_casting):
        is_casting = false
        on_stop_casting()

func on_stop_casting():
    pass

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
