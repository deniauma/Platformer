extends Area2D

signal animation_finished(anim_name)

func _on_animation_finished(anim_name):
	return emit_signal("animation_finished", anim_name)
	
func attack():
	$AnimationPlayer.play("attack")
