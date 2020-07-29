extends Node

# properties
onready var rabbit = $Rabbit
onready var camera = $Rabbit/Camera2D
onready var tilemap = $Map/TileMap
onready var light = $Rabbit/Light2D

# override methods
func _ready():
	var _e = Signals.connect("rabbit_dig", self, "_update_tilemap")
	camera.current = true
	light.enabled = false if GameController.candle else true
	BackgroundMusicPlayer.change_to_underworld()


# private mtehods
func _update_tilemap():
	var cell_position = tilemap.world_to_map(rabbit.position)
	tilemap.set_cellv(cell_position + Vector2(0, 1), -1)
	tilemap.set_cellv(cell_position + Vector2(0, -1), -1)
	tilemap.set_cellv(cell_position + Vector2(1, 0), -1)
	tilemap.set_cellv(cell_position + Vector2(-1, 0), -1)
	if GameController.shovel:
		tilemap.set_cellv(cell_position + Vector2(1, 1), -1)
		tilemap.set_cellv(cell_position + Vector2(1, -1), -1)
		tilemap.set_cellv(cell_position + Vector2(-1, 1), -1)
		tilemap.set_cellv(cell_position + Vector2(-1, -1), -1)
	tilemap.update_bitmask_region(cell_position + Vector2(-1, -1), cell_position + Vector2(1, 1))
