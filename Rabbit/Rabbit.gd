extends KinematicBody2D

# constants

# properties
export var movespeed = 100
export var jumpforce = 300

var _momentum = Vector2.ZERO
var _hopping = false

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer


# override methods
func _ready():
	if GameController.victorious:
		sprite.modulate = Color(1, 0.9, 0)


func _process(_delta):
	_horizontal_movement()
	_vertical_movement()
	_dig()
	_move()


# private methods
func _horizontal_movement():
	var horizontal_momentum = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	_momentum.x = movespeed * horizontal_momentum
	if horizontal_momentum < 0:
		animationPlayer.play("hop")
		sprite.flip_h = true
	elif horizontal_momentum > 0:
		animationPlayer.play("hop")
		sprite.flip_h = false
	else:
		animationPlayer.play("idle")
		

func _vertical_movement():
	_momentum.y -= Constants.GRAVITY
	if Input.is_action_just_pressed("ui_accept"):
		_momentum.y = -jumpforce


func _dig():
	if Input.is_action_just_pressed("ui_attack"):
		Signals.emit_signal("rabbit_dig")

func _move():
	_momentum = move_and_slide(_momentum, Vector2.UP)


func _on_Hurtbox_body_entered(_body):
	var _o = get_tree().change_scene("res://World/Overworld.tscn")
