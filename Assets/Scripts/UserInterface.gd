extends CanvasLayer

func _input(event):
	if event.is_action_pressed("tab"):
		$Inventory.visible = !$Inventory.visible
