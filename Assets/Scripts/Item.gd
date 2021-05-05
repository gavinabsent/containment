extends Node2D

var item_name

func _ready():
	if item_name != null:
		var item_temp_name = str(item_name).replace("[", "")
		var item_name_cleaned = str(item_temp_name).replace("]", "")
		$TextureRect.texture = load("res://Assets/Sprites/Items/%s.png" % item_name_cleaned) 

func set_item(nm):
	item_name = nm
	var item_temp_name = str(item_name).replace("[", "")
	var item_name_cleaned = str(item_temp_name).replace("]", "")
	$TextureRect.texture = load("res://Assets/Sprites/Items/" + str(item_name_cleaned) + ".png")
