extends Node


# properties
var carrots = 0


# override methods
func _ready():
	Signals.connect("carrot_amount_changed", self, "_update_carrot_count")
	print("connected")


# private methods
func _update_carrot_count(amount):
	carrots += amount
	print(carrots)
