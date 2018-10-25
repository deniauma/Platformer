extends "res://States/Base_state.gd"

const UP = Vector2(0, -1)
const MAX_SPEED = 100
const GRAVITY = 20
const ACCELERATION = 50
const JUMP_HEIGHT = -500
var motion = Vector2()

# Initialize the state. E.g. change the animation
func enter():
	print("State moving")

# Clean up the state. Reinitialize values like a timer
func exit():
	return

func update(delta):
	motion.y += GRAVITY
	
	var x_dist = get_distance()
	var x_dir = get_look_direction()
	if abs(x_dist) < 45:
		return emit_signal("finished", "attacking")
	else:
		motion.x = x_dir * MAX_SPEED
		owner.get_node("Weapon").scale.x = -x_dir * abs(owner.get_node("Weapon").scale.x)
		motion = owner.move_and_slide(motion, UP)
		return
		
func _on_body_exited(body):
	._on_body_exited(body)
	emit_signal("finished", "idle")