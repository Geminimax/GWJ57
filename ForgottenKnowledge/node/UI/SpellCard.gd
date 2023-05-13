extends Node2D


var selected = false setget set_selected
var spell = false setget set_spell

func _ready():
    $Sprite.material = $Sprite.material.duplicate()

func set_selected(value):
    selected = value
    $Sprite.material.set_shader_param("enabled",selected)
    
    $Tween.remove_all()
    if(selected):
        $Tween.interpolate_property(self,"position:y",position.y,-5,0.5,Tween.TRANS_CUBIC,Tween.EASE_OUT)
    else:
        $Tween.interpolate_property(self,"position:y",position.y,0,0.5,Tween.TRANS_CUBIC,Tween.EASE_OUT)
    $Tween.start()
func set_spell(value):
    spell = value
    if(spell):
        $Sprite.texture = spell.spell_img
