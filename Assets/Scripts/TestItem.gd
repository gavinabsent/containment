extends "BaseItem.gd"

func _init().("Test", 3, 1):
	.what_is_my_name()
	pass

func do_item_thing():
	print("Test item did the thing")
