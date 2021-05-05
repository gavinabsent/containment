extends Node2D

var item_name
var player = null

func _ready():
	item_name = "Black Floppy"

func pick_up_item(body):
	player = body
	PlayerInventory.add_item(item_name)
	queue_free()
