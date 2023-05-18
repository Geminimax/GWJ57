extends "res://node/Spell/Spell.gd"

var wraith_scene = preload("res://node/Character/Wraith.tscn")
func cast_at_position(source, target, delta = 0):
    var wraith_instance = wraith_scene.instance()
    get_tree().root.add_child(wraith_instance)
    wraith_instance.global_position = target
