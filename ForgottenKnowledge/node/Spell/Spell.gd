extends Node

export (Texture) var spell_img
export (String) var spell_name
export (String) var spell_description
export (int) var mana_cost = 1

func cast(source,target):
    if(target is Vector2):
        cast_at_position(source,target)
    elif(target is Node):
        cast_at_target(source, target)

func cast_at_position(source, target):
    pass

func cast_at_target(source, target):
    pass
