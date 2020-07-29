extends AudioStreamPlayer

# constants
const OVERWORLD_THEME = preload("res://Audio/Blue_Dot_Sessions_-_02_-_Rabbit_Hole.ogg")
const UNDERWORLD_THEME = preload("res://Audio/SPCZ_-_10_-_Ground.ogg")

# properties
var paused = false
var bookmark = 0

# override methods
func _ready():
	autoplay = true
	stream = OVERWORLD_THEME
	play()

func _process(_delta):
	if Input.is_action_just_pressed("audio_mute"):
		match paused:
			true:
				play(bookmark)
				paused = false
			false:
				bookmark = get_playback_position()
				stop()
				paused = true


# private methods
func change_to_overworld():
	if stream != OVERWORLD_THEME:
		stream = OVERWORLD_THEME
		_play()


func change_to_underworld():
	if stream != UNDERWORLD_THEME:
		stream = UNDERWORLD_THEME
		_play()


func _play():
	bookmark = 0
	if not paused:
		play()
