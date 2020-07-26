extends Area2D


func _on_Carrot_body_entered(_body):
	GameController.update_carrot_count(1)
	queue_free()
