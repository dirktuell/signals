extends Label

signal game_won

var score: int = 0
const WINNING_SCORE = 150

func add_to_score(amount: int):
	score += amount
	update_score()
	
func update_score():
	text = "Score: " + str(score)
	if score == WINNING_SCORE:
		game_won.emit()
		text = "FINAL SCORE: " + str(score)
	
func _on_button_pressed() -> void:
	add_to_score(5)


func _on_game_won() -> void:
	var timer = get_tree().create_timer(5)
	await timer.timeout
	get_tree().reload_current_scene()
