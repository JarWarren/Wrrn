extends Area2D


# private methods
func _on_Portal_body_entered(_body):
	GameController.victory()
	var _e = get_tree().change_scene("res://World/Overworld.tscn")
