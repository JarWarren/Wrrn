extends Node


func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_attack"):
		var _e = get_tree().change_scene("res://World/Overworld.tscn")
