extends Area2D

# properties
var player = null


# public methods
func can_see_player():
	return player != null


# private methods
func _on_PlayerDetectionZone_body_entered(body):
	player = body


func _on_PlayerDetectionZone_body_exited(_body):
	player = null
