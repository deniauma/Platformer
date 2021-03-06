extends "res://States/Base_state.gd"

const UP = Vector2(0, -1)
const MAX_SPEED = 200
const GRAVITY = 20
const ACCELERATION = 50
const JUMP_HEIGHT = -500
var motion = Vector2()

# Initialize the state. E.g. change the animation
func enter():
	print("state Idle")
	return

# Clean up the state. Reinitialize values like a timer
func exit():
	return

func update(delta):
	motion.y += GRAVITY
	motion = owner.move_and_slide(motion, UP)

func _on_body_entered(body):
	._on_body_entered(body)
	emit_signal("finished", "moving")