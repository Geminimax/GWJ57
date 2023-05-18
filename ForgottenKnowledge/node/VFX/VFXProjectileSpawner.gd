extends Node2D

export (PackedScene) var bullet
export (float) var cooldown = 0.1
var current_cooldown = cooldown
func _process(delta):
    if(current_cooldown > 0):
        current_cooldown -= delta
    
func fire(target,spawn_position = global_position):
    if(current_cooldown > 0):
        return
    current_cooldown = cooldown
    var bullet_instance = bullet.instance()
    bullet_instance.target = target
    get_tree().root.add_child(bullet_instance)
    bullet_instance.global_position = spawn_position
