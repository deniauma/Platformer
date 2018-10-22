extends KinematicBody2D

signal state_changed
var look_direction = Vector2(-1, 0)

onready var states_map = {
	"idle": $States/Idle,
	"moving": $States/Moving,
	"attacking": $States/Attacking,
}

var current_state = null
var target_seen = false
var target_node = null

func _ready():
	for state_node in $States.get_children():
		state_node.connect("finished", self, "_change_state")
	current_state = states_map["idle"]
	_change_state("idle")

func _physics_process(delta):
	current_state.update(delta)
	
func _change_state(state_name):
	current_state.exit()
	current_state = states_map[state_name]
	current_state.enter()
	emit_signal("state_changed", state_name)

func _on_Vision_body_entered(body):
	current_state._on_body_entered(body)

func _on_Vision_body_exited(body):
	current_state._on_body_exited(body)
