extends RigidBody2D

const MAX_TORQUE = 10000
const MIN_TORQUE = 2000
var torque_amount: int
var button: Button
var score: Label

func _ready() -> void:
	torque_amount = randi_range(MIN_TORQUE, MAX_TORQUE)
	
	button = get_node("../Button")
	button.connect("pressed", _on_button_pressed)
	
	score = get_node("../Score")
	score.connect("game_won", _on_game_won)
	
func _on_button_pressed() -> void:
	apply_torque_impulse(torque_amount)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	
func _on_game_won():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0, 2)
