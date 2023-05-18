extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = $Player
onready var spellbook_spawner = $SpellBookSpawner 
# Called when the node enters the scene tree for the first time.
func _ready():
    spellbook_spawner.spawn_book(player.spells.leech)
    spellbook_spawner.spawn_book(player.spells.shoot)
    spellbook_spawner.spawn_book(player.spells.summon)
    GlobalEventBus.connect("pixel_perfect_element_spawn",self,"on_pixel_perfect_element_spawned")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func on_pixel_perfect_element_spawned(element):
    $ViewportContainer/PixelPerfectRenderer.add_child(element)
