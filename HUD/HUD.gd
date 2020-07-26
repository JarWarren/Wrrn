extends CanvasLayer

# properties
var _carrots = 0
var _deaths = 0

onready var carrotCountLabel = $CarrotCount
onready var instructionsLabel = $Instructions
onready var deathCountLabel = $DeathCount
onready var shovelIcon = $ShovelIcon
onready var featherIcon = $FeatherIcon
onready var candleIcon = $CandleIcon

# override methods
func _ready():
	_carrots = GameController.carrots
	carrotCountLabel.text = str(_carrots)
	var _e = Signals.connect("carrot_amount_changed", self, "_update_carrot_count")
	
	_deaths = GameController.deaths
	deathCountLabel.text = str(_deaths)
	var _f = Signals.connect("death", self, "_update_death_count")
	
	shovelIcon.visible = GameController.shovel
	featherIcon.visible = GameController.halo
	candleIcon.visible = GameController.candle
	
	instructionsLabel.visible = GameController.overworld


# private methods
func _update_carrot_count(amount):
	_carrots += amount
	carrotCountLabel.text = str(_carrots)


func _update_death_count():
	_deaths += 1
	deathCountLabel.text = str(_deaths)
