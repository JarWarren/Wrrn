extends KinematicBody2D

# constants
const GRAVITY = -9.8

# properties
export var movespeed = 100
export var jumpforce = 300

var _momentum = Vector2.ZERO
var _hopping = false
var _alive = true
var _deathTimer = Timer.new()

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var deathSplat = $DeathSplat


# override methods
func _ready():
	_deathTimer.connect("timeout", self, "_on_deathTimer_timeout")
	add_child(_deathTimer)
	if GameController.victorious:
		sprite.modulate = Color(1, 0.9, 0)


func _process(_delta):
	if _alive:
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
	_momentum.y -= GRAVITY
	if Input.is_action_just_pressed("ui_accept"):
		match GameController.near_shop:
			false:
				if is_on_floor() or GameController.feather:
					_momentum.y = -jumpforce
			true:
				var _e = get_tree().change_scene("res://Interactable/Shop.tscn")
	elif Input.is_action_just_released("ui_accept") and _momentum.y < -jumpforce/2:
		_momentum.y = -jumpforce/4


func _dig():
	if Input.is_action_just_pressed("ui_attack"):
		Signals.emit_signal("rabbit_dig")

func _move():
	_momentum = move_and_slide(_momentum, Vector2.UP)


func _on_Hurtbox_body_entered(body):
	GameController.death()
	_alive = false
	animationPlayer.stop()
	sprite.hide()
	deathSplat.show()
	_deathTimer.start(1)
	if body.is_in_group("mortal"):
		body.queue_free()


func _on_deathTimer_timeout():
	var _o = get_tree().change_scene("res://World/Overworld.tscn")
	GameController.overworld = true
