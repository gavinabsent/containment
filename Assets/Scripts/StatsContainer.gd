extends VBoxContainer

func _on_PlayerStats_hp_changed(value):
	$Health.value = value
