extends Node


# Declare member variables here. Examples:
onready var rabbit = $Rabbit
onready var camera = $Rabbit/Camera2D
onready var light = $Rabbit/Light2D


# Called when the node enters the scene tree for the first time.
func _ready():
	camera.current = false
	light.enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
