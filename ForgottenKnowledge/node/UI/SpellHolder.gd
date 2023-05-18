extends Node2D

export (PackedScene) var spell_card_scene

var test_spell = load("res://node/Spell/Spell.tscn")

var card_size = 44
var spell_cards : Array = [] 
var selected_spell = 0
onready var tween = $Tween

func _ready():
    #add_spell(get_test_spell("res://node/Spell/SpellShoot.tscn"))
    #add_spell(get_test_spell("res://node/Spell/SpellLeech.tscn"))
    pass
    
func _process(delta):
#    if(Input.is_action_just_pressed("ui_accept")):
#        add_spell(get_test_spell("res://node/Spell/SpellShoot.tscn"))
    if(Input.is_action_just_pressed("ui_cancel")):
        remove_spell(spell_cards.size() - 1)
    if(Input.is_action_just_released("spell_roll_left")):
        change_selected_spell(-1)
    if(Input.is_action_just_released("spell_roll_right")):
        change_selected_spell(1)

func get_selected_spell():
    if(spell_cards.empty()):
        return null
    return spell_cards[selected_spell].spell

func get_test_spell(path):
    var spell_instance = load(path).instance()
    add_child(spell_instance)
    return spell_instance
    
func change_selected_spell(offset):
    if(spell_cards.size() == 0):
        return
    spell_cards[selected_spell].spell.stop_casting()
    spell_cards[selected_spell].selected = false
    selected_spell += offset
    if(selected_spell < 0):
        selected_spell = max(0, spell_cards.size() - abs(selected_spell))
    if(selected_spell > spell_cards.size() - 1):
        selected_spell = (selected_spell - (spell_cards.size()))
    spell_cards[selected_spell].selected = true
    
func add_spell(spell):
    var spell_card_instance = spell_card_scene.instance()
    add_child(spell_card_instance)
    spell_cards.append(spell_card_instance)
    spell_card_instance.spell = spell
    reposition_cards()
    #Se for a primeira habilidade
    if(spell_cards.size() == 1):
        spell_card_instance.selected = true
    
func remove_spell(index):
    var to_remove = spell_cards[index]
    spell_cards.remove(index)
    to_remove.queue_free()
    reposition_cards()
    if(selected_spell == index):
        selected_spell = max(index - 1,0)

func reposition_cards():
    if(spell_cards.size() == 0):
        return
    tween.stop_all()
    var total_size = card_size * spell_cards.size()
    var initial_position = -total_size/2
    var increment = total_size/spell_cards.size()
    for i in range(spell_cards.size()):
        var card = spell_cards[i]
        var goal_position = initial_position + increment * i + card_size/2
        tween.interpolate_property(card,"position:x", card.position.x, goal_position, 1.0,Tween.TRANS_CUBIC,Tween.EASE_OUT)
    tween.start()
