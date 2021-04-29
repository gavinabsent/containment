extends Node2D

var item_name
var player = null

func _ready():
	item_name = "Blue Keycard"

func pick_up_item(body):
	player = body
	print("Picking up item")
