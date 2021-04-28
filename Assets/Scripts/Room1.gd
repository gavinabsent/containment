extends YSort


func _ready():
	print(Global.door_name)
	
	if Global.door_name:
		var door_node = find_node(Global.door_name)
		if door_node:
			$Player.global_position = door_node.global_position
