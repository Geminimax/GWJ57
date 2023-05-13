extends Node

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

func cast(source,target):
    if (curr_cooldown > 0):
        return false
    
    if(target is Vector2):
        cast_at_position(source,target)
    elif(target is Node):
        cast_at_target(source, target)
        
    curr_cooldown = cooldown
    return true

func cast_at_position(source, target):
    pass

func cast_at_target(source, target):
    pass
