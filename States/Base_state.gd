"""
Base interface for all states: it doesn't do anything in itself
but forces us to pass the right arguments to the methods below
and makes sure every State object had all of these methods.
"""
extends Node

signal finished(next_state_name)

# Initialize the state. E.g. change the animation
func enter():
	return

# Clean up the state. Reinitialize values like a timer
func exit():
	return

func handle_input(event):
	return

func update(delta):
	return

func _on_body_entered(body):
	if body.name == "Player":
		owner.get_node("Sprite").modulate = Color(1, 0, 0)
		owner.target_seen = true
		owner.target_node = body
			
func _on_body_exited(body):
	if body.name == "Player":
		owner.get_node("Sprite").modulate = Color(1, 1, 1)
		owner.target_seen = false
		owner.target_node = null
	
