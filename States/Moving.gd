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
	
	var dist = owner.global_position.distance_to(owner.target_node.global_position)
	var x_dir = owner.target_node.global_position.x - owner.global_position.x
	x_dir = x_dir / abs(x_dir)
	motion.x = x_dir * MAX_SPEED
	
	motion = owner.move_and_slide(motion, UP)
		
func _on_body_exited(body):
	._on_body_exited(body)
	emit_signal("finished", "idle")