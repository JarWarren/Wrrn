extends KinematicBody2D

# properties
export var movespeed = 60

var _momentum = Vector2.ZERO
var _can_see_player = false

onready var playerDetectionZone = $PlayerDetectionZone
onready var sprite = $AnimatedSprite

# override methods
func _process(_delta):
	match playerDetectionZone.can_see_player():
		true:
			_attack()
		false:
			_idle()
	_momentum = move_and_slide(_momentum)

# private methods

func _idle():
	_momentum = Vector2.ZERO


func _attack():
	var direction = (playerDetectionZone.player.global_position - global_position).normalized()
	_momentum = _momentum.move_toward(movespeed * direction, 100)
	sprite.flip_h = _momentum.x < 0

