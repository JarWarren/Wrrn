extends Area2D

# private methods
func _on_Warren_body_entered(_body):
	GameController.overworld = false
	var _e = get_tree().change_scene("res://World/Underworld.tscn")
