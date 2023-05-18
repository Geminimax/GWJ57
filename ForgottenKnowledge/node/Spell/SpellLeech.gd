extends "res://node/Spell/Spell.gd"
var leech_rate = 100

    
func cast_at_target(source, target, delta = 0):
    if(target == null):
        return
    source.add_mp(leech_rate * delta)
    $VFXProjectileSpawner.fire(source,get_random_spawn_position(target.global_position,15))

func on_stop_casting():  
    pass

func get_random_spawn_position(source, radius):
    return source + Vector2.RIGHT.rotated(deg2rad(rand_range(0,360))) * rand_range(0,radius)
