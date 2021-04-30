extends Area2D

var can_interact = false
var is_on = true

onready var sprite = $AnimatedSprite
onready var SFX = $SFX

signal lights_off
signal lights_on

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
			emit_signal("lights_off")
		else:
			is_on = true
			sprite.frame = 0
			emit_signal("lights_on")
