extends Area2D


# private methods
func _on_Carrot_body_entered(_body):
	GameController.update_carrot_count(1)
	queue_free()
