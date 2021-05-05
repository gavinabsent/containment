extends KinematicBody2D

var can_interact = false

onready var label = $Label
onready var sprite = $Sprite

onready var root = get_tree().get_root().get_node("Game")
onready var Player = root.find_node("Player")

func _ready():
	label.text = "Kool" 
	sprite.animation = "Spawn"
	yield(sprite, "animation_finished")
	sprite.animation = "Idle"

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		can_interact = true

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		can_interact = false 

func _input(_event):
	if Input.is_action_just_pressed("interact") and can_interact == true:
		
		if Player.global_position.x - self.global_position.x < 0:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
