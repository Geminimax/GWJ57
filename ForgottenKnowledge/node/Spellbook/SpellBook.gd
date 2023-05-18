extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spell setget set_spell
var disabled = false
# Called when the node enters the scene tree for the first time.
func _ready():
    $BookSprite.material = $BookSprite.material.duplicate()
    $Icon.modulate = Color.transparent
    $BookSprite.play("spawn")
    yield($BookSprite,"animation_finished")
    $AnimationPlayer.play("IconShow")
    $BookSprite.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func set_spell(value):
    spell = value
    if(spell != null):
        $Icon.texture = spell.spell_img_small


func _on_PickupRangeArea_area_entered(area):
    player_nearby_effects()

func player_nearby_effects():
    $BookSprite.play("nearby")
    $Particles2D.emitting = true
    $BookSprite.material.set_shader_param("enabled",true)

func disable_player_nearby_effects():
    $BookSprite.play("idle")
    $Particles2D.emitting = false
    $BookSprite.material.set_shader_param("enabled",false)


func _on_PickupRangeArea_area_exited(area):
    if(disabled):
        return
    disable_player_nearby_effects()

func pickup():
    disabled = true
    $PickupRangeArea/PickupRange.set_deferred("disabled",true)
    disable_player_nearby_effects()
    $AnimationPlayer.play("IconHide")
    yield($AnimationPlayer,"animation_finished")
    $BookSprite.play("consume")
    
    yield($BookSprite,"animation_finished")
    queue_free()
