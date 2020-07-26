extends Node


# properties
var carrots = 0
var shovel = false
var candle = false
var halo = false
var victorious = false
var overworld = true
var near_shop = false


# public methods
func victory():
	victorious = true


# private methods
func update_carrot_count(amount):
	carrots += amount
	Signals.emit_signal("carrot_amount_changed", amount)
