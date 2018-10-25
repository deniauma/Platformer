extends "res://States/Base_state.gd"

var attacking = false

# Initialize the state. E.g. change the animation
func enter():
	print("State attacking")

# Clean up the state. Reinitialize values like a timer
func exit():
	attacking = false
	return

func update(delta):
	if not attacking:
		var x_dist = get_distance()
		print(str(x_dist))
		if x_dist > 50:
			return emit_signal("finished", "moving")
		else:
			owner.attack()
			attacking = true
			return

func _on_animation_finished(anim_name):
	attacking = false
	return

func _on_body_exited(body):
	if body.name == "Player":
		owner.get_node("Sprite").modulate = Color(1, 1, 1)
		owner.target_seen = false
		owner.target_node = null
		return emit_signal("finished", "idle")