extends Node

# properties
export var speed = 3
export var clockwise = true

onready var startPosition = $StartPosition
onready var endPosition = $EndPosition
onready var boulder = $KinematicBody2D

# override methods
func _ready():
	boulder.position = startPosition.position
	endPosition.position.y = startPosition.position.y
	clockwise = endPosition.position.x > startPosition.position.x
	speed = speed if clockwise else -speed


func _process(_delta):
	boulder.rotate(-speed)
	boulder.position.x += speed
	if (clockwise and boulder.position.x >= endPosition.position.x) or (not clockwise and boulder.position.x <= endPosition.position.x):
		boulder.position = startPosition.position
