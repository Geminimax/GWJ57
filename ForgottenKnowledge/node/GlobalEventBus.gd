extends Node
signal spell_dropped(spell)
signal pixel_perfect_element_spawn(element)
func emit_spell_dropped(spell):
    emit_signal("spell_dropped",spell)

func emit_pixel_perfect_element_spawn(element):
    emit_signal("pixel_perfect_element_spawn",element)
