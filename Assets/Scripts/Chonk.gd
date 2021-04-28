extends StaticBody2D

var can_interact = false
var playing = false
export(AudioStream) var music

func _ready():
	var music_player = get_node("ContainmentSteamer")
	music_player.stream = music
	music_player.stream_paused = true
	music_player.playing = true
	pass

func _on_Chonk_body_entered(body):
	if body.name == "Player":
		print("Can interact")
		can_interact = true

func _on_Chonk_body_exited(body):
	if body.name == "Player":
		print("Can no longer interact")
		can_interact = false

func _input(_event):
	if Input.is_action_just_pressed("interact") and can_interact == true:
		print("Attempting to interact")
		
		var music_player = get_node("ContainmentSteamer")
		var SFX = get_node("SFX")
		var timer = SFX.get_node("Timer")
		
		SFX.play()
		
		if playing == false:
			timer.start()
			playing = true
		else:
			music_player.stream_paused = true
			playing = false

func _on_Timer_timeout():
	get_node("ContainmentSteamer").stream_paused = false
	print("Attempting to play music from chonk")
