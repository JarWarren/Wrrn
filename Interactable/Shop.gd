extends MarginContainer

const PURCHASED = "Purchased"

# properties
onready var carrotsLabel = $VBoxContainer/Carrots
onready var shovelButton = $VBoxContainer/ShovelButton
onready var candleButton = $VBoxContainer/CandleButton
onready var haloButton = $VBoxContainer/HaloButton
onready var backButton = $VBoxContainer/BackButton

# override methods
func _ready():
	carrotsLabel.text = "carrots " + str(GameController.carrots)
	if GameController.shovel:
		shovelButton.text = PURCHASED
	if GameController.candle:
		candleButton.text = PURCHASED
	if GameController.halo:
		haloButton.text = PURCHASED
	backButton.grab_focus()
	


func _purchase(cost):
	if GameController.carrots >= cost:
		GameController.update_carrot_count(-cost)
		carrotsLabel.text = "carrots " + str(GameController.carrots)


func _on_ShovelButton_pressed():
	if GameController.shovel == false and GameController.carrots >= 5:
		GameController.shovel = true
		_purchase(5)
		shovelButton.text = PURCHASED


func _on_CandleButton_pressed():
	if GameController.candle == false and GameController.carrots >= 25:
		GameController.candle = true
		_purchase(25)
		candleButton.text = PURCHASED


func _on_HaloButton_pressed():
	if GameController.halo == false and GameController.carrots >= 10:
		GameController.halo = true
		_purchase(10)
		haloButton.text = PURCHASED


func _on_BackButton_pressed():
	GameController.near_shop = false
	var _e = get_tree().change_scene("res://World/Overworld.tscn")
