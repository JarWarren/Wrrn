extends Node

# properties
onready var rabbit = $Rabbit
onready var camera = $Rabbit/Camera2D
onready var light = $Rabbit/Light2D
onready var decoration = $Decoration
onready var reaper = $Reaper
onready var soldOutSign = $Shop/SoldOutSign
onready var background = $Background

# override methods
func _ready():
	camera.current = false
	light.enabled = false
	if GameController.deaths >= 20:
		reaper.visible = true
	if GameController.shovel and GameController.feather and GameController.candle:
		soldOutSign.visible = true
	BackgroundMusicPlayer.change_to_overworld()


func _process(_delta):
	if background.position.x >= -320:
		background.position.x -= 0.1
	else:
		background.position.x = 0


# private methods
func _on_Area2D_body_entered(_body):
	GameController.near_shop = true


func _on_Area2D_body_exited(_body):
	GameController.near_shop = false
