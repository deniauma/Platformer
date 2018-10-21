extends Area2D
var attacking = false

func _physics_process(delta):
	if Input.is_action_just_pressed("attack") and not attacking:
		$AnimationPlayer.play("attack")
		attacking = true

func _on_AnimationPlayer_animation_finished(anim_name):
	print("stop attacking")
	attacking = false
