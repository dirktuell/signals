extends Timer

@export var smile_scene: PackedScene

func _on_timeout() -> void:
	var new_smile = smile_scene.instantiate()
	
	var base_width = ProjectSettings.get_setting("display/window/size/viewport_width")
	var base_height = ProjectSettings.get_setting("display/window/size/viewport_height")
	
	new_smile.position.x = randi_range(100, base_width - 100)
	new_smile.position.y = randi_range(100, base_height - 100)
	
	get_node("../").add_child(new_smile)

func _on_score_game_won() -> void:
	stop()
