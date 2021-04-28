extends Area2D

var can_interact = false
var is_on = true

onready var sprite = get_node("AnimatedSprite")
onready var SFX = get_node("SFX")

func _ready():
	sprite.frame = 0

func _on_Power_Switch_body_entered(body):
	if body.name == "Player":
		print("Can interact")
		can_interact = true

func _on_Power_Switch_body_exited(body):
	if body.name == "Player":
		print("Can no longer interact")
		can_interact = false

func _input(_event):
	if Input.is_action_just_pressed("interact") and can_interact == true:
		print("Attempting to interact")
		
		SFX.play()
		
		if is_on == true:
			is_on = false
			sprite.frame = 1
		else:
			is_on = true
			sprite.frame = 0

