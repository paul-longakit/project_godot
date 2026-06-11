extends CanvasLayer

var count = 0

@onready var label = $counter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "Coins: " + str(count)

func _addCoin(value):
	count += value
	label.text = "Coins: " + str(count)
