extends CanvasLayer

# properties
var _carrots = 0
onready var carrotCountLabel = $CarrotCount
onready var instructionsLabel = $Instructions


# override methods
func _ready():
	_carrots = GameController.carrots
	carrotCountLabel.text = str(_carrots)
	var _e = Signals.connect("carrot_amount_changed", self, "_update_carrot_count")
	instructionsLabel.visible = GameController.overworld


# private methods
func _update_carrot_count(amount):
	_carrots += amount
	carrotCountLabel.text = str(_carrots)
