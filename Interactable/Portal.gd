extends Area2D


func _on_Portal_body_entered(body):
	GameController.victory()
	var _e = get_tree().change_scene("res://World/Overworld.tscn")