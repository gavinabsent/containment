extends Node2D

var item_name
var max_amount
var amount

func _init(in_item_name, in_max_amount, in_amount):
	item_name = in_item_name
	max_amount = in_max_amount
	amount = in_amount

func what_is_my_name():
	print(item_name)

func do_item_thing():
	print("It did the thing, congo rats")
