extends Node2D

var player
var spell_book_scene = preload("res://node/Spellbook/SpellBook.tscn")
func _ready():
    GlobalEventBus.connect("spell_dropped", self, "on_spell_dropped")
func on_spell_dropped(spell):
    spawn_book(spell)

func spawn_book(spell):
    var book_instance = spell_book_scene.instance()
    add_child(book_instance)
    book_instance.spell = spell
    book_instance.global_position = get_random_spawn_position()

func get_random_spawn_position():
    return Vector2(rand_range(0,490),rand_range(0,270))
