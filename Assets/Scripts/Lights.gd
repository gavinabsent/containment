extends Node2D

func _on_Power_Switch_lights_off():
	self.visible = false

func _on_Power_Switch_lights_on():
	self.visible = true
