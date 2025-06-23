extends Label

var clicks: int
var achievement_amount: int
@export var button: Button

func _ready() -> void:
	achievement_amount = randi_range(5,20)
	
func _on_button_pressed() -> void:
	clicks += 1
	if clicks == achievement_amount:
		text = "You clicked %d times!" % achievement_amount
		visible = true
		button.disconnect("pressed", _on_button_pressed)	


func _on_score_game_won() -> void:
	visible = false
