extends Area2D

export(int) var next_position_x
export(int) var next_position_y
var can_interact = false
onready var root = get_tree().get_root().get_node("Game")
onready var Player = root.find_node("Player")

func _ready():
	pass 

func _on_Normal_Door_Bottom_body_entered(body):
	if body.name == "Player":
		print("Can interact")
		can_interact = true

func _on_Normal_Door_Bottom_body_exited(body):
	if body.name == "Player":
		print("Can no longer interact")
		can_interact = false

func _input(_event):
	if Input.is_action_just_pressed("interact") and can_interact == true:
		print("Attempting to interact")
		
		var position_offset_x = Player.global_position.x - position.x
		var position_offset_y = Player.global_position.y - position.y
		
		Player.global_position = Vector2(next_position_x + position_offset_x, next_position_y + position_offset_y + 32)
		get_node("SFX").play()
