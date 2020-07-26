extends Node


# Declare member variables here. Examples:
onready var rabbit = $Rabbit
onready var camera = $Rabbit/Camera2D
onready var light = $Rabbit/Light2D
onready var decoration = $Decoration


# Called when the node enters the scene tree for the first time.
func _ready():
	camera.current = false
	light.enabled = false
	if GameController.deaths >= 20:
		decoration.texture = load("res://Sprites/reaper.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(_body):
	GameController.near_shop = true
