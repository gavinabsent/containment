extends Node

const SlotClass = preload("res://Assets/Scripts/Slot.gd")
const ItemClass = preload("res://Assets/Scripts/Item.gd")
const NUM_INVENTORY_SLOTS = 10

var inventory = {}

func add_item(item_name):
	for item in inventory:
		if inventory[item][0] == item_name:
			inventory[item][1]
			
	for i in range(NUM_INVENTORY_SLOTS):
		if inventory.has(i) == false:
			inventory[i] = [item_name]
			return
func remove_item(slot: SlotClass):
	inventory.erase(slot.slot_index)

func add_item_to_empty_slot(item: ItemClass, slot: SlotClass):
	inventory[slot.slot_index] = [item.item_name]
