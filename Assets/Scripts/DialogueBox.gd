extends Control

onready var label = get_node("RichTextLabel")
onready var soundPlayer = get_node("DialoguePlayer")
const AUDIOPATH = "res://Assets/Audio/"

var waitTime = 1
var index = 0
var sound = ""

var text = {
	0: "[center]A gun with one bullet.[/center]",
	1: "[center]I go unwillingly.[/center]",
	2: "[center]Test again[/center]",
}

var audio = {
	0: AUDIOPATH + "Voice/bullet.wav",
	1: AUDIOPATH + "SFX/thunder1.wav",
	2: AUDIOPATH + "SFX/swell1.wav"
}

func _ready():
	load_dialogue(2)

# warning-ignore:shadowed_variable
func load_dialogue(index = 0):
	if index < text.size():
		var sfx = load(audio[index])
		soundPlayer.stream = sfx
		soundPlayer.playing = true
		label.bbcode_text = text[index]
	else:
		queue_free()
		soundPlayer.playing = false
	index += 1

func _on_DialoguePlayer_finished():
	queue_free()
	soundPlayer.playing = false
