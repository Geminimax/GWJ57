extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target
var target_speed = 220
var speed = 0
var min_dist = 5
# Called when the node enters the scene tree for the first time.
func _ready():
    $AnimatedSprite.play("create")
    yield($AnimatedSprite,"animation_finished")
    $AnimatedSprite.play("idle")
    speed = target_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var direction = global_position.direction_to(target.global_position)
    $AnimatedSprite.rotation = direction.angle()
    if(global_position.distance_to(target.global_position) < min_dist):
        destroy()
    global_position += direction * speed * delta
func destroy():
    speed = 0
    set_process(false)
    $AnimatedSprite.play("destroy")
    yield($AnimatedSprite,"animation_finished")
    queue_free()
