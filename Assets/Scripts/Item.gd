extends Node2D

func _ready():
	if randi() % 2 == 0:
		$TextureRect.texture = load("res://Assets/Sprites/Items-Enviroment/FloppyDisks2.png")
	else:
		$TextureRect.texture = load("res://Assets/Sprites/Items-Enviroment/FloppyDisks1.png")
		
