extends Node2D

const SlotClass = preload("res://Assets/Scripts/Slot.gd")
onready var inventory_slots = $InventoryContainer
var holding_item = null

func _ready():
	# Get the array of possible inventory slots
	var slots = inventory_slots.get_children()
	
	# For every slot, connect the gui_input to the slot_gui_input function
	for i in range(slots.size()):
		slots[i].connect("gui_input", self, "slot_gui_input", [slots[i]])
		slots[i].slot_index = i
	initialize_inventory()

func initialize_inventory():
	var slots = inventory_slots.get_children()
	for i in range(slots.size()):
		if PlayerInventory.inventory.has(i):
			slots[i].initialize_item(PlayerInventory.inventory[i])

func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item:
					left_click_empty_slot(slot)
				else:
					left_click_different_item(event, slot)
			elif slot.item:
				left_click_not_holding(slot)

func _input(_event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()

func left_click_empty_slot(slot: SlotClass):
	PlayerInventory.add_item_to_empty_slot(holding_item, slot)
	slot.put_into_slot(holding_item)
	holding_item = null

func left_click_different_item(event: InputEvent, slot: SlotClass):
	PlayerInventory.remove_item(slot)
	PlayerInventory.add_item_to_empty_slot(holding_item, slot)
	var temp_item = slot.item
	slot.pick_from_slot()
	temp_item.global_position = event.global_position
	slot.put_into_slot(holding_item)
	holding_item = temp_item

func left_click_not_holding(slot: SlotClass):
	PlayerInventory.remove_item(slot)
	holding_item = slot.item
	slot.pick_from_slot()
	holding_item.global_position = get_global_mouse_position()
