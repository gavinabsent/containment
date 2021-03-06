extends Panel

var default_tex = preload("res://Assets/Sprites/UI/Inventory Slot 1.png")
var empty_tex = preload("res://Assets/Sprites/UI/Inventory Slot 1.png")

var default_style: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null

var item_class = preload("res://Assets/Scenes/Item.tscn")
var item = null
var slot_index

func _ready():
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	default_style.texture = default_tex
	empty_style.texture = empty_tex

func refresh_style():
	if item == null:
		set('custom_styles/panel', empty_style)
	else:
		set('custom_styles/panel', default_style)

func pick_from_slot():
	remove_child(item)
	var inventory_node = find_parent("Inventory")
	inventory_node.add_child(item)
	item = null
	refresh_style()

func put_into_slot(new_item):
	item = new_item
	item.position = Vector2(0, 0)
	var inventory_node = find_parent("Inventory")
	inventory_node.remove_child(item)
	add_child(item)
	refresh_style()

func initialize_item(item_name):
	if item == null:
		item = item_class.instance()
		add_child(item)
		item.set_item(item_name)
	else:
		item.set_item(item_name)
	refresh_style()
