extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (Texture) var spell_img
export (String) var spell_name
export (String) var spell_description

func cast_at_position(target : Vector2):
    pass

func cast_at_target(target : Node2D):
    pass
