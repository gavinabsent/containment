extends Node

export var max_hp = 20
var hp = 20 setget set_hp
var fear = 0 setget set_fear
var hunger = 0 setget set_hunger

signal hp_changed(value)
signal fear_changed(value)
signal hunger_changed(value)

func _ready():
	set_hp(hp)

func set_hp(value):
	hp = min(value, max_hp)
	emit_signal("hp_changed", hp)

func set_fear(value):
	fear = value
	emit_signal("fear_changed", fear)

func set_hunger(value):
	hunger = value
	emit_signal("hunger_changed", hunger)
