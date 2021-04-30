extends Node2D

onready var slots = $Slot1

func _ready():
	#slots[i].connect("gui_input", self, "slot_gui_input", [slots[i]])
	#slots[0].slot_index = 0
	initialize_weapon_slot()

func initialize_weapon_slot():
	for i in range(slots.size()):
		if PlayerInventory.weapon_slot.has(i):
			slots[i].initialize_item(PlayerInventory.weapon_slot[i])
