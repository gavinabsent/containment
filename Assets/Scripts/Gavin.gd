extends KinematicBody2D

onready var deagle = $Deagle
onready var muzzle_flash_light = deagle.find_node("Light2D")
onready var label = $Label

onready var root = get_tree().get_root().get_node("Game")
onready var Player = root.find_node("Player")

var can_interact = false
var has_floppy = false

func _ready():
	label.text = "Got a black floppy?"

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		#print("Can interact")
		can_interact = true

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		#print("Can no longer interact")
		can_interact = false 

func _input(_event):
	if Input.is_action_just_pressed("interact") and can_interact == true:
		#print("Attempting to interact")
		
		if Player.global_position.x - self.global_position.x < 0:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
