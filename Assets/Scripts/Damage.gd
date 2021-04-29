extends Area2D

var can_interact = false
var is_on = true

signal hp_changed

func _ready():
	pass

func _on_Damage_body_entered(body):
	if body.name == "Player":
		print("Can interact")
		can_interact = true

func _on_Damage_body_exited(body):
	if body.name == "Player":
		print("Can no longer interact")
		can_interact = false

func _input(_event):
	if Input.is_action_just_pressed("interact") and can_interact == true:
		print("Attempting to interact")
		
		var root = get_tree().current_scene
		var player = root.find_node("PlayerStats")
		player.hp -= 3
		emit_signal("hp_changed", player.hp)
		$AudioStreamPlayer.play()
