extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var wraith_color = Color("5d9b79")
onready var circle_renderer = $CircleAreaRenderer
# Called when the node enters the scene tree for the first time.
func _ready():
    $CircleAreaRenderer.circle_color = wraith_color
    $CircleAreaRenderer.follow = self
    remove_child(circle_renderer)
    GlobalEventBus.emit_pixel_perfect_element_spawn(circle_renderer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
