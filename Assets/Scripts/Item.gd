extends Node2D

var item_name

func _ready():
	if item_name != null:
		var item_temp_name = str(item_name).replace("[", "")
		var item_temp_name2 = str(item_temp_name).replace("]", "")
		$TextureRect.texture = load("res://Assets/Sprites/Items/%s.png" % item_temp_name2) 

func set_item(nm):
	item_name = nm
	var item_temp_name = str(item_name).replace("[", "")
	var item_temp_name2 = str(item_temp_name).replace("]", "")
	$TextureRect.texture = load("res://Assets/Sprites/Items/" + str(item_temp_name2) + ".png")
