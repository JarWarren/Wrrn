extends Node


# properties
var carrots = 0
var shovel = false
var flashlight = false
var halo = false
var victorious = false

# override methods
func _ready():
	Signals.connect("carrot_amount_changed", self, "_update_carrot_count")
	print("connected")



# public methods
func victory():
	victorious = true


# private methods
func _update_carrot_count(amount):
	carrots += amount
	print(carrots)
