extends Area2D


func _on_Carrot_body_entered(_body):
	Signals.emit_signal("carrot_amount_changed", 1)
	queue_free()
