extends Node2D

onready var timer = $Timer
var can_interact = false
var cooldown = 0.5

signal move_to_door(body, doorId, nextDoor)

func _ready():
	timer.start(cooldown)

func _on_Door0_send_data(body, doorId, nextDoor): # You kinda have to do this for _every_ door, too bad!
	send_to_player(body, doorId, nextDoor)

func _on_Door1_send_data(body, doorId, nextDoor):
	send_to_player(body, doorId, nextDoor)

func send_to_player(body, doorId, nextDoor):
	print(can_interact)
	if can_interact == true and Input.is_action_pressed("interact"): 
		emit_signal("move_to_door", body, doorId, nextDoor)
		can_interact = false
		timer.start(cooldown)
	print("not sending player")
	return

func _on_Timer_timeout():
	can_interact = true
