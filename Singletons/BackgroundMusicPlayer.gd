extends AudioStreamPlayer

# constants
const OVERWORLD_THEME = preload("res://Audio/Blue_Dot_Sessions_-_02_-_Rabbit_Hole.ogg")
const UNDERWORLD_THEME = preload("res://Audio/SPCZ_-_10_-_Ground.ogg")


# Called when the node enters the scene tree for the first time.
func _ready():
	autoplay = true
	stream = OVERWORLD_THEME
	play()


func change_to_overworld():
	if stream != OVERWORLD_THEME:
		stream = OVERWORLD_THEME
		play()


func change_to_underworld():
	if stream != UNDERWORLD_THEME:
		stream = UNDERWORLD_THEME
		play()
