extends Node


# properties
var carrots = 0
var deaths = 0
var shovel = false
var candle = false
var feather = false
var victorious = false
var overworld = true
var near_shop = false


# public methods
func victory():
	victorious = true


func death():
	deaths += 1
	Signals.emit_signal("death")


func completed():
	return shovel and candle and feather and victorious


func update_carrot_count(amount):
	carrots += amount
	Signals.emit_signal("carrot_amount_changed", amount)
