extends Node2D


var selected = false setget set_selected
var spell = false setget set_spell
func _ready():
    $Back.material = $Back.material.duplicate()
    $Back.play("appear")
    $Sprite.modulate.a = 0
    yield($Back,"animation_finished")
    $Tween.interpolate_property($Sprite,"modulate:a",0,1.0,0.3,Tween.TRANS_CUBIC,Tween.EASE_OUT,0.1)
    $Tween.start()
func set_selected(value):
    selected = value
    $Back.material.set_shader_param("enabled",selected)
    
    #$Tween.remove_all()
    if(selected):
        $Tween.interpolate_property(self,"position:y",position.y,-5,0.5,Tween.TRANS_CUBIC,Tween.EASE_OUT)
    else:
        $Tween.interpolate_property(self,"position:y",position.y,0,0.5,Tween.TRANS_CUBIC,Tween.EASE_OUT)
    $Tween.start()
func set_spell(value):
    spell = value
    if(spell):
        $Sprite.texture = spell.spell_img
